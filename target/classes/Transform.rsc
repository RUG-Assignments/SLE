module Transform

import Syntax;
import Resolve;
import AST;
import IO;
import Set;
import List;
import ParseTree;

map[str, AQuestion] flattenQRecursive(AQuestion question, AExpr condition, map[str, AQuestion] qsMap) {
  // base case
  if(question is basicQ || question is computedQ){
    qsMap += (question.var.name: conditionalQ(condition, [question]));
    return qsMap;
  } 
  
  if(question is conditionalQ){
    for(/AQuestion ifq <- question.questions){
      qsMap += flattenQRecursive(ifq, and(condition, question.expr), qsMap);
    }
  } else if(question is conditionalQWithElse) {
    for(/AQuestion ifq <- question.ifqs) {
      qsMap += flattenQRecursive(ifq, and(condition, question.expr), qsMap);
    }
    for(/AQuestion elseq <- question.elseqs) {
      qsMap += flattenQRecursive(elseq, and(condition, not(question.expr)), qsMap);
    }
  }
  return qsMap;
}

AForm flatten(AForm f) {
  map[str, AQuestion] qsMap = ();
  for(/AQuestion q <- f.questions, q is basicQ || q is computedQ) {
    qsMap += flattenQRecursive(q, boolean(true), qsMap);
  }
  for(/AQuestion q <- f.questions, q is conditionalQ || q is conditionalQWithElse) {
    qsMap += flattenQRecursive(q, boolean(true), qsMap);
  }
  list[AQuestion] newFormQs = [];
  for (s <- qsMap){
    newFormQs += qsMap[s];
  }
  f.questions = newFormQs;
  return f;
}

start[Form] rename(start[Form] f, loc useOrDef, str newName, UseDef useDef) {
  set[loc] defLoc = useDef[useOrDef];
  list[loc] defLocList = toList(defLoc);
  loc def = defLocList[0];
  rel[loc loc1, loc loc2] locs = {};
  locs += <def,def>;
  return visit(f) {
    case Id x => [Id]newName
      when x.src in (useDef o locs).use
  }
}
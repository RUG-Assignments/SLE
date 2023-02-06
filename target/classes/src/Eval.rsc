module Eval

import AST;
import Resolve;
import IO;

/*
 * Implement big-step semantics for QL
 */
 
// NB: Eval may assume the form is type- and name-correct.

// Semantic domain for expressions (values)
data Value
  = vint(int n)
  | vbool(bool b)
  | vstr(str s)
  ;

// The value environment
alias VEnv = map[str name, Value \value];

// Modeling user input
data Input
  = input(str question, Value \value);
  
// produce an environment which for each question has a default value
// (e.g. 0 for int, "" for str etc.)
VEnv initialEnv(AForm f) {
  map[str, Value] venv = ();   
  for (/AQuestion q := f, q has var) {
    if (q.t is booleanType) {
      venv += (q.var.name : vbool(false));
    } else if (q.t is intType) {
      venv += (q.var.name : vint(0));
    } else if (q.t is stringType) {
      venv += (q.var.name : vstr(""));
    }
  }  
  return venv;
}

// Because of out-of-order use and declaration of questions
// we use the solve primitive in Rascal to find the fixpoint of venv.
VEnv eval(AForm f, Input inp, VEnv venv) {
  return solve (venv) {
    venv = evalOnce(f, inp, venv);
  }
}

VEnv evalOnce(AForm f, Input inp, VEnv venv) {
  qs_in_conditionals = {};
  all_qs = { q | q <- f.questions};
  for (/AQuestion q := f, q is conditionalQ || q is conditionalQWithElse) {    
    if(q is conditionalQ) {
      if(eval(q.expr, venv) == vbool(true)) {
        for(qs <- q.questions){
          venv += eval(qs, inp, venv);
        }
      }
      qs_in_conditionals += {question | question <- q.questions};
    } else if(q is conditionalQWithElse) {
      if(eval(q.expr, venv) == vbool(true)) {
        for (qs <- q.ifqs){
          venv += eval(qs, inp, venv);
        }
      } else {
        for (qs <- q.elseqs){
          venv += eval(qs, inp, venv);
        }
      }
      qs_in_conditionals += {question | question <- q.ifqs};
      qs_in_conditionals += {question | question <- q.elseqs};
    }
  }
  // evaluate basic qs outside conditionals
  for (/AQuestion q <- all_qs, (q is basicQ || q is computedQ) && q notin qs_in_conditionals) {   
    venv += eval(q, inp, venv);
  }
  return venv; 
}

// evaluate inp and computed questions to return updated VEnv
VEnv eval(AQuestion q, Input inp, VEnv venv) {
  if(q is basicQ && q.var.name == inp.question) {
    venv += (inp.question : inp.\value);
  } else if (q is computedQ) {
    venv += (q.var.name : eval(q.expr, venv));
  }
  return venv; 
}

int valueToInt(Value val) {
  switch(val) {
    case number(int x): return(x);
    case vint(int x): return(x);
    default: throw "Could not convert <val>";
  }
}

Value eval(AExpr e, VEnv venv) {
  switch (e) {
    case ref(id(str x)): return venv[x];
    case number(int x): return vint(x);
    case boolean(bool x): return vbool(x);
    case withPars(AExpr expr): return eval(expr, venv);
    case or(AExpr lhs, AExpr rhs): return(vbool((eval(lhs, venv) == vbool(true)) || (eval(rhs, venv) == vbool(true))));
    case and(AExpr lhs, AExpr rhs): return(vbool((eval(lhs, venv) == vbool(true)) && (eval(rhs, venv) == vbool(true))));
    case eq(AExpr lhs, AExpr rhs): return(vbool(eval(lhs, venv) == eval(rhs, venv))); 
    case notEq(AExpr lhs, AExpr rhs): return(vbool(eval(lhs, venv) != eval(rhs, venv)));
    case lt(AExpr lhs, AExpr rhs): return(vbool(eval(lhs, venv) < eval(rhs, venv)));
    case leq(AExpr lhs, AExpr rhs): return(vbool(eval(lhs, venv) <= eval(rhs, venv)));
    case gt(AExpr lhs, AExpr rhs): return(vbool(eval(lhs, venv) > eval(rhs, venv)));
    case geq(AExpr lhs, AExpr rhs): return(vbool(eval(lhs, venv) >= eval(rhs, venv)));
    case add(AExpr lhs, AExpr rhs): return(vint(valueToInt(eval(lhs, venv)) + valueToInt(eval(rhs, venv))));
    case subtr(AExpr lhs, AExpr rhs): return(vint(valueToInt(eval(lhs, venv)) - valueToInt(eval(rhs, venv))));    
    case div(AExpr lhs, AExpr rhs): return(vint(valueToInt(eval(lhs, venv)) / valueToInt(eval(rhs, venv))));
    case mul(AExpr lhs, AExpr rhs): return(vint(valueToInt(eval(lhs, venv)) * valueToInt(eval(rhs, venv))));     
    case not(AExpr expr): return(vbool(eval(expr, venv) == vbool(false)));
    default: throw "Unsupported expression <e>";
  }
}
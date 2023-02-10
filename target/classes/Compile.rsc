module Compile

import AST;
import Resolve;
import Transform;
import util::Math;
import IO;
import lang::html::AST; // see standard library
import lang::html::IO;
import Boolean;

// Get the name of the JS file that is being compiled, 
// so that the value can be added to the html file to connect to the JS file
str getJSFileName(AForm f) {
  loc u = f.src[extension="js"].top;
  str fileName = u.file;
  return fileName;
}

void compile(AForm f) {
  writeFile(f.src[extension="js"].top, form2js(f));
  writeFile(f.src[extension="html"].top, writeHTMLString(form2html(f)));
}

str getTypeStr(AType t){
  if (t is booleanType) {
    return("checkbox");
  } else if (t is intType) {
    return("number");
  } else if (t is stringType) {
    return("text");
  }
  return "";
}

str getDefaultForType(AType t) {
  if(t is stringType) {
    return "\"\"";
  } else if (t is booleanType) {
    return "false";
  } else {
    return "0";
  }
}

HTMLElement form2html(AForm f) {
  f = flatten(f);
  // head
  HTMLElement title = title([text("QL Form")]);
  HTMLElement head = head([title]);

  // body
  list[HTMLElement] labs = [];
  for(/AQuestion q <- f, q is basicQ) {
    list[HTMLElement] lab = [];
    HTMLElement strQ =  text(q.question);
    str handleChange;
    HTMLElement inputTag;
    if (q.t is intType || q.t is stringType) {
      handleChange = "handle" + q.var.name + "Change(this.value)";   
      inputTag = input(\type = getTypeStr(q.t), id = q.var.name + "Input", oninput = handleChange);
    } else {
      handleChange = "handle" + q.var.name + "Change(this)"; 
      inputTag = input(\type = getTypeStr(q.t), id = q.var.name + "Input", onClick = handleChange);
    }
    lab += strQ;
    lab += inputTag;
    lab += br();
    lab += br();
    HTMLElement qLabel = label(lab);
    qLabel.id = q.var.name + "Label";
    labs += qLabel;
  }
  for(/AQuestion q <- f, q is computedQ) {
    list[HTMLElement] lab = [];
    HTMLElement strQ =  text(q.question + getDefaultForType(q.t));
    lab += strQ;
    lab += br();
    lab += br();
    HTMLElement qLabel = label(lab);
    qLabel.id = q.var.name + "Label";
    labs += qLabel;
  }

  // Extra tags
  HTMLElement buttonTag = button([text("Submit")]);
  buttonTag.\type = "submit";
  labs += buttonTag;

  HTMLElement scriptTag = script([]);
  scriptTag.src = getJSFileName(f); 
  labs += scriptTag;

  HTMLElement bodyTag = body(labs);

  list[HTMLElement] finalHTML =  [];
  finalHTML += head;
  finalHTML += bodyTag;
  return html(finalHTML);
}

str generateLabels(AForm f){
  str result = "// generate labels\n";
  for(/AQuestion q <- f, q is basicQ || q is computedQ) {
    result += "var " + q.var.name + "Label = document.getElementById(\'" + q.var.name + "Label\');\n";
  }
  return result;
}

str generateInputs(AForm f){
  str result = "// generate inputs\n";
  for(/AQuestion q <- f, q is basicQ) {
    result += "var " + q.var.name + "Input = document.getElementById(\'" + q.var.name + "Input\');\n";
  }
  return result;
}

str generateVars(AForm f){
  str result = "// generate vars\n";
  for(/AQuestion q <- f, q is basicQ || q is computedQ) {
    result += "var " + q.var.name + " = " + getDefaultForType(q.t)+ ";\n";
  }
  return result;
}

str additionalFunctions(AForm f) {
  result = "// additional functions\n";
  result += "conditionsEval();\n";
  result += "function text2num(text) {\n";
  result += "  if (text == \"\") {\n";
  result += "    return 0;\n";
  result += "  } else {\n";
  result += "    return parseFloat(text);\n";
  result += "  }\n";
  result += "}\n";
  return result;
}

str generateBasicFunctions(AForm f) {
  result = "// generate functions\n";
  for(/AQuestion q <- f, q is basicQ ){
    result += "function handle" + q.var.name + "Change(input) {\n";
    if (q.t is booleanType){
      result += "  " + q.var.name + " = true ? input.checked : false;\n";
    } else {
      result += "  " + q.var.name + " = text2num(input);\n";
    }
    for(/AQuestion q <- f, q is computedQ) {
      result += "  compute" + q.var.name + "();\n";
    }
    result += "  conditionsEval();\n}\n\n";
  }
  return result;
}

str generateConditionalFunctions(AForm f){
  result = "// generate conditionals\n";
  result += "function conditionsEval() {\n";
  for(/AQuestion q <- f, q is conditionalQ){
    result += "  if (" + expr2str(q.expr) + ") {\n";
    for(/AQuestion question <- q.questions, question is basicQ || question is computedQ){
      result += "    " + question.var.name + "Label.style.display = \"block\";\n";
    }
    result += "  } else {\n";
    for(/AQuestion question <- q.questions, question is basicQ || question is computedQ){
      result += "    " + question.var.name + "Label.style.display = \"none\";\n";
    }
    result += "  }\n";
  }
  for(/AQuestion q <- f, q is conditionalQWithElse){
    result += "  if (" + expr2str(q.expr) + ") {\n";
    for(/AQuestion question <- q.elseqs, question is basicQ || question is computedQ) {
      result += "    " + question.var.name + "Label.style.display = \"none\";\n";
    }
    for(/AQuestion question <- q.ifqs, question is basicQ || question is computedQ) {
      result += "    " + question.var.name + "Label.style.display = \"block\";\n";
    }
    result += "  } else {\n";
    for(/AQuestion question <- q.ifqs, question is basicQ || question is computedQ){
      result += "    " + question.var.name + "Label.style.display = \"none\";\n";
    }
    for(/AQuestion question <- q.elseqs, question is basicQ || question is computedQ){
      result += "    " + question.var.name + "Label.style.display = \"block\";\n";
    }
    result += "  }\n";
  }
  result += "}\n\n";
  return result;
}

str generateComputedFunctions(AForm f){
  result = "// generate computed\n";
  for(/AQuestion q <- f, q is computedQ) {
    result += "function update" + q.var.name + "Label() {\n";
    result += "  " + q.var.name + "Label.innerHTML = " + q.question + " + " + q.var.name + " + " + "\"\<br\>\<br\>\"\n";
    result += "}\n\n";

    result += "function compute" + q.var.name + "(){\n";
    result += "  " + q.var.name + " = " + expr2str(q.expr) + ";\n";
    result += "  update" + q.var.name + "Label();\n";
    result += "}\n\n";
  }
  return result;
}

str expr2str(AExpr expr) {
  switch(expr){
    case ref(id(str x)): return x;
    case number(int x): return toString(x);
    case boolean(bool x): return toString(x);
    case withPars(AExpr expr): return ("( " + expr2str(expr) + " )");
    case or(AExpr lhs, AExpr rhs): return (expr2str(lhs) + " || " + expr2str(rhs));
    case and(AExpr lhs, AExpr rhs): return (expr2str(lhs) + " && " + expr2str(rhs));
    case eq(AExpr lhs, AExpr rhs): return (expr2str(lhs) + " == " + expr2str(rhs)); 
    case notEq(AExpr lhs, AExpr rhs): return (expr2str(lhs) + " != " + expr2str(rhs));
    case lt(AExpr lhs, AExpr rhs): return (expr2str(lhs) + " \< " + expr2str(rhs));
    case leq(AExpr lhs, AExpr rhs): return (expr2str(lhs) + " \<= " + expr2str(rhs));
    case gt(AExpr lhs, AExpr rhs): return (expr2str(lhs) + " \> " + expr2str(rhs));
    case geq(AExpr lhs, AExpr rhs): return (expr2str(lhs) + " \>= " + expr2str(rhs));
    case add(AExpr lhs, AExpr rhs): return (expr2str(lhs) + " + " + expr2str(rhs));
    case subtr(AExpr lhs, AExpr rhs): return (expr2str(lhs) + " - " + expr2str(rhs));    
    case div(AExpr lhs, AExpr rhs): return (expr2str(lhs) + " / " + expr2str(rhs));
    case mul(AExpr lhs, AExpr rhs): return (expr2str(lhs) + " * " + expr2str(rhs));     
    case not(AExpr expr): return ("!" + expr2str(expr));
  }
  return "Unimplemented expression type";
}

str form2js(AForm f) {
  str labels = generateLabels(f); 
  str inputs = generateInputs(f);
  str vars = generateVars(f);
  str additionalFuncs = additionalFunctions(f);
  str basicFunctions = generateBasicFunctions(f);
  str condFunctions = generateConditionalFunctions(f);
  str computedFunctions = generateComputedFunctions(f);
  return labels + "\n" + inputs + "\n" + vars + "\n" + additionalFuncs + "\n" + basicFunctions + "\n" + condFunctions + "\n" + computedFunctions + "\n";
}

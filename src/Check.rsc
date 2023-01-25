module Check

import AST;
import Resolve;
import Message; // see standard library
import IO;

data Type
  = tint()
  | tbool()
  | tstr()
  | tunknown()
  ;

str typeToString(Type t) {
  if (t == tint()) {
    return "integer";
  } else if(t== tbool()){
    return "boolean";
  } else if (t == tstr()) {
    return "string";
  } else {
    return "unknown";
  }
  
}

Type convert(AType t){
  if (t is booleanType) {
    return(tbool());
  } else if (t is intType) {
    return(tint());
  } else if (t is stringType) {
    return(tstr());
  }
  return(tunknown());
}

// the type environment consisting of defined questions in the form 
alias TEnv = rel[loc def, str name, str label, Type \type];

// To avoid recursively traversing the form, use the `visit` construct
// or deep match (e.g., `for (/question(...) := f) {...}` ) 
TEnv collect(AForm f) {
  TEnv collections = {};
  for (/AQuestion q := f) {
    if (q is basicQ || q is computedQ) {
      collections += <q.src, q.question, q.var.name, convert(q.t)>;
    }
  }
  return collections;
}

set[Message] check(AForm f, TEnv tenv, UseDef useDef) {
  set[Message] messages = {};
  for (/AQuestion q := f) {
    if (q is basicQ || q is computedQ) {
      messages += check(q, tenv, useDef);
    }
  }
  return messages; 
}

// name = id, label = str question
// - produce an error if there are declared questions with the same name but different types.
// - duplicate labels should trigger a warning 
// - the declared type computed questions should match the type of the expression.
set[Message] check(AQuestion q, TEnv tenv, UseDef useDef) {
  set[Message] msgs = {};

  // duplicate labels should trigger a warning 
  for(<d, _, label, typ> <- tenv) {
    msgs += { warning("Label declared elsewhere with the same type " + typeToString(typ), d) | label == q.var.name && d != q.src && typ == convert(q.t)};
    msgs += { error("Label declared elsewhere with different types - " + typeToString(typ) + " and " + typeToString(convert(q.t)) , d) | label == q.var.name && d != q.src && typ != convert(q.t)};
  }

  // the declared type computed questions should match the type of the expression.
  if (q is computedQ) {
    for(/AExpr expr <- q) {
      switch(expr) {
        case ref(AId _): if (convert(q.t) != typeOf(expr, tenv, useDef)) {
        msgs += { error("Invalid type: Expected " + typeToString(convert(q.t)) + ", found " + typeToString(typeOf(expr, tenv, useDef)), expr.src); }
        }
      }
    }
    if (convert(q.t) != typeOf(q.expr, tenv, useDef)) {
       msgs += { error("The declared type of computed question - " + typeToString(convert(q.t)) + " does not match the type of the expression - " + typeToString(typeOf(q.expr, tenv, useDef)), q.expr.src); }
    }
  }

  // check individual expressions
  for(/AExpr expr <- q) {
      msgs += check(expr, tenv, useDef);
  }

  // produce an error if there are declared questions with the same name but different types.
  for(<d, name, _, t> <- tenv) {
      msgs += { error("Question of different type with the same label declared elsewhere", d) | name == q.var.name && d != q.src && t != convert(q.t)};
  }

  return msgs;
}

// Check operand compatibility with operators.
// E.g. for an addition node add(lhs, rhs), 
//   the requirement is that typeOf(lhs) == typeOf(rhs) == tint()
set[Message] check(AExpr e, TEnv tenv, UseDef useDef) {
  set[Message] msgs = {};
  switch (e) {
    case ref(AId x): msgs += { error("Undeclared question", x.src) | useDef[x.src] == {} };
    case or(AExpr lhs, AExpr rhs): msgs += { error("Binary operation OR cannot be performed on " + typeToString(typeOf(lhs, tenv, useDef)) + " and " + typeToString(typeOf(rhs, tenv, useDef)), e.src) | typeOf(lhs, tenv, useDef) != tbool() || typeOf(rhs, tenv, useDef) != tbool()};
    case and(AExpr lhs, AExpr rhs): msgs += { error("Binary operation AND cannot be performed on " + typeToString(typeOf(lhs, tenv, useDef)) + " and " + typeToString(typeOf(rhs, tenv, useDef)), e.src) | typeOf(lhs, tenv, useDef) != tbool() || typeOf(rhs, tenv, useDef) != tbool()};
    case eq(AExpr lhs, AExpr rhs): msgs += { error("Comparison not defined on " + typeToString(typeOf(lhs, tenv, useDef)) + " and " + typeToString(typeOf(rhs, tenv, useDef)) , e.src) | typeOf(lhs, tenv, useDef) != tint() || typeOf(rhs, tenv, useDef) != tint()};
    case notEq(AExpr lhs, AExpr rhs): msgs += { error("Comparison not defined on " + typeToString(typeOf(lhs, tenv, useDef)) + " and " + typeToString(typeOf(rhs, tenv, useDef)) , e.src) | typeOf(lhs, tenv, useDef) != tint() || typeOf(rhs, tenv, useDef) != tint()};
    case lt(AExpr lhs, AExpr rhs): msgs += { error("Comparison not defined on " + typeToString(typeOf(lhs, tenv, useDef)) + " and " + typeToString(typeOf(rhs, tenv, useDef)) , e.src) | typeOf(lhs, tenv, useDef) != tint() || typeOf(rhs, tenv, useDef) != tint()};
    case leq(AExpr lhs, AExpr rhs): msgs += { error("Comparison not defined on " + typeToString(typeOf(lhs, tenv, useDef)) + " and " + typeToString(typeOf(rhs, tenv, useDef)) , e.src) | typeOf(lhs, tenv, useDef) != tint() || typeOf(rhs, tenv, useDef) != tint()};
    case gt(AExpr lhs, AExpr rhs): msgs += { error("Comparison not defined on " + typeToString(typeOf(lhs, tenv, useDef)) + " and " + typeToString(typeOf(rhs, tenv, useDef)) , e.src) | typeOf(lhs, tenv, useDef) != tint() || typeOf(rhs, tenv, useDef) != tint()};
    case geq(AExpr lhs, AExpr rhs): msgs += { error(" cannot be performed on " + typeToString(typeOf(lhs, tenv, useDef)) + " and " + typeToString(typeOf(rhs, tenv, useDef)) , e.src) | typeOf(lhs, tenv, useDef) != tint() || typeOf(rhs, tenv, useDef) != tint()};
    case add(AExpr lhs, AExpr rhs): msgs += { error("Addition cannot be performed on " + typeToString(typeOf(lhs, tenv, useDef)) + " and " + typeToString(typeOf(rhs, tenv, useDef)) , e.src) | typeOf(lhs, tenv, useDef) != tint() || typeOf(rhs, tenv, useDef) != tint()};
    case subtr(AExpr lhs, AExpr rhs): msgs += { error("Subtraction cannot be performed on " + typeToString(typeOf(lhs, tenv, useDef)) + " and " + typeToString(typeOf(rhs, tenv, useDef)) , e.src) | typeOf(lhs, tenv, useDef) != tint() || typeOf(rhs, tenv, useDef) != tint()}; 
    case div(AExpr lhs, AExpr rhs): msgs += { error("Division cannot be performed on " + typeToString(typeOf(lhs, tenv, useDef)) + " and " + typeToString(typeOf(rhs, tenv, useDef)), e.src) | typeOf(lhs, tenv, useDef) != tint() || typeOf(rhs, tenv, useDef) != tint()};
    case mul(AExpr lhs, AExpr rhs): msgs += { error("Multiplication cannot be performed on " + typeToString(typeOf(lhs, tenv, useDef)) + " and " + typeToString(typeOf(rhs, tenv, useDef)) , e.src) | typeOf(lhs, tenv, useDef) != tint() || typeOf(rhs, tenv, useDef) != tint()};     
    case not(AExpr expr): msgs += { error("Binary operation NOT cannot be performed on a " + typeToString(a), e.src) | Type a <- typeOf(expr, tenv, useDef), a != tbool()};
  }
  return msgs; 
}

Type typeOf(AExpr e, TEnv tenv, UseDef useDef) {
  Type temp = tunknown();
  switch (e) {
    case ref(id(_, src = loc u)):  
      if (<u, loc d> <- useDef, <d, _, _, Type t> <- tenv) {
        temp=t;
      }
    case number(_):
      temp = tint();
    case boolean(_):
      temp = tbool();
    case withPars(AExpr e):
      temp = typeOf(e, tenv, useDef);
    case or(_, _):
      temp = tbool();
    case and(_, _):
      temp = tbool();
    case eq(_, _):
      temp = tbool();
    case notEq(_, _):
      temp = tbool();
    case lt(_, _):
      temp = tbool();
    case leq(_, _):
      temp = tbool();
    case gt(_, _):
      temp = tbool();    
    case geq(_, _):
      temp = tbool();
    case add(_, _):
      temp = tint();
    case subtr(_, _):
      temp = tint();
    case div(_, _):
      temp = tint();    
    case mul(_, _):
      temp = tint();
    case not(_):
      temp = tbool();  
  }
  return temp; 
}

/* 
 * Pattern-based dispatch style:
 * 
 * Type typeOf(ref(id(_, src = loc u)), TEnv tenv, UseDef useDef) = t
 *   when <u, loc d> <- useDef, <d, x, _, Type t> <- tenv
 *
 * ... etc.
 * 
 * default Type typeOf(AExpr _, TEnv _, UseDef _) = tunknown();
 *
 */
 
 


module AST

/*
 * Define Abstract Syntax for QL [tmp]
 *
 * - complete the following data types
 * - make sure there is an almost one-to-one correspondence with the grammar
 */

data AForm(loc src = |file:///|)
  = form(AId name, list[AQuestion] questions)
  ; 

data AQuestion(loc src = |file:///|)
  = basicQ(str question, AId var, AType t)
  | computedQ(str question, AId var, AType t, AExpr expr)
  | conditionalQ(AExpr expr, list[AQuestion] questions)
  | conditionalQWithElse(AExpr expr, list[AQuestion] ifqs, list[AQuestion] elseqs)
  ;

data AExpr(loc src = |file:///|)
  = ref(AId id)
  | number(int n)
  | boolean(bool b)
  | withPars(AExpr exp)
  | or(AExpr lhs, AExpr rhs)
  | and(AExpr lhs, AExpr rhs)
  | notEq(AExpr lhs, AExpr rhs)
  | eq(AExpr lhs, AExpr rhs)
  | lt(AExpr lhs, AExpr rhs)
  | leq(AExpr lhs, AExpr rhs)
  | gt(AExpr lhs, AExpr rhs)
  | geq(AExpr lhs, AExpr rhs)
  | add(AExpr lhs, AExpr rhs)
  | subtr(AExpr lhs, AExpr rhs)
  | div(AExpr lhs, AExpr rhs)
  | mul(AExpr lhs, AExpr rhs)
  | not(AExpr expr)
  ;


data AId(loc src = |file:///|)
  = id(str name);

data AType(loc src = |file:///|)
  = stringType()
  | booleanType()
  | intType()
  ;
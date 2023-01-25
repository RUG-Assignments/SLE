module CST2AST

import Syntax;
import AST;
import String;
import ParseTree;
import Boolean;
import IO;

/*
 * Implement a mapping from concrete syntax trees (CSTs) to abstract syntax trees (ASTs)
 *
 * - Use switch to do case distinction with concrete patterns (like in Hack your JS) 
 * - Map regular CST arguments (e.g., *, +, ?) to lists 
 *   (NB: you can iterate over * / + arguments using `<-` in comprehensions or for-loops).
 * - Map lexical nodes to Rascal primitive types (bool, int, str)
 * - See the ref example on how to obtain and propagate source locations.
 */

AForm cst2ast(start[Form] sf) = cst2ast(sf.top);

AForm cst2ast(f: (Form)`form <Id x> { <Question* qs> }`) = form(id("<x>", src=x.src), [cst2ast(q) | Question q <- qs], src = f.src);

default AQuestion cst2ast(Question question) {
  switch(question){
    case (Question)`<Str x> <Id y> : <Type z>` :  return basicQ("<x>", id("<y>", src=y.src), cst2ast(z), src=question.src);
    case (Question)`<Str x> <Id y> : <Type z> = <Expr e>` : return computedQ("<x>", id("<y>", src=y.src), cst2ast(z), cst2ast(e), src=question.src);
    case (Question)`if ( <Expr x> ) { <Question* qs> }` : return conditionalQ(cst2ast(x), [cst2ast(q) | Question q <- qs], src=question.src);
    case (Question)`if ( <Expr x> ) { <Question* qs1> } else {<Question* qs2>}` : return conditionalQWithElse(cst2ast(x), [cst2ast(q1) | Question q1 <- qs1], [cst2ast(q2) | Question q2 <- qs2], src=question.src);
    default: throw "Not yet implemented <question>";
  }
}

AExpr cst2ast(Expr e) {
  switch (e) {
    case (Expr)`<Id x>`: return ref(id("<x>", src=x.src), src=e.src);
    case (Expr)`<Int x>`: return number(toInt("<x>"), src=e.src);
    case (Expr)`<Bool x>`: return boolean(fromString("<x>"), src=e.src);
    case (Expr)`(<Expr x>)` : return withPars(cst2ast(x), src=e.src);
    case (Expr)`<Expr x> || <Expr y>` : return or(cst2ast(x), cst2ast(y), src=e.src);
    case (Expr)`<Expr x> && <Expr y>` : return and(cst2ast(x), cst2ast(y), src=e.src);
    case (Expr)`<Expr x> != <Expr y>` : return notEq(cst2ast(x), cst2ast(y), src=e.src);
    case (Expr)`<Expr x> == <Expr y>` : return eq(cst2ast(x), cst2ast(y), src=e.src);
    case (Expr)`<Expr x> \< <Expr y>` : return lt(cst2ast(x), cst2ast(y), src=e.src);
    case (Expr)`<Expr x> \<= <Expr y>` : return leq(cst2ast(x), cst2ast(y), src=e.src);
    case (Expr)`<Expr x> \> <Expr y>` : return gt(cst2ast(x), cst2ast(y), src=e.src);
    case (Expr)`<Expr x> \>= <Expr y>` : return geq(cst2ast(x), cst2ast(y), src=e.src);
    case (Expr)`<Expr x> + <Expr y>` : return add(cst2ast(x), cst2ast(y), src=e.src);
    case (Expr)`<Expr x> - <Expr y>` : return subtr(cst2ast(x), cst2ast(y), src=e.src);
    case (Expr)`<Expr x> / <Expr y>` : return div(cst2ast(x), cst2ast(y), src=e.src);
    case (Expr)`<Expr x> * <Expr y>` : return mul(cst2ast(x), cst2ast(y), src=e.src);
    case (Expr)`! <Expr x>` : return not(cst2ast(x), src=e.src);
    default: throw "Unhandled expression: <e>";
  }
}

default AType cst2ast(Type t) {
  switch(t){
    case (Type)`string`: return(stringType(src=t.src)); 
    case (Type)`integer`: return(intType(src=t.src)); 
    case (Type)`boolean`: return(booleanType(src=t.src));
    default: throw "Unhandled type: <t>";
  }
}

//test Bool implodeState() = state(id("foo"), []) := cst2ast((State) `state foo end`);
//:test
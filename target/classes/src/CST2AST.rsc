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

AForm cst2ast(f: (Form)`form <Id x> { <Component* coms> }`) = basicForm(id("<x>", src=x.src), [cst2ast(com) | Component com <- coms], src = f.src);

default AComponent cst2ast(Component component) {
  switch(component) {
    case (Component)`<Str x> <Id y> : <Type z>` :  return qComp(basicQ("<x>", id("<y>", src=y.src), cst2ast(z), src=component.src), src=component.src);
    case (Component)`<Str x> <Id y> : <Type z> = <Expr e>` : return qComp(computedQ("<x>", id("<y>", src=y.src), cst2ast(z), cst2ast(e), src=component.src), src=component.src);
    case (Component)`if ( <Expr x> ) { <Component* comps> }` : return conComp(conditionalQ(cst2ast(x), [cst2ast(com) | Component com <- comps], src=component.src), src=component.src);
    case (Component)`if ( <Expr x> ) { <Component* coms1> } else {<Component* coms2>}` : return conComp(conditionalQWithElse(cst2ast(x), [cst2ast(com1) | Component com1 <- coms1], [cst2ast(com2) | Component com2 <- coms2], src=component.src), src=component.src);
    default: throw "Not yet implemented component <component>";
  }
}

/*
default AQuestion cst2ast(Question question) {
  switch(question) {
    case (Question)`<Str x> <Id y> : <Type z>` : return basicQ("<x>", id("<y>", src=y.src), cst2ast(z), src=question.src);
    case (Question)`<Str x> <Id y> : <Type z> = <Expr e>` : return computedQ("<x>", id("<y>", src=y.src), cst2ast(z), cst2ast(e), src=question.src);
    default: throw "Not yet implemented question <question>";
  }
}

default AConditional cst2ast(Conditional conditional){
  switch(conditional){
    case (Conditional)`if ( <Expr x> ) { <Component* comps> }` : return conditionalQ(cst2ast(x), [cst2ast(com) | Component com <- comps], src=conditional.src);
    case (Conditional)`if ( <Expr x> ) { <Component* coms1> } else {<Component* coms2>}` : return conditionalQWithElse(cst2ast(x), [cst2ast(com1) | Component com1 <- coms1], [cst2ast(com2) | Component com2 <- coms2], src=conditional.src);
    default: throw "Not yet implemented condition <conditional>";
  }
}
*/

AExpr cst2ast(Expr e) {
  switch (e) {
    case (Expr)`<Id x>`: return ref(id("<x>", src=x.src), src=e.src);
    case (Expr)`<Int x>`: return number(toInt("<x>"), src=e.src);
    case (Expr)`<Bool x>`: return boolean(fromString("<x>"), src=e.src);
    case (Expr)`(<Expr x>)` : return withPars(cst2ast(e), src=e.src);
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

default AType cst2ast(Type t) = typ("<t>", src=t.src);

//test Bool implodeState() = state(id("foo"), []) := cst2ast((State) `state foo end`);
//:test
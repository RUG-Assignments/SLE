module Resolve
import IO;
import AST;

/*
 * Name resolution for QL
 */ 


// modeling declaring occurrences of names
alias Def = rel[str name, loc def];

// modeling use occurrences of names
alias Use = rel[loc use, str name];

alias UseDef = rel[loc use, loc def];

// the reference graph
alias RefGraph = tuple[
  Use uses, 
  Def defs, 
  UseDef useDef
]; 

RefGraph resolve(AForm f) = <us, ds, us o ds>
  when Use us := uses(f), Def ds := defs(f);

Use uses(AForm f) {
  Use relations = {};
  for(/AId N := f) {
    relations += <N.src, N.name>;
  }
  println(relations);
  return relations;
}

Def defs(AForm f) {
  Def relations = {};
  /*
  for(/AForm N := f) {
    relations += <N.name.name, N.src>;
  } 
  */
  for(/AQuestion N := f) {
    relations += <N.var.name, N.src>;
  }
  return relations; 
}

//parse(#start[Form], |project://sle-rug/examples/binary.myql|);
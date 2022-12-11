module Syntax

extend lang::std::Layout;
extend lang::std::Id;

/*
 * Concrete syntax of QL
 */

start syntax Form 
  = "form" Id name "{" Component* components "}"
  ; 

syntax Component
  = Question question
  | Conditional cond
  ;

// TODO: question, computed question, block, if-then-else, if-then
syntax Question 
  = Str question Id var ":" Type t 
  | Str question Id var ":" Type t "=" Expr
  ;

syntax Conditional
  = "if" "(" Expr expr ")" "{" Component* components "}" 
  | "if" "(" Expr expr ")" "{" Component* components "}" "else" "{" Component* components "}"
  ;

// TODO: +, -, *, /, &&, ||, !, >, <, <=, >=, ==, !=, literals (bool, int, str)
// Think about disambiguation using priorities and associativity
// and use C/Java style precedence rules (look it up on the internet)
syntax Expr 
  = Id \"true" \ "false" // true/false are reserved keywords.
  | Int
  | Bool
  | "(" Expr ")"
  | left Expr "||" Expr
  > left Expr "&&" Expr
  > left (Expr "!=" Expr | Expr "==" Expr) 
  > left (Expr "\<" Expr | Expr "\<=" Expr | Expr "\>=" Expr | Expr "\>" Expr)
  > left (Expr "+" Expr | Expr "-" Expr)
  > left (Expr "/" Expr | Expr "*" Expr)
  > "!" Expr
  ;

syntax Type = "string" | "integer" | "boolean";

lexical Str = [\"] ![\"]*[\"];

lexical Int = "-"? [1-9][0-9]* | [0];

lexical Bool = "true" | "false";
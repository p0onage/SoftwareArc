header {package decaf;}

options
{
  mangleLiteralPrefix = "TK_";
  language="Java";
}

class DecafParser extends Parser;
options
{
  importVocab=DecafScanner;
  k=3;
  buildAST=true;
}

program: TK_class ID LCURLY (field_decl)* (method_decl)* RCURLY EOF;

// ")+","";");" This part is an error. Need "," inside the brackets. and ";" at the end

field_decl			: (type ( ID | ID "[" INT "]" )+","";"); 

method_decl			: (type | "void") ID "("(type ID)+","")" block;

block				: "{" (var_decl)* (statement)* "}";

var_decl			: ((type) (ID)*","";"); 



statement: ("");

//expr: (INT);

type: ("int"|"boolean"); 


header {package decaf;}

options 
{
  mangleLiteralPrefix = "TK_";
  language="Java";
}

class DecafScanner extends Lexer;
options 
{
  k=2;
}

tokens 
{
  "class"; "if"; "boolean"; "callout"; "else"; "int"; "return"; "void"; "for"; "break"; "continue";
  
}

LCURLY options { paraphrase = "{"; } : "{";
RCURLY options { paraphrase = "}"; } : "}";

ID options { paraphrase = "an identifier"; } : 
  ('a'..'z' | 'A'..'Z' | '_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*;
  

  


WS_ : (' ' | '\n' {newline();}) {_ttype = Token.SKIP; };

SL_COMMENT : "//" (~'\n')* '\n' {_ttype = Token.SKIP; newline (); };

CHAR : '\'' (ESC|~('\''|'"'|'\n'|'\r'|'\t')) '\'' ;

STRING : '"' (ESC|~('\''|'"'|'\n'|'\r'|'\t'|'\\'))* '"';


HEX : ('0' 'x' HEX1 (HEX1)*);

INT : ('0'..'9')+;

BOOL : ("true" | "false" );



protected
ESC :  '\\' ('n'|'t'|'r'|'\\'|'\''|'\"');

ESC1 : '\\' ('?'|'.'|'\'');

ESC3 : '\\' ('"'|'n');

protected
HEX1: ('0'..'9'|'a'..'f'|'A'..'F')+;

OPERATORS : ('.'|":=" |';'|','|'='|'['|']'|".."|"/="|'<'|"<="|'>'|">="|'+'|'-'|'*'|'/'|"&&"|"!="|"||"|'('|')');  // Need to enhance this to find all possible Operators.

// Why can't I put + at the end of the OPERATORS function?



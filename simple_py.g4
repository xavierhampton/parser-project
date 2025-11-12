grammar simple_py;

start: statement+ EOF;

statement: VAR ASSIGNMENT expression NEWLINE*;

expression: literal 
            | VAR
            | expression ('*' | '/') expression 
            | expression ('+' | '-' | '%') expression
            | array;

literal: FLOAT | INT | BOOL | STRING;
array: '[' (expression (',' expression)*)? ']';

VAR: [a-zA-Z_][a-zA-Z0-9_]*;
ASSIGNMENT: '=' | '*=' | '/=' | '-=' | '+=';
FLOAT: ([0-9]+'.'[0-9]+);
INT: [0-9]+;
BOOL: 'True' | 'False';
STRING: '"' (~["\n])* '"' | '\'' (~['\n])* '\'';
NEWLINE: '\n'+;

WS: [ \t]+ -> skip;
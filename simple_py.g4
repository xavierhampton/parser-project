grammar simple_py;

start: block EOF;

statement:  simple_statement
            | if_statement;

simple_statement: VAR ASSIGNMENT expression NEWLINE*;

if_statement: IF expression ':' NEWLINE INDENT block (elif_clause)* (else_clause)?;

elif_clause: ELIF expression ':' NEWLINE INDENT block;

else_clause: ELSE ':' NEWLINE INDENT block;

block: statement+ ;


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
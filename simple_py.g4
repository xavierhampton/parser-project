///////////////////////
//Grammar Start
///////////////////////

grammar simple_py;

start: block EOF;

///////////////////////
//Statements and Blocks
///////////////////////

statement:  simple_statement
            | if_statement;

simple_statement: VAR ASSIGNMENT expression NEWLINE*;

if_statement: IF expression ':' NEWLINE innerBlock (elif_clause)* (else_clause)?;

elif_clause: ELIF expression ':' NEWLINE innerBlock;

else_clause: ELSE ':' NEWLINE innerBlock;

block: statement+ ;
innerBlock: (INDENT statement)+

///////////////////////
//Expressions
///////////////////////

expression: log_or;

log_or: log_and (OR log_and)*;

log_and: equality (AND equality)*

equality: comparison ((EQ | NEQ) comparison)*;

comparison: addition ((GT|LT|GE|LE) addition)*;

addition: mult ((PLUS|MINUS) mult)*;

mult: negation ((MUL|DIV|MOD) negation)*;

negation: (NOT|MINUS) negation
          | root;

root: literal 
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
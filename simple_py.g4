///////////////////////
//Grammar Start
///////////////////////

grammar simple_py;

start: block EOF;

///////////////////////
//Statements and Blocks
///////////////////////

statement:     simple_statement
                | if_statement
                | while_statement
                | for_statement;

simple_statement: VAR ASSIGNMENT expression NEWLINE*;

// If Statement
if_statement: IF expression ':' NEWLINE innerBlock (elif_clause)* (else_clause)?;

elif_clause: ELIF expression ':' NEWLINE innerBlock;

else_clause: ELSE ':' NEWLINE innerBlock;

///Loops
//For Loop
for_statement: FOR VAR IN iterable ':' NEWLINE innerBlock;

//While Loop
while_statement: WHILE '('? expression ')'? ':' NEWLINE innerBlock;
///

//Iterable
iterable: VAR
          | function;

//Function 
function: VAR '(' (expression (',' expression)*)? ')';

//Blocks
block: statement+ ;
innerBlock: (INDENT+ (simple_statement | compound_block))+ ;

compound_block: if_statement 
                | while_statement
                | for_statement ;


///////////////////////
//Expressions
///////////////////////

expression: log_or;

log_or: log_and (OR log_and)* ;

log_and: equality (AND equality)* ;

equality: comparison ((EQ | NEQ) comparison)* ;

comparison: addition ((GT|LT|GE|LE) addition)* ;

addition: mult ((PLUS|MINUS) mult)* ;

mult: negation ((MUL|DIV|MOD) negation)* ;

negation: (NOT|MINUS) negation
          | root ;

root:   literal 
        | VAR
        | array
        | '(' expression ')';

///////////////////////
//Literals/Array
///////////////////////

literal: FLOAT | INT | BOOL | STRING;
array: '[' (expression (',' expression)*)? ']';

///////////////////////
//Tokens
///////////////////////

PLUS: '+';
MINUS: '-';
MUL: '*';
DIV: '/';
MOD: '%';

GT: '>';
LT: '<';
GE: '>=';
LE: '<=';
EQ: '==';
NEQ: '!=';

AND: 'and';
OR: 'or';
NOT: 'not';

IF: 'if';
ELIF: 'elif';
ELSE: 'else';

FLOAT: ([0-9]+'.'[0-9]+);
INT: [0-9]+;
BOOL: 'True' | 'False';
STRING: '"' (~["\n])* '"' | '\'' (~['\n])* '\'';

VAR: [a-zA-Z_][a-zA-Z0-9_]*;
ASSIGNMENT: '+=' | '*=' | '/=' | '-=' | '=';

INDENT: '\t';
NEWLINE: '\n'+;

WS: [ ]+ -> skip;
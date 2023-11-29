%{
#include <iostream>
#include <string.h>
#include "parseTree.h"
using namespace std;

int yyerror(const char* s);
extern int yylex();
extern FILE *yyin;

struct parseTree *tree;
int currentNode = 0;
%}

%union {
    struct parseTree *node;
    char* sym;
}

%token<sym> K_DO K_DOUBLE K_ELSE K_EXIT K_FUNCTION K_IF K_INTEGER K_PRINT_DOUBLE K_PRINT_INTEGER K_PRINT_STRING K_PROCEDURE K_PROGRAM K_READ_DOUBLE K_READ_INTEGER K_READ_STRING K_RETURN K_STRING K_THEN K_WHILE ASSIGN ASSIGN_PLUS ASSIGN_MINUS ASSIGN_MULTIPLY ASSIGN_DIVIDE ASSIGN_MOD COMMA COMMENT DAND DIVIDE DOR DEQ GEQ GT LBRACKET LEQ LCURLY LPAREN LT MINUS DECREMENT MOD MULTIPLY NE NOT PERIOD PLUS INCREMENT RBRACKET RCURLY RPAREN SEMI IDENTIFIER ICONSTANT DCONSTANT SCONSTANT


%left PLUS MINUS
%left MULTIPLY DIVIDE
%left ASSIGN
%right NOT
%nonassoc DAND DOR DEQ GEQ GT LEQ LT NE  

%type<node> program block stmts stmt var_dec fun_dec proc_dec fun_dec_args iden const arith bool expr call_args type print do_loop while_loop

%%

program: K_PROGRAM iden block { tree = insert($2->name, $1, currentNode++, $3, NULL); $$ = tree; }
;

block: LCURLY stmts RCURLY { tree = insert(NULL, strdup("block"), currentNode++, $2, NULL); $$ = tree; }
|   LCURLY RCURLY { tree = insert(NULL, strdup("block"), currentNode++, NULL, NULL); $$ = tree; }
;

stmts: stmt { $$ = $1; }
|   stmts stmt { tree = insert(NULL, strdup("stmts"), currentNode++, $1, $2); $$ = tree; }
;

stmt: var_dec SEMI { $$ = $1; }
|   fun_dec { $$ = $1; }
|   do_loop { $$ = $1; }
|   while_loop { $$ = $1; }
|   proc_dec { $$ = $1; }
|   expr SEMI { $$ = $1; }
|   COMMENT { $$ = NULL; }
|   print SEMI { $$ = $1; }
;

var_dec: type iden { tree = insert($2->name, strdup("var_dec"), currentNode++, $1, $2); $$ = tree; }
|   type iden ASSIGN expr { 
        tree = insert($2->name, strdup("var_dec"), currentNode++, insert($2->name, strdup("assign"), currentNode++, $1, $4), $2);  
        $$ = tree;
    }   
;

fun_dec: K_FUNCTION type iden LPAREN fun_dec_args RPAREN block
;

proc_dec: K_PROCEDURE iden LPAREN fun_dec_args RPAREN block
;

fun_dec_args: %empty { /*empty*/ }
|   var_dec
|   fun_dec_args COMMA var_dec
;

iden: IDENTIFIER
;


const: ICONSTANT
|   DCONSTANT
|   SCONSTANT
;

arith: expr PLUS expr
|   expr MINUS expr
|   expr MULTIPLY expr
|   expr DIVIDE expr
|   LPAREN expr RPAREN
;

bool: expr DAND expr
|   expr DOR expr
|   expr DEQ expr
|   expr GT expr
|   expr LEQ expr
|   expr GEQ expr
|   expr LT expr
|   expr NE expr
|   NOT expr
;

expr: arith
|   bool
|   iden ASSIGN expr
|   iden LPAREN call_args RPAREN
|   iden
|   const
;


call_args: %empty { /*empty*/ }
|   expr
|   call_args COMMA expr
;

type: K_INTEGER
|   K_DOUBLE
|   K_STRING
;

print: K_PRINT_INTEGER LPAREN iden RPAREN
|   K_PRINT_INTEGER LPAREN const RPAREN
|   K_PRINT_DOUBLE LPAREN iden RPAREN
|   K_PRINT_DOUBLE LPAREN const RPAREN
|   K_PRINT_STRING LPAREN iden RPAREN
|   K_PRINT_STRING LPAREN const RPAREN
;

do_loop: K_DO LPAREN bool RPAREN block
|   K_DO LPAREN bool RPAREN stmt
;

while_loop: K_WHILE LPAREN bool RPAREN block
|   K_WHILE LPAREN bool RPAREN stmt
;

%%

int main(int argc, char* argv[]) {
    if(argc == 2) {
        const char* filename = argv[1];
        FILE* file = fopen(filename, "r");

        if(!file) {
            cerr << "Unable to open " << filename << endl;
            return 1;
        }

        yyin = file;
        do { 
            yyparse();
        } while(!feof(yyin));

        fclose(file);

        /* cout << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << "+ Walking Through the Parse Tree Begins Here" << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << endl;

        printTree(tree);

        cout << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << "+ Done Walking Through Parse Tree" << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << endl; */
    } else {
        cout << "Please use a single file as an argument." << endl;
    }
    return 0;
}

int yywrap() {
    return 1;
}

int yyerror(const char *s) {
    cerr << "Parse error: " << s << endl;
    return 0;
}
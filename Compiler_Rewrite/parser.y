%{
#include<iostream>
using namespace std;

int yyerror(const char* s);
extern int yylex();
extern FILE *yyin;
%}

%union {
    char* sym;
}

%token<sym> K_DO K_DOUBLE K_ELSE K_EXIT K_FUNCTION K_IF K_INTEGER K_PRINT_DOUBLE K_PRINT_INTEGER K_PRINT_STRING K_PROCEDURE K_PROGRAM K_READ_DOUBLE K_READ_INTEGER K_READ_STRING K_RETURN K_STRING K_THEN K_WHILE ASSIGN ASSIGN_PLUS ASSIGN_MINUS ASSIGN_MULTIPLY ASSIGN_DIVIDE ASSIGN_MOD COMMA COMMENT DAND DIVIDE DOR DEQ GEQ GT LBRACKET LEQ LCURLY LPAREN LT MINUS DECREMENT MOD MULTIPLY NE NOT PERIOD PLUS INCREMENT RBRACKET RCURLY RPAREN SEMI IDENTIFIER ICONSTANT DCONSTANT SCONSTANT

%left PLUS MINUS
%left MULTIPLY DIVIDE
%left ASSIGN

%%

program: K_PROGRAM iden block
;

block: LCURLY stmts RCURLY 
|   LCURLY RCURLY
;

stmts: stmt
|   stmts stmt
;

stmt: var_dec SEMI
|   fun_dec
|   proc_dec
|   expr SEMI
|   COMMENT
|   print SEMI
;

var_dec: type iden
|   type iden ASSIGN expr
;

fun_dec: K_FUNCTION type iden LPAREN fun_dec_args RPAREN block
;

proc_dec: K_PROCEDURE iden LPAREN fun_dec_args RPAREN block
;

fun_dec_args: /*blank*/
|   var_dec
|   fun_dec_args COMMA var_dec
;

iden: IDENTIFIER
;

const: ICONSTANT
|   DCONSTANT
|   SCONSTANT
;

expr: iden ASSIGN expr 
|   expr PLUS expr
|   expr MINUS expr
|   expr MULTIPLY expr
|   expr DIVIDE expr
|   LPAREN expr RPAREN
|   iden LPAREN call_args RPAREN
|   iden
|   const
;

call_args: /*blank*/
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
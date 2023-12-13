%{
#include <iostream>
#include <string.h>
#include <fstream>
#include "parseTree.h"
#include "symtab.h"
using namespace std;

int yyerror(const char* s);
extern int yylex();
extern FILE *yyin;

struct parseTree *tree;
struct symtab *table;
int currentNode = 0;
%}

%union {
    struct parseTree *node;
    char* sym;
}

%token<sym> K_DO K_DOUBLE K_ELSE K_FUNCTION K_IF K_INTEGER K_PRINT_DOUBLE K_PRINT_INTEGER K_PRINT_STRING K_PROCEDURE K_PROGRAM K_READ_DOUBLE K_READ_INTEGER K_READ_STRING K_RETURN K_STRING K_THEN K_WHILE ASSIGN ASSIGN_PLUS ASSIGN_MINUS ASSIGN_MULTIPLY ASSIGN_DIVIDE ASSIGN_MOD COMMA  DAND DIVIDE DOR DEQ GEQ GT LBRACKET LEQ LCURLY LPAREN LT MINUS DECREMENT MOD MULTIPLY NE NOT PLUS INCREMENT RBRACKET RCURLY RPAREN SEMI IDENTIFIER ICONSTANT DCONSTANT SCONSTANT


%left PLUS MINUS
%left MULTIPLY DIVIDE
%left INCREMENT DECREMENT
%left MOD
%right NOT
%left DAND DOR DEQ GEQ GT LEQ LT NE
%right K_THEN
%left K_ELSE
%nonassoc UMINUS  

%type<node> program block stmts stmt var_dec fun_dec proc_dec fun_dec_args iden const arith bool expr call_args type print do_loop while_loop var_assign do_bool cond_block array dec return_stmt read assign_op if_stmt else_stmt var_dec_list

%%

program: K_PROGRAM iden block { $$ = tree; }
;

block: LCURLY stmts RCURLY { $$ = tree; }
|   LCURLY RCURLY { $$ = tree; }
;

stmts: stmt { $$ = tree; }
|   stmts stmt { $$ = tree; }
;

stmt: var_dec SEMI { $$ = tree; }
|   var_assign SEMI { $$ = tree; }
|   expr SEMI { $$ = tree; }
|   fun_dec { $$ = tree; }
|   return_stmt SEMI { $$ = tree; }
|   do_loop { $$ = tree; }
|   while_loop { $$ = tree; }
|   proc_dec { $$ = tree; }
|   print SEMI { $$ = tree; }
|   read SEMI { $$ = tree; }
|   if_stmt { $$ = tree; }
;

var_dec: type dec var_dec_list { $$ = tree; }
|   type dec assign_op expr var_dec_list { $$ = tree; }
;

var_dec_list: %empty { $$ = tree; }
|   COMMA dec var_dec_list { $$ = tree; }
;


dec: iden { $$ = tree; }
|   array { $$ = tree; }
;

var_assign: dec assign_op expr { $$ = tree; }
|   dec assign_op var_assign { $$ = tree; }
|   var_dec assign_op expr { $$ = tree; }
|   var_dec assign_op var_assign { $$ = tree; }
|   var_dec COMMA var_assign { $$ = tree; }
;


assign_op: ASSIGN { $$ = tree; }
|   ASSIGN_PLUS { $$ = tree; }
|   ASSIGN_MINUS { $$ = tree; }
|   ASSIGN_MULTIPLY { $$ = tree; }
|   ASSIGN_DIVIDE { $$ = tree; }
|   ASSIGN_MOD { $$ = tree; }
; 

fun_dec: K_FUNCTION type iden LPAREN fun_dec_args RPAREN block { $$ = tree; }
;

proc_dec: K_PROCEDURE iden LPAREN fun_dec_args RPAREN block { $$ = tree; }
;

fun_dec_args: %empty { $$ = tree; }
|   type dec { $$ = tree; }
|   fun_dec_args COMMA type dec { $$ = tree; }
;

iden: IDENTIFIER { $$ = tree; }
;

const: ICONSTANT { $$ = tree; }
|   DCONSTANT { $$ = tree; }
|   SCONSTANT { $$ = tree; }
;

arith: expr PLUS expr { $$ = tree; }
|   expr MINUS expr { $$ = tree; }
|   expr MULTIPLY expr { $$ = tree; }
|   expr DIVIDE expr { $$ = tree; }
|   expr MOD expr { $$ = tree; }
|   LPAREN expr RPAREN { $$ = tree; }
|   expr INCREMENT { $$ = tree; }
|   expr DECREMENT { $$ = tree; }
|   MINUS expr %prec UMINUS { $$ = tree; }
;

bool: expr DAND expr { $$ = tree; }
|   expr DOR expr { $$ = tree; }
|   expr DEQ expr { $$ = tree; }
|   expr GT expr { $$ = tree; }
|   expr LEQ expr { $$ = tree; }
|   expr GEQ expr { $$ = tree; }
|   expr LT expr { $$ = tree; }
|   expr NE expr { $$ = tree; }
|   NOT expr { $$ = tree; }
;

expr: arith { $$ = tree; }
|   bool { $$ = tree; }
|   array { $$ = tree; }
|   iden LPAREN call_args RPAREN { $$ = tree; }
|   iden { $$ = tree; }
|   const { $$ = tree; }
;

call_args: %empty { $$ = tree; }
|   expr { $$ = tree; }
|   call_args COMMA expr { $$ = tree; }
;

type: K_INTEGER { $$ = tree; }
|   K_DOUBLE { $$ = tree; }
|   K_STRING { $$ = tree; }
;

print: K_PRINT_INTEGER LPAREN dec RPAREN { $$ = tree; }
|   K_PRINT_INTEGER LPAREN const RPAREN { $$ = tree; }
|   K_PRINT_DOUBLE LPAREN dec RPAREN { $$ = tree; }
|   K_PRINT_DOUBLE LPAREN const RPAREN { $$ = tree; }
|   K_PRINT_STRING LPAREN dec RPAREN { $$ = tree; }
|   K_PRINT_STRING LPAREN const RPAREN { $$ = tree; }
;

read: K_READ_INTEGER LPAREN dec RPAREN { $$ = tree; }
|   K_READ_DOUBLE LPAREN dec RPAREN { $$ = tree; }
|   K_READ_STRING LPAREN dec RPAREN { $$ = tree; }
;

cond_block: block { $$ = tree; }
|   stmt { $$ = tree; }
;

do_loop: K_DO LPAREN do_bool RPAREN cond_block { $$ = tree; }
;

do_bool: var_assign SEMI bool SEMI arith { $$ = tree; }
;

while_loop: K_WHILE LPAREN expr RPAREN cond_block { $$ = tree; }
;

array: iden LBRACKET RBRACKET { $$ = tree; }
|   iden LBRACKET expr RBRACKET { $$ = tree; }
;

return_stmt: K_RETURN expr { $$ = tree; }
|   K_RETURN var_assign { $$ = tree; }
;

if_stmt: K_IF LPAREN expr RPAREN K_THEN cond_block else_stmt { $$ = tree; }
;

else_stmt: %empty { $$ = tree; }
| K_ELSE cond_block { $$ = tree; }
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

        ofstream mainFile("yourmain.h");

        mainFile << "int yourmain()\n{\n";

        // Generate code here

        mainFile << "return 0;\n}";

        mainFile.close();

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
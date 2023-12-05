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

program: K_PROGRAM iden block { tree = insert($2->name, $1, currentNode++, $3, NULL); $$ = tree; }
;

block: LCURLY stmts RCURLY { $$ = $2; }
|   LCURLY RCURLY { $$ = NULL; }
;

stmts: stmt { $$ = $1; }
|   stmts stmt { tree = insert(strdup("NULL"), strdup("stmts"), currentNode++, $1, $2); $$ = tree; }
;

stmt: var_dec SEMI { $$ = $1; }
|   var_assign SEMI {$$ = $1; }
|   expr SEMI { $$ = $1; }
|   fun_dec { $$ = $1; }
|   return_stmt SEMI { $$ = $1; }
|   do_loop { $$ = $1; }
|   while_loop { $$ = $1; }
|   proc_dec { $$ = $1; }
|   print SEMI { $$ = $1; }
|   read SEMI { $$ = $1; }
|   if_stmt { $$ = $1; }
;

var_dec: type dec var_dec_list { tree = insert($2->name, strdup("var_dec"), currentNode++, $1, $2); $$ = tree; }
|   type dec assign_op expr var_dec_list { $$ = tree; }
;

var_dec_list: %empty { $$ = NULL; }
|   COMMA dec var_dec_list { tree = insert($2->name, strdup("var_dec"), currentNode++, NULL, $2); $$ = tree; }
;


dec: iden { $$ = $1; }
|   array { $$ = $1; }
;

var_assign: dec assign_op expr { tree = insert($1->name, strdup("var_assign"), currentNode++, $1, $3); $$ = tree; }
|   dec assign_op var_assign { tree = insert($1->name, strdup("var_assign"), currentNode++, $1, $3); $$ = tree; }
|   var_dec assign_op expr { tree = insert(strdup("NULL"), strdup("var_assign"), currentNode++, $1, $3); $$ = tree; }
|   var_dec assign_op var_assign { tree = insert(strdup("NULL"), strdup("var_assign"), currentNode++, $1, $3); $$ = tree; }
|   var_dec COMMA var_assign { tree = insert(strdup("NULL"), strdup("var_assign"), currentNode++, $1, $3); $$ = tree; }
;


assign_op: ASSIGN { tree = insert(strdup("NULL"), strdup(":="), currentNode++, NULL, NULL); $$ = tree; }
|   ASSIGN_PLUS { tree = insert(strdup("NULL"), strdup("+="), currentNode++, NULL, NULL); $$ = tree; }
|   ASSIGN_MINUS { tree = insert(strdup("NULL"), strdup("-="), currentNode++, NULL, NULL); $$ = tree; }
|   ASSIGN_MULTIPLY { tree = insert(strdup("NULL"), strdup("*="), currentNode++, NULL, NULL); $$ = tree; }
|   ASSIGN_DIVIDE { tree = insert(strdup("NULL"), strdup("/="), currentNode++, NULL, NULL); $$ = tree; }
|   ASSIGN_MOD { tree = insert(strdup("NULL"), strdup("%="), currentNode++, NULL, NULL); $$ = tree; }
; 

fun_dec: K_FUNCTION type iden LPAREN fun_dec_args RPAREN block {
    tree = insert($3->name, strdup("fun_dec"), currentNode++, $2, $7);
    $$ = tree;
}
;

proc_dec: K_PROCEDURE iden LPAREN fun_dec_args RPAREN block {
    tree = insert($2->name, strdup("proc_dec"), currentNode++, NULL, $6);
    $$ = tree;
}
;

fun_dec_args: %empty { $$ = NULL; }
|   type dec { $$ = $1; }
|   fun_dec_args COMMA type dec { tree = insert(strdup("NULL"), strdup("FunDecArgs"), currentNode++, $1, $3); $$ = tree; }
;

iden: IDENTIFIER { tree = insert($1, strdup("Iden"), currentNode++, NULL, NULL); $$ = tree; }
;

const: ICONSTANT { tree = insert($1, strdup("IntConstant"), currentNode++, NULL, NULL); $$ = tree; }
|   DCONSTANT { tree = insert($1, strdup("DoubleConstant"), currentNode++, NULL, NULL); $$ = tree; }
|   SCONSTANT { tree = insert($1, strdup("StringConstant"), currentNode++, NULL, NULL); $$ = tree; }
;

arith: expr PLUS expr { tree = insert(strdup("NULL"), strdup("+"), currentNode++, $1, $3); $$ = tree; }
|   expr MINUS expr { tree = insert(strdup("NULL"), strdup("-"),currentNode++, $1, $3); $$ = tree; }
|   expr MULTIPLY expr { tree = insert(strdup("NULL"), strdup("*"),currentNode++, $1, $3); $$ = tree; }
|   expr DIVIDE expr { tree = insert(strdup("NULL"), strdup("/"),currentNode++, $1, $3); $$ = tree; }
|   expr MOD expr { tree = insert(strdup("NULL"), strdup("%"),currentNode++, $1, $3); $$ = tree; }
|   LPAREN expr RPAREN { $$ = $2; }
|   expr INCREMENT { tree = insert(strdup("NULL"), strdup("++"), currentNode++, $1, NULL); $$ = tree; }
|   expr DECREMENT { tree = insert(strdup("NULL"), strdup("--"), currentNode++, $1, NULL); $$ = tree; }
|   MINUS expr %prec UMINUS { tree = insert(strdup("NULL"), strdup("-"), currentNode++, $2, NULL); $$ = tree; }
;

bool: expr DAND expr { tree = insert(strdup("NULL"), strdup("&&"),currentNode++, $1, $3); $$ = tree; }
|   expr DOR expr { tree = insert(strdup("NULL"), strdup("||"),currentNode++, $1, $3); $$ = tree; }
|   expr DEQ expr { tree = insert(strdup("NULL"), strdup("=="),currentNode++, $1, $3); $$ = tree; }
|   expr GT expr { tree = insert(strdup("NULL"), strdup(">"),currentNode++, $1, $3); $$ = tree; }
|   expr LEQ expr { tree = insert(strdup("NULL"), strdup("<="),currentNode++, $1, $3); $$ = tree; }
|   expr GEQ expr { tree = insert(strdup("NULL"), strdup(">="),currentNode++, $1, $3); $$ = tree; }
|   expr LT expr { tree = insert(strdup("NULL"), strdup("<"),currentNode++, $1, $3); $$ = tree; }
|   expr NE expr { tree = insert(strdup("NULL"), strdup("!="),currentNode++, $1, $3); $$ = tree; }
|   NOT expr { tree = insert(strdup("NULL"), strdup("!"),currentNode++, NULL, $2); $$ = tree; }
;

expr: arith { $$ = $1; }
|   bool { $$ = $1; }
|   array { $$ = $1; }
|   iden LPAREN call_args RPAREN { tree = insert($1->name, strdup("FunctionCall"), currentNode++, $1, $3); $$ = tree; }
|   iden { $$ = $1; }
|   const { $$ = $1; }
;

call_args: %empty { $$ = NULL; }
|   expr { $$ = $1; }
|   call_args COMMA expr { tree = insert(strdup("NULL"), strdup("CallArgs"), currentNode++, $1, $3); $$ = tree; }
;

type: K_INTEGER { tree = insert(strdup("NULL"), strdup("Integer"), currentNode++, NULL, NULL); $$ = tree; }
|   K_DOUBLE { tree = insert(strdup("NULL"), strdup("Double"), currentNode++, NULL, NULL); $$ = tree; }
|   K_STRING { tree = insert(strdup("NULL"), strdup("String"), currentNode++, NULL, NULL); $$ = tree; }
;

print: K_PRINT_INTEGER LPAREN dec RPAREN { tree = insert($3->name, strdup("Print"), currentNode++, $3, NULL); $$ = tree; }
|   K_PRINT_INTEGER LPAREN const RPAREN { tree = insert($3->name, strdup("Print"), currentNode++, $3, NULL); $$ = tree; }
|   K_PRINT_DOUBLE LPAREN dec RPAREN { tree = insert($3->name, strdup("Print"), currentNode++, $3, NULL); $$ = tree; }
|   K_PRINT_DOUBLE LPAREN const RPAREN { tree = insert($3->name, strdup("Print"), currentNode++, $3, NULL); $$ = tree; }
|   K_PRINT_STRING LPAREN dec RPAREN { tree = insert($3->name, strdup("Print"), currentNode++, $3, NULL); $$ = tree; }
|   K_PRINT_STRING LPAREN const RPAREN { tree = insert($3->name, strdup("Print"), currentNode++, $3, NULL); $$ = tree; }
;

read: K_READ_INTEGER LPAREN dec RPAREN { tree = insert($3->name, strdup("read"), currentNode++, $3, NULL); $$ = tree; }
|   K_READ_DOUBLE LPAREN dec RPAREN { tree = insert($3->name, strdup("read"), currentNode++, $3, NULL); $$ = tree; }
|   K_READ_STRING LPAREN dec RPAREN { tree = insert($3->name, strdup("read"), currentNode++, $3, NULL); $$ = tree; }
;

cond_block: block { $$ = $1; }
|   stmt { $$ = $1; }
;

do_loop: K_DO LPAREN do_bool RPAREN cond_block { tree = insert(strdup("NULL"), strdup("DoLoop"), currentNode++, $3, $5); $$ = tree; }
;

do_bool: var_assign SEMI bool SEMI arith { tree = insert(strdup("NULL"), strdup("DoBool"), currentNode++, $1, $3); $$ = tree; }
;

while_loop: K_WHILE LPAREN expr RPAREN cond_block { tree = insert(strdup("NULL"), strdup("WhileLoop"), currentNode++, $3, $5); $$ = tree; }
;

array: iden LBRACKET RBRACKET { tree = insert($1->name, strdup("array"), currentNode++, $1, NULL); $$ = tree; }
|   iden LBRACKET expr RBRACKET { tree = insert($1->name, strdup("array"), currentNode++, $1, $3); $$ = tree; }
;

return_stmt: K_RETURN expr { tree = insert(strdup("NULL"), strdup("return"), currentNode++, $2, NULL); $$ = tree; }
|   K_RETURN var_assign { tree = insert(strdup("NULL"), strdup("return"), currentNode++, $2, NULL); $$ = tree; }
;

if_stmt: K_IF LPAREN expr RPAREN K_THEN cond_block else_stmt { 
        tree = insert(strdup("NULL"), strdup("if_stmt"), currentNode++, $3, $6); 
        $$ = tree; 
    }
;

else_stmt: %empty { $$ = NULL; }
| K_ELSE cond_block { 
        tree = insert(strdup("NULL"), strdup("else_stmt"), currentNode++, $2, NULL); 
        $$ = tree; 
    }
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

        cout << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << "+ Walking Through the Parse Tree Begins Here" << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << endl;

        printTree(tree);

        cout << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << "+ Done Walking Through Parse Tree" << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << endl;
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
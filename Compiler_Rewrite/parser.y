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

block: LCURLY stmts RCURLY { $$ = $2; }
|   LCURLY RCURLY { $$ = NULL; }
;

stmts: stmt { $$ = $1; }
|   stmts stmt { tree = insert(strdup("NULL"), strdup("stmts"), currentNode++, $1, $2); $$ = tree; }
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

fun_dec: K_FUNCTION type iden LPAREN fun_dec_args RPAREN block {
    tree = insert($3->name, strdup("fun_dec"), currentNode++, insert($3->name, strdup("type"), currentNode++, $2, NULL), insert($3->name, strdup("iden"), currentNode++, $3, insert($3->name, strdup("FunDecArgs"), currentNode++, $5, $7)));
    $$ = tree;
}
;

proc_dec: K_PROCEDURE iden LPAREN fun_dec_args RPAREN block {
    tree = insert($2->name, strdup("ProcDec"), currentNode++, insert($2->name, strdup("Iden"), currentNode++, $2, insert($2->name, strdup("FunDecArgs"), currentNode++, $4, $6)), NULL);
    $$ = tree;
}
;

fun_dec_args: %empty { $$ = NULL; }
|   var_dec { $$ = $1; }
|   fun_dec_args COMMA var_dec { tree = insert(strdup("NULL"), strdup("FunDecArgs"), currentNode++, $1, $3); $$ = tree; }
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
|   LPAREN expr RPAREN { $$ = $2; }
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
|   iden ASSIGN expr { tree = insert($1->name, strdup("Assign"), currentNode++, $1, $3); $$ = tree; }
|   iden LPAREN call_args RPAREN { 
        tree = insert($1->name, strdup("FunctionCall"), currentNode++, insert($1->name, strdup("Iden"), currentNode++, NULL, $1), $3); $$ = tree; 
    }
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

print: K_PRINT_INTEGER LPAREN iden RPAREN { 
        tree = insert($3->name, strdup("Print"), currentNode++, insert($3->name, strdup("Iden"), currentNode++, NULL, $3), NULL);
        $$ = tree; 
    }
|   K_PRINT_INTEGER LPAREN const RPAREN { tree = insert($3->name, strdup("Print"), currentNode++, $3, NULL); $$ = tree; }
|   K_PRINT_DOUBLE LPAREN iden RPAREN { 
        tree = insert($3->name, strdup("Print"), currentNode++, insert($3->name, strdup("Iden"), currentNode++, NULL, $3), NULL); 
        $$ = tree;    
    }
|   K_PRINT_DOUBLE LPAREN const RPAREN { tree = insert($3->name, strdup("Print"), currentNode++, $3, NULL); $$ = tree; }
|   K_PRINT_STRING LPAREN iden RPAREN { 
        tree = insert($3->name, strdup("Print"), currentNode++, insert($3->name, strdup("Iden"), currentNode++, NULL, $3), NULL); 
        $$ = tree;    
    }
|   K_PRINT_STRING LPAREN const RPAREN { tree = insert($3->name, strdup("Print"), currentNode++, $3, NULL); $$ = tree; }
;

do_loop: K_DO LPAREN bool RPAREN block { tree = insert(strdup("NULL"), strdup("DoLoop"), currentNode++, $3, $5); $$ = tree; }
|   K_DO LPAREN bool RPAREN stmt { 
        tree = insert(strdup("NULL"), strdup("DoLoop"), currentNode++, $3, insert(strdup("NULL"), strdup("Stmt"), currentNode++, NULL, $5)); 
        $$ = tree;
    }
;

while_loop: K_WHILE LPAREN bool RPAREN block { tree = insert(strdup("NULL"), strdup("WhileLoop"), currentNode++, $3, $5); $$ = tree; }
|   K_WHILE LPAREN bool RPAREN stmt { 
        tree = insert(strdup("NULL"), strdup("WhileLoop"), currentNode++, $3, insert(strdup("NULL"), strdup("Stmt"), currentNode++, NULL, $5)); 
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
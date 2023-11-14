%{
#include <iostream>
#include <stdio.h>
#include <string.h>
#include <iomanip>
#include <fstream>
#include "symtab.h"
using namespace std;

int yyerror(const char *s);
int yylex();
struct symtab *symupdate(char *s, char *v, int type);

struct node {
    char *name;
    char *action;
    char *other;
    int terminal;
};

int insertNode(struct node tree[], int currentNode, char* name, char* action, char* other, int terminal);

struct node tree[20];
int currentNode = 0;

%}

%union {
    char *sym;
    struct symtab *table;
}

%token<table> IDENTIFIER
%token<sym> K_DO K_DOUBLE K_ELSE K_EXIT K_FUNCTION K_IF K_INTEGER K_PRINT_DOUBLE K_PRINT_INTEGER K_PRINT_STRING K_PROCEDURE K_PROGRAM K_READ_DOUBLE K_READ_INTEGER K_READ_STRING K_RETURN K_STRING K_THEN K_WHILE ASSIGN ASSIGN_PLUS ASSIGN_MINUS ASSIGN_MULTIPLY ASSIGN_DIVIDE ASSIGN_MOD COMMA COMMENT DAND DIVIDE DOR DEQ GEQ GT LBRACKET LEQ LCURLY LPAREN LT MINUS DECREMENT MOD MULTIPLY NE NOT PERIOD PLUS INCREMENT RBRACKET RCURLY RPAREN SEMI SCONSTANT DCONSTANT ICONSTANT 

%left PLUS MINUS
%left MULTIPLY DIVIDE
%nonassoc UMINUS

%type<sym> type

%%

program: K_PROGRAM IDENTIFIER code_block {
    currentNode = insertNode(tree, currentNode, $2->name, strdup("program"), strdup("null"), 0);
    symupdate($2->name, $1, 2);
} 
;

function_dec: K_FUNCTION type IDENTIFIER LPAREN arg_list RPAREN code_block {
    currentNode = insertNode(tree, currentNode, $3-> name, strdup("function_dec"), strdup("null"), 0);
    symupdate($3->name, $1, 2);
    symupdate($3->name, $2, 1);
} 
;

arg_list: arg_list COMMA arg
|   arg
;

arg: type IDENTIFIER {}
|    %empty { /*empty*/ }
;

function_call: IDENTIFIER LPAREN param_list RPAREN {}
;

param_list: param_list COMMA param
|   param
;

param: SCONSTANT
|   ICONSTANT
|   DCONSTANT
|   IDENTIFIER
|   %empty { /*empty*/ }
;

print: K_PRINT_INTEGER LPAREN IDENTIFIER RPAREN {
    currentNode = insertNode(tree, currentNode, $3->name, strdup("print"), strdup("null"), 1);
}
|   K_PRINT_INTEGER LPAREN ICONSTANT RPAREN {
    currentNode = insertNode(tree, currentNode, $3, strdup("print"), strdup("null"), 1);
}
|   K_PRINT_DOUBLE LPAREN IDENTIFIER RPAREN {
    currentNode = insertNode(tree, currentNode, $3->name, strdup("print"), strdup("null"), 1);
}
|   K_PRINT_DOUBLE LPAREN DCONSTANT RPAREN {
    currentNode = insertNode(tree, currentNode, $3, strdup("print"), strdup("null"), 1);
}
|   K_PRINT_STRING LPAREN IDENTIFIER RPAREN {
    currentNode = insertNode(tree, currentNode, $3->name, strdup("print"), strdup("null"), 1);
}
|   K_PRINT_STRING LPAREN SCONSTANT RPAREN {
    currentNode = insertNode(tree, currentNode, $3, strdup("print"), strdup("null"), 1);
}
;

iden_dec :  type IDENTIFIER {
    currentNode = insertNode(tree, currentNode, $2->name, strdup("iden_dec"), strdup("null"), 1);
    char *token = strdup("identifier");
    symupdate($2->name, token, 2);
    symupdate($2->name, $1, 1);
} 
;

iden_assign: IDENTIFIER assign_op IDENTIFIER {
    currentNode = insertNode(tree, currentNode, $1->name, strdup("iden_assign"), $3->name, 1);
    symupdate($1->name, $3->value, 0);
}
|   IDENTIFIER assign_op ICONSTANT {
    currentNode = insertNode(tree, currentNode, $1->name, strdup("iden_assign"), $3, 1);
    symupdate($1->name, $3, 0);
}
|   IDENTIFIER assign_op DCONSTANT {
    currentNode = insertNode(tree, currentNode, $1->name, strdup("iden_assign"), $3, 1);
    symupdate($1->name, $3, 0);
}
|   IDENTIFIER assign_op SCONSTANT {
    currentNode = insertNode(tree, currentNode, $1->name, strdup("iden_assign"), $3, 1);
    symupdate($1->name, $3, 0);
}
|   type IDENTIFIER assign_op IDENTIFIER {
    currentNode = insertNode(tree, currentNode, $2->name, strdup("iden_assign"), $4->name, 1);
    char *token = strdup("identifier");
    symupdate($2->name, token, 2);
    symupdate($2->name, $1, 1);
    symupdate($2->name, $4->value, 0);
}
|   type IDENTIFIER assign_op ICONSTANT {
    currentNode = insertNode(tree, currentNode, $2->name, strdup("iden_assign"), $4, 1);
    char *token = strdup("identifier");
    symupdate($2->name, token, 2);
    symupdate($2->name, $1, 1);
    symupdate($2->name, $4, 0);
}
|   type IDENTIFIER assign_op DCONSTANT {
    currentNode = insertNode(tree, currentNode, $2->name, strdup("iden_assign"), $4, 1);
    char *token = strdup("identifier");
    symupdate($2->name, token, 2);
    symupdate($2->name, $1, 1);
    symupdate($2->name, $4, 0);
}
|   type IDENTIFIER assign_op SCONSTANT {
    currentNode = insertNode(tree, currentNode, $2->name, strdup("iden_assign"), $4, 1);
    char *token = strdup("identifier");
    symupdate($2->name, token, 2);
    symupdate($2->name, $1, 1);
    symupdate($2->name, $4, 0);
}
;

type: K_INTEGER { $$ = $1; }
|   K_DOUBLE { $$ = $1; }
|   K_STRING { $$ = $1; }
;

assign_op: ASSIGN 
|   ASSIGN_PLUS 
|   ASSIGN_MINUS 
|   ASSIGN_MULTIPLY 
|   ASSIGN_DIVIDE 
|   ASSIGN_MOD
;

code_block: LCURLY code RCURLY
;

code: line code
|   %empty { /*empty*/ }
;

line: arith_exp SEMI 
|   iden_dec SEMI 
|   iden_assign SEMI 
|   function_call SEMI 
|   COMMENT 
|   print SEMI 
|   function_dec 
;

arith_exp: arith_exp PLUS arith_exp {}
|   arith_exp MINUS arith_exp {}
|   arith_exp MULTIPLY arith_exp {}
|   arith_exp DIVIDE arith_exp {}
|   MINUS arith_exp %prec UMINUS {}
|   LPAREN arith_exp RPAREN {}
|   ICONSTANT 
|   DCONSTANT
|   IDENTIFIER
;


%%

extern FILE *yyin;

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

        cout << endl;
        cout << "*** Printing Parse Tree ***" << endl;
        cout << setw(20) << left << "Node" << setw(20) << left << "Name" << setw(20) << left << "Action" << setw(20) << left <<  "Other" << setw(20) << left << "Terminal" << endl;
        for(int i = currentNode - 1; i >= 0; i--) {
            cout << setw(20) << i << setw(20) << tree[i].name << setw(20) << tree[i].action << setw(20) << tree[i].other << setw(20) << tree[i].terminal << endl;
        }
        cout << endl;

        ofstream mainFile("yourmain.h");

        mainFile << "int yourmain()\n{";
        
        mainFile << "}";

    } else {
        cout << "Please use a single file as an argument to the parser" << endl;
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

struct symtab *symlook(char *s) {    
    struct symtab *sp;

    for(sp = symtab; sp < &symtab[NSYMS]; sp++) {
        if(sp->name && !strcmp(sp->name, s)) {
            return sp;
        }
        if(!sp->name) {
            sp->name = strdup(s);
            sp->token = strdup("null");
            sp->type = strdup("null");
            sp->value = strdup("null");
            return sp;
        }
    }
    yyerror("Too many symbols");
    exit(1);
}

struct symtab *symupdate(char *s, char *v, int type) {
    // Function to update an index of the symbol table. s is the
    // name of the index to update, v is the value we are adding
    // and type is the type of field (value=0, type=1 or token=2) 
    // we are updating.
    struct symtab *sp;

    for(sp = symtab; sp < &symtab[NSYMS]; sp++) {

        if(sp->name && !strcmp(sp->name, s)) {
            if(type == 0) {
                sp->value = strdup(v);
                return sp;
            } else if(type == 1) {
                sp->type = strdup(v);
                return sp;
            } else if(type == 2) {
                sp->token = strdup(v);
                return sp;
            } else {
                yyerror("Update: invalid type being added");
                exit(1);
            }
        }
        if(!sp->name) {
            yyerror("Attempting to update table before adding name");
            exit(1);
        }
    }
    yyerror("Too many symbols");
    exit(1);
}

int insertNode(struct node tree[], int currentNode, char *name, char *action, char* other, int terminal) {
    tree[currentNode].name = name;
    tree[currentNode].action = action;
    tree[currentNode].other = other;
    tree[currentNode].terminal = terminal;

    return currentNode + 1;
}
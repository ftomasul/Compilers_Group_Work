%{
#include <iostream>
#include <stdio.h>
#include <string.h>
#include <iomanip>
#include "symtab.h"
using namespace std;

int yyerror(const char *s);
int yylex();
struct symtab *symupdate(char *s, char *v, int type);
int symhash(char *s);


%}

%union {
    double num;
    char *sym;
    struct symtab *table;
}

%token<table> IDENTIFIER
%token<sym> K_DO K_DOUBLE K_ELSE K_EXIT K_FUNCTION K_IF K_INTEGER K_PRINT_DOUBLE K_PRINT_INTEGER K_PRINT_STRING K_PROCEDURE K_PROGRAM K_READ_DOUBLE K_READ_INTEGER K_READ_STRING K_RETURN K_STRING K_THEN K_WHILE ASSIGN ASSIGN_PLUS ASSIGN_MINUS ASSIGN_MULTIPLY ASSIGN_DIVIDE ASSIGN_MOD COMMA COMMENT DAND DIVIDE DOR DEQ GEQ GT LBRACKET LEQ LCURLY LPAREN LT MINUS DECREMENT MOD MULTIPLY NE NOT PERIOD PLUS INCREMENT RBRACKET RCURLY RPAREN SEMI SCONSTANT DCONSTANT ICONSTANT 

%left PLUS MINUS
%left MULTIPLY DIVIDE
%nonassoc UMINUS

%type<sym> type
/* %type<sym> program function_dec arg_list arg function_call param_list param print iden_dec iden_assign type assign_op code_block code line arith_exp */

%%

program: K_PROGRAM IDENTIFIER code_block {
    // cout << "Before" << endl;
    struct symtab *sp; 
    sp = symupdate($2->name, $1, 2);
    // cout << "After" << endl;
} 
;

function_dec: K_FUNCTION type IDENTIFIER LPAREN arg_list RPAREN code_block {
    struct symtab *sp;
    sp = symupdate($3->name, $1, 2);
    sp = symupdate($3->name, $2, 1);
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

print: K_PRINT_INTEGER LPAREN IDENTIFIER RPAREN {}
|   K_PRINT_INTEGER LPAREN ICONSTANT RPAREN {}
|   K_PRINT_DOUBLE LPAREN IDENTIFIER RPAREN {}
|   K_PRINT_DOUBLE LPAREN DCONSTANT RPAREN {}
|   K_PRINT_STRING LPAREN IDENTIFIER RPAREN {}
|   K_PRINT_STRING LPAREN SCONSTANT RPAREN {}
;

iden_dec :  type IDENTIFIER { 
    struct symtab *sp;
    char *token = strdup("identifier");

    sp = symupdate($2->name, token, 2);
    sp = symupdate($2->name, $1, 1);
} 
;

iden_assign: IDENTIFIER assign_op IDENTIFIER {
    struct symtab *sp;
    sp = symupdate($1->name, $3->value, 0);
}
|   IDENTIFIER assign_op ICONSTANT {
    struct symtab *sp;
    sp = symupdate($1->name, $3, 0);
}
|   IDENTIFIER assign_op DCONSTANT {
    struct symtab *sp;
    sp = symupdate($1->name, $3, 0);
}
|   IDENTIFIER assign_op SCONSTANT {
    struct symtab *sp;
    sp = symupdate($1->name, $3, 0);
}
|   type IDENTIFIER assign_op IDENTIFIER {
    struct symtab *sp;
    char *token = strdup("identifier");
    sp = symupdate($2->name, token, 2);
    sp = symupdate($2->name, $1, 1);
    sp = symupdate($2->name, $4->value, 0);
}
|   type IDENTIFIER assign_op ICONSTANT {
    struct symtab *sp;
    char *token = strdup("identifier");
    sp = symupdate($2->name, token, 2);
    sp = symupdate($2->name, $1, 1);
    sp = symupdate($2->name, $4, 0);
}
|   type IDENTIFIER assign_op DCONSTANT {
    struct symtab *sp;
    char *token = strdup("identifier");
    sp = symupdate($2->name, token, 2);
    sp = symupdate($2->name, $1, 1);
    sp = symupdate($2->name, $4, 0);
}
|   type IDENTIFIER assign_op SCONSTANT {
    struct symtab *sp;
    char *token = strdup("identifier");
    sp = symupdate($2->name, token, 2);
    sp = symupdate($2->name, $1, 1);
    sp = symupdate($2->name, $4, 0);
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
            cout << "Before" << endl;
            yyparse();
            cout << "After" << endl;
        } while(!feof(yyin));
        fclose(file);
        
        int tableIndex = 0;
        struct symtab *sp;
        cout << endl;
        cout << "*** Printing Symbol Table ***" << endl;
        /* cout << setw(20) << left << "Index" << setw(20) << left << "Name" << setw(20) << left << "Token" << setw(20) << left << "Type" << setw(20) << left << "Value" << endl;
        for(sp = symtab; sp < &symtab[NSYMS]; sp++) {
            if(sp->name) {
                cout << setw(20) << tableIndex++ << setw(20) << sp->name << setw(20) << sp->token << setw(20) << sp->type << setw(20) << sp->value << endl;
            }
        }
        cout << endl; */

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

/* struct symtab *symlook(char *s) {    
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
} */


struct symtab *symlook(char *s) {
    int key = symhash(s);
    struct symtab *sp;
    sp = symtab;

    if(sp[key].name) {
        return sp;
    }
    if(!sp[key].name) {
        sp[key].name = strdup(s);
        sp[key].token = strdup("null");
        sp[key].type = strdup("null");
        sp[key].value = strdup("null");
        return sp;
    }

    yyerror("Too many symbols");
    exit(1);

}


struct symtab *symupdate(char *s, char *v, int type) {
    int key = symhash(s);
    struct symtab *sp;
    sp = symtab;
    cout << "Key: " << key << endl;

    if(sp[key].name) {
        cout << "Name: " << sp[key].name << endl;
        if(type == 0) {
            sp[key].value = strdup(v);
            return sp;
        } else if(type == 1) {
            sp[key].type = strdup(v);
            return sp;
        } else if(type == 2) {
            sp[key].token = strdup(v);
            return sp;
        } else {
            yyerror("Update: invalid type being added");
            exit(1);
        }
    }
    if(!sp[key].name) {
        yyerror("Attempting to update table before adding name");
        exit(1);
    }
    yyerror("Too many symbols");
    exit(1);
}
/* struct symtab *symupdate(char *s, char *v, int type) {
    // Function to update an index of the symbol table. s is the
    // name of the index to update, v is the value we are adding
    // and type is the type of field (value=0, type=1 or token=2) 
    // we are updating.
    struct symtab *sp;

    for(sp = symtab; sp < &symtab[NSYMS]; sp++) {

        if(sp->name && !strcmp(sp->name, s)) {
            cout << endl;
            cout << s << " current value: " << sp->value << endl;
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
} */

int symhash(char *s) {
    int key = 0;
    for(int i = 0; i < strlen(s); i++) {
        key += s[i];
    }

    return key % NSYMS;
}
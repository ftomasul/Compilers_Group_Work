%{
#include <iostream>
#include <stdio.h>
using namespace std;

int yyerror(const char* s);
int yylex();

int currentNode;

%}

%union {
    double num;
    char* sym;
}

%token<sym> K_DO K_DOUBLE K_ELSE K_EXIT K_FUNCTION K_IF K_INTEGER K_PRINT_DOUBLE K_PRINT_INTEGER K_PRINT_STRING K_PROCEDURE K_PROGRAM K_READ_DOUBLE K_READ_INTEGER K_READ_STRING K_RETURN K_STRING K_THEN K_WHILE ASSIGN ASSIGN_PLUS ASSIGN_MINUS ASSIGN_MULTIPLY ASSIGN_DIVIDE ASSIGN_MOD COMMA COMMENT DAND DIVIDE DOR DEQ GEQ GT LBRACKET LEQ LCURLY LPAREN LT MINUS DECREMENT MOD MULTIPLY NE NOT PERIOD PLUS INCREMENT RBRACKET RCURLY RPAREN SEMI IDENTIFIER SCONSTANT DCONSTANT ICONSTANT 

%left PLUS MINUS

%type<sym> arith_exp

%%

arith_exp: ICONSTANT 
|   DCONSTANT 
|   IDENTIFIER 
|   arith_exp PLUS arith_exp { cout << "Node " << currentNode++ << ": " << $1 << $2 << $3 << endl; }
|   arith_exp MINUS arith_exp { cout << "Node " << currentNode++ << ": " << $1 << $2 << $3 << endl; }
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
        cout << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << "+ Walking Through the Parse Tree Begins Here" << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << endl;

        currentNode = 0;
        do {
            yyparse();
        } while(!feof(yyin));

        cout << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << "+ Done Walking Through Parse Tree" << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << endl;


        fclose(file);
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
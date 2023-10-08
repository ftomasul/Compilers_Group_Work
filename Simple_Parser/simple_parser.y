%{
#include <iostream>
#include <stdio.h>
using namespace std;

int yyerror(const char* s);
int yylex();

%}

%token K_DO K_DOUBLE K_ELSE K_EXIT K_FUNCTION K_IF K_INTEGER K_PRINT_DOUBLE K_PRINT_INTEGER K_PRINT_STRING K_PROCEDURE K_PROGRAM K_READ_DOUBLE K_READ_INTEGER K_READ_STRING K_RETURN K_STRING K_THEN K_WHILE ICONSTANT DCONSTANT ASSIGN ASSIGN_PLUS ASSIGN_MINUS ASSIGN_MULTIPLY ASSIGN_DIVIDE ASSIGN_MOD COMMA COMMENT DAND DIVIDE DOR DEQ GEQ GT LBRACKET LEQ LCURLY LPAREN LT MINUS DECREMENT MOD MULTIPLY NE NOT PERIOD PLUS INCREMENT RBRACKET RCURLY RPAREN SEMI IDENTIFIER SCONSTANT 

%left PLUS MINUS
%left MULTIPLY DIVIDE

%%

arith_expr: arith_expr PLUS arith_expr { cout << "arith_expr + arith_expr: " << $1 << $2 << $3 << endl; }
          | arith_expr MINUS arith_expr { cout << "arith_expr - arith_expr: " << $1 << $2 << $3 << endl; }
          | ICONSTANT 
          | DCONSTANT 
          | SCONSTANT 
          | IDENTIFIER 
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
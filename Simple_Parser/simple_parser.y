%{
#include <iostream>
#include <stdio.h>
using namespace std;

%}

%token K_DO K_DOUBLE K_ELSE K_EXIT K_FUNCTION K_IF K_INTEGER K_PRINT_DOUBLE K_PRINT_INTEGER K_PRINT_STRING K_PROCEDURE K_PROGRAM K_READ_DOUBLE K_READ_INTEGER K_READ_STRING K_RETURN K_STRING K_THEN K_WHILE ICONSTANT DCONSTANT ASSIGN ASSIGN_PLUS ASSIGN_MINUS ASSIGN_MULTIPLY ASSIGN_DIVIDE ASSIGN_MOD COMMA COMMENT DAND DIVIDE DOR DEQ GEQ GT LBRACKET LEQ LCURLY LPAREN LT MINUS DECREMENT MOD MULTIPLY NE NOT PERIOD PLUS INCREMENT RBRACKET RCURLY RPAREN SEMI IDENTIFIER SCONSTANT  

%%

const: ICONSTANT { cout << "Found ICONSTANT: " << $1 << endl; }
     | DCONSTANT { cout << "Found DCONSTANT: " << $1 << endl; }
     | SCONSTANT { cout << "Found SCONSTANT: " << $1 << endl; }
     ;

%%

extern FILE *yyin;

int main(int argc, char* argv[]) {
    if(argc == 2) {
        cout << endl;
        cout << "Parsing " << argv[1] << endl;
        cout << endl;

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
        cout << "Please use a single file as an argument to the parser" << endl;
    }
    // blah
    return 0;
}

void yyerror(const char *s) {
    cerr << "Parse error: " << s << endl;
}

int yywrap() {
    return 1;
}
%{
#include <iostream>
#include <stdio.h>
#include <string.h>
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
%left MULTIPLY DIVIDE
%nonassoc UMINUS

%type<sym> program function_dec arg_list arg function_call param_list param print iden_dec iden_assign type assign_op code_block code line arith_exp

%%



program: K_PROGRAM IDENTIFIER code_block { cout << "Node " << currentNode++ << ": " << "program -> " << $2 << endl; } 
;

function_dec: K_FUNCTION type IDENTIFIER LPAREN arg_list RPAREN code_block { cout << "Node " << currentNode++ << ": " << $2 << " function_dec -> " << $3 << endl; } 
;

arg_list: arg_list COMMA arg
|   arg
;

arg: type IDENTIFIER { $$ = $2; }
|    %empty { /*empty*/ }
;

function_call: IDENTIFIER LPAREN param_list RPAREN { cout << "Node " << currentNode++ << ": function_call -> " << $1 << endl; }
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

print: K_PRINT_INTEGER LPAREN IDENTIFIER RPAREN { cout << "Node " << currentNode++ << ": print_integer -> " << $3 << endl; }
|   K_PRINT_INTEGER LPAREN ICONSTANT RPAREN { cout << "Node " << currentNode++ << ": print_integer -> " << $3 << endl; }
|   K_PRINT_DOUBLE LPAREN IDENTIFIER RPAREN { cout << "Node " << currentNode++ << ": print_double -> " << $3 << endl; }
|   K_PRINT_DOUBLE LPAREN DCONSTANT RPAREN { cout << "Node " << currentNode++ << ": print_double -> " << $3 << endl; }
|   K_PRINT_STRING LPAREN IDENTIFIER RPAREN { cout << "Node " << currentNode++ << ": print_string -> " << $3 << endl; }
|   K_PRINT_STRING LPAREN SCONSTANT RPAREN { cout << "Node " << currentNode++ << ": print_string -> " << $3 << endl; }
;

iden_dec :  type IDENTIFIER { cout << "Node " << currentNode++ << ": declaration -> " << $1 << " " << $2 << endl; } 
;

iden_assign: IDENTIFIER assign_op IDENTIFIER { cout << "Node " << currentNode++ << ": assign -> " << $1 << $2 << $3 << endl; }
|   IDENTIFIER assign_op ICONSTANT { cout << "Node " << currentNode++ << ": assign -> " << $1 << $2 << $3 << endl; }
|   IDENTIFIER assign_op DCONSTANT { cout << "Node " << currentNode++ << ": assign -> " << $1 << $2 << $3 << endl; }
|   IDENTIFIER assign_op SCONSTANT { cout << "Node " << currentNode++ << ": assign -> " << $1 << $2 << $3 << endl; }
|   iden_dec assign_op IDENTIFIER { cout << "Node " << currentNode++ << ": assign -> " << $1 << $2 << $3 << endl; }
|   iden_dec assign_op ICONSTANT { cout << "Node " << currentNode++ << ": assign -> " << $1 << $2 << $3 << endl; }
|   iden_dec assign_op DCONSTANT { cout << "Node " << currentNode++ << ": assign -> " << $1 << $2 << $3 << endl; }
|   iden_dec assign_op SCONSTANT { cout << "Node " << currentNode++ << ": assign -> " << $1 << $2 << $3 << endl; }
;

type: K_INTEGER
|   K_DOUBLE
|   K_STRING
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

arith_exp: arith_exp PLUS arith_exp { 
        cout << "Node " << currentNode++ << ": " << "arith_exp PLUS arith_exp" << endl;
        cout << "expression -> " << $1 << endl;
        cout << "terminal symbol -> " << $2 << endl;
        cout << "expression -> " << $3 << endl << endl;
        $$ = strdup("parse tree node");
    }
|   arith_exp MINUS arith_exp { 
        cout << "Node " << currentNode++ << ": " << "arith_exp MINUS arith_exp" << endl; 
        cout << "expression -> " << $1 << endl;
        cout << "terminal symbol -> " << $2 << endl;
        cout << "expression -> " << $3 << endl << endl;
        $$ = strdup("parse tree node");             
    }
|   arith_exp MULTIPLY arith_exp { 
        cout << "Node " << currentNode++ << ": " << "arith_exp MULTIPLY arith_exp" << endl; 
        cout << "expression -> " << $1 << endl;
        cout << "terminal symbol -> " << $2 << endl;
        cout << "expression -> " << $3 << endl << endl;  
        $$ = strdup("parse tree node");
    }
|   arith_exp DIVIDE arith_exp { 
        cout << "Node " << currentNode++ << ": " << "arith_exp DIVIDE arith_exp" << endl; 
        cout << "expression -> " << $1 << endl;
        cout << "terminal symbol -> " << $2 << endl;
        cout << "expression -> " << $3 << endl << endl;
        $$ = strdup("parse tree node");  
    }
|   MINUS arith_exp %prec UMINUS { 
        cout << "Node " << currentNode++ << ": " << "UMINUS arith_exp" << endl; 
        cout << "terminal symbol -> " << $1 << endl;
        cout << "expression -> " << $2 << endl << endl;  
        $$ = strdup("parse tree node");
    }
|   LPAREN arith_exp RPAREN { 
        cout << "Node " << currentNode++ << ": " << "LPAREN arith_exp RPAREN" << endl; 
        $$ = strdup("parse tree node");
    }
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
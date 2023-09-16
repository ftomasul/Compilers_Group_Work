%{
#include <iostream>
#include <cstdio>
using namespace std;
%}

%%

[ \t]+ {cout << "whitespace ignore" << endl;}
do { cout << "K-DO" << endl; }
double { cout << "K-DOUBLE" << endl; }
^[a-zA-Z$_][a-zA-Z0-9$_]{0,31} { cout << "IDENTIFIER" << endl; }
^[0-9]+$ {cout << "ICONSTANT" << endl; }
. { cout << "No match" << endl; }
\n { return 0; }

%%

int main(int argc, char* argv[]) {
    if(argc == 1) {
        cout << "No file given enter a line to lex or kill the program" << endl;
        while(1) {
            cout << "Enter line: ";
            yylex();
        }
    } else if(argc == 2) {
        cout << "Lex " << argv[1] << endl;

        const char* filename = argv[1];
        FILE* file = fopen(filename, "r");

        if(!file) {
            cerr << "Unable to open " << filename << endl;
            return 1;
        }

        yyin = file;
        yylex();

        fclose(file);
    } else {
        cout << "Can only lex one file at a time" << endl;
    }

    return 0;
}

int yywrap() {
    return 1;
}
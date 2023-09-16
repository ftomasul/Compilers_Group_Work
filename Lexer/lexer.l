%{
#include <iostream>
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

int main() {

    while(1) {
        cout << "Enter test: ";
        yylex();
    }

    return 0;
}

int yywrap() {
    return 1;
}
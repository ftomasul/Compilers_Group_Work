%{
#include <iostream>
using namespace std;
%}

%%

do { cout << "K-DO" << endl; }
double { cout << "K-DOUBLE" << endl;}
. { cout << "No match" << endl; }
\n { return 0; }

%%

int main() {
    cout << "Enter test: ";
    yylex();

    return 0;
}

int yywrap() {
    return 1;
}
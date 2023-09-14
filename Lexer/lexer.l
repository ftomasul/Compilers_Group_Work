%{
#include <iostream>
using namespace std;
%}

%%

[a-z] { cout << "Lowercase" << endl; }
. { cout << "Not a lowercase" << endl; }
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
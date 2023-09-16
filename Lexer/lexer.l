%{
#include <iostream>
#include <cstdio>
using namespace std;
%}

%%

[ \t\n\f\r]+ { /* Ignore whitespace */ }
do { cout << "K-DO" << endl; }
double { cout << "K-DOUBLE" << endl; }
else { cout << "K_ELSE" << endl; }
exit { cout << "K_EXIT" << endl; }
function { cout << "K_FUNCTION" << endl; }
if { cout << "K_IF" << endl; }
integer { cout << "K_INTEGER" << endl; }
print_double { cout << "K_PRINT_DOUBLE" << endl; }
print_integer { cout << "K_PRINT_INTEGER" << endl; }
print_string { cout << "K_PRINT_STRING" << endl; }
procedure { cout << "K_PROCEDURE" << endl; }
program { cout << "K_PROGRAM" << endl; }
read_double { cout << "K_READ_DOUBLE" << endl; }
read_integer { cout << "K_READ_INTEGER" << endl; }
read_string { cout << "K_READ_STRING" << endl; }
return { cout << "K_RETURN" << endl; }
string { cout << "K_STRING" << endl; }
then { cout << "K_THEN" << endl; }
while { cout << "K_WHILE" << endl; }
[0-9]+ { cout << "ICONSTANT" << endl; }
-?([0-9]*[.])?[0-9]+[dD]?[-+]?[0-9]+ { cout << "DCONSTANT" << endl; }
:= { cout << "ASSIGN" << endl; }
\+= { cout << "ASSIGN_PLUS" << endl; }
-= { cout << "ASSIGN_MINUS" << endl; }
\*= { cout << "ASSIGN_MULTIPLY" << endl; }
\/= { cout << "ASSIGN_DIVIDE" << endl; }
%= { cout << "ASSIGN_MOD" << endl; }
, { cout << "COMMA" << endl; }
&& { cout << "DAND" << endl; }
\/ { cout << "DIVIDE" << endl; }
\|\| { cout << "DOR" << endl; }
== { cout << "DEQUAL" << endl; }
>= { cout << "GEQ" << endl; }
> { cout << "GT" << endl; }
\[ { cout << "LBRACKET" << endl; }
\<= { cout << "LEQ" << endl; }
\{ { cout << "LCURLY" << endl; }
\( { cout << "LPAREN" << endl; }
\< { cout << "LT" << endl; }
\- { cout << "MINUS" << endl; }
\-\- { cout << "DECREMENT" << endl; }
% { cout << "MOD" << endl; }
\* { cout << "MULTIPLY" << endl; }
!= { cout << "NE" << endl; }
! { cout << "NOT" << endl; }
\. { cout << "PERIOD" << endl; }
\+ { cout << "PLUS" << endl; }
\+\+ { cout << "INCREMENT" << endl; }
] { cout << "RBRACKET" << endl; }
\} { cout << "RCURLY" << endl; }
\) { cout << "RPAREN" << endl; }
; { cout << "SEMI" << endl; }
[a-zA-Z$_][a-zA-Z0-9$_]{0,31} { cout << "IDENTIFIER" << endl; }
\"(\\.|[^"\\])*\" { cout << "SCONSTANT" << endl; }
. { cout << "No match" << endl; }

%%

int main(int argc, char* argv[]) {
    if(argc == 2) {
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
        cout << "Please use a single file as an argument to lex" << endl;
    }

    return 0;
}

int yywrap() {
    return 1;
}

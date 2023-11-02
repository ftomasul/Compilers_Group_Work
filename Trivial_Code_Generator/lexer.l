%{

#include <iostream>
#include <cstdio>
#include "simple_parser.tab.h"
using namespace std;

// int yywrap();
struct symtab *symlook(char *s);

%}

%%

[ \t\n\f\r]+ { /* Whitespace: ignore */ }
do { yylval.sym = strdup(yytext); return K_DO; }
double { yylval.sym = strdup(yytext); return K_DOUBLE; }
else { yylval.sym = strdup(yytext); return K_ELSE; }
exit { yylval.sym = strdup(yytext); return K_EXIT; }
function { yylval.sym = strdup(yytext); return K_FUNCTION; }
if { yylval.sym = strdup(yytext); return K_IF; }
integer { yylval.sym = strdup(yytext); return K_INTEGER; }
print_double { yylval.sym = strdup(yytext); return K_PRINT_DOUBLE; }
print_integer { yylval.sym = strdup(yytext); return K_PRINT_INTEGER; }
print_string { yylval.sym = strdup(yytext); return K_PRINT_STRING; }
procedure { yylval.sym = strdup(yytext); return K_PROCEDURE; }
program { yylval.sym = strdup(yytext); return K_PROGRAM; }
read_double { yylval.sym = strdup(yytext); return K_READ_DOUBLE; }
read_integer { yylval.sym = strdup(yytext); return K_READ_INTEGER; }
read_string { yylval.sym = strdup(yytext); return K_READ_STRING; }
return { yylval.sym = strdup(yytext); return K_RETURN; }
string { yylval.sym = strdup(yytext); return K_STRING; }
then { yylval.sym = strdup(yytext); return K_THEN; }
while { yylval.sym = strdup(yytext); return K_WHILE; }
-?[0-9]+ { yylval.sym = strdup(yytext); return ICONSTANT; }
-?([0-9]+([.][0-9]*)?|[.][0-9]+|[0-9]+([.][0-9]*)?[dD][+-]?[0-9]+) { yylval.sym = strdup(yytext); return DCONSTANT; } 
:= { yylval.sym = strdup(yytext); return ASSIGN; }
\+= { yylval.sym = strdup(yytext); return ASSIGN_PLUS; }
-= { yylval.sym = strdup(yytext); return ASSIGN_MINUS; }
\*= { yylval.sym = strdup(yytext); return ASSIGN_MULTIPLY; }
\/= { yylval.sym = strdup(yytext); return ASSIGN_DIVIDE; }
%= { yylval.sym = strdup(yytext); return ASSIGN_MOD; }
, { yylval.sym = strdup(yytext); return COMMA; }
\/\/[^\n]* { yylval.sym = strdup(yytext); return COMMENT; }
&& { yylval.sym = strdup(yytext); return DAND; }
\/ { yylval.sym = strdup(yytext); return DIVIDE; }
\|\| { yylval.sym = strdup(yytext); return DOR; }
== { yylval.sym = strdup(yytext); return DEQ; }
>= { yylval.sym = strdup(yytext); return GEQ; }
> { yylval.sym = strdup(yytext); return GT; }
\[ { yylval.sym = strdup(yytext); return LBRACKET; }
\<= { yylval.sym = strdup(yytext); return LEQ; }
\{ { yylval.sym = strdup(yytext); return LCURLY; }
\( { yylval.sym = strdup(yytext); return LPAREN; }
\< { yylval.sym = strdup(yytext); return LT; }
\- { yylval.sym = strdup(yytext); return MINUS; }
\-\- { yylval.sym = strdup(yytext); return DECREMENT; }
% { yylval.sym = strdup(yytext); return MOD; }
\* { yylval.sym = strdup(yytext); return MULTIPLY; }
!= { yylval.sym = strdup(yytext); return NE; }
! { yylval.sym = strdup(yytext); return NOT; }
\. { yylval.sym = strdup(yytext); return PERIOD; }
\+ { yylval.sym = strdup(yytext); return PLUS; }
\+\+ { yylval.sym = strdup(yytext); return INCREMENT; }
] { yylval.sym = strdup(yytext); return RBRACKET; }
\} { yylval.sym = strdup(yytext); return RCURLY; }
\) { yylval.sym = strdup(yytext); return RPAREN; }
; { yylval.sym = strdup(yytext); return SEMI; }
[a-zA-Z$_][a-zA-Z0-9$_]{0,31} { yylval.table = symlook(yytext); return IDENTIFIER; } 
\"(\\.|[^"\\])*\" { yylval.sym = strdup(yytext); return SCONSTANT; }
. { cout << "No match" << endl; }

%%

int yywrap() {
    return 1;
}


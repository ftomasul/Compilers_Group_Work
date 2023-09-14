%{


%}

%%

[a-z] {printf("Lowercase\n");}
. {printf("Not a lowercase\n");}
\n {return 0;}

%%

yywrap() {}

int main() {
    printf("Enter test: ");
    yylex();

    return 0;
}
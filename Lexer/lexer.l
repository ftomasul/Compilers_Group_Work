%{


%}

%%

[a-z] {printf("It works")}

%%

yywrap() {}

int main() {
    yylex();

    return 0;
}
%{
#include <iostream>
#include <string.h>
#include <fstream>
#include <string>
#include "parseTree.h"
#include "symtab.h"
using namespace std;

int yyerror(const char* s);
extern int yylex();
void generate(parseTree *node, struct symtab *tab, int currReg, int currMem);

extern FILE *yyin;
ofstream mainFile("yourmain.h");
struct parseTree *tree;
struct symtab *table;
%}

%union {
    struct parseTree *node;
    char* sym;
    double val;
}

%token<sym> K_DO K_DOUBLE K_ELSE K_FUNCTION K_IF K_INTEGER K_PRINT_DOUBLE K_PRINT_INTEGER K_PRINT_STRING K_PROCEDURE K_PROGRAM K_READ_DOUBLE K_READ_INTEGER K_READ_STRING K_RETURN K_STRING K_THEN K_WHILE ASSIGN ASSIGN_PLUS ASSIGN_MINUS ASSIGN_MULTIPLY ASSIGN_DIVIDE ASSIGN_MOD COMMA  DAND DIVIDE DOR DEQ GEQ GT LBRACKET LEQ LCURLY LPAREN LT MINUS DECREMENT MOD MULTIPLY NE NOT PLUS INCREMENT RBRACKET RCURLY RPAREN SEMI IDENTIFIER ICONSTANT DCONSTANT SCONSTANT


%left PLUS MINUS
%left MULTIPLY DIVIDE
%left INCREMENT DECREMENT
%left MOD
%right NOT
%left DAND DOR DEQ GEQ GT LEQ LT NE
%right K_THEN
%left K_ELSE
%nonassoc UMINUS  

%type<node> program block stmts stmt var_dec fun_dec proc_dec fun_dec_args const arith bool expr call_args type print do_loop while_loop var_assign do_bool cond_block return_stmt read assign_op if_stmt else_stmt var_dec_list iden array dec


%%

program: K_PROGRAM iden block { tree = insert($2->name, $1, $3, NULL); $$ = tree; }
;

block: LCURLY stmts RCURLY { $$ = $2; }
|   LCURLY RCURLY { $$ = NULL; }
;

stmts: stmt { $$ = $1; }
|   stmts stmt { tree = insert(strdup("NULL"), strdup("stmts"), $1, $2); $$ = tree; }
;

stmt: var_dec SEMI { $$ = $1; }
|   var_assign SEMI {$$ = $1; }
|   expr SEMI { $$ = $1; }
|   fun_dec { $$ = $1; }
|   return_stmt SEMI { $$ = $1; }
|   do_loop { $$ = $1; }
|   while_loop { $$ = $1; }
|   proc_dec { $$ = $1; }
|   print SEMI { $$ = $1; }
|   read SEMI { $$ = $1; }
|   if_stmt { $$ = $1; }
;

var_dec: type dec var_dec_list { 
        tree = insert($2->name, strdup("var_dec"), $1, $2); 
        table = symlook($2->name);
        $$ = tree; 
    }
|   type dec assign_op expr var_dec_list { $$ = tree; }
;

var_dec_list: %empty { $$ = NULL; }
|   COMMA dec var_dec_list { 
            tree = insert($2->name, strdup("var_dec"), NULL, $2); 
            table = symlook($2->name);
            $$ = tree; 
        }
;


dec: iden { $$ = $1; }
|   array { $$ = $1; }
;

var_assign: dec assign_op expr { 
        tree = insert($1->name, strdup("var_assign"), $1, $3); 
        table = symupdate($1->name, $3->name, 1);
        $$ = tree; 
    }
|   dec assign_op var_assign { 
        tree = insert($1->name, strdup("var_assign"), $1, $3); 
        table = symupdate($1->name, $3->name, 1);
        $$ = tree; 
    }
|   var_dec assign_op expr { 
        tree = insert(strdup("NULL"), strdup("var_assign"), $1, $3); 
        table = symupdate($1->name, $3->name, 1);
        $$ = tree; 
    }
|   var_dec assign_op var_assign { 
        tree = insert(strdup("NULL"), strdup("var_assign"), $1, $3); 
        table = symupdate($1->name, $3->name, 1);
        $$ = tree; 
    }
|   var_dec COMMA var_assign { 
        tree = insert(strdup("NULL"), strdup("var_assign"), $1, $3); 
        $$ = tree; 
    }
;


assign_op: ASSIGN { tree = insert(strdup("NULL"), strdup(":="), NULL, NULL); $$ = tree; }
|   ASSIGN_PLUS { tree = insert(strdup("NULL"), strdup("+="), NULL, NULL); $$ = tree; }
|   ASSIGN_MINUS { tree = insert(strdup("NULL"), strdup("-="), NULL, NULL); $$ = tree; }
|   ASSIGN_MULTIPLY { tree = insert(strdup("NULL"), strdup("*="), NULL, NULL); $$ = tree; }
|   ASSIGN_DIVIDE { tree = insert(strdup("NULL"), strdup("/="), NULL, NULL); $$ = tree; }
|   ASSIGN_MOD { tree = insert(strdup("NULL"), strdup("%="), NULL, NULL); $$ = tree; }
; 

fun_dec: K_FUNCTION type iden LPAREN fun_dec_args RPAREN block {
    tree = insert($3->name, strdup("fun_dec"), $2, $7);
    $$ = tree;
}
;

proc_dec: K_PROCEDURE iden LPAREN fun_dec_args RPAREN block {
    tree = insert($2->name, strdup("proc_dec"), NULL, $6);
    $$ = tree;
}
;

fun_dec_args: %empty { $$ = NULL; }
|   type dec { $$ = $1; }
|   fun_dec_args COMMA type dec { tree = insert(strdup("NULL"), strdup("FunDecArgs"), $1, $3); $$ = tree; }
;

iden: IDENTIFIER { tree = insert($1, strdup("Iden"), NULL, NULL); $$ = tree; }
;

const: ICONSTANT { tree = insert($1, strdup("IntConstant"), NULL, NULL); $$ = tree; }
|   DCONSTANT { tree = insert($1, strdup("DoubleConstant"), NULL, NULL); $$ = tree; }
|   SCONSTANT { tree = insert($1, strdup("StringConstant"), NULL, NULL); $$ = tree; }
;

arith: expr PLUS expr { tree = insert(strdup("NULL"), strdup("+"), $1, $3); $$ = tree; }
|   expr MINUS expr { tree = insert(strdup("NULL"), strdup("-"), $1, $3); $$ = tree; }
|   expr MULTIPLY expr { tree = insert(strdup("NULL"), strdup("*"), $1, $3); $$ = tree; }
|   expr DIVIDE expr { tree = insert(strdup("NULL"), strdup("/"), $1, $3); $$ = tree; }
|   expr MOD expr { tree = insert(strdup("NULL"), strdup("%"), $1, $3); $$ = tree; }
|   LPAREN expr RPAREN { $$ = $2; }
|   expr INCREMENT { tree = insert(strdup("NULL"), strdup("++"), $1, NULL); $$ = tree; }
|   expr DECREMENT { tree = insert(strdup("NULL"), strdup("--"), $1, NULL); $$ = tree; }
|   MINUS expr %prec UMINUS { tree = insert(strdup("NULL"), strdup("-"), $2, NULL); $$ = tree; }
;

bool: expr DAND expr { tree = insert(strdup("NULL"), strdup("&&"), $1, $3); $$ = tree; }
|   expr DOR expr { tree = insert(strdup("NULL"), strdup("||"), $1, $3); $$ = tree; }
|   expr DEQ expr { tree = insert(strdup("NULL"), strdup("=="), $1, $3); $$ = tree; }
|   expr GT expr { tree = insert(strdup("NULL"), strdup(">"), $1, $3); $$ = tree; }
|   expr LEQ expr { tree = insert(strdup("NULL"), strdup("<="), $1, $3); $$ = tree; }
|   expr GEQ expr { tree = insert(strdup("NULL"), strdup(">="), $1, $3); $$ = tree; }
|   expr LT expr { tree = insert(strdup("NULL"), strdup("<"), $1, $3); $$ = tree; }
|   expr NE expr { tree = insert(strdup("NULL"), strdup("!="), $1, $3); $$ = tree; }
|   NOT expr { tree = insert(strdup("NULL"), strdup("!"), NULL, $2); $$ = tree; }
;

expr: arith { $$ = $1; }
|   bool { $$ = $1; }
|   array { $$ = $1; }
|   iden LPAREN call_args RPAREN { tree = insert($1->name, strdup("FunctionCall"), $1, $3); $$ = tree; }
|   iden { $$ = $1; }
|   const { $$ = $1; }
;

call_args: %empty { $$ = NULL; }
|   expr { $$ = $1; }
|   call_args COMMA expr { tree = insert(strdup("NULL"), strdup("CallArgs"), $1, $3); $$ = tree; }
;

type: K_INTEGER { tree = insert(strdup("NULL"), strdup("Integer"), NULL, NULL); $$ = tree; }
|   K_DOUBLE { tree = insert(strdup("NULL"), strdup("Double"), NULL, NULL); $$ = tree; }
|   K_STRING { tree = insert(strdup("NULL"), strdup("String"), NULL, NULL); $$ = tree; }
;

print: K_PRINT_INTEGER LPAREN dec RPAREN { tree = insert($3->name, strdup("Print"), $3, NULL); $$ = tree; }
|   K_PRINT_INTEGER LPAREN const RPAREN { tree = insert($3->name, strdup("Print"), $3, NULL); $$ = tree; }
|   K_PRINT_DOUBLE LPAREN dec RPAREN { tree = insert($3->name, strdup("Print"), $3, NULL); $$ = tree; }
|   K_PRINT_DOUBLE LPAREN const RPAREN { tree = insert($3->name, strdup("Print"), $3, NULL); $$ = tree; }
|   K_PRINT_STRING LPAREN dec RPAREN { tree = insert($3->name, strdup("Print"), $3, NULL); $$ = tree; }
|   K_PRINT_STRING LPAREN const RPAREN { tree = insert($3->name, strdup("Print"), $3, NULL); $$ = tree; }
;

read: K_READ_INTEGER LPAREN dec RPAREN { tree = insert($3->name, strdup("read"), $3, NULL); $$ = tree; }
|   K_READ_DOUBLE LPAREN dec RPAREN { tree = insert($3->name, strdup("read"), $3, NULL); $$ = tree; }
|   K_READ_STRING LPAREN dec RPAREN { tree = insert($3->name, strdup("read"), $3, NULL); $$ = tree; }
;

cond_block: block { $$ = $1; }
|   stmt { $$ = $1; }
;

do_loop: K_DO LPAREN do_bool RPAREN cond_block { tree = insert(strdup("NULL"), strdup("DoLoop"), $3, $5); $$ = tree; }
;

do_bool: var_assign SEMI bool SEMI arith { tree = insert(strdup("NULL"), strdup("DoBool"), $1, $3); $$ = tree; }
;

while_loop: K_WHILE LPAREN expr RPAREN cond_block { tree = insert(strdup("NULL"), strdup("WhileLoop"), $3, $5); $$ = tree; }
;

array: iden LBRACKET RBRACKET { tree = insert($1->name, strdup("array"), $1, NULL); $$ = tree; }
|   iden LBRACKET expr RBRACKET { tree = insert($1->name, strdup("array"), $1, $3); $$ = tree; }
;

return_stmt: K_RETURN expr { tree = insert(strdup("NULL"), strdup("return"), $2, NULL); $$ = tree; }
|   K_RETURN var_assign { tree = insert(strdup("NULL"), strdup("return"), $2, NULL); $$ = tree; }
;

if_stmt: K_IF LPAREN expr RPAREN K_THEN cond_block else_stmt { 
        tree = insert(strdup("NULL"), strdup("if_stmt"), $3, $6); 
        $$ = tree; 
    }
;

else_stmt: %empty { $$ = NULL; }
| K_ELSE cond_block { 
        tree = insert(strdup("NULL"), strdup("else_stmt"), $2, NULL); 
        $$ = tree; 
    }
;

%%

int main(int argc, char* argv[]) {
    if(argc == 2) {
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

        mainFile << "int yourmain()\n{\n";

        generate(tree, table, 0, 0);

        mainFile << "return 0;\n}";
        mainFile.close();

        /* cout << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << "+ Checking Structures" << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << endl;

        printTree(tree);
        cout << endl; 
        symprint(table);

        cout << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << "+ Done Checking Structures" << endl << "++++++++++++++++++++++++++++++++++++++++++++++++" << endl << endl;         */

    } else {
        cout << "Please use a single file as an argument." << endl;
    }
    return 0;
}

void generate(parseTree *node, struct symtab *tab, int currReg, int currMem) {
    if (node != NULL) {
        if (strcmp(node->action, "var_dec") == 0) {
            mainFile << "SR -= 1;\n";
        } else if (strcmp(node->action, "var_assign") == 0) {
            struct symtab *sp = symlook(node->name);
            if (currReg > 2) {
                currReg = 0;
            }
            char* mem = strdup("Mem[SR-");
            char* reg = strdup("R[");
            char currRegStr[9];
            char currMemStr[9];
            snprintf(currRegStr, 9, "%d", currReg);
            snprintf(currMemStr, 9, "%d", currMem);

            mainFile << reg << currRegStr << "] = " << sp->value << ";\n";
            mainFile << mem << currMemStr << "] = " << sp->value << ";\n";

            strcat(mem, currRegStr);
            strcat(mem, "]");

            tab = symupdate(node->name, mem, 3);

        } else if (strcmp(node->action, "FunctionCall") == 0) {
            int numArgs = 0;
            parseTree *argNode = node->right;
            while (argNode != NULL) {
                generate(argNode->left, tab, currReg, currMem);
                numArgs++;
                argNode = argNode->right;
            }

            mainFile << "R[0] = " << node->name << "(";
            for (int i = 0; i < numArgs; ++i) {
                if (i > 0) {
                    mainFile << ", ";
                }
                mainFile << "Mem[SR + " << i << "]";
            }
            mainFile << ");\n";
            mainFile << "SR += " << numArgs << ";\n";
        } else if (strcmp(node->action, "IfStmt") == 0) {
            generate(node->left, tab, currReg, currMem);
            mainFile << "if (R[0]) {\n";
            generate(node->right, tab, currReg, currMem);
            mainFile << "} else {\n";
            mainFile << "}\n";
        } else if (strcmp(node->action, "WhileLoop") == 0) {
            int loopLabel = currMem++;
            mainFile << "L" << loopLabel << ":\n";
            generate(node->left, tab, currReg, currMem);
            mainFile << "if (!R[0]) goto L" << currMem << ";\n";
            generate(node->right, tab, currReg, currMem);
            mainFile << "goto L" << loopLabel << ";\n";
            mainFile << "L" << currMem << ":\n";
        }

        generate(node->left, tab, currReg, currMem);
        generate(node->right, tab, currReg, currMem);
    }
}


int yywrap() {
    return 1;
}

int yyerror(const char *s) {
    cerr << "Parse error: " << s << endl;
    return 0;
}
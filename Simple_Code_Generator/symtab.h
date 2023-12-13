#include<iostream>
#include<string.h>
#include<iomanip>
using namespace std;

#define NSYMS 100
struct symtab
{
    char* name;
    char* token;
    char* type;
    char* value;
    char* location;
} symtab[NSYMS];

struct symtab *symlook(char *s) {    
    struct symtab *sp;

    for(sp = symtab; sp < &symtab[NSYMS]; sp++) {
        if(sp->name && !strcmp(sp->name, s)) {
            return sp;
        }
        if(!sp->name) {
            sp->name = strdup(s);
            sp->token = strdup("null");
            sp->type = strdup("null");
            sp->value = strdup("null");
            sp->location = strdup("null");
            return sp;
        }
    }
    cerr << "Too many symbols" << endl;;
    exit(1);
}

struct symtab *symupdate(char *s, char *v, int type) {
    // Function to update an index of the symbol table. s is the
    // name of the index to update, v is the value we are adding
    // and type is the type of field (value=0, type=1, token=2, 
    // location=3) we are updating.
    struct symtab *sp;

    for(sp = symtab; sp < &symtab[NSYMS]; sp++) {

        if(sp->name && !strcmp(sp->name, s)) {
            if(type == 0) {
                sp->value = strdup(v);
                return sp;
            } else if(type == 1) {
                sp->type = strdup(v);
                return sp;
            } else if(type == 2) {
                sp->token = strdup(v);
                return sp;
            } else if(type == 3) {
                sp->location = strdup(v);
                return sp;
            } else {
                cerr <<"Update: invalid type being added" << endl;
                exit(1);
            }
        }
        if(!sp->name) {
            cerr << "Attempting to update table before adding name" << endl;
            exit(1);
        }
    }
    cerr << "Too many symbols" << endl;
    exit(1);
}

void symprint(struct symtab* tab) {
    struct symtab *sp;
    int tableIndex = 0;

    cout << setw(20) << left << "Index" << setw(20) << left << "Name" << setw(20) << left << "Token" << setw(20) << left << "Type" << setw(20) << left << "Value" << endl;
        for(sp = tab; sp < &tab[NSYMS]; sp++) {
            if(sp->name) {
                cout << setw(20) << tableIndex++ << setw(20) << sp->name << setw(20) << sp->token << setw(20) << sp->type << setw(20) << sp->value << endl;
            }
        }
        cout << endl;
}
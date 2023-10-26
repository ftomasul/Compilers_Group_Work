## Finn Tomasula Martin and Edward Gilbert
## COSC-4785
## Fall 2023
## Symbol Table

The files included in this zip file are to satisfy the requirements for the symbol table assignment.

# Software needed

You will need flex bison and g++. The versions we are using are: g++ 11.4, flex 2.6.4  and bison 3.8.2.

# How to compile and run

The included make file should do all the work so just type 'make'. The make file will run flex on lexer.l,
'flex lexer.l'. Then it will run bison on simple_parser.y,'bison -d -t simple_parser.y'. Then it will compile
the results of those two with g++, 'g++ -o symtab simple_parser.tab.c lex.yy.c -ll'. Finally the executable 
will be ran './symtab te1.f23'. The make file has a variable 'FILE'. The value stored here is the file that 
will be tested. I have it set as te1.f23 but if you'd like to test the code on another file simply change it 
there.

# Output

After compiling and running you should see the printed symbol table of whatever file you specified. The lexer covers the 
whole language so any symbol present in the test program should be in the table but the parser does not cover all the
grammar yet so some updates may be missing depending on what you are testing.
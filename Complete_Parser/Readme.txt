## Finn Tomasula Martin and Edward Gilbert
## COSC-4785
## Fall 2023
## Complete Parser

The files included in this zip file are to satisfy the requirements for the complete parser assignment.

# Software needed

You will need flex bison and g++. The versions we are using are: g++ 11.4, flex 2.6.4  and bison 3.8.2.

# How to compile and run

The included make file should do all the work so just type 'make'. The make file will run flex on lexer.l,
'flex lexer.l'. Then it will run bison on parser.y,'bison -d -t parser.y'. Then it will compile
the results of those two with g++, 'g++ -o parser parser.tab.c lex.yy.c'. Then, the executable 
will be ran './parser TomasulaMartin.f23'.

# Output

After running make the parse tree of the input program will be printed to the console.

# Misc

The assignment specified we say who's trivial code generator we will be moving forward with. We have decided 
that the best thing to do is to rewrite the code generator from scratch.

We defined most of the grammar rules together. Individually Edward defined loops and arrays while Finn 
defined conditionals and arithmetic expressions. Everything else we did together for the most part.
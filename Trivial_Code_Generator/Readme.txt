## Finn Tomasula Martin and Edward Gilbert
## COSC-4785
## Fall 2023
## trivial Code Generator

The files included in this zip file are to satisfy the requirements for the trivial code generator assignment.

# Software needed

You will need flex bison and g++. The versions we are using are: g++ 11.4, flex 2.6.4  and bison 3.8.2.

# How to compile and run

The included make file should do all the work so just type 'make'. The make file will run flex on lexer.l,
'flex lexer.l'. Then it will run bison on simple_parser.y,'bison -d -t simple_parser.y'. Then it will compile
the results of those two with g++, 'g++ -o generator simple_parser.tab.c lex.yy.c'. Then, the executable 
will be ran './generator te1/te2.f23' which produces yourmain.h. Then, the f23.c file is compiled into 
an executable called f23. Finally, the f23 executable is ran which will produce the results of the code.

# Output

After running make the results of the target program will be executed and the generated code will be in yourmain.How

# Misc

The assignment specified we each write our own version that will work on different examples. Both our versions work on
both te1.f23 and te2.f23 but Edward will be running te2.f23 and Finn will be running te1.f23. Going forward we are most 
likely gonna re-write the code generator but if we go forward with either of ours then we will chose Edwards as his is
bit cleaner.
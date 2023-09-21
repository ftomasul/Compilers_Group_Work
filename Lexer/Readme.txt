## Finn Tomasula Martin and Edward Gilbert
## COSC-4785
## Fall 2023
## Lexer

The files included in this zip file are to satisfy the requirements for the lexer assignment.

# Software needed

You will need some version of g++ and flex. We are using an Ubuntu laptop and a CentOS virtual machine,
both of which came with both these programs.

# How to compile and run

The make file should handle all compilation so just type "make" into the terminal within a directory containing all
included files. The make file should run flex on the lexer.l file "flex lexer.l", which should produce a file called
lex.yy.c. It will then compile that file "g++ lex.yy.c -o lexer" and produce an executable file simply called lexer. It
will then execute this file using our example "./lexer example.f23".

If you wish to test another file, simply call the executable again with whatever file you would to test. "./lexer file.f23".
The executable lexer is designed to only take one argument, so if you give it no arguments or more than one it will print an error.
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
lex.yy.c. It will then compile that file "g++ lex.yy.c -o lexer" and produce an executable file simply called lexer.

You can run the executable with the command "./lexer". It is designed to take one file as an argument so run it with
whatever file you want to use as an example like so: "./lexer example.f23". It is only designed to take one argument,
so if you don't give it any files or more than one file it will print an error. Once you run it with a file it will perform
lexical analysis on that file printing each token it finds to a new line on the terminal.
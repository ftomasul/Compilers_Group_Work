# COSC-4785
# Simple_Parser Assignemt 
# Finn Tomasula Martin and Edward Gilbert
# Makefile to compile and run our simple parser

# Variables
CC=gcc
CXX=g++
FLEX=flex
YACC=bison
RUN=./
RM=/bin/rm -f
FILE=Examples/te1.f23

# Don't need to check for clean
.PHONY: clean, run

run: f23
	${RUN}f23

yourmain.h: generator
	${RUN}generator ${FILE}

# Compile lex into executable
generator: simple_parser.tab.c lex.yy.c 
	${CXX} -o generator simple_parser.tab.c lex.yy.c

# Run yacc on parser
simple_parser.tab.c: simple_parser.y
	${YACC} -d -t simple_parser.y

# Run flex on lexer
lex.yy.c: lexer.l
	${FLEX} lexer.l

f23: f23.c yourmain.h
	${CC} -o f23 f23.c -lm

# Removes all created files
clean:
	${RM} simple_parser.tab.c simple_parser.tab.h lex.yy.c generator yourmain.h f23

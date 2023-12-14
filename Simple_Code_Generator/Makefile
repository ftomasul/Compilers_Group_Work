# COSC-4785
# Complete Parser Assignemt 
# Finn Tomasula Martin and Edward Gilbert
# Makefile to compile and run our complete parser

# Variables
CC=gcc
CXX=g++
FLEX=flex
YACC=bison
RUN=./
RM=/bin/rm -f
FILE=test.f23

# Don't need to check for clean
.PHONY: clean, run, yourmain.h

run: f23
	${RUN}f23

yourmain.h: compiler
	${RUN}compiler ${FILE}

compiler: parser.tab.c lex.yy.c
	${CXX} -o compiler parser.tab.c lex.yy.c

parser.tab.c: parser.y
	${YACC} -d -t parser.y

lex.yy.c: lexer.l
	${FLEX} lexer.l

f23: f23.c yourmain.h
	${CC} -o f23 f23.c -lm

# Removes all created files
clean:
	${RM} parser.tab.c parser.tab.h lex.yy.c compiler yourmain.h f23

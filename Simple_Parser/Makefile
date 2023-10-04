# COSC-4785
# Simple_Parser Assignemt 
# Finn Tomasula Martin and Edward Gilbert
# Makefile to compile and run our simple parser

# Variables
CXX=g++
FLEX=flex
YACC=yacc
RUN=./
RM=/bin/rm -f
FILE=test.txt

# Don't need to check for clean
.PHONY: clean, run

run: parser
	${RUN}parser ${FILE}

# Compile lex into executable
parser: y.tab.c lex.yy.c 
	${CXX} -o parser y.tab.c lex.yy.c -ll -lfl

# Run flex on lexer
lex.yy.c: lexer.l
	${FLEX} lexer.l

y.tab.c: simple_parser.y
	${YACC} -d simple_parser.y

# Removes all created files
clean:
	${RM} y.tab.c y.tab.h lex.yy.c parser

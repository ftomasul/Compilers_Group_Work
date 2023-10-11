# COSC-4785
# Simple_Parser Assignemt 
# Finn Tomasula Martin and Edward Gilbert
# Makefile to compile and run our simple parser

# Variables
CXX=g++
FLEX=flex
YACC=bison
RUN=./
RM=/bin/rm -f
FILE=test.txt

# Don't need to check for clean
.PHONY: clean, run

run: parser
	${RUN}parser ${FILE}

# Compile lex into executable
parser: y.tab.c lex.yy.c 
	${CXX} -o parser simple_parser.tab.c lex.yy.c -ll

# Run yacc on parser
y.tab.c: simple_parser.y
	${YACC} -d -t simple_parser.y

# Run flex on lexer
lex.yy.c: lexer.l
	${FLEX} lexer.l

# Removes all created files
clean:
	${RM} simple_parser.tab.c simple_parser.tab.h lex.yy.c parser

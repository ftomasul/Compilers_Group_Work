# Variables
CXX=g++
FLEX=flex
YACC=bison
RUN=./
RM=/bin/rm -f
FILE=Examples/test.f23

# Don't need to check for clean
.PHONY: clean, run

run: parser
	${RUN}parser ${FILE}

# Compile lex into executable
parser: parser.tab.c lex.yy.c 
	${CXX} -o parser parser.tab.c lex.yy.c

# Run yacc on parser
parser.tab.c: parser.y
	${YACC} -d -t parser.y

# Run flex on lexer
lex.yy.c: lexer.l
	${FLEX} lexer.l

# Removes all created files
clean:
	${RM} parser.tab.c parser.tab.h lex.yy.c parser

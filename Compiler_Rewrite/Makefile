# Variables
CXX=g++
FLEX=flex
RUN=./
RM=/bin/rm -f
FILE=Examples/test.f23

# Don't need to check for clean
.PHONY: clean, run

run: lexer
	${RUN}lexer ${FILE}

# Compile lex into executable
lexer: lex.yy.c 
	${CXX} lex.yy.c -o lexer

# Run flex on lexer
lex.yy.c: lexer.l
	${FLEX} lexer.l 

# Removes all created files
clean:
	${RM} lex.yy.c lexer
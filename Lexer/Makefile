# COSC-4785
# Lexer Assignemt 
# Finn Tomasula Martin and Edward Gilbert
# Makefile to flex the lexer and then compile the result

# Variables
CXX=g++
FLEX=flex
RUN=./
RM=/bin/rm -f

# Don't need to check for clean
.PHONY: clean, run

run: lexer
	${RUN}lexer test.txt

# Compile lex into executable
lexer: lex.yy.c 
	${CXX} lex.yy.c -o lexer

# Run flex on lexer
lex.yy.c: lexer.l
	${FLEX} lexer.l 

# Removes all created files
clean:
	${RM} lex.yy.c lexer

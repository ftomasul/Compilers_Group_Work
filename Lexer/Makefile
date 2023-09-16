# COSC-4785
# Lexer Assignemt 
# Finn Tomasula Martin and Edward Gilbert
# Makefile to flex the lexer and then compile the result

# Variables
CXX=g++
FLEX=flex
# CXXFLAGS=-wall -g
RM=/bin/rm -f

# Don't need to check for clean
.PHONY: clean

# Compile lex into executable
lexer: lex.yy.c 
	${CXX} ${CXXFLAGS} lex.yy.c -o lexer

# Run flex on lexer
lex.yy.c: lexer.l
	${FLEX} lexer.l 

# Removes all created files
clean:
	${RM} lex.yy.c lexer

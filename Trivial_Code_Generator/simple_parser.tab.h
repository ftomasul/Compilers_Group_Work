/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_SIMPLE_PARSER_TAB_H_INCLUDED
# define YY_YY_SIMPLE_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IDENTIFIER = 258,              /* IDENTIFIER  */
    K_DO = 259,                    /* K_DO  */
    K_DOUBLE = 260,                /* K_DOUBLE  */
    K_ELSE = 261,                  /* K_ELSE  */
    K_EXIT = 262,                  /* K_EXIT  */
    K_FUNCTION = 263,              /* K_FUNCTION  */
    K_IF = 264,                    /* K_IF  */
    K_INTEGER = 265,               /* K_INTEGER  */
    K_PRINT_DOUBLE = 266,          /* K_PRINT_DOUBLE  */
    K_PRINT_INTEGER = 267,         /* K_PRINT_INTEGER  */
    K_PRINT_STRING = 268,          /* K_PRINT_STRING  */
    K_PROCEDURE = 269,             /* K_PROCEDURE  */
    K_PROGRAM = 270,               /* K_PROGRAM  */
    K_READ_DOUBLE = 271,           /* K_READ_DOUBLE  */
    K_READ_INTEGER = 272,          /* K_READ_INTEGER  */
    K_READ_STRING = 273,           /* K_READ_STRING  */
    K_RETURN = 274,                /* K_RETURN  */
    K_STRING = 275,                /* K_STRING  */
    K_THEN = 276,                  /* K_THEN  */
    K_WHILE = 277,                 /* K_WHILE  */
    ASSIGN = 278,                  /* ASSIGN  */
    ASSIGN_PLUS = 279,             /* ASSIGN_PLUS  */
    ASSIGN_MINUS = 280,            /* ASSIGN_MINUS  */
    ASSIGN_MULTIPLY = 281,         /* ASSIGN_MULTIPLY  */
    ASSIGN_DIVIDE = 282,           /* ASSIGN_DIVIDE  */
    ASSIGN_MOD = 283,              /* ASSIGN_MOD  */
    COMMA = 284,                   /* COMMA  */
    COMMENT = 285,                 /* COMMENT  */
    DAND = 286,                    /* DAND  */
    DIVIDE = 287,                  /* DIVIDE  */
    DOR = 288,                     /* DOR  */
    DEQ = 289,                     /* DEQ  */
    GEQ = 290,                     /* GEQ  */
    GT = 291,                      /* GT  */
    LBRACKET = 292,                /* LBRACKET  */
    LEQ = 293,                     /* LEQ  */
    LCURLY = 294,                  /* LCURLY  */
    LPAREN = 295,                  /* LPAREN  */
    LT = 296,                      /* LT  */
    MINUS = 297,                   /* MINUS  */
    DECREMENT = 298,               /* DECREMENT  */
    MOD = 299,                     /* MOD  */
    MULTIPLY = 300,                /* MULTIPLY  */
    NE = 301,                      /* NE  */
    NOT = 302,                     /* NOT  */
    PERIOD = 303,                  /* PERIOD  */
    PLUS = 304,                    /* PLUS  */
    INCREMENT = 305,               /* INCREMENT  */
    RBRACKET = 306,                /* RBRACKET  */
    RCURLY = 307,                  /* RCURLY  */
    RPAREN = 308,                  /* RPAREN  */
    SEMI = 309,                    /* SEMI  */
    SCONSTANT = 310,               /* SCONSTANT  */
    DCONSTANT = 311,               /* DCONSTANT  */
    ICONSTANT = 312,               /* ICONSTANT  */
    UMINUS = 313                   /* UMINUS  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 29 "simple_parser.y"

    char *sym;
    struct symtab *table;

#line 127 "simple_parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_SIMPLE_PARSER_TAB_H_INCLUDED  */

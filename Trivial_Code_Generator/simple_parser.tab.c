/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "simple_parser.y"

#include <iostream>
#include <stdio.h>
#include <string.h>
#include <iomanip>
#include <fstream>
#include "symtab.h"
using namespace std;

int yyerror(const char *s);
int yylex();
struct symtab *symlook(char *s);
struct symtab *symupdate(char *s, char *v, int type);

struct node {
    char *name;
    char *action;
    char *other;
    int terminal;
};

int insertNode(struct node tree[], int currentNode, char* name, char* action, char* other, int terminal);

struct node tree[20];
int currentNode = 0;


#line 99 "simple_parser.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "simple_parser.tab.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_IDENTIFIER = 3,                 /* IDENTIFIER  */
  YYSYMBOL_K_DO = 4,                       /* K_DO  */
  YYSYMBOL_K_DOUBLE = 5,                   /* K_DOUBLE  */
  YYSYMBOL_K_ELSE = 6,                     /* K_ELSE  */
  YYSYMBOL_K_EXIT = 7,                     /* K_EXIT  */
  YYSYMBOL_K_FUNCTION = 8,                 /* K_FUNCTION  */
  YYSYMBOL_K_IF = 9,                       /* K_IF  */
  YYSYMBOL_K_INTEGER = 10,                 /* K_INTEGER  */
  YYSYMBOL_K_PRINT_DOUBLE = 11,            /* K_PRINT_DOUBLE  */
  YYSYMBOL_K_PRINT_INTEGER = 12,           /* K_PRINT_INTEGER  */
  YYSYMBOL_K_PRINT_STRING = 13,            /* K_PRINT_STRING  */
  YYSYMBOL_K_PROCEDURE = 14,               /* K_PROCEDURE  */
  YYSYMBOL_K_PROGRAM = 15,                 /* K_PROGRAM  */
  YYSYMBOL_K_READ_DOUBLE = 16,             /* K_READ_DOUBLE  */
  YYSYMBOL_K_READ_INTEGER = 17,            /* K_READ_INTEGER  */
  YYSYMBOL_K_READ_STRING = 18,             /* K_READ_STRING  */
  YYSYMBOL_K_RETURN = 19,                  /* K_RETURN  */
  YYSYMBOL_K_STRING = 20,                  /* K_STRING  */
  YYSYMBOL_K_THEN = 21,                    /* K_THEN  */
  YYSYMBOL_K_WHILE = 22,                   /* K_WHILE  */
  YYSYMBOL_ASSIGN = 23,                    /* ASSIGN  */
  YYSYMBOL_ASSIGN_PLUS = 24,               /* ASSIGN_PLUS  */
  YYSYMBOL_ASSIGN_MINUS = 25,              /* ASSIGN_MINUS  */
  YYSYMBOL_ASSIGN_MULTIPLY = 26,           /* ASSIGN_MULTIPLY  */
  YYSYMBOL_ASSIGN_DIVIDE = 27,             /* ASSIGN_DIVIDE  */
  YYSYMBOL_ASSIGN_MOD = 28,                /* ASSIGN_MOD  */
  YYSYMBOL_COMMA = 29,                     /* COMMA  */
  YYSYMBOL_COMMENT = 30,                   /* COMMENT  */
  YYSYMBOL_DAND = 31,                      /* DAND  */
  YYSYMBOL_DIVIDE = 32,                    /* DIVIDE  */
  YYSYMBOL_DOR = 33,                       /* DOR  */
  YYSYMBOL_DEQ = 34,                       /* DEQ  */
  YYSYMBOL_GEQ = 35,                       /* GEQ  */
  YYSYMBOL_GT = 36,                        /* GT  */
  YYSYMBOL_LBRACKET = 37,                  /* LBRACKET  */
  YYSYMBOL_LEQ = 38,                       /* LEQ  */
  YYSYMBOL_LCURLY = 39,                    /* LCURLY  */
  YYSYMBOL_LPAREN = 40,                    /* LPAREN  */
  YYSYMBOL_LT = 41,                        /* LT  */
  YYSYMBOL_MINUS = 42,                     /* MINUS  */
  YYSYMBOL_DECREMENT = 43,                 /* DECREMENT  */
  YYSYMBOL_MOD = 44,                       /* MOD  */
  YYSYMBOL_MULTIPLY = 45,                  /* MULTIPLY  */
  YYSYMBOL_NE = 46,                        /* NE  */
  YYSYMBOL_NOT = 47,                       /* NOT  */
  YYSYMBOL_PERIOD = 48,                    /* PERIOD  */
  YYSYMBOL_PLUS = 49,                      /* PLUS  */
  YYSYMBOL_INCREMENT = 50,                 /* INCREMENT  */
  YYSYMBOL_RBRACKET = 51,                  /* RBRACKET  */
  YYSYMBOL_RCURLY = 52,                    /* RCURLY  */
  YYSYMBOL_RPAREN = 53,                    /* RPAREN  */
  YYSYMBOL_SEMI = 54,                      /* SEMI  */
  YYSYMBOL_SCONSTANT = 55,                 /* SCONSTANT  */
  YYSYMBOL_DCONSTANT = 56,                 /* DCONSTANT  */
  YYSYMBOL_ICONSTANT = 57,                 /* ICONSTANT  */
  YYSYMBOL_UMINUS = 58,                    /* UMINUS  */
  YYSYMBOL_YYACCEPT = 59,                  /* $accept  */
  YYSYMBOL_program = 60,                   /* program  */
  YYSYMBOL_function_dec = 61,              /* function_dec  */
  YYSYMBOL_arg_list = 62,                  /* arg_list  */
  YYSYMBOL_arg = 63,                       /* arg  */
  YYSYMBOL_function_call = 64,             /* function_call  */
  YYSYMBOL_param_list = 65,                /* param_list  */
  YYSYMBOL_param = 66,                     /* param  */
  YYSYMBOL_print = 67,                     /* print  */
  YYSYMBOL_iden_dec = 68,                  /* iden_dec  */
  YYSYMBOL_iden_assign = 69,               /* iden_assign  */
  YYSYMBOL_type = 70,                      /* type  */
  YYSYMBOL_assign_op = 71,                 /* assign_op  */
  YYSYMBOL_code_block = 72,                /* code_block  */
  YYSYMBOL_code = 73,                      /* code  */
  YYSYMBOL_line = 74,                      /* line  */
  YYSYMBOL_arith_exp = 75                  /* arith_exp  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   105

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  59
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  17
/* YYNRULES -- Number of rules.  */
#define YYNRULES  58
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  101

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   313


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    45,    45,    51,    58,    59,    62,    63,    66,    69,
      70,    73,    74,    75,    76,    77,    80,    83,    86,    89,
      92,    95,   100,   108,   112,   116,   120,   124,   131,   138,
     145,   154,   155,   156,   159,   160,   161,   162,   163,   164,
     167,   170,   171,   174,   175,   176,   177,   178,   179,   180,
     183,   184,   185,   186,   187,   188,   189,   190,   191
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "IDENTIFIER", "K_DO",
  "K_DOUBLE", "K_ELSE", "K_EXIT", "K_FUNCTION", "K_IF", "K_INTEGER",
  "K_PRINT_DOUBLE", "K_PRINT_INTEGER", "K_PRINT_STRING", "K_PROCEDURE",
  "K_PROGRAM", "K_READ_DOUBLE", "K_READ_INTEGER", "K_READ_STRING",
  "K_RETURN", "K_STRING", "K_THEN", "K_WHILE", "ASSIGN", "ASSIGN_PLUS",
  "ASSIGN_MINUS", "ASSIGN_MULTIPLY", "ASSIGN_DIVIDE", "ASSIGN_MOD",
  "COMMA", "COMMENT", "DAND", "DIVIDE", "DOR", "DEQ", "GEQ", "GT",
  "LBRACKET", "LEQ", "LCURLY", "LPAREN", "LT", "MINUS", "DECREMENT", "MOD",
  "MULTIPLY", "NE", "NOT", "PERIOD", "PLUS", "INCREMENT", "RBRACKET",
  "RCURLY", "RPAREN", "SEMI", "SCONSTANT", "DCONSTANT", "ICONSTANT",
  "UMINUS", "$accept", "program", "function_dec", "arg_list", "arg",
  "function_call", "param_list", "param", "print", "iden_dec",
  "iden_assign", "type", "assign_op", "code_block", "code", "line",
  "arith_exp", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-29)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int8 yypact[] =
{
       8,    13,    24,   -14,   -29,    -2,   -29,    65,   -29,    26,
     -29,   -13,    -6,     7,   -29,   -29,     1,     1,   -29,   -29,
     -29,   -28,   -22,   -15,    20,    41,     0,    -2,   -12,   -29,
     -29,   -29,   -29,   -29,   -29,     4,     9,    50,    14,    -1,
      16,   -29,    31,   -29,   -29,   -29,   -29,   -29,    71,   -29,
     -29,     1,     1,     1,     1,   -29,   -29,   -29,   -29,   -29,
     -24,   -29,   -29,   -29,   -29,   -29,    22,    25,    28,    29,
      30,    32,    33,   -29,    12,   -29,   -10,   -29,   -10,     4,
     -29,    26,   -29,   -29,   -29,   -29,   -29,   -29,   -29,   -29,
     -29,   -29,   -29,    -8,   -29,    72,    26,   -14,   -29,   -29,
     -29
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,     0,     0,     1,    42,     2,    58,    32,     0,
      31,     0,     0,     0,    33,    47,     0,     0,    57,    56,
      49,     0,     0,     0,     0,     0,     0,    42,     0,    34,
      35,    36,    37,    38,    39,    15,     0,     0,     0,     0,
       0,    58,     0,    54,    46,    48,    44,    45,    22,    40,
      41,     0,     0,     0,     0,    43,    14,    11,    13,    12,
       0,    10,    23,    26,    25,    24,     0,     0,     0,     0,
       0,     0,     0,    55,     0,    53,    51,    52,    50,    15,
       8,     7,    18,    19,    16,    17,    20,    21,    27,    30,
      29,    28,     9,     0,     5,     0,     7,     0,     6,     4,
       3
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -29,   -29,   -29,   -29,   -19,   -29,   -29,    21,   -29,   -29,
     -29,    -9,    53,   -18,    75,   -29,    -3
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,     2,    20,    93,    94,    21,    60,    61,    22,    23,
      24,    25,    36,     6,    26,    27,    28
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      37,     7,    69,     8,    41,    79,     9,    56,    10,    11,
      12,    13,    62,    42,    43,    88,     3,    67,    14,    71,
      51,    96,    51,     1,     4,     5,    44,    38,    15,    80,
      52,     8,    45,    53,    39,    53,    10,    54,    16,    46,
      17,    16,    55,    17,    48,    97,    14,    40,    75,    76,
      77,    78,    49,    66,    18,    19,    70,    18,    19,    57,
      58,    59,    81,    51,    63,    64,    65,    89,    90,    91,
      68,    72,    95,    52,    47,    98,    53,    99,    82,   100,
      54,    83,    84,    85,    73,    86,    87,    95,    29,    30,
      31,    32,    33,    34,    29,    30,    31,    32,    33,    34,
      92,    74,    50,     0,     0,    35
};

static const yytype_int8 yycheck[] =
{
       9,     3,     3,     5,     3,    29,     8,     3,    10,    11,
      12,    13,     3,    16,    17,     3,     3,     3,    20,     3,
      32,    29,    32,    15,     0,    39,    54,    40,    30,    53,
      42,     5,    54,    45,    40,    45,    10,    49,    40,    54,
      42,    40,    54,    42,     3,    53,    20,    40,    51,    52,
      53,    54,    52,     3,    56,    57,    57,    56,    57,    55,
      56,    57,    40,    32,    55,    56,    57,    55,    56,    57,
      56,    55,    81,    42,    54,     3,    45,    96,    53,    97,
      49,    53,    53,    53,    53,    53,    53,    96,    23,    24,
      25,    26,    27,    28,    23,    24,    25,    26,    27,    28,
      79,    48,    27,    -1,    -1,    40
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    15,    60,     3,     0,    39,    72,     3,     5,     8,
      10,    11,    12,    13,    20,    30,    40,    42,    56,    57,
      61,    64,    67,    68,    69,    70,    73,    74,    75,    23,
      24,    25,    26,    27,    28,    40,    71,    70,    40,    40,
      40,     3,    75,    75,    54,    54,    54,    54,     3,    52,
      73,    32,    42,    45,    49,    54,     3,    55,    56,    57,
      65,    66,     3,    55,    56,    57,     3,     3,    56,     3,
      57,     3,    55,    53,    71,    75,    75,    75,    75,    29,
      53,    40,    53,    53,    53,    53,    53,    53,     3,    55,
      56,    57,    66,    62,    63,    70,    29,    53,     3,    63,
      72
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    59,    60,    61,    62,    62,    63,    63,    64,    65,
      65,    66,    66,    66,    66,    66,    67,    67,    67,    67,
      67,    67,    68,    69,    69,    69,    69,    69,    69,    69,
      69,    70,    70,    70,    71,    71,    71,    71,    71,    71,
      72,    73,    73,    74,    74,    74,    74,    74,    74,    74,
      75,    75,    75,    75,    75,    75,    75,    75,    75
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     3,     7,     3,     1,     2,     0,     4,     3,
       1,     1,     1,     1,     1,     0,     4,     4,     4,     4,
       4,     4,     2,     3,     3,     3,     3,     4,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     2,     0,     2,     2,     2,     2,     1,     2,     1,
       3,     3,     3,     3,     2,     3,     1,     1,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* program: K_PROGRAM IDENTIFIER code_block  */
#line 45 "simple_parser.y"
                                         {
    currentNode = insertNode(tree, currentNode, (yyvsp[-1].table)->name, strdup("program"), strdup("null"), 0);
    symupdate((yyvsp[-1].table)->name, (yyvsp[-2].sym), 2);
}
#line 1235 "simple_parser.tab.c"
    break;

  case 3: /* function_dec: K_FUNCTION type IDENTIFIER LPAREN arg_list RPAREN code_block  */
#line 51 "simple_parser.y"
                                                                           {
    currentNode = insertNode(tree, currentNode, (yyvsp[-4].table)-> name, strdup("function_dec"), strdup("null"), 0);
    symupdate((yyvsp[-4].table)->name, (yyvsp[-6].sym), 2);
    symupdate((yyvsp[-4].table)->name, (yyvsp[-5].sym), 1);
}
#line 1245 "simple_parser.tab.c"
    break;

  case 6: /* arg: type IDENTIFIER  */
#line 62 "simple_parser.y"
                     {}
#line 1251 "simple_parser.tab.c"
    break;

  case 7: /* arg: %empty  */
#line 63 "simple_parser.y"
            { /*empty*/ }
#line 1257 "simple_parser.tab.c"
    break;

  case 8: /* function_call: IDENTIFIER LPAREN param_list RPAREN  */
#line 66 "simple_parser.y"
                                                   {}
#line 1263 "simple_parser.tab.c"
    break;

  case 15: /* param: %empty  */
#line 77 "simple_parser.y"
           { /*empty*/ }
#line 1269 "simple_parser.tab.c"
    break;

  case 16: /* print: K_PRINT_INTEGER LPAREN IDENTIFIER RPAREN  */
#line 80 "simple_parser.y"
                                                {
    currentNode = insertNode(tree, currentNode, (yyvsp[-1].table)->name, strdup("print"), strdup("iden_int"), 1);
}
#line 1277 "simple_parser.tab.c"
    break;

  case 17: /* print: K_PRINT_INTEGER LPAREN ICONSTANT RPAREN  */
#line 83 "simple_parser.y"
                                            {
    currentNode = insertNode(tree, currentNode, (yyvsp[-1].sym), strdup("print"), strdup("int"), 1);
}
#line 1285 "simple_parser.tab.c"
    break;

  case 18: /* print: K_PRINT_DOUBLE LPAREN IDENTIFIER RPAREN  */
#line 86 "simple_parser.y"
                                            {
    currentNode = insertNode(tree, currentNode, (yyvsp[-1].table)->name, strdup("print"), strdup("iden_double"), 1);
}
#line 1293 "simple_parser.tab.c"
    break;

  case 19: /* print: K_PRINT_DOUBLE LPAREN DCONSTANT RPAREN  */
#line 89 "simple_parser.y"
                                           {
    currentNode = insertNode(tree, currentNode, (yyvsp[-1].sym), strdup("print"), strdup("double"), 1);
}
#line 1301 "simple_parser.tab.c"
    break;

  case 20: /* print: K_PRINT_STRING LPAREN IDENTIFIER RPAREN  */
#line 92 "simple_parser.y"
                                            {
    currentNode = insertNode(tree, currentNode, (yyvsp[-1].table)->name, strdup("print"), strdup("iden_string"), 1);
}
#line 1309 "simple_parser.tab.c"
    break;

  case 21: /* print: K_PRINT_STRING LPAREN SCONSTANT RPAREN  */
#line 95 "simple_parser.y"
                                           {
    currentNode = insertNode(tree, currentNode, (yyvsp[-1].sym), strdup("print"), strdup("string"), 1);
}
#line 1317 "simple_parser.tab.c"
    break;

  case 22: /* iden_dec: type IDENTIFIER  */
#line 100 "simple_parser.y"
                            {
    currentNode = insertNode(tree, currentNode, (yyvsp[0].table)->name, strdup("iden_dec"), strdup("null"), 1);
    char *token = strdup("identifier");
    symupdate((yyvsp[0].table)->name, token, 2);
    symupdate((yyvsp[0].table)->name, (yyvsp[-1].sym), 1);
}
#line 1328 "simple_parser.tab.c"
    break;

  case 23: /* iden_assign: IDENTIFIER assign_op IDENTIFIER  */
#line 108 "simple_parser.y"
                                             {
    currentNode = insertNode(tree, currentNode, (yyvsp[-2].table)->name, strdup("iden_assign"), (yyvsp[0].table)->name, 1);
    symupdate((yyvsp[-2].table)->name, (yyvsp[0].table)->value, 0);
}
#line 1337 "simple_parser.tab.c"
    break;

  case 24: /* iden_assign: IDENTIFIER assign_op ICONSTANT  */
#line 112 "simple_parser.y"
                                   {
    currentNode = insertNode(tree, currentNode, (yyvsp[-2].table)->name, strdup("iden_assign"), (yyvsp[0].sym), 1);
    symupdate((yyvsp[-2].table)->name, (yyvsp[0].sym), 0);
}
#line 1346 "simple_parser.tab.c"
    break;

  case 25: /* iden_assign: IDENTIFIER assign_op DCONSTANT  */
#line 116 "simple_parser.y"
                                   {
    currentNode = insertNode(tree, currentNode, (yyvsp[-2].table)->name, strdup("iden_assign"), (yyvsp[0].sym), 1);
    symupdate((yyvsp[-2].table)->name, (yyvsp[0].sym), 0);
}
#line 1355 "simple_parser.tab.c"
    break;

  case 26: /* iden_assign: IDENTIFIER assign_op SCONSTANT  */
#line 120 "simple_parser.y"
                                   {
    currentNode = insertNode(tree, currentNode, (yyvsp[-2].table)->name, strdup("iden_assign"), (yyvsp[0].sym), 1);
    symupdate((yyvsp[-2].table)->name, (yyvsp[0].sym), 0);
}
#line 1364 "simple_parser.tab.c"
    break;

  case 27: /* iden_assign: type IDENTIFIER assign_op IDENTIFIER  */
#line 124 "simple_parser.y"
                                         {
    currentNode = insertNode(tree, currentNode, (yyvsp[-2].table)->name, strdup("iden_assign"), (yyvsp[0].table)->name, 1);
    char *token = strdup("identifier");
    symupdate((yyvsp[-2].table)->name, token, 2);
    symupdate((yyvsp[-2].table)->name, (yyvsp[-3].sym), 1);
    symupdate((yyvsp[-2].table)->name, (yyvsp[0].table)->value, 0);
}
#line 1376 "simple_parser.tab.c"
    break;

  case 28: /* iden_assign: type IDENTIFIER assign_op ICONSTANT  */
#line 131 "simple_parser.y"
                                        {
    currentNode = insertNode(tree, currentNode, (yyvsp[-2].table)->name, strdup("iden_assign"), (yyvsp[0].sym), 1);
    char *token = strdup("identifier");
    symupdate((yyvsp[-2].table)->name, token, 2);
    symupdate((yyvsp[-2].table)->name, (yyvsp[-3].sym), 1);
    symupdate((yyvsp[-2].table)->name, (yyvsp[0].sym), 0);
}
#line 1388 "simple_parser.tab.c"
    break;

  case 29: /* iden_assign: type IDENTIFIER assign_op DCONSTANT  */
#line 138 "simple_parser.y"
                                        {
    currentNode = insertNode(tree, currentNode, (yyvsp[-2].table)->name, strdup("iden_assign"), (yyvsp[0].sym), 1);
    char *token = strdup("identifier");
    symupdate((yyvsp[-2].table)->name, token, 2);
    symupdate((yyvsp[-2].table)->name, (yyvsp[-3].sym), 1);
    symupdate((yyvsp[-2].table)->name, (yyvsp[0].sym), 0);
}
#line 1400 "simple_parser.tab.c"
    break;

  case 30: /* iden_assign: type IDENTIFIER assign_op SCONSTANT  */
#line 145 "simple_parser.y"
                                        {
    currentNode = insertNode(tree, currentNode, (yyvsp[-2].table)->name, strdup("iden_assign"), (yyvsp[0].sym), 1);
    char *token = strdup("identifier");
    symupdate((yyvsp[-2].table)->name, token, 2);
    symupdate((yyvsp[-2].table)->name, (yyvsp[-3].sym), 1);
    symupdate((yyvsp[-2].table)->name, (yyvsp[0].sym), 0);
}
#line 1412 "simple_parser.tab.c"
    break;

  case 31: /* type: K_INTEGER  */
#line 154 "simple_parser.y"
                { (yyval.sym) = (yyvsp[0].sym); }
#line 1418 "simple_parser.tab.c"
    break;

  case 32: /* type: K_DOUBLE  */
#line 155 "simple_parser.y"
             { (yyval.sym) = (yyvsp[0].sym); }
#line 1424 "simple_parser.tab.c"
    break;

  case 33: /* type: K_STRING  */
#line 156 "simple_parser.y"
             { (yyval.sym) = (yyvsp[0].sym); }
#line 1430 "simple_parser.tab.c"
    break;

  case 42: /* code: %empty  */
#line 171 "simple_parser.y"
           { /*empty*/ }
#line 1436 "simple_parser.tab.c"
    break;

  case 50: /* arith_exp: arith_exp PLUS arith_exp  */
#line 183 "simple_parser.y"
                                    {}
#line 1442 "simple_parser.tab.c"
    break;

  case 51: /* arith_exp: arith_exp MINUS arith_exp  */
#line 184 "simple_parser.y"
                              {}
#line 1448 "simple_parser.tab.c"
    break;

  case 52: /* arith_exp: arith_exp MULTIPLY arith_exp  */
#line 185 "simple_parser.y"
                                 {}
#line 1454 "simple_parser.tab.c"
    break;

  case 53: /* arith_exp: arith_exp DIVIDE arith_exp  */
#line 186 "simple_parser.y"
                               {}
#line 1460 "simple_parser.tab.c"
    break;

  case 54: /* arith_exp: MINUS arith_exp  */
#line 187 "simple_parser.y"
                                 {}
#line 1466 "simple_parser.tab.c"
    break;

  case 55: /* arith_exp: LPAREN arith_exp RPAREN  */
#line 188 "simple_parser.y"
                            {}
#line 1472 "simple_parser.tab.c"
    break;


#line 1476 "simple_parser.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 195 "simple_parser.y"


extern FILE *yyin;

int main(int argc, char* argv[]) {
    if(argc == 2) {
        const char* filename = argv[1];
        FILE* file = fopen(filename, "r");

        if(!file) {
            cerr << "Unable to open " << filename << endl;
            return 1;
        }

        yyin = file;

        do {
            yyparse();
        } while(!feof(yyin));
        fclose(file);

        int reg = 1;
        int memory = 1;

        ofstream mainFile("yourmain.h");

        mainFile << "int yourmain()\n{\n";

        for(int i = 0; i < currentNode; i++) {
            if(tree[i].terminal == 1) {
                struct symtab *sp = symlook(tree[i].name);
                if(strcmp(tree[i].action, "print") == 0) {
                    char *printType = strdup(tree[i].other);
                    if(strcmp(printType, "int") == 0) {
                        mainFile << "print_int(" << tree[i].name << ");\n";
                    } else if(strcmp(printType, "string") == 0) {
                        mainFile << "print_string(" << tree[i].name << ");\n";
                    } else if(strcmp(printType, "double") == 0) {
                        mainFile << "print_double(" << tree[i].name << ");\n";
                    } else if(strcmp(printType, "iden_int") == 0) {
                        char *loc = sp->location;
                        mainFile << "print_int(" << loc << ");\n";
                    } else if(strcmp(printType, "iden_string") == 0) {
                        char *loc = sp->location;
                        mainFile << "print_string(" << loc << ");\n";
                    } else if(strcmp(printType, "iden_double") == 0) {
                        char *loc = sp->location;
                        mainFile << "print_double(" << loc << ");\n";
                    }
                } else if(strcmp(tree[i].action, "iden_dec") == 0) {
                    struct symtab *sp = symlook(tree[i].name);
                    mainFile << "SR -= 1;\n";
                    if(strcmp(sp->type, "double") == 0) {
                        mainFile << "FR = SR;\n";
                    }
                } else if(strcmp(tree[i].action, "iden_assign") == 0) {
                    if(reg == 3) {
                        reg = 1;
                    }
                    char *assign = strdup(tree[i].other);
                    char *memType;
                    char *regType;
                    char *loc;
                    char memStr[9];
                    snprintf(memStr, 9, "%d", memory);
                    struct symtab *sp = symlook(tree[i].name);
                    mainFile <<"R[" << reg << "] = " << assign << ";\n";
                    if(strcmp(sp->type, "string") == 0) {
                        memType = strdup("SMem");
                        regType = strdup("SR");
                    } else if(strcmp(sp->type, "double") == 0) {
                        memType = strdup("FMem");
                        regType = strdup("FR");
                    } else {
                        memType = strdup("Mem");
                        regType = strdup("SR");
                    }
                    loc = strdup(memType);
                    strcat(loc, "[");
                    strcat(loc, regType);
                    strcat(loc, "+");
                    strcat(loc, memStr);
                    strcat(loc, "]");
                    mainFile << loc << " = " << "R[" << reg << "];\n";
                    symupdate(sp->name, loc, 3);
                    reg++;
                    memory++;
                }
            }
        }

        mainFile << "return 0;\n}";

        mainFile.close();

    } else {
        cout << "Please use a single file as an argument to the parser" << endl;
    }
    return 0;
}

int yywrap() {
    return 1;
}

int yyerror(const char *s) {
    cerr << "Parse error: " << s << endl;
    return 0;
}

struct symtab *symlook(char *s) {    
    struct symtab *sp;

    for(sp = symtab; sp < &symtab[NSYMS]; sp++) {
        if(sp->name && !strcmp(sp->name, s)) {
            return sp;
        }
        if(!sp->name) {
            sp->name = strdup(s);
            sp->token = strdup("null");
            sp->type = strdup("null");
            sp->value = strdup("null");
            sp->location = strdup("null");
            return sp;
        }
    }
    yyerror("Too many symbols");
    exit(1);
}

struct symtab *symupdate(char *s, char *v, int type) {
    // Function to update an index of the symbol table. s is the
    // name of the index to update, v is the value we are adding
    // and type is the type of field (value=0, type=1, token=2, 
    // location=3) we are updating.
    struct symtab *sp;

    for(sp = symtab; sp < &symtab[NSYMS]; sp++) {

        if(sp->name && !strcmp(sp->name, s)) {
            if(type == 0) {
                sp->value = strdup(v);
                return sp;
            } else if(type == 1) {
                sp->type = strdup(v);
                return sp;
            } else if(type == 2) {
                sp->token = strdup(v);
                return sp;
            } else if(type == 3) {
                sp->location = strdup(v);
                return sp;
            } else {
                yyerror("Update: invalid type being added");
                exit(1);
            }
        }
        if(!sp->name) {
            yyerror("Attempting to update table before adding name");
            exit(1);
        }
    }
    yyerror("Too many symbols");
    exit(1);
}

int insertNode(struct node tree[], int currentNode, char *name, char *action, char* other, int terminal) {
    tree[currentNode].name = name;
    tree[currentNode].action = action;
    tree[currentNode].other = other;
    tree[currentNode].terminal = terminal;

    return currentNode + 1;
}

#ifndef _yy_defines_h_
#define _yy_defines_h_

#define CONSTANTE_ENTIERE 257
#define CONSTANTE_FLOTTANTE 258
#define variable 259
#define ADDITION 260
#define MULTIPLICATION 261
#define SOUSTRACTION 262
#define MODULO 263
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union YYSTYPE {
    int intval;
    float floatval;
    char* strval;
    TypeExpr typeexpr;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;

#endif /* _yy_defines_h_ */

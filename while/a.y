%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
int yylex();
%}

%token WHILE AND OR NTEQ EQ LT LTEQ GT GTEQ ID NUM
%%
whileloop	: WHILE '(' cond ')' '{' '}' {printf("parsing successful");}
	;

cond	: scond
	| scond logop cond
	;

scond	: nid
	| nid relop nid
	;

nid	: ID
	| NUM
	;

logop	: AND
	| OR
	;

relop	: NTEQ
	| EQ
	| LT
	| LTEQ
	| GT
	| GTEQ
	;

%%

void yyerror(char *s)
{
	printf("\nparsing err ");
}

int main()
{
	yyparse();
	return 0;
}

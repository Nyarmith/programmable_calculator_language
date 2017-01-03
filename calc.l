/********************************************************
 * calc.l
 ********************************************************/
%{
#include "calc.tab.hpp"
#include <iostream>
#include <cstring>
using namespace std;
//char *cppnewguy = new char[200];
%}

%option noyywrap

%%

[a-z]+   { 
            //cout << "HERE" << endl;
            int n = strlen(yytext);
            //cout << "word: " << yytext << endl;
            char* word = new char[n+1]; // TODO: Fix this memory leak
            //cout << word << endl;
            //cout << n << endl;
            word = strcpy(word, yytext);
            yylval.str = word;
            return STR; 
         }
[0-9]+   { yylval.val = atoi(yytext); return NUM; }
[\+|\-]  { yylval.sym = yytext[0]; return OPA; }
[\*|/]   { yylval.sym = yytext[0]; return OPM; }
"("      { return LP; }
")"      { return RP; }
";"      { return STOP; }
"="      { return OPE; }
<<EOF>>  { return 0; }
[ \t\n]+ { }
.        { cerr << "Unrecognized token!" << endl; exit(1); }
%%

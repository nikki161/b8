
%using QUT.Gppg;

%namespace LYtest


%scannertype MyLanguageScanner
%visibility internal
%tokentype Token

%option stack, minimize, parser, verbose, persistbuffer, noembedbuffers 

Eol             (\r\n?|\n)
NotWh           [^ \t\r\n]
Space           [ \t]

Alpha	[a-zA-Z_]
Digit   [0-9] 
IntNum  {Digit}+
AlphaDigit {Alpha}|{Digit}
Ident {Alpha}{AlphaDigit}* 

%{

%}

%%

/* Scanner body */

{IntNum}		{  
					yylval.iVal = int.Parse(yytext);
					return (int)Token.NUMBER;
				}

"=" { return (int)Token.ASSIGN; }


"==" { return (int)Token.EQ; }
"!=" { return (int)Token.NEQ; }

"<" { return (int)Token.LT; }
">" { return (int)Token.GT; }
"<=" { return (int)Token.LE; }
">=" { return (int)Token.GE; }
"or" { return (int)Token.OR; }
"and" { return (int)Token.AND; }
"not" { return (int)Token.NOT; }

"-" { return (int)Token.MINUS; }
"+" { return (int)Token.PLUS; }
"*" { return (int)Token.MULT; }
"/" { return (int)Token.DIV; }
"(" { return (int)Token.LPAREN; }
")" { return (int)Token.RPAREN; }
".." { return (int)Token.DDOT; }
"," { return (int)Token.COMMA; }

"{" { return (int)Token.BEGIN; }
"}" { return (int)Token.END; }

";" { return (int)Token.SEMICOLON; }


"while" { return (int)Token.WHILE; }
"endwhile" { return (int)Token.ENDWHILE; }
"for" { return (int)Token.FOR; }
"endfor" { return (int)Token.ENDFOR; }
"if" { return (int)Token.IF; }
"endif" { return (int)Token.ENDIF; }
"else" { return (int)Token.ELSE; }
"print" { return (int)Token.PRINT; }
"println" { return (int)Token.PRINTLN; }

{Ident} {   yylval.sVal = yytext;
			return (int)Token.IDENT; }

{Space}+		/* skip */



%%

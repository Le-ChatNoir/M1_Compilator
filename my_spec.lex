//JFlex spec
/*
* Compilation Project
*/
import java_cup.runtime.Symbol;

%%
%unicode
%cup        //Declares that we're using cup
%line
%column

%%

//Creation of the BINARY:n token using yytext()
"$"[a-zA-Z] {System.out.print(yytext()); return new Symbol(sym.VARIABLESTRING, new String(yytext())); }
[a-zA-Z] {System.out.print(yytext()); return new Symbol(sym.VARIABLEINT, new String(yytext())); }
[0-9]+ {System.out.print(yytext()); return new Symbol(sym.NB, new Integer(yytext())); }
"+" {System.out.print(yytext()); return new Symbol(sym.PLUS, new String(yytext())); }
"*" {System.out.print(yytext()); return new Symbol(sym.MULT, new String(yytext())); }
"(" {System.out.print(yytext()); return new Symbol(sym.OP, new String(yytext())); }
")" {System.out.print(yytext()); return new Symbol(sym.CP, new String(yytext())); }
"=" {System.out.print(yytext()); return new Symbol(sym.AFFECT, new String(yytext())); }
"PRINT" {System.out.print(yytext()); return new Symbol(sym.PRINT, new String(yytext())); }

(\"[0-9a-zA-Z]+\") {System.out.print(yytext()); return new Symbol(sym.CHAR, new String(yytext())); }

\n {return new Symbol(sym.CR, new String(yytext())); }
[ \t] {} //consume space
. {System.out.print("lexical error : \"" + yytext() + "\" line : " + yyline+1 + "\n"); } //Lexical error, not in the grammar
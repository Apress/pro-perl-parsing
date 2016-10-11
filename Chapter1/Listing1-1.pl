#!/usr/bin/perl

use Parse::Lex;

#defines the tokens
@token=qw(  
	BegParen [\(]
	EndParen [\)]
	Operator [-+*/^]
	Number   [-?\d+|-?\d+\.\d*]
	);
$lexer=Parse::Lex->new(@token); #Specifies the lexer
$lexer->from(STDIN); #Specifies the input source

TOKEN:
while(1){ #1 will be returned unless EOI
	$token=$lexer->next;
	if(not $lexer->eoi){
		print $token->name . " " . $token->text . " " . "\n";
	}
	else {last TOKEN;}
}

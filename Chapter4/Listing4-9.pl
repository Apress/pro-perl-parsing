sub Lexer{
    my($parser)=shift;
    
    $parser->YYData->{INPUT} or return('',undef);
    $parser->YYData->{INPUT}=~s/^[ \t]//;
    for($parser->YYData->{INPUT}){
        s/^(\+)// and return ('+', $1);
        s/^(-)// and return ('-', $1);
        s/^(\*)// and return ('*', $1);
        s/^(\/)// and return ('/', $1);
        s/^(\d+)// and return ('number',$1);
    }
    
}


sub Error {
    exists $_[0]->YYData->{ERRMSG}
    and do {
        print $_[0]->YYData->{ERRMSG};
        delete $_[0]->YYData->{ERRMSG};
        return;
   };
    print "Syntax error\n";
}

sub parse{
  my ($self, $input) = @_;
  $self->YYData->{INPUT} = $input;
  my $result = $self->YYParse(yylex => \&Lexer, yyerror => \&Error);
  return $result;
}

sub parse{
  my ($self, $input) = @_;
  $self->YYData->{INPUT} = $input;
  my $result = $self->YYParse(yylex => \&Lexer, yyerror => \&Error, yydebug=>0x1F);
  return $result;
}

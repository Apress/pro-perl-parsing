use Parse::RecDescent;

my $grammar=q{
   startrule:      String eofile
   String:         <perl_quotelike>
   eofile:         /^\Z/
};

my $parser=new Parse::RecDescent($grammar) 
    or die "parser generation failure";

my @lists=("/abc/",
           "'a string'",
           "abcd"
           );

foreach my $list(@lists){
   print $list . '= ' .
   (defined($parser->startrule($list))?"CORRECT":"INCORRECT") . "\n";
}

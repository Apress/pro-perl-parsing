use Parse::RecDescent;

my $grammar=q{
   startrule:      String(2..5) eofile
   String:	         'a'
   eofile:	         /^\Z/
};

my $parser=new Parse::RecDescent($grammar) 
   or die "parser generation failure";

my @lists=( "a",
            "aa",
            "aaa",
            "aaaa",
            "aaaaa",
            "aaaaaa",
            "aaaaaaa"
            );


foreach my $list(@lists){
   print $list . '= ' .
   (defined($parser->startrule($list))?"CORRECT":"INCORRECT") . "\n";
}

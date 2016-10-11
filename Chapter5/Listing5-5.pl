use Parse::RecDescent;

my $grammar=q{
   {my $position='???';}
   startrule:      DNA(s) eofile {$return=$position;}
   DNA:        CutSite|/[ATCG]/
   CutSite:    /GAATTC/ {$position=$thisoffset-5;}
   eofile:         /^\Z/
};

my $parser=new Parse::RecDescent($grammar) 
    or die "parser generation failure";

my @lists=("ATTGAATTCTTAAG",
           "GTCGGGAGAATTCGGCCT",
           "CGAATTCA",
           );

foreach my $list(@lists){
   print $list . ' Cutsite after position ' .
   $parser->startrule($list) . "\n";
}

use Parse::RecDescent;
use Data::Dumper;

my $grammar=q{
   <autotree>
   startrule:      Item eofile|List 'and' Item eofile
   List:           Item',' List|Item
   Item:           'bread'|'milk'|'eggs'|'meat'
   eofile:         /^\Z/
};

my $parser=new Parse::RecDescent($grammar) 
    or die "parser generation failure";

my @lists=( "bread, milk and eggs");

foreach my $list(@lists){
   my $result=($parser->startrule($list));
   print Dumper($result);
}

#!/usr/bin/perl -w

use Parse::RecDescent;
$::RD_AUTOACTION=q{print $item[0] . "\n"};

my $grammar=q{
   startrule:      Item eofile|List 'and' Item eofile
   List:           Item',' List|Item
   Item:           'bread'|'milk'|'eggs'|'meat'
	eofile:         /^\Z/
};

my $parser=new Parse::RecDescent($grammar) 
    or die "parser generation failure";

my @lists=( "bread, milk and eggs");

foreach my $list(@lists){
   ($parser->startrule($list));
}

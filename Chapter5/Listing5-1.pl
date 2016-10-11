#!/usr/bin/perl -w

use Parse::RecDescent;

my $grammar=q{
   startrule:      Item eofile|List 'and' Item eofile
   List:           Item',' List|Item
   Item:           'bread'|'milk'|'eggs'|'meat'
   eofile:	         /^\Z/
};

my $parser=new Parse::RecDescent($grammar) 
   or die "parser generation failure";

my @lists=( "bread, milk and eggs",
            "meat and eggs",
            "bread and milk and eggs",
            "meat, milk, eggs",
            "bread and bread",
            "milk, eggs, and",
            "meat, eggs, milk,"
            );


foreach my $list(@lists){
   print $list . '= ' .
   (defined($parser->startrule($list))?"CORRECT":"INCORRECT") . "\n";
}

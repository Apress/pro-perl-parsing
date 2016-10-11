#!/usr/bin/perl -w

use Parse::RecDescent;
$::RD_HINT=1;

my $grammar=q{
   startrule:       expression eofile {$return=$item[1]}
   expression:      addition|subtraction|division|multiplication
   addition:        number '+' number {$return=$item[1]+$item[3]}
   subtraction:     number '-' number {$return=$item[1]-$item[3]}
   multiplication:  number '*' number {$return=$item[1]*$item[3]}
   division:        number '/' number <reject: $item[3]==0>
                      {$return=$item[1]/$item[3]}
   number:          /\d+/
   eofile:          /^\Z/
};


my $parser=new Parse::RecDescent($grammar)
   or die "parser generation failure";

my @lists=("12/0",
           "22/10"
           );
foreach my $list(@lists){
   print $list . '= ' .
   $parser->startrule($list) . "\n";
}

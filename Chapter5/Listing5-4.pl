#!/usr/bin/perl -w

use Parse::RecDescent;

my $grammar=q{
   startrule:        expression eofile {$return=$item[1]}
   expression:       addition|subtraction|multiplication|division
   addition:         number '+' number {$return=$item[1]+$item[3]}
   subtraction:      number '-' number {$return=$item[1]-$item[3]}
   multiplication:   number '*' number {$return=$item[1]*$item[3]}
   division:         number '/' number {if($item[3]!=0){
                                            $return=$item[1]/$item[3]}
                                            else{print "division by zero";
                                            $return=""}}
   number:           /\d+/
   eofile:           /^\Z/
};

my $parser=new Parse::RecDescent($grammar) 
    or die "parser generation failure" ;

my @lists=("1+7",
           "3+5",
           "12-6",
           "22/12",
           "15+8",
           "2*6",
           "3-2"
           );

foreach my $list(@lists){
   print $list . '= ' .
   $parser->startrule($list) . "\n";
}

#!/usr/bin/perl -w

use Parse::RecDescent;

my $grammar=q{
   startrule:      LastName ',' FirstName argrule[$item[1],$item[3]]
   LastName:       /\w+/
   FirstName:      /\w+/
   argrule:       { print "Name= $arg[1] $arg[0]\n";}
   };

my $parser=new Parse::RecDescent($grammar)
    or die "parser generation failure";

my @lists=("Frenz, Chris",
           "Smith, Robert",
           "Doe, John");

foreach my $list(@lists){
   $parser->startrule($list);
}

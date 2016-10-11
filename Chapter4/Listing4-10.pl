#!usr/bin/perl
use MyMathParser;
my @input=("6 + 5","7 - 15","8 * 5","9 / 19");

$parser=new MyMathParser();

foreach $expression(@input){
    my $result=$parser->parse($expression);
    print $result . "\n";
}

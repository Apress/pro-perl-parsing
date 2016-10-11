#!/usr/bin/perl

#Note MyParser.pm should be in the same directory as the script
use MyParser;

my $input="eggs, milk and bread";

$parser=new MyParser();
my $result=$parser->parse($input);

print $parser->YYNberr();

#!/usr/bin/perl

use XML::LibXML;

my $parser=XML::LibXML->new;
$parser->validation(1); # turns on validation- off by default
$parser->parse_file("atp.xml");

#!/usr/bin/perl

use XML::Simple;
use Data::Dumper;

$tree=XMLin("MyXML.xml");

print Dumper($tree);

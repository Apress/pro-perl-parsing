#!/usr/bin/perl

use XML::SAX::ParserFactory;
use XML::Handler::YAWriter;
use XML::Filter::Sort;

my $handler = new XML::Handler::YAWriter(AsFile=>'sorted.xml');
my $filter = new XML::Filter::Sort(
    Record => 'book',
    Keys => 'title',
    Handler => $handler,
);
my $parser = XML::SAX::ParserFactory->parser(Handler => $filter);

$parser->parse_uri('MyXML.xml');

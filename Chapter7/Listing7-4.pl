#!/usr/bin/perl

use XML::SAX::ParserFactory;
use XML::Validator::Schema;

$validator = XML::Validator::Schema->new(file => 'cml1_0_1.xsd');
$parser = XML::SAX::ParserFactory->parser(Handler => $validator);

eval { $parser->parse_uri('atp.xml') };
die "Validation Failed: $@" if $@;

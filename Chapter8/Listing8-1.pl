#!usr/bin/perl

use Text::Balanced qw(extract_delimited);

$text=q{#abc#12345};
$delim='#';

($extracted,$remainder)=extract_delimited($text,$delim);

print "Extracted= " . $extracted . "\n";
print "Remainder= " . $remainder;

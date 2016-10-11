#!usr/bin/perl

use Text::Balanced qw(extract_delimited);

$text=q{12345#abc#12345};
$delim='#';

 $pos=index($text,$delim);
$string=substr($text,$pos);
($extracted,$remainder)=extract_delimited($string,$delim);

print "Extracted= " . $extracted . "\n";
print "Remainder= " . $remainder;

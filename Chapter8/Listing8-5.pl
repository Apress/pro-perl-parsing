#!usr/bin/perl

use Text::Balanced qw(extract_quotelike);

($text=<<'MYCODE');
    qw{abcd}
MYCODE

($extracted,$remainder)=extract_quotelike($text);

print "Extracted= " . $extracted . "\n";

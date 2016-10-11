#!/usr/bin/perl -w
use Regexp::Common 'RE_ALL';

while(<>){
    $_ =~ RE_delimited(-delim=>'"',-keep)
    and print "$1\n";
}

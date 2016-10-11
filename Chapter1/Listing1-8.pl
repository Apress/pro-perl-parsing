#!/usr/bin/perl -w
use Regexp::Common;

while(<>){
    /$RE{delimited}{-delim=>'"'}{-keep}/
    and print "$1\n";
}

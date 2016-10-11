#!/usr/bin/perl -w
use Regexp::Common;

while(<>){
    /$RE{balanced}{-parens=>'()'}{-keep}/
    and print "$1\n";
}

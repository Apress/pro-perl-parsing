#!/usr/bin/perl

use Text::Balanced qw(extract_multiple);
use Text::Balanced qw(extract_variable);

($text=<<'MYCODE');
    $myvar[$i][$j];
    $myvar2;
    # more code
MYCODE

@extracted=extract_multiple($text,[sub{extract_variable($_[0])}]);
for($i=0;$i<=$#extracted;$i++){
   print $extracted[$i];
}

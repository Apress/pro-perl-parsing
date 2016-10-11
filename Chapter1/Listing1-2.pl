#!/usr/bin/perl

$string1="123";
$string2="ABC";
$pattern1="123";

if($string1=~/$pattern1/){
    print "123=123\n";
}

if($string2!~/123/){
    print "ABC does not match /123/\n";
}

if("234"=~/$pattern1|ABC/){
    print "This is 123 or ABC\n";
}
else{print "This is neither 123 nor ABC";}

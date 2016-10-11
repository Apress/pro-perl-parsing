#!/usr/bin/perl

($string=<<'LIST');
John (555)555-5555
Bob (234)567-8901
Mary (734)234-9873
Tom (999)999-9999
LIST

$name="Mary";
pos($string)=0;
while($string=~/$name/g){
    if($string=~/\G(\s?\(?\d{3}\)?[-\s.]?\d{3}[-.]\d{4})/){
        print "$name $1";
    }
}

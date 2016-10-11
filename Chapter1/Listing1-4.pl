#!usr/bin/perl;
$string="regular expressions are fun";
pos($string)=3;
while($string=~/e/g){
	print "e at position " . (pos($string)-1). "\n";
}

#!usr/bin/perl;

$String="ATGCCGGGAAATTATAGCG";
$Count=0;

while($String=~/G|C/g){
	$Count=$Count+1;
}
$len=length($String);
$GC=$Count/$len;
print "The DNA sequence has $GC %GC Content";

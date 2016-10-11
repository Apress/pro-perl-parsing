#!/usr/bin/perl

use XML::LibXML;

#Constructs the DOM tree
my $parser=XML::LibXML->new;
my $domtree=$parser->parse_file("atp.xml");

#Outputs appropriate elements to @atoms
my @atoms=$domtree->getElementsByTagName("string");

my $i=0;
my $element;
;
my %Counts=(C=>0,
            N=>0,
            O=>0,
            P=>0
            );

#Iterates through @atoms to count element types (e.g. C,O,etc.)
foreach my $atom (@atoms){
    if ($atom->firstChild->data =~ /([CNOP])/){
        $Counts{$1}++;
    }
}

print "ATP is \n";
print $Counts{C}/$i*100 . "% Carbon \n";
print $Counts{N}/$i*100 . "% Nitrogen \n";
print $Counts{O}/$i*100 . "% Oxygen \n";
print $Counts{P}/$i*100 . "% Phosphorous \n";

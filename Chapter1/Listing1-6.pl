#!usr/bin/perl;

($String=<<'ABOUTA');
   ChemicalA is used to treat cancer.  ChemicalA 
   reacts with ChemicalB which is found in cancer
   cells.  ChemicalC inhibits ChemicalA .
ABOUTA

pos($String)=0;
while($String=~/reacts with|inhibits/ig){
    $rxn=$&;
    $left=$`;
    $right=$';
    if($left=~/(\w+)\s+\z/){
       $Chem1=$1;
    }
    if($right=~/(\w+)/){
       $Chem2=$1;
    }
    print "$Chem1 $rxn $Chem2\n";
}

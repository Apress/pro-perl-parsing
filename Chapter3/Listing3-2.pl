#!/usr/bin/perl -w
use strict;

my @rules;
my $Expression;
my $Sentence="W=X*(Y+Z)";
my $NonTerm;
my $i;

#Read in grammar rules
while(<>){
    push @rules, [split/::= /];
}

#Set $Expression to start rule rhs
$Expression=$rules[1][1];
print $Expression;

#Allows for the replacement of <Expression>
while($Expression=~/<Expression>/){

   #Directs replacement by pulling appropriate opperators out of $Sentence
    if($Sentence=~/\+|-|\*|\\|\(/g){
    $NonTerm=$&;
    if($NonTerm ne '-'){
      $NonTerm="\\" . $NonTerm ;
    }
      for($i=0;$i<=$#rules;$i++){
              if($rules[$i][1]=~/$NonTerm/){
              $Expression=~s/<Expression>/$rules[$i][1]/;
              print $Expression;
          }
        }
    }

   #Controls replacement of E with V
    if($Expression=~/<Expression>/ and $NonTerm ne '\('){
        $Expression=~s/<Expression>/<Variable>/;
        print $Expression;
    }
}

#Resets $Sentence position to beginning
pos($Sentence)=0;

#Directs replacement of V by pulling appropriate non-terminals out of $Sentence 
while($Expression=~/<Variable>/){
    if($Sentence=~/W|X|Y|Z/g){
             $NonTerm=$&;             $Expression=~s/<Variable>/$NonTerm/;             print $Expression;
    }
}

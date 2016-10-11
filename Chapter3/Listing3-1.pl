#!/usr/bin/perl -w
use strict;
my @rules;
my $Expression;
my $Sentence="W=X*(Y+Z)";
my $Stack;
my $i;
my $k=0;
my @rhs;

# read in grammar rules to @rules array
while(<>){
    push @rules, [split/::= /];
}

#shift first token onto stack
$Stack=substr($Sentence,$k,1);
print $Stack . "\n";

#loop which proceeses the entire input string until
# it has been reduced to the start token.
while($Stack!~/<Sentence>/) {
    for($i=0;$i<=$#rules;$i++){
        if($i!=7 && $Stack=~/$rules[$i][1]/){

#Ensures that V=E not reduced until entire string is processed
            if($i!=1){
                $Stack=~s/$rules[$i][1]/$rules[$i][0]/;
                print $Stack . "\n";
            }
            elsif($i==1 && $Stack!~/\+|-|\*|\/|\(/){
                $Stack=~s/$rules[$i][1]/$rules[$i][0]/;
            }
        }

#only allows V to be reduced if it occurs on rhs of =
        elsif($i==7){
            if($Stack=~/=/){
                @rhs=split /=/, $Stack;
                if($rhs[1]=~/($rules[7][1])/){
                    $rhs[1]=~s/$rules[$i][1]/$rules[$i][0]/;
                    print $rhs[0] ."=". $rhs[1] . "\n";
                }
                $Stack=$rhs[0] ."=". $rhs[1];
            }
        }
    }

$shifts next token onto $Stack
    $k=$k+1;
    $Stack=$Stack . substr($Sentence,$k,1);
    if($k<=8){print $Stack . "\n";}
}
print $Stack . "\n";

#!/usr/bin/perl -w
use strict;
my $Expression="1+3*(((4*7)-29))/3+(90/5)";
my $ParenExpression;
my $ParenContents;

sub evaluate{
    my $Expr=join("",@_);
    my $A;
    my $B;
    my $C;

#Order of while loops preserves order of operations
    while($Expr=~/((-?\d+|-?\d+\.\d+)\*(-?\d+|-?\d+\.\d+))/){

#Math broken down into extra steps to simplify logic
        $A=$2;
        $B=$3;
        $C=$A*$B;
        $Expr=~s/((-?\d+|-?\d+\.\d+)\*(-?\d+|-?\d+\.\d+))/$C/;
    }
    while($Expr=~/((-?\d+|-?\d+\.\d+)\/(-?\d+|-?\d+\.\d+))/){
        $A=$2;
        $B=$3;	
        $C=$A/$B;
        $Expr=~s/((-?\d+|-?\d+\.\d+)\/(-?\d+|-?\d+\.\d+))/$C/;
    }
    while($Expr=~/((-?\d+|-?\d+\.\d+)\+(-?\d+|-?\d+\.\d+))/){
        $A=$2;
        $B=$3;
        $C=$A+$B;
        $Expr=~s/((-?\d+|-?\d+\.\d+)\+(-?\d+|-?\d+\.\d+))/$C/;
    }
    while($Expr=~/((-?\d+|-?\d+\.\d+)-(-?\d+|-?\d+\.\d+))/){
        $A=$2;
        $B=$3;
        $C=$A-$B;
        $Expr=~s/((-?\d+|-?\d+\.\d+)-(-?\d+|-?\d+\.\d+))/$C/;
    }
    return $Expr;
}

#Evaluates contents of parenthesis first
while($Expression=~/(\((.*?)\))/){
    $ParenContents=$2;
    $ParenContents=evaluate($ParenContents);
    $Expression=~s/(\((.*?)\))/$ParenContents/;
}

#Evaluates elements not in parenthesis
$Expression=evaluate($Expression);
print $Expression;

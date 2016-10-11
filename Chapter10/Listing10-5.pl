#!/usr/bin/perl -w

use strict;

use constant alpha=>0.2; # the learning rate
use constant mu=>0.6; #The momentum constant
use constant N=>2;
use constant M=>4;

our(@hbias,@hbiasold,@dhbias);
our(@hweight,@hweightold,@dhweight);
our($obias,$obiasold,$dobias);
our(@oweight,@oweightold,@doweight);
our(@hin,@hout);
our($oin,$oout);
our($odelta,$hdelta);
our(@X,@X1,@targval);

sub trans {
	my($val)=@_;
	my $trans;
	$trans=(2/(1+(exp(-$val))))-1;
	return $trans;
}

sub dtrans {
	my($val)=@_;
	my $dtrans;
	$dtrans=(1/2)*(1+trans($val))*(1-trans($val));
	return $dtrans;
}

sub init {
	my($i,$j);
	for($i=0;$i<=(N)-1;$i++) {
		for($j=0;$j<=(M)-1;$j++) {
			$hweight[$i][$j]=(rand)-0.5;
		}
	}
	@hweightold=@hweight;
	for($j=0;$j<=(M)-1;$j++) {
		$hbias[$j]=(rand)-0.5;
		$oweight[$j]=(rand)-0.5;
	}
	@hbiasold=@hbias;
	@oweightold=@oweight;
	$obias=(rand)-0.5;
	$obiasold=$obias;
}

sub hiddeninput {
	my($i,$j);
	my $sum;
	for($j=0;$j<=(M)-1;$j++) {
		$sum=0;
		for($i=0;$i<=(N)-1;$i++) {
			$sum=$sum+($X[$i]*$hweight[$i][$j]);
		}
		$hin[$j]=$hbias[$j]+$sum;
	}
}

sub hiddentransfer {
	my $j;
	for($j=0;$j<=(M)-1;$j++) {
		$hout[$j]=(trans($hin[$j]));
	}
}

sub outputinput {
	my $sum=0;
	my $j;
	for($j=0;$j<=(M)-1;$j++) {
		$sum=$sum+($hout[$j]*$oweight[$j]);
	}
	$oin=$obias+$sum;
}

sub outputtransfer {
	$oout=trans($oin);
}

sub updateout {
	my($i)=@_;
	my $j;
	$odelta=(dtrans($oin))*($targval[$i]-$oout);
	for($j=0;$j<=(M)-1;$j++) {
		$doweight[$j]=(alpha*($odelta)*$hout[$j])+(mu*($oweight[$j]-$oweightold[$j]));
		$oweightold[$j]=$oweight[$j];
		$oweight[$j]=$oweight[$j]+$doweight[$j];
	}
	$dobias=((alpha)*($odelta))+((mu)*(($obias)-($obiasold)));
	$obiasold=$obias;
	$obias=$obias+$dobias;
}

sub updatehidden {
	my($i,$j,$k);
	my $deltatemp;
	for($j=0;$j<=(M)-1;$j++) {
		$hdelta=$odelta*$oweight[$j]*dtrans($hin[$j]);
		for($i=0;$i<=(N)-1;$i++) {
			$dhweight[$i][$j]=(alpha*$hdelta*$X[$i])+(mu*($hweight[$i][$j]-$hweightold[$i][$j]));
			$hweightold[$i][$j]=$hweight[$i][$j];
			$hweight[$i][$j]=$hweight[$i][$j]+$dhweight[$i][$j];
		}
		$dhbias[$j]=(alpha*$hdelta)+(mu*($hbias[$j]-$hbiasold[$j]));
		$hbiasold[$j]=$hbias[$j];
		$hbias[$j]=$hbias[$j]+$dhbias[$j];
	}
}


@X1=([1,1],[-1,1],[1,-1],[-1,-1]); # input values
@targval=(-1,1,1,-1);
init();
my($i,$j);
my @outvals;
for($j=0;$j<1000;$j++) {
	for($i=0;$i<=3;$i++) {
		$X[0]=$X1[$i][0];
		$X[1]=$X1[$i][1];
		hiddeninput();
		hiddentransfer();
		outputinput();
		outputtransfer();
		$outvals[$i]=$oout;
		updateout($i);
		updatehidden();
	}
print $outvals[0]," ",$outvals[1]," ",$outvals[2]," ",$outvals[3],"\n";
}
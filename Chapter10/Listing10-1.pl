#!/usr/bin/perl

use Statistics::Descriptive;

#declares a new instance of the statistics object
my $stats=Statistics::Descriptive::Full->new();

#passes data values to the statistics object
$stats->add_data(110,125,147,131,119);

#retrieves mean and standard deviation
$mean=$stats->mean();
$SD=$stats->standard_deviation();

printf("The average blood pressure is %.2f +/- %.2f",$mean,$SD);

#!/usr/bin/perl

use Statistics::Regression;

my $reg = Statistics::Regression->new( 
    2, "Example", 
    ["intercept", "slope"] 
  );

# Setting the value of x1 to 1.0 will
# allow for the calculation of a Y intercept
$reg->include( 4.0, [1.0, 0.5] );
$reg->include( 12.0, [1.0, 1.0] );
$reg->include( 38.0, [1.0, 2.0] );
$reg->include( 129.0, [1.0, 8.0] );

# Print the result
$reg->print();

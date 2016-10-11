#!/usr/bin/perl

use SOAP::Lite;

$uri='http://www.soaplite.com/Temperatures';
$proxy='http://services.soaplite.com/temper.cgi';

my $WebServ=SOAP::Lite->uri($uri)->proxy($proxy);

my $result= $WebServ->call("c2f",56)->result
   or die "Failed to connect to server";

print "The temperature in Fahrenheit is " . $result;

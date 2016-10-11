#!/usr/bin/perl

use XML::Simple;

($Config=<<'CONFIGINFO');
    <config Name="MyCustomConfig" Program="MyScript.pl">
       <settings> Setting A </settings>
       <settings> Setting B </settings>
    </config>
CONFIGINFO

my $Settings = XMLin($Config);

print "Name=$Settings->{Name} \n";
print "First Setting=$Settings->{settings}->[0]";

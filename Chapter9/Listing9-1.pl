#!/usr/bin/perl

use Parse::RecDescent;

$grammar=q{ 
            startrule:   Commands(s) eof
            Commands:   '-i ' input|'-it ' intype|'-o ' output|'-ot ' outtype
            input:      /\S*/ {$::ConfigHash{I}=$item[1]}
            intype:     'text'  {$::ConfigHash{IT}=$item[1]}
                        |'XML'  {$::ConfigHash{IT}=$item[1]}
                        |'HTML' {$::ConfigHash{IT}=$item[1]}
            output:     /\S*/ {$::ConfigHash{O}=$item[1]}
            outtype:    'text'  {$::ConfigHash{OT}=$item[1]}
                        |'XML'  {$::ConfigHash{OT}=$item[1]}
                        |'HTML' {$::ConfigHash{OT}=$item[1]}
            eof:     /^\Z/
            };
            
my $parser=new Parse::RecDescent($grammar)
   or die("Parser Generation Failed");

$list=join(" ", @ARGV);

$parser->startrule($list);
if (scalar keys %ConfigHash < 4) { die "Missing Arguments" }
print "Input file name is $::ConfigHash{I} \n";
print "The input file is a $::ConfigHash{IT} file \n";
print "Output file name is $::ConfigHash{O} \n";
print "The output file is a $::ConfigHash{OT} file \n";

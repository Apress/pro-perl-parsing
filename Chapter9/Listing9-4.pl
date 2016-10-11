#!/usr/bin/perl

format OFILE_TOP=
        A report of My Formatted Data
        Date: @||||||||||||||||||||||
                       $Date
Column1     Column2     Column3     Column 4
____________________________________________
.
format OFILE=
@<<<           @>>>     @||||||     @<<<<<<<
$var1,      $var2,      $var3,      $var4
.

# specifying STDOUT is not necessary it is
# stated to demonstrate where a file handle would go
open(STDOUT, ">formattedout.txt");

$Date='June 3, 2005';
foreach my $i(0..9){
  $var1=rand()*5;
  $var2=rand()*-7;
  $var3=rand();
  $var4=rand()*3;
  write OFILE;
}

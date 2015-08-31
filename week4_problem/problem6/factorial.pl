#!/usr/bin/perl
# Week 4 problem 6
use strict;
use warnings;

# open in and out file
my $in_file = 'numbers.txt';
my $out_file = 'myresult.txt';

open (IN, '<', $in_file) or die ("Cannot open file: $!\n");
open (OUT, '>', $out_file) or die ("Cannot open file: $!\n");

# while loop
while (my $line = <IN>) {
   chomp $line;
   if ($line % 2 == 0 && $line < 24) {
        print "$line\n";
   } 
   else {
      # initialize factorial
      my $factorial = $line;
      while ($line > 1) {
         $line--;
         $factorial = $factorial*$line;
      }
      print OUT "$factorial\n"; 
   } 
}

close IN;
close OUT;

exit;

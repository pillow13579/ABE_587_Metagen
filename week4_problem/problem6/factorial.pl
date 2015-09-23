#!/usr/bin/perl
# Week 4 problem 6
use strict;
use warnings;

# open in and out file
my $in_file = 'numbers.txt';
my $out_file = 'myresult.txt';

open (my $in_fh, '<', $in_file) or die ("Cannot open file: $!\n");
open (my $out_fh, '>', $out_file) or die ("Cannot open file: $!\n");

# while loop
while (my $line = <$in_fh>) {
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
      print $out_fh "$factorial\n"; 
   } 
}

close $in_fh;
close $out_fh;

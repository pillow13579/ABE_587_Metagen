#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;

my @sequences = @ARGV;
if (@ARGV == 0) {
   die "Please provide a list of sequences.\n";
}

my $length = 0;
my $g = 0;
my $c = 0;

# for each sequence in array
for my $element (@sequences) {
   $length = length $element; 
   
   # for one sequence count GC
   my @seq = split(//,$element);
   for my $n (@seq) {
     if (uc($n) eq 'G') {
        $g++;
     }
     if (uc($n) eq 'C') {
        $c++
     }            
   }
   
   print "--------\n","Seq :$element\n","Length: $length\n",
         "#GC :", $g+$c,"\n","%GC :", ($g+$c)/$length*100,"\n"; 
   
   # initialize counter for next sequence
   $g =0;
   $c =0;  
} 

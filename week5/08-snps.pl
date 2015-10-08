#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;

my ($seq1, $seq2) = @ARGV;
unless (@ARGV == 2) {
   die "Please provide two sequences.\n";
}

if (length($seq1) != length($seq2)) {
   say "Please ensure the sequences are the same length.";
   exit;   
}

my @n1 = split(//, $seq1);
my @n2 = split(//, $seq2);
my $count = 0;

for (my $i=0; $i< length($seq1);$i++) {
     if (uc($n1[$i]) ne uc($n2[$i])) {
        $count++;
        say "Pos ",$i+1,": $n1[$i] => $n2[$i]"; 
     }
}

if ($count == 1) {
   say "Found $count SNP."
} else {
   say "Found $count SNPs."
}  

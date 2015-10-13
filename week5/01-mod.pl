#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;

my @numbers = @ARGV;
if (@ARGV == 0) {
   die "Please provide a list of numbers.\n";
}

my @evens;

for my $number (@numbers) {
  if ($number % 2 == 0) {
    push(@evens, $number);   
  }
}

say "evens = ", join(', ',@evens);

#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;

my @numbers = @ARGV;
if (@ARGV == 0) {
   die "Please provide a list of numbers.\n";
}

my $evensum = 0;
my $oddsum  = 0;

for my $number (@numbers) {
  if ($number % 2 == 0) {
   $evensum += $number;
    } else {
   $oddsum += $number; 
    }
}

say "sum evens = $evensum";
say "sum odds = $oddsum";

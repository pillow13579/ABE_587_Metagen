#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;

my @numbers = @ARGV;
if (@ARGV == 0) {
   die "Please provide a list of numbers.\n";
}

my @def_sort = sort(@numbers);
my @num_sort = sort {$a <=> $b}@numbers;
my @rev_sort = sort {$b <=> $a}@numbers;

say "default sort = ", join(', ',@def_sort);
say "numerical sort = ", join(', ',@num_sort);
say "reverse numerical sort = ", join(', ',@rev_sort);

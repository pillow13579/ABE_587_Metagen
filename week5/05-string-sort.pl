#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;

my @strings = @ARGV;
if (@ARGV == 0) {
   die "Please provide a list of sequences.\n";
}

my @sort_string = sort {uc($a) cmp uc($b)} @strings;
say "sorted = ", join(', ', @sort_string);

my @rev_string = sort {uc($b) cmp uc($a)} @strings;
say "reverse = ", join(', ', @rev_string);

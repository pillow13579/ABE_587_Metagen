#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;

my @strings = @ARGV;
if (@ARGV == 0) {
   die "Please provide a list of sequences.\n";
}

my @sort_string = sort {length($a) cmp length($b)} @strings;
say "soted = ", join(',', @sort_string);

my @rev_string = sort {length($b) cmp length($a)} @strings;
say "reverse = ", join(',', @rev_string);

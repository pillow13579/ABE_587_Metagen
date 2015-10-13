#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;

my @array = qw(101 2 15 22 95 33 2 27 72 15 52);
say "array = ", join(', ',@array);

my $popped = pop(@array);
say "popped = $popped, array = ", join(', ',@array);

my $shifted = shift(@array);
say "shifted = $shifted, array = ", join(', ',@array);

push @array, '12';
say "after push, array = ", join(', ',@array);

unshift @array,'4';
say "after unshift, array = ", join(', ',@array);

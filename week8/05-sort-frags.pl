#!/usr/bin/env perl

use strict;
use warnings;
use feature "say";
use autodie;

my @frags = split(/\^/, <STDIN>);

for my $element (sort{length($a) <=> length($b)} @frags) {
    say $element;
}

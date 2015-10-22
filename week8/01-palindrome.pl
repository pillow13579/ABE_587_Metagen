#!/usr/bin/env perl

use strict;
use warnings;
use feature "say";
use autodie;

my $string = shift @ARGV;
die "Please provide a word or phrase.\n" unless (defined $string);

$string =~ s/\W//g; 

while (length($string) > 1) {
       $string =~ /(.)(.*)(.)/i;
       die "No\n" unless (lc($1) eq lc($3));
       $string = $2;
}
say "Yes";

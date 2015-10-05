#!/usr/bin/env perl
# Week 4 problem 6
use strict;
use warnings;
use autodie;

# open in and out file
my $in_file  = shift || 'numbers.txt';
my $out_file = shift || 'myresult.txt';

open my $in_fh,  '<', $in_file;
open my $out_fh, '>', $out_file;

# while loop
while (my $num = <$in_fh>) {
    chomp $num;
    if ($num % 2 == 0 && $num < 24) {
        print "$num\n";
    }
    else {
        # initialize factorial
        my $factorial = $num;
        while ($num > 1) {
            $num--;
            $factorial *= $num;
        }
        print $out_fh "$factorial\n";
    }
}

close $in_fh;
close $out_fh;

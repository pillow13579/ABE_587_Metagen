#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use autodie;

my $input = shift;
die "Please provide a FASTA file.\n" if (!defined $input);

open my $in_fh, "<", $input;

my $count = 0;

while (my $line = <$in_fh>) {
       chomp $line;
       if ($line =~ /^>/) {
           $line =~ s/^>//;
           $count++;
           say "$count: $line";
       }
}
close($in_fh);

if ($count == 1) {
    say "Found $count sequence.";
} else {
    say "Found $count sequences.";
}

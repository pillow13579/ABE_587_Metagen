#!/usr/bin/env perl
# Q4: Count the number of lines and characters per line.
use strict;
use warnings;
use autodie;
use feature 'say';

# open the file from in.fastq
my $file = shift || 'in.fastq';
open my $in_fh, '<', $file;

# initializ the counter
my $line_count      = 0;
my $character_count = 0;

# read the file by line
while (my $line = <$in_fh>) {

    #chomp $line;
    $line_count++;
    my $length = length($line);
    $character_count = $character_count + $length;
}

say "The total number of lines = $line_count";
say "The total number of characters = $character_count";
say "The average line length = ", $character_count / $line_count;

close($in_fh);

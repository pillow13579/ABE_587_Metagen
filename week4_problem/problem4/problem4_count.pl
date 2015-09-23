#!/usr/bin/perl
# Q4: Count the number of lines and characters per line.
use strict;
use warnings;

# open the file from in.fastq
my $file = 'in.fastq';
open (my $in_fh, '<', $file) or die ("cannot open file: $!\n");

# initializ the counter
my $line_count = 0;
my $character_count = 0;

# read the file by line
while ( my $line = <$in_fh>) {
     chomp $line;
     $line_count++;
     my $length = length ($line);
     $character_count = $character_count + $length;
}

print "The total number of lines = $line_count\n";
print "The total number of characters = $character_count\n";
print "The average line length = ",$character_count/$line_count,"\n";

close ($in_fh);

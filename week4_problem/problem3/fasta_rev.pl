#!/usr/bin/perl
# Q3: print the reverse complement
use strict;
use warnings;

# read the fasta file
my $file = 'in.fasta';
open (IN, '<', $file) or die ("Cannot open file: $!\n");

# while loop
my $sequence = '';

while (my $line = <IN>) {
  chomp $line;
  if ($line =~ /^>/) {
    print $line," This is the reverse complement sequence\n";
  } else {
      $line =~ tr/atcgATCG/tagcTAGC/;
      $sequence = reverse($line);
    print $sequence, "\n";
  }
}

close IN;

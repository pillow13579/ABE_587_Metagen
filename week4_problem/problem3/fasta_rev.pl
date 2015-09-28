#!/usr/bin/env perl
# Q3: print the reverse complement
use strict;
use warnings;

# read the fasta file
my $file = shift || 'in.fasta';
my $out  = shift || 'result.txt'; 
open (my $in_fh, '<', $file) or die ("Cannot open file: $!\n");
open (my $out_fh, '>',$out) or die ("Cannot open file: $!\n");

# while loop
my $sequence = '';

while (my $line = <$in_fh>) {
  chomp $line;
  if ($line =~ /^>/) {
    print $line," This is the reverse complement sequence\n";
    print $out_fh $line," This is the reverse complement sequence\n";

  } else {
      $line =~ tr/atcgATCG/tagcTAGC/;
      $sequence = reverse($line);
    print $sequence, "\n";
    print $out_fh $sequence, "\n";

  }
}

close $in_fh;

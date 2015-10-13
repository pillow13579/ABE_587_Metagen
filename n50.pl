#!/usr/bin/env/perl
use strict;
use warnings;
use feature 'say';
use autodie;

my $contig_file = shift;
my $index = 'index.txt';
my $cut_sort = 'cut_sort.txt';

`egrep ">" $contig_file > $index`;
`cut -d'_' -f4 $index | sort -g -r > $cut_sort`; 

my $no_contig = `egrep ">" $contig_file | wc -l`;
my $no_oneread = `egrep "cov_1." $index | wc -l`; 
my $longest = `head -1 $cut_sort`;
my $shortest = `tail -1 $cut_sort`;

open my $in_fh, '<', $cut_sort;
my $sum = 0;
my $line = '';
while ($line = <$in_fh>) {
      chomp $line;
      $sum += $line;
      last if ($sum >= $no_contig/2);
}

say "\nNumber of contigs: $no_contig";
say "Longest contig: $longest";
say "Shortest contig: $shortest";
say "N50: $line\n";
say "Reads not included: $no_oneread";

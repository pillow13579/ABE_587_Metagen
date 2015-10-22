#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use Data::Dumper;

my $file = 'link_bionet.txt';
open my $in_fh, "<", $file;

my %hash;
my @name = '';
my @seq = '';
while (my $line = <$in_fh>) {
       chomp $line;
       if ($line =~ /^([A-Z]{1}.+[\w\)])(\s+)([A-Z^]+)$/) {
       push @{$hash{$1}}, $3;
       }
}
close($in_fh);
my $number = keys %hash;

print STDERR Dumper(\%hash);
print STDOUT "There are $number enzymes.\n";

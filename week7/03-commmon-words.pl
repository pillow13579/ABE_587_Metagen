#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;

my ($file1, $file2) = @ARGV;
open my $in_fh1, '<', $file1;
open my $in_fh2, '<', $file2;

my @f1_words;
my @f2_words;
my %common;
my %f1_hash;

while (my $line1 = <$in_fh1>) {
       chomp $line1;
       @f1_words = map {lc} split(' ', $line1);
       for my $word (@f1_words) {
           $word =~ s/[^A-Za-z0-9]//g;
           $f1_hash{$word}++;
       }
}
close($in_fh1);

my $count = 0;

while (my $line2 = <$in_fh2>) {
       chomp $line2;
       @f2_words = map {lc} split(' ', $line2);
       for my $word (@f2_words) {
           $word =~ s/[^A-Za-z0-9]//g;
           if (exists $f1_hash{$word}){
               $common{$word}++;
           }
       }
}
close($in_fh2);

for my $key (sort keys %common) {
    say $key;
}
say "Found ", scalar keys %common, " words in common."

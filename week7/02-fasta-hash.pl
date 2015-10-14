#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;

my $file = shift || 'Perl_V.genesAndSeq.txt';
open my $in_fh, '<', $file;

my %hash;
my $name = '';

while (my $line = <$in_fh>) {
   chomp $line;
   if ($line =~ /^>/) {
      $line =~ s/^>//; 
      $name = $line;
   } else {
      $hash{$name} .= $line;
   }
}
close $in_fh;

for my $key ( sort { length $hash{$a} <=> length $hash{$b} } keys %hash) {
    my $length = length($hash{$key});
    say "$key: $length";
}

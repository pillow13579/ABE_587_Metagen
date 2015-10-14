#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;
use Data::Dumper;

my %hash = (
  'Tucson'     => 'AZ',
  'Boston'     => 'MA',
  'Jackson'    => 'MS',
  'Dixon'      => 'NM',
  'Denton'     => 'TX',
  'Cincinnati' => 'OH'
);

say Dumper(\%hash);

my $i = 0;
for my $city (sort keys %hash) {
  my $cardinal = $hash{$city};
     $i++;
  say "$i: $city, $cardinal";
}

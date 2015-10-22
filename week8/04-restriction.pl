#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use autodie;

my $input = shift;
die "Please provide a sequence or file.\n" if (!defined $input);
my $seq = '';

if (-f $input) {
    open my $in_fh, "<", $input;
    while (my $line = <$in_fh>) {
           chomp $line;
           $seq .= $line;
    }
          
    $seq =~ s/([AG])(AATT[CT])/$1\^$2/g;
    close($in_fh);

} else {
    $input =~ s/([AG])(AATT[CT])/$1\^$2/g;
}

say $seq; 


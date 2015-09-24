#!/usr/bin/env perl
# Perl_III.nobody.txt
use strict;
use warnings;

# open file
my $file = 'Perl_III.nobody.txt';
open (my $in_fh, '<', $file) or die ("cannot open file: $!\n");

# read contents
while ( my $line = <$in_fh>) {
    chomp $line;
    my $nobody = index ($line, 'Nobody');
    my $somebody = index ($line, 'somebody');
    if ($nobody >= 0 ) {
       warn ("The first position of 'Nobody' is: $nobody.\n ");
    }
    if ($somebody >= 0) {
       warn ("somebody is here: $somebody.\n");
    }
}

close ($in_fh);

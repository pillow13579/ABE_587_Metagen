#!/usr/bin/perl
# Q2: open file make all the letters in each line uppercase.
use strict;
use warnings;

# file name.
my $in = 'file-problem2.txt';
my $out = 'output2.txt';

# open file read the line and uppercase the content.
open (IN,'<',$in ) or die ("cannot open the file: $!\n");
open (OUT, '>', $out) or die ("cannot open the file: $!\n");

while ( my $line = <IN> ) {
   chomp $line;
   my $line_uppercase = uc $line;
   print OUT "$line_uppercase\n";
}

close(IN);
close(OUT);

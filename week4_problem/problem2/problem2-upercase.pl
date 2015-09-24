#!/usr/bin/env perl
# Q2: open file make all the letters in each line uppercase.
use strict;
use warnings;

# file name.
my $in = 'file-problem2.txt';
my $out = 'output2.txt';

# open file read the line and uppercase the content.
open (my $in_fh,'<',$in ) or die ("cannot open the file: $!\n");
open (my $out_fh, '>', $out) or die ("cannot open the file: $!\n");

while ( my $line = <$in_fh> ) {
   chomp $line;
   my $line_uppercase = uc $line;
   print $out_fh "$line_uppercase\n";
}

close($in_fh);
close($out_fh);

#!/usr/bin/perl
# Q5: compare two strings print out in alphabetic order
use strict;
use warnings;

my ($string1, $string2) = @ARGV;
die ("please provide two strings: perl reorder.pl <string1> <string2>\n") if (@ARGV != 2);

if ($string1 le $string2) {

   print "$string1 $string2\n";

} else {

   print "$string2 $string1\n";

}

exit;

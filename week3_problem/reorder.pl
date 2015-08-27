#!/usr/bin/perl
# Q5: compare two strings print out in alphabetic order
use strict;
use warnings;

my ($string1, $string2) = @ARGV;
if ($string1 le $string2) {

   print "$string1 $string2\n";

} else {

   print "$string2 $string1\n";

}

exit;

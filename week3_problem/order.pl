#!/usr/bin/perl
# Q4: two strings right order if in alphabetic order and wrong order if not
use strict;
use warnings;

my ($string1, $string2) = @ARGV;
die ("please provide two strings: perl order.pl <string1> <string2>\n") if (@ARGV <2);

if ($string1 le $string2) {

   print "right order\n";

} else {
 
   print "wrong order\n";

}

exit;

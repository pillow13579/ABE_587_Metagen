#!/usr/bin/perl
# Q4: two strings right order if in alphabetic order and wrong order if not
use strict;
use warnings;

my ($string1, $string2) = @ARGV;
if ($string1 le $string2) {

   print "right order\n";

} else {
 
   print "wrong order\n";

}

exit;

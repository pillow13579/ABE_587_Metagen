#!/usr/bin/perl
# Q3:check both arguments are positive numbers
use strict;
use warnings;

my ($number1, $number2) = @ARGV;
if ($number1 >= 0 && $number2 >= 0) {
  
    print $number1 + $number2, "\n";

} else {

    print "please provide two positive numbers.\n";

}
exit;

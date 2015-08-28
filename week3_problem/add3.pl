#!/usr/bin/perl
# Q3:check both arguments are positive numbers
use strict;
use warnings;

my ($number1, $number2) = @ARGV;
die ("please provide two numbers: perl add3.pl <number1> <number2>\n") if (@ARGV <2);

if ($number1 >= 0 && $number2 >= 0) {
  
    print $number1 + $number2, "\n";

} else {

    print "please provide two positive numbers.\n";

}
exit;

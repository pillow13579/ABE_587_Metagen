#!/usr/bin/perl
# Q8: calculate percentages. does not crash when given two add to zero
use strict;
use warnings;

my ($number1, $number2) = @ARGV;
die ("please provide two numbers: perl percent.pl <number1> <number2>\n") if (@ARGV != 2);

if (($number1+$number2) == 0 ) {

     print "You are trying to trick me!\n";

} else {

     print $number1/($number1+$number2)*100,"%\n";

}

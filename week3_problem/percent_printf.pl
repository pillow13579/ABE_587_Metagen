#!/usr/bin/perl
# Q9: use printf function
use strict;
use warnings;

my ($number1, $number2) = @ARGV;
if (($number1+$number2) == 0 ) {

     print "You are trying to trick me!\n";

} else {

     printf("%.2f %% \n", $number1/($number1+$number2)*100);

}

exit;

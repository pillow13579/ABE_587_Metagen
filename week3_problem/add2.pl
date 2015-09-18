#!/usr/bin/perl
# Q2:check both arguments are defined
use strict;
use warnings;

my ($number1, $number2) = @ARGV;

if (defined $number1 && defined $number2)) {
  
    print $number1 + $number2, "\n";

} else {

    print "please provide two numbers.\n";

}

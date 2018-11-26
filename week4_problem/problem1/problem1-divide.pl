#!/usr/bin/env perl
# Q1: script divides two numbers provided on the command line
use strict;
use warnings;

# redirect STDOUT and STDERR to file
#open (STDOUT, '>', 'out.txt') or die ("$!\n");
#open (STDERR, '>', 'err.txt') or die ("$!\n");

# get two positive numbers from command line, write them to STDOUT and STDERR
my ($number1, $number2) = @ARGV;
die ("usage: perl problem1-divide.pl <number1> <number2>\n") if (@ARGV != 2);

if ($number1 >= 0 && $number2 >0 ) {

     print $number1/$number2, "\n";

} else {

     print STDERR "please provide two positive numbers, and the divisor cannot be zero. \n";
}

#close STDOUT;
#close STDERR;

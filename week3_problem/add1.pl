#!/usr/bin/perl
# Q1:takes two numbers from the command line and adds them.
use strict;
use warnings;

my ($number1, $number2) = @ARGV;
die ("please provide two numbers: perl add1.pl <number1> <number2>\n") if (@ARGV != 2);
print $number1 + $number2, "\n";

#!/usr/bin/perl
# Q6: compare the strings in a case-sensitive manner
use strict;
use warnings;

print "Enter string 1: ";
my $string1 = <STDIN>;
print "Enter string 2: ";
my $string2 = <STDIN>;

if ($string1 =~ /$string2/) {

   print "same\n";

} else {
 
   print "different\n";

}

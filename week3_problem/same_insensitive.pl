#!/usr/bin/perl
# Q7: compare the strings in a case-INsensitive manner
use strict;
use warnings;

print "Enter string 1: ";
my $string1 = <STDIN>;
print "Enter string 2: ";
my $string2 = <STDIN>;

if ($string1 =~ /$string2/i) {

   print "same\n";

} else {
 
   print "different\n";

}

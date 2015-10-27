#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;
use Data::Dumper;

my ($file1, $file2, $file3, $file4) = @ARGV;
die "Please provide four files.\n" if (@ARGV != 4);

# write to out file
open my $out_fh1, ">", "core_keggid";
open my $out_fh2, ">", "variable_keggid";

# get keggid which has at least 50 reads for each file
my @array1 = get_keggid($file1);
my @array2 = get_keggid($file2);
my @array3 = get_keggid($file3);
my @array4 = get_keggid($file4);

my @total;
my %all_keggs;
my @core;
my @variable;

# get all kegg ids of four files
push (@total, @array1,@array2,@array3,@array4);

# change array to hash 
for my $id (@total) {
        $all_keggs{$id}++;
}

# get core and variable
for my $key (keys %all_keggs) {
    if ($all_keggs{$key} == 4) {
        push (@core, $key); 
    } else {
        push (@variable, $key);
    }
}
say $out_fh1 "The total number of keggID with at least 50 reads are: ", scalar keys %all_keggs;
say $out_fh2 "The total number of keggID with at least 50 reads are: ", scalar keys %all_keggs;
say $out_fh1 "The number of core keggID are: ", scalar @core, " Percentage: ", scalar @core/scalar keys %all_keggs;
say $out_fh2 "The number of variable keggID are: ", scalar @variable, " Percentage: ", scalar @variable/scalar keys %all_keggs;
say $out_fh1 Dumper(\@core);
say $out_fh2 Dumper(\@variable);
 
#-----------------------------------------------------

# get the keggid have at least 50 reads
sub get_keggid {

    my $file = shift @_;
    my @array;
    open my $in_fh, "<", $file;
    while (my $line = <$in_fh>) {
           chomp $line;
           my ($id, $read) = split(",", $line);
           if ($read >= 50) {
               push @array, $id;
           } else {next;} 
    }
    return @array;   
    close($in_fh);
}
#-----------------------------------------------------

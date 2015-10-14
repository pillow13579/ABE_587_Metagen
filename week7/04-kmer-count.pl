#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use autodie;

#-------------------------------------------------------------
# get value from commond line
my $sequence  = shift; 
my $kmer_size = shift || 3;
if (!defined$sequence) {
   die "Please provide a sequence.\n";
}

# check if arg is file
if (-f $sequence) {
     if (-z $sequence) {
          say "Zero-length sequence.";
          exit;
     } else {
          open my $in_fh, "<", $sequence;        
          while (my $line = <$in_fh>) {
                 #chomp $line;
                 kmer_info($line, $kmer_size);
          } 
          close($in_fh);
     }
} else {
   kmer_info($sequence, $kmer_size);
}

#--------------------------------------------------------------
sub kmer_info {
    my ($seq, $k) = @_;
    if (length($seq) < 3) {
        die "Cannot get any 3 mers from a sequence of length ", length($seq), "\n";
    }

    my $length = length$seq;
    my $kmer_number = $length-$k+1;
    my $singleton = 0;
    my %seqhash;

    for (my $i = 0; $i < $kmer_number; $i++) {
         my $kmer = substr $seq, $i, $k;
         $seqhash{$kmer}++;
    }

    for my $key (keys %seqhash) {
        if ($seqhash{$key} == 1) {
            $singleton++;  
        }
    }
    
    printf("%-15s %10s\n", "Sequence length", $length);
    printf("%-15s %10s\n", "Mer size", $k);
    printf("%-15s %10s\n", "Number of kmers", $kmer_number);
    printf("%-15s %10s\n", "Unique kmers", scalar keys %seqhash);
    printf("%-15s %10s\n", "Num. singletons", "$singleton");
    
    my @kmers = sort keys %seqhash;
    my @sorted = sort {$seqhash{$b} <=> $seqhash{$a}} @kmers;
    if (scalar keys %seqhash != 1) {
        say "Most abundant";
        for (my $i=0; $i<11; $i++) {       
             if ($seqhash{$sorted[$i]} != 1) {
                 say "$sorted[$i]: $seqhash{$sorted[$i]}";
             }
        } 
    }   
}
#--------------------------------------------------------------

#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::Perl;
use Bio::SeqIO;
use File::Basename;
use Cwd;
use File::Path qw(make_path);

main();

# --------------------------------------------------
sub main {
    my %args = get_args();

    if ($args{'help'} || $args{'man'}) {
        pod2usage({
            -exitval => 0,
            -verbose => $args{'man'} ? 2 : 1
        });
    } 
    my $number  = $args{'number'} || 500 or pod2usage;
    my $out_dir = $args{'out_dir'} or pod2usage; 
    make_path("$out_dir");
 
    my @input = @ARGV;
 
    for my $file (@input) {
        my $filename = basename($file);

        my $in   = Bio::SeqIO->new(
           -file    => $file,
           -format  => "fasta"
        );
    
        my $count = 0;
        my $fcount = 1;
        my $out = Bio::SeqIO->new(
           -file => ">$out_dir/$filename.$fcount",
           -format=> "fasta"
        );

        while (my $seq = $in->next_seq()) {
              $count++;
              if ($count == $number+1) {
                  $fcount++;
                  $out = Bio::SeqIO->new(
                     -file => ">$out_dir/$filename.$fcount",
                     -format=> "fasta"
                  );
                  $count = 1;
              }
              $out->write_seq($seq);
         }
     }
}

# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'number=s',
        'out_dir=s',
        'help',
        'man',
    ) or pod2usage(2);

    return %args;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

01-fasta-splitter.pl - a script

=head1 SYNOPSIS

  01-fasta-splitter.pl -n 20 -o ~/split file1.fa [file2.fa ...] 

Options (defults in parentheses):
  
  --number  The maxmimum number of sequences per file (500)
  --out_dir Output directory (cwd)
  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Describe what the script does, what input it expects, what output it
creates, etc.

=head1 SEE ALSO

perl.

=head1 AUTHOR

xiangl1 E<lt>xiangl1@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 xiangl1

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut

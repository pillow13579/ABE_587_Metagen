#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::Perl;
use Bio::SeqIO;

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

    my @input = @ARGV or pod2usage;
    for my $inputfile (@input) {
        
        my $seqio = Bio::SeqIO->new (
           -file => $inputfile,
           -format =>'genbank'
        ); 

        while (my $seq = $seqio-> next_seq) {
           my $name = $seq->accession_number;
           my @values;
           for my $feature ($seq->get_SeqFeatures){
               if ($feature->primary_tag eq 'CDS'){
                   push  @values, $feature->get_tag_values('translation');
               }
           }

           my $count = 1;
           say "$name has ", scalar(@values), " CDS\n",
                join "\n", map {$count++ . ": " . $_} @values;
        }
    }
    
}


# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'help',
        'man',
    ) or pod2usage(2);

    return %args;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

03-find-cds.pl - a script

=head1 SYNOPSIS

  03-find-cds.pl rec.gb [rec2.gb ...] 

Options:

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

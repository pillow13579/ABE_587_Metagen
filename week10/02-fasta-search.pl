#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Bio::DB::Fasta;
use File::Basename;

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
    
    my ($file, $pattern) = @ARGV or pod2usage;
    my $db  = Bio::SeqIO->new(-file=>$file, -format=>'fasta');
    my $out = Bio::SeqIO->new(-file=>">$pattern.fa", -format=>'fasta');
    my $filename = basename($file);
    my $count = 0;

    while (my $seq = $db->next_seq) {
        my $id = $seq->id;
        if ($id =~ /$pattern/) {
           $count++;
           $out->write_seq($seq);
        }
    }
    say "Searching \' basename($file)\' for \'HDAC\'";
    say "Found $count ids"; 
    if ($count != 0) {
    say "See results in \'HDAC.fa\'";
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

02-fasta-search.pl - a script

=head1 SYNOPSIS

  02-fasta-search.pl file.fa pattern 

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

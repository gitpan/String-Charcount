# $Id: Charcount.pm,v 0.04 2004/01/15 21:55:37 sts Exp $

package String::Charcount;

use 5.006;
use base qw(Exporter);
use strict;
use warnings;

our $VERSION = '0.04';

our @EXPORT_OK = qw(count percentage);

sub croak {
    require Carp;
    &Carp::croak;
}

=head1 NAME

String::Charcount - count the occurence of characters within a string.

=head1 SYNOPSIS

 use String::Charcount qw(count percentage);

 $string = 'The lazy brown fox jumped over the cat sitting on the fence.';

 $count = count(\$string);
 print 'e exists ', $$count{e}, ' times',"\n";

 $percentage = percentage(\$string, $count);
 print 'e percentage - ', $$percentage{e}, '%',"\n";

=head1 DESCRIPTION

C<String::Charcount> counts the occurence of characters within a string and
calculates percentage of occurence.

=head1 FUNCTIONS

=head2 count

Counts the occurence of all characters within a string.

 $count = count(\$string);
 print 'e exists ', $$count{e}, ' times',"\n";

Returns an hashref with characters as keys and 
occurences as values.

=cut

sub count {
    my $string = $_[0];
    croak q~usage: count (\$string)~
      unless $$string && ref $string eq 'SCALAR';

    my %count;
    foreach (split //, $$string) {
        $count{$_}++;
    }
    
    return \%count;
}

=head2 percentage

Calculates percentage of occurence of 
all characters within a string.

 $percentage = percentage(\$string, $count);
 print 'e percentage - ', $$percentage{e}, '%',"\n";

Returns an hashref with characters as keys and 
percentages of occurence as values.

=cut

sub percentage {
    my ($string, $count) = @_;
    croak q~usage: percentage (\$string, $count_ref)~
      unless $$string && %$count 
      && ref $string eq 'SCALAR' && ref $count eq 'HASH';
       
    my $perc_single = 100 / length $$string;
    
    my %percentage;
    foreach (keys %$count) {
	$percentage{$_} = sprintf "%2.2f", $$count{$_} * $perc_single;
    }
    
    return \%percentage;
}

1;
__END__

=head1 EXPORT

C<count(), percentage()> are exportable.

=cut

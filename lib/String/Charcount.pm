# $Id: Charcount.pm,v 0.07 2004/01/21 17:34:49 sts Exp $

package String::Charcount;

use 5.006;
use base qw(Exporter);
use strict 'vars';
use warnings;

our $VERSION = '0.07';

our (@EXPORT_OK, %EXPORT_TAGS, @subs);

@subs = qw(count count_unique percentage);

@EXPORT_OK = @subs;
%EXPORT_TAGS = (  all =>    [ @subs ],
);

sub croak {
    require Carp;
    &Carp::croak;
}

=head1 NAME

String::Charcount - count the occurence of characters within a string.

=head1 SYNOPSIS

 use String::Charcount qw(count percentage);

 $string = 'The lazy brown fox jumped over the cat sitting on the fence.';

 $count = count($string);
 print 'e exists ', $$count{e}, ' times',"\n";

 $percentage = percentage($string, $count);
 print 'e percentage - ', $$percentage{e}, '%',"\n";

=head1 DESCRIPTION

C<String::Charcount> counts the occurence of characters within a string and
calculates percentage of occurence.

=head1 FUNCTIONS

=head2 count

Counts the occurence of all characters within a string.

 $count = count($string);
 print 'e exists ', $$count{e}, ' times',"\n";

Returns an hashref with characters as keys and 
occurences as values.

=cut

sub count {
    my $string = shift;
    croak q~Usage: count($string)~ unless $string;
      
    my %count;
    for (split '', $string) { $count{$_}++ }
    
    return \%count;
}

=head2 count_unique

Counts unique characters (case-sensitive) within a string.

 $unique = count_unique($string);
 
Returns a string.

=cut

sub count_unique {
    my $string = shift;
    croak q~Usage: count_unique($string)~ unless $string; 
    
    my %count;
    for (0..(length($string) - 1)) {
        $count{substr $string, $_, 1}++;
    }
    
    return scalar keys %count;
}

=head2 percentage

Calculates percentage of occurence of 
all characters within a string.

 $percentage = percentage($string, [$count]);
 print 'e percentage - ', $$percentage{e}, '%',"\n";

Returns an hashref with characters as keys and 
percentages of occurence as values.

=cut

sub percentage {
    my $string = shift;
    my %count  = %{'shift'} || %{count($string)}; 
    croak q~Usage: percentage($string, [$countref])~
      unless $string;
       
    my $perc_single = 100 / length $string;
    
    my %percentage;
    for (keys %count) {
        $percentage{$_} = sprintf "%2.2f", $count{$_} * $perc_single;
    }
          
    return \%percentage;
}

1;
__END__

=head1 EXPORT

C<count(), count_unique(), percentage()> are exportable.

=cut

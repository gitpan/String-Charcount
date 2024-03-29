package String::Charcount;

$VERSION = '0.11';
@subs = qw(count count_unique percentage);
@EXPORT_OK = @subs;
%EXPORT_TAGS = (all => [ @subs ]);

use strict 'vars';
use base qw(Exporter);
use Carp 'croak';

=head1 NAME

String::Charcount - Count the occurence of characters within a string

=head1 SYNOPSIS

 use String::Charcount qw(count percentage);

 $string = 'The lazy brown fox jumped over the cat sitting on the fence.';

 $count = count( $string );
 print 'e exists ', $count->{e}, ' times',"\n";

 $percentage = percentage( $string, $count );
 print 'e percentage - ', $percentage->{e}, '%',"\n";

=head1 DESCRIPTION

String::Charcount counts the occurence of characters within a string and
calculates percentage of occurence.

=head1 FUNCTIONS

=head2 count

Counts the occurence of all characters within a string.

 $count = count( $string );
 print 'e exists ', $count->{e}, ' times',"\n";

Returns an hashref with characters as keys and 
occurences as values.

=cut

sub count {
    my ($string) = @_;
    croak 'usage: count( $string )' unless $string;      
         
    my %count; 
    for my $char (split '', $string) { 
        $count{$char}++; 
    }
    
    return \%count;
}

=head2 count_unique

Counts unique characters (case-sensitive) within a string.

 $unique = count_unique( $string );
 
Returns a string.

=cut

sub count_unique {
    my ($string) = @_;
    croak 'usage: count_unique( $string )' unless $string;       
      
    my %count;
    for my $i (0 .. (length( $string ) - 1)) {
        $count{substr( $string, $i, 1 )}++;
    } 
    
    return scalar keys %count;
}

=head2 percentage

Calculates percentage of occurence of 
all characters within a string.

 $percentage = percentage( $string, [$count] );
 print 'e percentage - ', $percentage->{e}, '%',"\n";

Returns an hashref with characters as keys and 
percentages of occurence as values.

=cut

sub percentage {
    my $string = shift;
    my %count  = %{'shift'} || %{count( $string )}; 
    croak 'usage: percentage( $string, [$countref] )' unless $string;          
      
    my $perc_single = 100 / length $string;
         
    my %percentage;
    
    for my $char (keys %count) {
        $percentage{$char} = sprintf "%2.2f", $count{$char} * $perc_single;
    }
             
    return \%percentage;
}

1;
__END__

=head1 EXPORT

C<count(), count_unique(), percentage()> are exportable.

=cut

#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 5;

use String::Charcount ':all';

BEGIN {
    my $PACKAGE = 'String::Charcount';
    use_ok($PACKAGE);
    require_ok($PACKAGE);
}

my ($string, $count);

$string = 'abcdefghijklmn';
$count = count($string);

is($$count{e}, 1, 'count($string);');
is(count_unique($string), 14, 'count_unique($string);');
is(${percentage($string, $count)}{e}, 7.14, 'percentage($string, [$count]);');

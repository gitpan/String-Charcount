#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 4;

use String::Charcount q/:all/;

my ($string, $count, $percentage);

BEGIN {
    my $PACKAGE = 'String::Charcount';
    use_ok($PACKAGE);
    require_ok($PACKAGE);
}

$string = 'abcdefghijklmn';

$count = count(\$string);
is($$count{e}, 1, 'count (\$string);');
 
$percentage = percentage(\$string, $count);
is($$percentage{e}, 7.14, 'percentage (\$string, $count);');

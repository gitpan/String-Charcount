#!/usr/bin/perl

use strict;
use warnings;

use String::Charcount qw(count percentage);

my ($string, $count, $percentage);
 
$string = 'The lazy brown fox jumped over the cat sitting on the fence.';
print $string,"\n";

$count = count(\$string);
print 'e exists ', $$count{e}, ' times',"\n";
 
$percentage = percentage(\$string, $count);
print 'e percentage - ', $$percentage{e}, '%',"\n";

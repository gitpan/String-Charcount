#!/usr/local/bin/perl

use strict;
use warnings;
use String::Charcount ':all';

my($string, $count, $percentage);
 
$string = 'The lazy brown fox jumped over the cat sitting on the fence.';
print $string,"\n";

$count = count($string);
print 'e occurence: ', $count->{e},"\n";
 
$percentage = percentage($string);
print 'e percentage: ', $percentage->{e}, '%',"\n";

print 'unique characters: ', count_unique($string),"\n";

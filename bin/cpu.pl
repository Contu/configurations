#!/usr/bin/perl

use strict;
use warnings;

my $cpu0 = qx/mpstat -P 0 | tail -1/;
$cpu0 =~ s/\s+/_/g;

my @values = split /_/, $cpu0;

my $result = $values[3]+$values[4]+$values[5]+$values[7]+$values[8]+$values[9]+$values[10]+$values[11];

print $result;

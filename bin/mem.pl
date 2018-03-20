#!/usr/bin/perl

use strict;
use warnings;

my $mem = qx/free -h|grep Mem/;
$mem =~ s/\s+/_/g;
my @memValues = split /_/, $mem;
print $memValues[3]; 

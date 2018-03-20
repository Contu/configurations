#!/usr/bin/perl

use strict;
use warnings;

my $com = `amixer -D pulse get Capture`;

print $com =~ /\[([0-9]+%)\]/;




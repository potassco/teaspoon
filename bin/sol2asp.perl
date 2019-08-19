#! /usr/bin/perl
##
## Converts solution of competition format into ASP facts
##
use Getopt::Std;
use strict;
$| = 1;

use vars qw($opt_h);

&getopts("h:");

if ($opt_h) {
    print "Usage: $0 file.col >file.lp\n";
    exit(1);
}

while (<>) {
    tr/\r\n//d;
    next if /^\s*$/;
    my @v = split;
    next if (@v != 4);
    foreach my $a (@v) {
	if ($a =~ /^[A-Z]/) {
	    $a = "\"$a\"";
	}
    }    
    print "legacy(assigned(", join(",", @v), ")).\n";
}

exit(0);


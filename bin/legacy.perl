#! /usr/bin/perl
use strict;
use Getopt::Long;
$| = 1;

my ($opt_h);
my ($opt_v);
&GetOptions('h|help' => \$opt_h, 'v|verbose' => \$opt_v);

&usage() if (@ARGV != 1 || $opt_h);
my $out = $ARGV[0];
if (! -e $out) {
    print "ERROR: $out does not exist.\n";
    exit(1);
}
&show($out);
exit(0);

#############################################################################
sub show {
    my ($in) = @_;
    my @best = ();
    open(IN, "<$in") || die;
    while (<IN>) {
	chomp;
	&write_comment($_);
	if (/^Answer: (\d+)/) {
	    my $num_of_answer = $1;
	    chomp($_ = <IN>);
	    &write_comment($_);
	    &write_comment("Solution: $num_of_answer");
	    @_ = split(/\s+/);
	    my @sol = ();
	    foreach (@_) {
		s/^\s+//;
		s/\s+$//;
		next if (! /^assigned/ && ! /^penalty/ && ! /^working_day/);
		push(@sol, $_);
	    }
	    &write_solution(\@sol) if ($opt_v);
	    @best = @sol;
	}
    }
    close(IN);
    &write_solution(\@best) if (! $opt_v);
}

sub usage {
    print "\nUsage: $0 file.out\n";
    exit(1);
}

sub write_solution {
    my ($x) = @_;
    my @sol = @{$x};
    foreach my $a (@sol) {
	print "legacy($a).\n";
    }
}

sub write_comment {
    return if (! $opt_v);
    &write_message("%", @_);
}

sub write_message {
    print join(" ", @_), "\n";
}

# END

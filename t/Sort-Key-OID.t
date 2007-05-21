# -*- Mode: Perl -*-

use Test::More tests => 1;

use Sort::Key::OID qw(oidsort);
use Sort::Key::Natural qw(natsort);

my $n = 100000;

my @data;

for (0..$n) {
    my $l = rand;
    my $len = int(12 * $l * $l * $l * $l);
    push @data,
        join('.',
             map {
                 my $r = rand;
                 int(0xffffffff * $r * $r * $r * $r * $r * $r)
             } 0..$len);
}

my @sorted = oidsort @data;
my @good = natsort @data;

is ("@sorted", "@good");


__END__

my $last;
for (@sorted) {
    print "$_\n" 
        unless $_ eq $last;
    $last = $_;
}






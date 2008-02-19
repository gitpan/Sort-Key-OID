# -*- Mode: Perl -*-

use strict;
use warnings;

use Test::More tests => 3;

use Sort::Key::OID qw(oidsort);
use Sort::Key::Natural qw(natsort);

my $n = 10000;

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
is_deeply (\@sorted, \@good);

use Sort::Key::Maker my_oidsort => sub { $_ }, qw(oid);

my @d1 = @data;
@sorted = my_oidsort @data;
is_deeply (\@sorted, \@good);

my_oidsort_inplace @d1;
is_deeply(\@d1, \@good);

__END__







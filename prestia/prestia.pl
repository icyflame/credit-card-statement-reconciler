use strict;
use warnings;

# use encoding 'euc-jp';

sub get_statement {
    my $line = shift;
    my @components = split ",", $line;
    my @transaction;
    push @transaction, $components[0], $components[5], $components[1];
    @transaction;
}

my $statement_file = $ARGV[0];

open(my $statement_fh, '< :encoding(euc-jp)', $statement_file) 
    or die "Could not open the statement file: $!";

my @statement_buf;
while (<$statement_fh>) {
    my $line = chomp $_;
    push @statement_buf, get_statement($line)
}

print @statement_buf;

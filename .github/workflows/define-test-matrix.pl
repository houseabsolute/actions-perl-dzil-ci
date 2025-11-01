use strict;
use warnings;
use autodie;

use JSON::PP qw( encode_json );

my $min_perl     = shift;
my $with_threads = shift;

my @jobs = (

    # {
    #     name           => 'Linux',
    #     'runs-on'      => 'ubuntu-latest',
    #     'perl-version' => $min_perl,
    # },
    # {
    #     name           => 'macOS',
    #     'runs-on'      => 'macos-latest',
    #     'perl-version' => 'latest',
    # },
    {
        name           => 'Windows',
        'runs-on'      => 'windows-latest',
        'perl-version' => 'latest',
    }
);

if ( $with_threads eq 'true' ) {
    push @jobs, {
        name           => 'Linux (threaded Perl)',
        'runs-on'      => 'ubuntu-latest',
        'perl-version' => 'latest',
        'multi-thread' => $JSON::PP::true,
    };
}

my %matrix = (
    'os-and-perl' => \@jobs,
);

open my $fh, '>>', $ENV{GITHUB_OUTPUT};
print {$fh} "matrix=" . encode_json( \%matrix ) . "\n"
    or die "Cannot write to $ENV{GITHUB_OUTPUT}: $!";
close $fh;

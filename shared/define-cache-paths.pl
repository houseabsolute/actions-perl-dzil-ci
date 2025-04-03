use strict;
use warnings;
use autodie;

my $perl_version = shift @ARGV;
my $cache_extra = shift @ARGV;

my @cache = @INC;
if ($cache_extra) {
    push @cache, "/opt/hostedtoolcache/perl/$perl_version }}/x64/$cache_extra";
}

my $cache = join q{}, map { "$_\n" } @cache;

open my $fh, '>>', $ENV{GITHUB_OUTPUT};
print {$fh} "cache-paths<<EOF-1\n$cache\nEOF-1\n"
    or die "Failed to write to $ENV{GITHUB_OUTPUT}: $!";
close $fh;


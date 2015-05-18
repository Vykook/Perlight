package Perlight;

use strict;
use warnings;

use Data::Dumper;

my $Debug = 1;

sub check { #TODO
    my ($q) = @_;

    die('unimplemented');
}

sub live { #TODO
    my ($q) = @_;

    die('unimplemented');
}

sub search {
    my ($q) = @_;

    my @response = undef;
    my $command = 'mdfind';

    die("Can't use smart folder search and filename search in one query") if defined $q->{smart} and defined $q->{name};
    $command.= ' -count' if defined $q->{count};
    $command.= " -onlyin $q->{dir}" if defined $q->{dir};
    $command.= ' -s' if defined $q->{smart};
    $command.= ' -name' if defined $q->{name};
    $command.= " $q->{query}";
    warn('Debug $command:'. $command) if $Debug;
    @response = `$command`;
    warn('Debug @response:'. Dumper(@response)) if $Debug;
    return @response;
}

1;

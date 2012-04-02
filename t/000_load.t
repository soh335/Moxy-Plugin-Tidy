#!perl -w
use strict;
use Test::More tests => 1;

BEGIN {
    use_ok 'Moxy::Plugin::Tidy';
}

diag "Testing Moxy::Plugin::Tidy/$Moxy::Plugin::Tidy::VERSION";

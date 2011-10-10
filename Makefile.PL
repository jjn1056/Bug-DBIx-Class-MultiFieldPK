#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';
use inc::Module::Install;

sub dbic_optional {
  require DBIx::Class::Optional::Dependencies;
  map { %{DBIx::Class::Optional::Dependencies->req_list_for($_)} }
    qw(admin deploy);
}

configure_requires 'DBIx::Class';
my %deploy_deps = &dbic_optional;

requires 'parent'
requires 'DBIx::Class';
requires $_ => $deploy_deps{$_} for (keys %deploy_deps);

test_requires 'Test::Most';
test_requires 'File::Spec';

tests_recursive;



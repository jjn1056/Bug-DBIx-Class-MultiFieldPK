#!/usr/bin/env perl

use File::Spec;
use Bug::DBIx::Class::MultiFieldPK::Schema;

Bug::DBIx::Class::MultiFieldPK::Schema
  ->connect("DBI:SQLite:testdb.db", '', '')
  ->create_ddl_dir(['MySQL', 'SQLite', 'PostgreSQL'], undef, File::Spec->catdir(@ARGV));

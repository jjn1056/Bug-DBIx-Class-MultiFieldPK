#!/usr/bin/env perl

use File::Spec;
use Bug::DBIx::Class::MultiFieldPK::Schema;

Bug::DBIx::Class::MultiFieldPK::Schema
  ->connect("DBI:SQLite:testdb.db", '', '')
  ->create_ddl_dir(['SQLite'], undef, File::Spec->catdir(@ARGV));

package Bug::DBIx::Class::MultiFieldPK::Schema::ResultSet;
use parent 'DBIx::Class::ResultSet';

sub to_hri {
  shift->search(
    {},
    {result_class => 'DBIx::Class::ResultClass::HashRefInflator'},
  );
}

sub as_arrayref { +[shift->to_hri->all] }

1;


package Bug::DBIx::Class::MultiFieldPK::Schema::Result::UserImageDownload;
use parent 'Bug::DBIx::Class::MultiFieldPK::Schema::Result';

__PACKAGE__->table('user_image_downloaded');

__PACKAGE__->add_columns(
  downloaded_id => {
	data_type => 'int',
    is_auto_increment => 1,
  },
  fk_user_id => { data_type => 'int' },
  fk_image_id => { data_type => 'int' },
);

if($ENV{MULTIKEY}) {
  __PACKAGE__->set_primary_key(qw/downloaded_id fk_user_id fk_image_id /);
} else {
  __PACKAGE__->set_primary_key(qw/downloaded_id/);
}

__PACKAGE__->add_unique_constraint(['downloaded_id']);

__PACKAGE__->belongs_to(
  user => 'Bug::DBIx::Class::MultiFieldPK::Schema::Result::User',
  {'foreign.user_id', => 'self.fk_user_id'},
);
 __PACKAGE__->belongs_to(
  image => 'Bug::DBIx::Class::MultiFieldPK::Schema::Result::Image',
  {'foreign.image_id', => 'self.fk_image_id'},
);

1;

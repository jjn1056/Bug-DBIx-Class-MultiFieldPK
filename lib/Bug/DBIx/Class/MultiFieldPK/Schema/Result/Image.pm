package Bug::DBIx::Class::MultiFieldPK::Schema::Result::Image;
use parent 'Bug::DBIx::Class::MultiFieldPK::Schema::Result';

__PACKAGE__->table('image');

__PACKAGE__->add_columns(
  image_id => {
    data_type => 'int', 
    is_auto_increment => 1,
  },
  title => {
    data_type => 'varchar',
    size => '255',
  },
);

__PACKAGE__->set_primary_key('image_id');

__PACKAGE__->has_many(
  users_image_downloads_rs => 'Bug::DBIx::Class::MultiFieldPK::Schema::Result::UserImageDownload',
  { 'foreign.fk_image_id' => 'self.image_id' },
);

__PACKAGE__->many_to_many(downloaders => 'users_image_downloads_rs', 'user');

1;



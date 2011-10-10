package Bug::DBIx::Class::MultiFieldPK::Schema::Result::User;
use parent 'Bug::DBIx::Class::MultiFieldPK::Schema::Result';

__PACKAGE__->table('user');
__PACKAGE__->add_columns(
  user_id => {
    data_type => 'int', 
    is_auto_increment => 1,
  },
  name => { data_type => 'varchar' },
);

__PACKAGE__->set_primary_key('user_id');

__PACKAGE__->has_many(
        user_images_downloads_rs => 'Bug::DBIx::Class::MultiFieldPK::Schema::Result::UserImageDownload',
        { 'foreign.fk_user_id' => 'self.user_id' },
);
__PACKAGE__->many_to_many(downloaded_images => 'user_images_downloads_rs', 'image');


1;



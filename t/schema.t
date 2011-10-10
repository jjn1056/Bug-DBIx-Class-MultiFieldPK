use Test::Most;
use File::Spec;
use Bug::DBIx::Class::MultiFieldPK::Schema;

my ($dns, $user, $pass) = ($ENV{TEST_DNS}||"DBI:SQLite::memory:", $ENV{TEST_USER}||'', $ENV{TEST_PASSWORD}||'');

(my $schema = Bug::DBIx::Class::MultiFieldPK::Schema
  ->connect($dns, $user, $pass))
  ->deploy({}, File::Spec->catdir(qw/. share/));

my $vanessa_pk = 2;
my @users = (
  [ qw/user_id name/ ],
  [ 1, 'john' ],
  [ $vanessa_pk, 'vanessa' ],
  [ 3, 'vincent' ],
);

my ($john, $vanessa, $vincent) = $schema->populate(User => \@users);

my $dogs_pk = 13;
my @images =  (
  [ qw/image_id title/ ],
  [ 11, 'empire state building' ],
  [ 12, 'my car' ],
  [ $dogs_pk, 'our dogs' ],
);

my ($empire, $car, $dogs) = $schema->populate(Image => \@images);
my $user_image_download_rs = $schema->resultset('UserImageDownload');

ok $user_image_download_rs->create({fk_user_id=>$vanessa_pk, fk_image_id=>$dogs_pk}),
  'vanessa has a dog picture';

ok $user_image_download_rs->create({user=>$vincent, image=>$dogs}),
  'vincent has a dog picture';

ok $john->add_to_user_images_downloads_rs({image=>$empire}),
  'has empire';

ok $john->add_to_downloaded_images($dogs),
  'added dogs';

ok $john->add_to_downloaded_images($car),
  'added car';

is $user_image_download_rs->count, 5,
  'correct downloads count';

done_testing;

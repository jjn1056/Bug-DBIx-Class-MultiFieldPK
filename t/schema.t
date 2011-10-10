use Test::Most;
use File::Spec;
use Bug::DBIx::Class::MultiFieldPK::Schema;

my ($dns, $user, $pass) = ($ENV{TEST_DNS}||"DBI:SQLite::memory:", $ENV{TEST_USER}||'', $ENV{TEST_PASSWORD}||'');

(my $schema = Bug::DBIx::Class::MultiFieldPK::Schema
  ->connect($dns, $user, $pass))
  ->deploy({}, File::Spec->catdir(qw/. share/));

my @users = (
  [ qw/user_id name/ ],
  [ 1, 'john' ],
  [ 2, 'vanessa' ],
  [ 3, 'vincent' ],
);

my ($john, $vanessa, $vincent) = $schema->populate(User => \@users);

my @images =  (
  [ qw/image_id title/ ],
  [ 11, 'empire state building' ],
  [ 12, 'my car' ],
  [ 13, 'our dogs' ],
);

my ($empire, $car, $dogs) = $schema->populate(Image => \@images);

ok $schema->resultset('UserImageDownload')->create({fk_user_id=>2, fk_image_id=>13}),
  'vanessa has a dog picture';

ok $schema->resultset('UserImageDownload')->create({user=>$vincent, image=>$dogs}),
  'vincent has a dog picture';

ok $john->add_to_user_images_downloads_rs({image=>$empire}),
  'has empire';

ok $john->add_to_downloaded_images($dogs),
  'added dogs';

ok $john->add_to_downloaded_images($car),
  'added car';

is $schema->resultset('UserImageDownload')->count, 5,
  'correct downloads count';

done_testing;

use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('adresse');

subtest 'Test static address search page' => sub {
    $t->get_ok('/static')->status_is(200)->content_like(qr/no-js interface/is);
};

subtest 'Test static address search result page' => sub {
    $t->get_ok('/static')->status_is(200)->content_like(qr//is);
};

done_testing();

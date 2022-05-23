use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('adresse');

subtest 'Test correct api version' => sub {
    $t->get_ok('/static')->status_is(200)->content_like(qr/no-js interface/is);
    0;
};

subtest 'Test no result' => sub {
    $t->get_ok('/static')->status_is(200)->content_like(qr/no-js interface/is);
    0;
};

subtest 'Test exact result match' => sub {
    $t->get_ok('/static')->status_is(200)->content_like(qr//is);
    0;
};

subtest 'Test multiple results' => sub {
    $t->get_ok('/static')->status_is(200)->content_like(qr//is);
    0;
};

done_testing();

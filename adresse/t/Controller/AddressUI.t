use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

our $t = Test::Mojo->new('adresse');

subtest 'Test static address search page' => sub {
    $t->get_ok('/static')->status_is(200)->content_like(qr/no-js interface/is);
};

subtest 'Test static address search result page' => sub {
    $t->get_ok('/static')->status_is(200)->content_like(qr/Type to start address search/is);
};

subtest 'Test static address search result page' => sub {
    $t->get_ok('/static')->status_is(200)->content_like(qr/Type to start address search/is);
};

done_testing();

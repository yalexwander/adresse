use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

use lib "./lib";

our $t = Test::Mojo->new('adresse');

subtest 'Test main address search page' => sub {
    $t->get_ok('/')->status_is(200)->content_like(qr/Type to start address search/);
};

subtest 'Test static address search page' => sub {
    $t->get_ok('/static')->status_is(200)->content_like(qr/Enter part of address and hit Enter/);
};

subtest 'Test static address search results page' => sub {
    my $query = "some_nonexistent_address";
    $t->get_ok('/result?search_string=' . $query)->status_is(200)->content_like(qr/Search results for "$query"/);
};

done_testing();

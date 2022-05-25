use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

use lib "./lib";

our $t = Test::Mojo->new('adresse');

our $config = $t->ua->server->app->config;

our $api_prefix = '/api/v' . $config->{'api_version'};

subtest 'Test no results found' => sub {
    $t->get_ok($api_prefix . '/address/complete?query=some_nonexistent_address')
       ->status_is(200)
       ->json_is('/result_count' => '0')
       ->json_is('/status' => 'success');
};

subtest 'Test exact result match' => sub {
    my $url = $api_prefix . '/address/complete?query=' . 'St. Olavs plass 2';
    
    $t->get_ok($url)->status_is(200)
      ->json_is('/result_count' => '1')
      ->json_is('/status' => 'success');
};

subtest 'Test multiple results' => sub {
    my $url = $api_prefix . '/address/complete?query=' . 'St. Olavs';

    $t->get_ok($url)->status_is(200)->json_has('/status' => 'success');

    ok( $t->tx->res->json->{'result_count'} > 1 );
};

done_testing();

use Test::More;
use strict;
use warnings;

use lib 'lib';
use adresse::API::ExternalRestAPI;

subtest 'Test error handling on network API fail' => sub {
    my $api = ExternalRestAPI->new({
        'api_url' => 'some_non_existentd_address'
    });

    my $result = $api->query('Storgata');

    ok($result->{'status'} eq 'error');
};

subtest 'Test some correct API response' => sub {
    my $api = ExternalRestAPI->new({
        'api_url' => 'https://www.husleie.no/api/adresse'
    });

    my $result = $api->query('St. Olavs plass 2');

    ok($result->{'result_count'} == 1);
};


done_testing();

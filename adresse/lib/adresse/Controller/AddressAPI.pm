package adresse::Controller::AddressAPI;
use Mojo::Base 'Mojolicious::Controller', -signatures;

use JSON;

use adresse::API::ExternalRestAPI;

sub complete ($self) {

    my $api = adresse::API::ExternalRestAPI->new($self->app->config);

    my $result = $api->query($self->param('query'));

    $self->render("json" => $result)
}

1;

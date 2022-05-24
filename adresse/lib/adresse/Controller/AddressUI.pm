package adresse::Controller::AddressUI;
use Mojo::Base 'Mojolicious::Controller', -signatures;

sub index ($self) {
    $self->render('AddressUI/index');
}

sub static_index ($self) {
    $self->render('AddressUI/static_index');
}  

sub static_result ($self) {
    my $api = adresse::API::ExternalRestAPI->new($self->app->config);

    my $result = $api->query($self->param('search_string'));

    $self->render('AddressUI/static_result',
                  'search_string' => $self->param('search_string'),
                  'result'        => $result
    );
}  

1;

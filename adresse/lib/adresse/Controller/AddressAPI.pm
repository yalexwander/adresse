package adresse::Controller::AddressAPI;
use Mojo::Base 'Mojolicious::Controller', -signatures;


sub complete ($self) {
  $self->render('AddressAPI/complete');
}

1;

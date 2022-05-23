package adresse::Controller::AddressUI;
use Mojo::Base 'Mojolicious::Controller', -signatures;

sub index ($self) {
  $self->render('AddressUI/index');
}

sub static_index ($self) {
  $self->render('AddressUI/static_index');
}  

sub static_result ($self) {
  $self->render('AddressUI/static_result');
}  

1;

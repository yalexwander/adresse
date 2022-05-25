package adresse;
use Mojo::Base 'Mojolicious', -signatures;

# This method will run once at server start
sub startup ($self) {

	# Load configuration from config file
	my $config = $self->plugin('NotYAMLConfig');

	# Configure the application
	$self->secrets($config->{secrets});

	# Router
	my $r = $self->routes;

	# UI routes
	$r->get('/')->to('AddressUI#index')->name('ui_index');
	$r->get('/static')->to('AddressUI#static_index')->name('ui_static_index');
	$r->get('/result')->to('AddressUI#static_result')->name('ui_static_result');

	# API routes
	$r->get('/api/v' . $config->{'api_version'} . '/address/complete')->to('AddressAPI#complete')->name('api_complete');
}

1;

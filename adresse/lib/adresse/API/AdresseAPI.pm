package AdresseAPI;
use strict;
use warnings;

use Mojo::UserAgent;
use Try::Tiny;
use JSON;
use Data::Dumper;

sub new {
    my ($class, @args) = @_;
    my $self = bless {}, $class;

    $self->{'config'} = $args[0];

    return $self;
}


sub query {
    my ($self, $query) = @_;

    my $result = {
        "status"       => undef,
        "message"      => undef,
        "result_count" => 0,
        "results"      => []
    };

    my $ua  = Mojo::UserAgent->new;

    try {
        my $res = $ua->get(
            $self->{"config"}->{"api_url"},
            {},
            "form" => {
                "q" => $query
            }
        )->result;

        if ($res->is_success)  {
            # we hardly assume here, what is 100% correct response from API here
            # so anything except few typical patterns is treated as wrong response
            try {
                my $json_decoder = JSON->new->allow_nonref();
                my $api_response = $json_decoder->decode( $res->body );

                $result->{"status"} = "success";
                $result->{"result_count"} = scalar(@{$api_response}) - 1;
                $result->{"results"} = @{$api_response}[ 1 .. $result->{"result_count"} ];
            }
            catch {
                warn "caught error: $_";
                $result->{"status"} = "error";
                $result->{"message"} = "External API wrong response";
            };
        }
        else {
            $result->{"status"} = "error";
            $result->{"message"} = "External API error";
        }
    } catch {
        $result->{"status"} = "error";
        $result->{"message"} = "Network error";
    };

    return $result;
}

1;

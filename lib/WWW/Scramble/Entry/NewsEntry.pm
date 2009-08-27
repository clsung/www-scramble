package WWW::Scramble::Entry::NewsEntry;
use WWW::Scramble::Handler::News;
use Moose;

=head1 NAME

WWW::Scramble::Entry::NewsEntry 

=head1 SYNOPSIS

Quick summary of what the module does.

=cut

extends 'WWW::Scramble::Entry';

has provider => (is => 'rw', isa => 'Str', lazy_build => 1);

has '+_handler' => (default => sub {
    WWW::Scramble::Handler::News->new
});

sub _build_provider {
    my $self = shift;
    $self->provider ($self->_handler->get_provider);
};

no Moose;
__PACKAGE__->meta->make_immutable;
1;

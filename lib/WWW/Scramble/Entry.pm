package WWW::Scramble::Entry;
use URI;
use HTML::TreeBuilder::XPath;
use WWW::Scramble::Handler;
use Carp;
use Moose;

=head1 NAME

WWW::Scramble::Entry 

=head1 SYNOPSIS

Quick summary of what the module does.

=cut

has title => (is => 'rw', isa => 'Str');
has content => (is => 'rw', isa => 'Str');
has rawdata => (is => 'ro', isa => 'Str');
has _handler => (
    is => 'ro', isa => 'WWW::Scramble::Handler', default => sub { WWW::Scramble::Handler->new }
);
has _xpath => (
    is => 'ro', isa => 'HTML::TreeBuilder::XPath'
);
has URI => (
    is => 'rw', isa => 'URI',
    default => sub { URI->new() }
);

=head2 BUILD

=cut 

sub BUILD {
    my $self = shift;
    $self->_xpath->parse_content($self->rawdata) || croak "Parse error";
    $self->title ($self->_xpath->findvalue($self->_handler->xtitle));
    $self->content ($self->_xpath->findvalue($self->_handler->xcontent));
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;

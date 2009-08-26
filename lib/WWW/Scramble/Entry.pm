package WWW::Scramble::Entry;
use URI;
use HTML::TreeBuilder::XPath;
use Moose;

=head1 NAME

WWW::Scramble::Entry 

=head1 SYNOPSIS

Quick summary of what the module does.

=cut

has title => (is => 'rw', isa => 'Str');
has content => (is => 'rw', isa => 'Str');
has rawdata => (is => 'ro', isa => 'Str');
has _xpath => (
    is => 'ro', isa => 'HTML::TreeBuilder::XPath'
);
has URI => (
    is => 'rw', isa => 'URI',
    default => sub { URI->new() }
);

no Moose;
__PACKAGE__->meta->make_immutable;
1;

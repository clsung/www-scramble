package Entry;
use URI;
use Moose;
use Moose::Util::TypeConstraints;

=head1 NAME

WWW::Scramble::Entry 

=head1 SYNOPSIS

Quick summary of what the module does.

=cut

has 'title' => (is => 'rw', isa => 'Str');
has 'content' => (is => 'rw', isa => 'Str');
has 'URI' => (
    is => 'rw', isa => 'URI',
    default => sub { URI->new() }
);

no Moose;
__PACKAGE__->meta->make_immutable;
1;

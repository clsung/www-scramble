package WWW::Scramble::NewsEntry.pm
use Moose;

=head1 NAME

WWW::Scramble::NewsEntry 

=head1 SYNOPSIS

Quick summary of what the module does.

=cut

extends 'Entry';

has 'provider' => (is => 'rw', isa => 'Str');

no Moose;
__PACKAGE__->meta->make_immutable;
1;

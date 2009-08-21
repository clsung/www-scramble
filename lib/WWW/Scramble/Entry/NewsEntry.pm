package NewsEntry.pm

use Moose;
use Moose::Util::TypeConstraints;

=head1 NAME

WWW::Scramble::Entry 

=head1 SYNOPSIS

Quick summary of what the module does.

=cut

extends 'Entry';

has 'provider' => (is => 'rw', isa => 'Str');

no Moose;
__PACKAGE__->meta->make_immutable;
1;

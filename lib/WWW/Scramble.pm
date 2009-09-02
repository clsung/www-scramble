package WWW::Scramble;
use Moose;
use WWW::Scramble::Entry;
use WWW::Scramble::Handler;
use WWW::Scramble::Entry::NewsEntry;
use WWW::Mechanize;

=head1 NAME

WWW::Scramble - The great new WWW::Scramble!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

has mech => ( is => 'ro', isa => 'WWW::Mechanize', default => sub { WWW::Mechanize->new } );
has handler => (
    is => 'rw', isa => 'WWW::Scramble::Handler', default => sub { WWW::Scramble::Handler->new }
);

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use WWW::Scramble;

    my $foo = WWW::Scramble->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=head2 fetch

=cut

sub fetch {
    my ($self, $url) = @_;
    $self->mech->get($url);
    return $self->mech->response->status_line
        unless $self->mech->success;
    return WWW::Scramble::Entry->new ( uri => $self->mech->uri, _rawdata => $self->mech->content, _handler => $self->handler );
}

=head2 fetchfile

=cut

sub fetchfile {
    my ($self, $file, $attr_ref) = @_;
    use Data::Dumper;
    warn Dumper $self->mech->get('file://'.$file);
    return $self->mech->response->status_line
        unless $self->mech->success;
    my %attr;
    %attr = %{$attr_ref} if ref $attr_ref eq 'HASH';
    for my $key (keys %attr) {
        $self->handler->set_asset($key, $attr{$key});
    }
    return WWW::Scramble::Entry->new ( uri => $self->mech->uri, _rawdata => $self->mech->content, _handler => $self->handler );
}

=head2 fetchnews

=cut

sub fetchnews {
    my ($self, $url) = @_;
    $self->mech->get($url);
    return $self->mech->response->status_line
        unless $self->mech->success;
    return WWW::Scramble::Entry::NewsEntry->new ( uri => $self->mech->uri, _rawdata => $self->mech->content, _handler => $self->handler );
}
=head1 AUTHOR

Cheng-Lung Sung, C<< <clsung at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-www-scramble at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Scramble>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::Scramble


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WWW-Scramble>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WWW-Scramble>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WWW-Scramble>

=item * Search CPAN

L<http://search.cpan.org/dist/WWW-Scramble/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Cheng-Lung Sung, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

no Moose;
__PACKAGE__->meta->make_immutable;
1; # End of WWW::Scramble

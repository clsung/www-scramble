package WWW::Scramble::Handler;
use Moose;
use Carp;
use HTML::TreeBuilder::XPath;

=head1 NAME

WWW::Scramble::Handler 

=head1 SYNOPSIS

Quick summary of what the module does.

=cut

has _xpath => (
    is      => 'ro',
    isa     => 'HTML::TreeBuilder::XPath',
    default => sub { HTML::TreeBuilder::XPath->new }
);
has xtitle =>
  ( is => 'rw', isa => 'Str', default => '//div[@id="ynwsart"]/*/h1' );
has xcontent =>
  ( is => 'rw', isa => 'Str', default => '//div[@id="ynwsartcontent"]' );

=head1 FUNCTIONS

=head2 parse

=cut

sub parse {
    my ($self, $raw) = @_;
    croak "Empty Content" unless $raw;
    $self->_xpath->parse_content($raw) || croak "Parse error";
}

=head2 get_title

=cut

sub get_title {
    my ($self) = shift;
    return $self->_xpath->findvalue($self->xtitle);
}

=head2 get_content

=cut

sub get_content {
    my ($self) = shift;
    return $self->_xpath->findvalue($self->xcontent);
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;

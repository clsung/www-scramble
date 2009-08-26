package WWW::Scramble::Handler;
use Moose;

=head1 NAME

WWW::Scramble::Handler 

=head1 SYNOPSIS

Quick summary of what the module does.

=cut

has xtitle => (is => 'rw', isa => 'Str', default => '//div[@id="ynwsart"]/*/h1');
has xcontent => (is => 'rw', isa => 'Str', default => '//div[@id="ynwsartcontent"]');

no Moose;
__PACKAGE__->meta->make_immutable;
1;

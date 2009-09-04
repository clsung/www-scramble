use inc::Module::Install;

name     'WWW-Scramble';
all_from 'lib/WWW/Scramble.pm';
author   'Cheng-Lung Sung <clsung@cpan.org>';
license  'perl';

build_requires 'File::Temp';
build_requires 'HTML::FormatText';
build_requires 'Test::More';
requires       'HTML::Element';
requires       'HTML::TreeBuilder';
requires       'Moose';
requires       'MooseX::AttributeHelpers';
requires       'URI';
requires       'WWW::Mechanize';
requiers       'File::Find::Rule';
requiers       'YAML';

auto_install;

WriteAll;


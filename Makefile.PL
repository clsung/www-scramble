use inc::Module::Install;

name     'WWW-Scramble';
all_from 'lib/WWW/Scramble.pm';
author   'Cheng-Lung Sung <clsung@cpan.org>';
license  'perl';

build_requires 'Test::More';
requires       'HTML::TreeBuilder';

auto_install;

WriteAll;


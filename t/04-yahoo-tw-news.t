#!perl -T
use utf8;
use Test::More tests => 2;
use WWW::Scramble;

BEGIN {
        my $scrab = WWW::Scramble->new();
        my $entry = $scrab->fetch('http://tw.news.yahoo.com/article/url/d/a/090817/4/1p7dx.html');
        isa_ok ( $entry , 'WWW::Scramble::Entry' );
        is ($entry->title, '韓國救難隊 嗅覺如搜救犬般靈敏', 'Check title');
}

diag( "Testing Yahoo!TW News" );

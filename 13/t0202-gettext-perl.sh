# lib-gettext: Found 'is_IS.UTF-8' as a is_IS UTF-8 locale
# run 1: Perl Git::I18N API (/usr/bin/perl /Users/tomc/Projects/git/t/t0202/test.pl)
1..9
ok 1 - Testing Git::I18N version 0.01 with NO Perl gettext library
ok 2 - Git::I18N is located at /Users/tomc/Projects/git/t/../perl/blib/lib/Git/I18N.pm
ok 3 - sanity: Git::I18N defines a $VERSION
ok 4 - sanity: Git::I18N has 1 export(s)
ok 5 - sanity: Git::I18N exports everything by default
ok 6 - sanity: __ has a $ prototype
ok 7 - Passing a string through __() in the C locale works
ok 8 - Without a gettext library + <C> locale <TEST: A Perl test string> turns into <TEST: A Perl test string>
ok 9 - Without a gettext library + <is> locale <TEST: A Perl test string> turns into <TEST: A Perl test string>
# test_external test Perl Git::I18N API was ok
# test_external_without_stderr test no stderr: Perl Git::I18N API was ok

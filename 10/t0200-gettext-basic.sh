# lib-gettext: Found 'is_IS.utf8' as a is_IS UTF-8 locale
ok 1 - sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME is set (to gnu)
ok 2 - sanity: $TEXTDOMAIN is git
ok 3 - xgettext sanity: Perl _() strings are not extracted
ok 4 - xgettext sanity: Comment extraction with --add-comments
ok 5 - xgettext sanity: Comment extraction with --add-comments stops at statements
ok 6 - sanity: $TEXTDOMAINDIR exists without NO_GETTEXT=YesPlease
ok 7 - sanity: Icelandic locale was compiled
ok 8 # skip sanity: $TEXTDOMAINDIR doesn't exists with NO_GETTEXT=YesPlease
ok 9 - sanity: gettext("") metadata is OK
ok 10 - sanity: gettext(unknown) is passed through
ok 11 - xgettext: C extraction of _() and N_() strings
ok 12 - xgettext: C extraction with %s
ok 13 - xgettext: Shell extraction
ok 14 - xgettext: Shell extraction with $variable
ok 15 - xgettext: Perl extraction
ok 16 - xgettext: Perl extraction with %s
ok 17 - sanity: Some gettext("") data for real locale
# passed all 17 test(s)
1..17

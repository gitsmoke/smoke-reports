# lib-gettext: Found 'is_IS.utf8' as a is_IS UTF-8 locale
# lib-gettext: Found 'is_IS.iso88591' as a is_IS ISO-8859-1 locale
ok 1 - sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME is set (to gnu)
ok 2 - sanity: $TEXTDOMAIN is git
ok 3 - xgettext sanity: Perl _() strings are not extracted
ok 4 - xgettext sanity: Comment extraction with --add-comments
ok 5 - xgettext sanity: Comment extraction with --add-comments stops at statements
ok 6 - sanity: $TEXTDOMAINDIR exists without NO_GETTEXT=YesPlease
ok 7 - sanity: Icelandic locale was compiled
ok 8 - sanity: gettext("") metadata is OK
ok 9 - sanity: gettext(unknown) is passed through
ok 10 - xgettext: C extraction of _() and N_() strings
ok 11 - xgettext: C extraction with %s
ok 12 - xgettext: Shell extraction
ok 13 - xgettext: Shell extraction with $variable
ok 14 - xgettext: Perl extraction
ok 15 - xgettext: Perl extraction with %s
ok 16 - sanity: Some gettext("") data for real locale
# passed all 16 test(s)
1..16

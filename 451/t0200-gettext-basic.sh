# lib-gettext: No is_IS UTF-8 locale available
# lib-gettext: No is_IS ISO-8859-1 locale available
ok 1 - sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME is set (to gnu)
ok 2 - sanity: $TEXTDOMAIN is git
ok 3 - xgettext sanity: Perl _() strings are not extracted
ok 4 - xgettext sanity: Comment extraction with --add-comments
ok 5 - xgettext sanity: Comment extraction with --add-comments stops at statements
ok 6 - sanity: $TEXTDOMAINDIR exists without NO_GETTEXT=YesPlease
ok 7 - sanity: Icelandic locale was compiled
ok 8 # skip sanity: gettext("") metadata is OK (missing GETTEXT_LOCALE)
ok 9 # skip sanity: gettext(unknown) is passed through (missing GETTEXT_LOCALE)
ok 10 # skip xgettext: C extraction of _() and N_() strings (missing GETTEXT_LOCALE)
ok 11 # skip xgettext: C extraction with %s (missing GETTEXT_LOCALE)
ok 12 # skip xgettext: Shell extraction (missing GETTEXT_LOCALE)
ok 13 # skip xgettext: Shell extraction with $variable (missing GETTEXT_LOCALE)
ok 14 # skip xgettext: Perl extraction (missing GETTEXT_LOCALE)
ok 15 # skip xgettext: Perl extraction with %s (missing GETTEXT_LOCALE)
ok 16 # skip sanity: Some gettext("") data for real locale (missing GETTEXT_LOCALE)
# passed all 16 test(s)
1..16

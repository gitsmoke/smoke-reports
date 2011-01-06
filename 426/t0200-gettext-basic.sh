Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0200-gettext-basic/.git/
# lib-gettext: GETTEXT_POISON defined, can't test gettext
expecting success: 
    test -n "$GIT_INTERNAL_GETTEXT_SH_SCHEME"


ok 1 - sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME is set (to fallthrough)

expecting success: 
    test $TEXTDOMAIN = "git"


ok 2 - sanity: $TEXTDOMAIN is git

expecting success: 
    ! grep "A Perl string xgettext will not get" "$GIT_PO_PATH"/is.po


ok 3 - xgettext sanity: Perl _() strings are not extracted
expecting success: 
    grep "TRANSLATORS: This is a test" "$TEST_DIRECTORY"/t0200/* | wc -l >expect &&
    grep "TRANSLATORS: This is a test" "$GIT_PO_PATH"/is.po  | wc -l >actual &&
    test_cmp expect actual

ok 4 - xgettext sanity: Comment extraction with --add-comments

expecting success: 
    ! grep "This is a phony" "$GIT_PO_PATH"/is.po &&
    ! grep "the above comment" "$GIT_PO_PATH"/is.po


ok 5 - xgettext sanity: Comment extraction with --add-comments stops at statements

skipping test: sanity: $TEXTDOMAINDIR exists without NO_GETTEXT=YesPlease 
    test -d "$TEXTDOMAINDIR" &&
    test "$TEXTDOMAINDIR" = "$GIT_TEXTDOMAINDIR"

ok 6 # skip sanity: $TEXTDOMAINDIR exists without NO_GETTEXT=YesPlease (missing GETTEXT)

skipping test: sanity: Icelandic locale was compiled 
    test -f "$TEXTDOMAINDIR/is/LC_MESSAGES/git.mo"

ok 7 # skip sanity: Icelandic locale was compiled (missing GETTEXT)

skipping test: sanity: gettext("") metadata is OK 
    # Return value may be non-zero
    LANGUAGE=is LC_ALL="$is_IS_locale" gettext "" >zero-expect &&
    grep "Project-Id-Version: Git" zero-expect &&
    grep "Git Mailing List <git@vger.kernel.org>" zero-expect &&
    grep "Content-Type: text/plain; charset=UTF-8" zero-expect &&
    grep "Content-Transfer-Encoding: 8bit" zero-expect

ok 8 # skip sanity: gettext("") metadata is OK (missing GETTEXT_LOCALE)

skipping test: sanity: gettext(unknown) is passed through 
    printf "This is not a translation string"  >expect &&
    gettext "This is not a translation string" >actual &&
    eval_gettext "This is not a translation string" >actual &&
    test_cmp expect actual

ok 9 # skip sanity: gettext(unknown) is passed through (missing GETTEXT_LOCALE)

skipping test: xgettext: C extraction of _() and N_() strings 
    printf "TILRAUN: C tilraunastrengur" >expect &&
    printf "
" >>expect &&
    printf "Sjá 'git help SKIPUN' til að sjá hjálp fyrir tiltekna skipun." >>expect &&
    LANGUAGE=is LC_ALL="$is_IS_locale" gettext "TEST: A C test string" >actual &&
    printf "
" >>actual &&
    LANGUAGE=is LC_ALL="$is_IS_locale" gettext "See 'git help COMMAND' for more information on a specific command." >>actual &&
    test_cmp expect actual

ok 10 # skip xgettext: C extraction of _() and N_() strings (missing GETTEXT_LOCALE)

skipping test: xgettext: C extraction with %s 
    printf "TILRAUN: C tilraunastrengur %%s" >expect &&
    LANGUAGE=is LC_ALL="$is_IS_locale" gettext "TEST: A C test string %s" >actual &&
    test_cmp expect actual

ok 11 # skip xgettext: C extraction with %s (missing GETTEXT_LOCALE)

skipping test: xgettext: Shell extraction 
    printf "TILRAUN: Skeljartilraunastrengur" >expect &&
    LANGUAGE=is LC_ALL="$is_IS_locale" gettext "TEST: A Shell test string" >actual &&
    test_cmp expect actual

ok 12 # skip xgettext: Shell extraction (missing GETTEXT_LOCALE)

skipping test: xgettext: Shell extraction with $variable 
    printf "TILRAUN: Skeljartilraunastrengur með breytunni a var i able" >x-expect &&
    LANGUAGE=is LC_ALL="$is_IS_locale" variable="a var i able" eval_gettext "TEST: A Shell test \$variable" >x-actual &&
    test_cmp x-expect x-actual

ok 13 # skip xgettext: Shell extraction with $variable (missing GETTEXT_LOCALE)

skipping test: xgettext: Perl extraction 
    printf "TILRAUN: Perl tilraunastrengur" >expect &&
    LANGUAGE=is LC_ALL="$is_IS_locale" gettext "TEST: A Perl test string" >actual &&
    test_cmp expect actual

ok 14 # skip xgettext: Perl extraction (missing GETTEXT_LOCALE)

skipping test: xgettext: Perl extraction with %s 
    printf "TILRAUN: Perl tilraunastrengur með breytunni %%s" >expect &&
    LANGUAGE=is LC_ALL="$is_IS_locale" gettext "TEST: A Perl test variable %s" >actual &&
    test_cmp expect actual

ok 15 # skip xgettext: Perl extraction with %s (missing GETTEXT_LOCALE)

skipping test: sanity: Some gettext("") data for real locale 
    LANGUAGE=is LC_ALL="$is_IS_locale" gettext "" >real-locale &&
    test -s real-locale

ok 16 # skip sanity: Some gettext("") data for real locale (missing GETTEXT_LOCALE)

# passed all 16 test(s)
1..16

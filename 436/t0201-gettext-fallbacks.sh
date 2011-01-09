Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0201-gettext-fallbacks/.git/
# lib-gettext: GETTEXT_POISON defined, can't test gettext
expecting success: 
    test -n "$GIT_INTERNAL_GETTEXT_SH_SCHEME"


ok 1 - sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME is set (to fallthrough)

expecting success: 
    test -n "$GIT_INTERNAL_GETTEXT_TEST_FALLBACKS"


ok 2 - sanity: $GIT_INTERNAL_GETTEXT_TEST_FALLBACKS is set

expecting success: 
    test "$GIT_INTERNAL_GETTEXT_SH_SCHEME" = "fallthrough"


ok 3 - sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME" is fallthrough

expecting success: 
    printf "test" >expect &&
    gettext "test" >actual &&
    test_cmp expect actual &&
    printf "test more words" >expect &&
    gettext "test more words" >actual &&
    test_cmp expect actual

ok 4 - gettext: our gettext() fallback has pass-through semantics

expecting success: 
    printf "test" >expect &&
    eval_gettext "test" >actual &&
    test_cmp expect actual &&
    printf "test more words" >expect &&
    eval_gettext "test more words" >actual &&
    test_cmp expect actual


ok 5 - eval_gettext: our eval_gettext() fallback has pass-through semantics

expecting success: 
    printf "test YesPlease" >expect &&
    eval_gettext "test \$GIT_INTERNAL_GETTEXT_TEST_FALLBACKS" >actual &&
    test_cmp expect actual


ok 6 - eval_gettext: our eval_gettext() fallback can interpolate variables

# passed all 6 test(s)
1..6

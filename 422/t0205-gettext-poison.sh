Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0205-gettext-poison/.git/
# lib-gettext: GETTEXT_POISON defined, can't test gettext
skipping test: sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME is set (to fallthrough) 
    test -n "$GIT_INTERNAL_GETTEXT_SH_SCHEME"
ok 1 # skip sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME is set (to fallthrough) (missing GETTEXT_POISON)
skipping test: sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME" is poison 
    test "$GIT_INTERNAL_GETTEXT_SH_SCHEME" = "poison"
ok 2 # skip sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME" is poison (missing GETTEXT_POISON)
skipping test: gettext: our gettext() fallback has poison semantics 
    printf "# GETTEXT POISON #" >expect &&
    gettext "test" >actual &&
    test_cmp expect actual &&
    printf "# GETTEXT POISON #" >expect &&
    gettext "test more words" >actual &&
    test_cmp expect actual
ok 3 # skip gettext: our gettext() fallback has poison semantics (missing GETTEXT_POISON)

skipping test: eval_gettext: our eval_gettext() fallback has poison semantics 
    printf "# GETTEXT POISON #" >expect &&
    eval_gettext "test" >actual &&
    test_cmp expect actual &&
    printf "# GETTEXT POISON #" >expect &&
    eval_gettext "test more words" >actual &&
    test_cmp expect actual

ok 4 # skip eval_gettext: our eval_gettext() fallback has poison semantics (missing GETTEXT_POISON)
# passed all 4 test(s)
1..4

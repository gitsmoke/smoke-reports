# lib-gettext: No is_IS UTF-8 locale available
# lib-gettext: No is_IS ISO-8859-1 locale available
ok 1 - sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME is set (to fallthrough)
ok 2 - sanity: $GIT_INTERNAL_GETTEXT_TEST_FALLBACKS is set
ok 3 - sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME" is fallthrough
ok 4 - gettext: our gettext() fallback has pass-through semantics
ok 5 - eval_gettext: our eval_gettext() fallback has pass-through semantics
ok 6 - eval_gettext: our eval_gettext() fallback can interpolate variables
# passed all 6 test(s)
1..6

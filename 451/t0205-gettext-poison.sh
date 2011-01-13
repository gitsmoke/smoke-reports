# lib-gettext: No is_IS UTF-8 locale available
# lib-gettext: No is_IS ISO-8859-1 locale available
ok 1 # skip sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME is set (to gnu) (missing GETTEXT_POISON)
ok 2 # skip sanity: $GIT_INTERNAL_GETTEXT_SH_SCHEME" is poison (missing GETTEXT_POISON)
ok 3 # skip gettext: our gettext() fallback has poison semantics (missing GETTEXT_POISON)
ok 4 # skip eval_gettext: our eval_gettext() fallback has poison semantics (missing GETTEXT_POISON)
# passed all 4 test(s)
1..4

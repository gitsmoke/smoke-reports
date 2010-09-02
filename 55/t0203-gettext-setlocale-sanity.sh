# lib-gettext: No GETTEXT support available
ok 1 - git show a ISO-8859-1 commit under C locale
ok 2 # skip git show a ISO-8859-1 commit under a UTF-8 locale (missing GETTEXT_LOCALE)
# passed all 2 test(s)
1..2

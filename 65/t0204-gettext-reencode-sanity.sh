# lib-gettext: Found 'is_IS.utf8' as a is_IS UTF-8 locale
# lib-gettext: No is_IS ISO-8859-1 locale available
ok 1 - gettext: Emitting UTF-8 from our UTF-8 *.mo files / Icelandic
ok 2 - gettext: Emitting UTF-8 from our UTF-8 *.mo files / Runes
ok 3 # skip gettext: Emitting ISO-8859-1 from our UTF-8 *.mo files / Icelandic (missing GETTEXT_ISO_LOCALE)
ok 4 # skip gettext: Emitting ISO-8859-1 from our UTF-8 *.mo files / Runes (missing GETTEXT_ISO_LOCALE)
ok 5 - gettext: Fetching a UTF-8 msgid -> UTF-8
ok 6 # skip gettext: Fetching a UTF-8 msgid -> ISO-8859-1 (missing GETTEXT_ISO_LOCALE)
ok 7 - gettext.c: git init UTF-8 -> UTF-8
ok 8 # skip gettext.c: git init UTF-8 -> ISO-8859-1 (missing GETTEXT_ISO_LOCALE)
# passed all 8 test(s)
1..8

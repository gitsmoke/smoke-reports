# lib-gettext: No is_IS UTF-8 locale available
# lib-gettext: No is_IS ISO-8859-1 locale available
ok 1 # skip gettext: Emitting UTF-8 from our UTF-8 *.mo files / Icelandic (missing GETTEXT_LOCALE)
ok 2 # skip gettext: Emitting UTF-8 from our UTF-8 *.mo files / Runes (missing GETTEXT_LOCALE)
ok 3 # skip gettext: Emitting ISO-8859-1 from our UTF-8 *.mo files / Icelandic (missing GETTEXT_ISO_LOCALE)
ok 4 # skip gettext: Emitting ISO-8859-1 from our UTF-8 *.mo files / Runes (missing GETTEXT_ISO_LOCALE)
ok 5 # skip gettext: Fetching a UTF-8 msgid -> UTF-8 (missing GETTEXT_LOCALE)
ok 6 # skip gettext: Fetching a UTF-8 msgid -> ISO-8859-1 (missing GETTEXT_ISO_LOCALE)
ok 7 # skip gettext.c: git init UTF-8 -> UTF-8 (missing GETTEXT_LOCALE)
ok 8 # skip gettext.c: git init UTF-8 -> ISO-8859-1 (missing GETTEXT_ISO_LOCALE)
# passed all 8 test(s)
1..8

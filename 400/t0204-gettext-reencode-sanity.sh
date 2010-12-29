Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0204-gettext-reencode-sanity/.git/
# lib-gettext: GETTEXT_POISON defined, can't test gettext
skipping test: gettext: Emitting UTF-8 from our UTF-8 *.mo files / Icelandic 
    printf "TILRAUN: Halló Heimur!" >expect &&
    LANGUAGE=is LC_ALL="$is_IS_locale" gettext "TEST: Hello World!" >actual &&
    test_cmp expect actual

ok 1 # skip gettext: Emitting UTF-8 from our UTF-8 *.mo files / Icelandic (missing GETTEXT_LOCALE)

skipping test: gettext: Emitting UTF-8 from our UTF-8 *.mo files / Runes 
    printf "TILRAUN: ᚻᛖ ᚳᚹᚫᚦ ᚦᚫᛏ ᚻᛖ ᛒᚢᛞᛖ ᚩᚾ ᚦᚫᛗ ᛚᚪᚾᛞᛖ ᚾᚩᚱᚦᚹᛖᚪᚱᛞᚢᛗ ᚹᛁᚦ ᚦᚪ ᚹᛖᛥᚫ" >expect &&
    LANGUAGE=is LC_ALL="$is_IS_locale" gettext "TEST: Old English Runes" >actual &&
    test_cmp expect actual

ok 2 # skip gettext: Emitting UTF-8 from our UTF-8 *.mo files / Runes (missing GETTEXT_LOCALE)

skipping test: gettext: Emitting ISO-8859-1 from our UTF-8 *.mo files / Icelandic 
    printf "TILRAUN: Halló Heimur!" | iconv -f UTF-8 -t ISO8859-1 >expect &&
    LANGUAGE=is LC_ALL="$is_IS_iso_locale" gettext "TEST: Hello World!" >actual &&
    test_cmp expect actual

ok 3 # skip gettext: Emitting ISO-8859-1 from our UTF-8 *.mo files / Icelandic (missing GETTEXT_ISO_LOCALE)

skipping test: gettext: Emitting ISO-8859-1 from our UTF-8 *.mo files / Runes 
    LANGUAGE=is LC_ALL="$is_IS_iso_locale" gettext "TEST: Old English Runes" >runes &&

	if grep "^TEST: Old English Runes$" runes
	then
		say "Your system can not handle this complexity and returns the string as-is"
	else
		# Both Solaris and GNU libintl will return this stream of
		# question marks, so it is s probably portable enough
		printf "TILRAUN: ?? ???? ??? ?? ???? ?? ??? ????? ??????????? ??? ?? ????" >runes-expect &&
		test_cmp runes-expect runes
	fi

ok 4 # skip gettext: Emitting ISO-8859-1 from our UTF-8 *.mo files / Runes (missing GETTEXT_ISO_LOCALE)

skipping test: gettext: Fetching a UTF-8 msgid -> UTF-8 
    printf "TILRAUN: ‚einfaldar‘ og „tvöfaldar“ gæsalappir" >expect &&
    LANGUAGE=is LC_ALL="$is_IS_locale" gettext "TEST: ‘single’ and “double” quotes" >actual &&
    test_cmp expect actual

ok 5 # skip gettext: Fetching a UTF-8 msgid -> UTF-8 (missing GETTEXT_LOCALE)

skipping test: gettext: Fetching a UTF-8 msgid -> ISO-8859-1 
    LANGUAGE=is LC_ALL="$is_IS_iso_locale" gettext "TEST: ‘single’ and “double” quotes" >actual &&
    grep "einfaldar" actual &&
    grep "$(echo tvöfaldar | iconv -f UTF-8 -t ISO8859-1)" actual

ok 6 # skip gettext: Fetching a UTF-8 msgid -> ISO-8859-1 (missing GETTEXT_ISO_LOCALE)

skipping test: gettext.c: git init UTF-8 -> UTF-8 
    printf "Bjó til tóma Git lind" >expect &&
    LANGUAGE=is LC_ALL="$is_IS_locale" git init repo >actual &&
    test_when_finished "rm -rf repo" &&
    grep "^$(cat expect) " actual

ok 7 # skip gettext.c: git init UTF-8 -> UTF-8 (missing GETTEXT_LOCALE)

skipping test: gettext.c: git init UTF-8 -> ISO-8859-1 
    printf "Bjó til tóma Git lind" >expect &&
    LANGUAGE=is LC_ALL="$is_IS_iso_locale" git init repo >actual &&
    test_when_finished "rm -rf repo" &&
    grep "^$(cat expect | iconv -f UTF-8 -t ISO8859-1) " actual

ok 8 # skip gettext.c: git init UTF-8 -> ISO-8859-1 (missing GETTEXT_ISO_LOCALE)

# passed all 8 test(s)
1..8

ok 1 - Ray's example without options
ok 2 - Ray's example with -w
ok 3 - Ray's example with -b
ok 4 - another test, without options
ok 5 - another test, with -w
ok 6 - another test, with -w -b
ok 7 - another test, with -w --ignore-space-at-eol
ok 8 - another test, with -w -b --ignore-space-at-eol
ok 9 - another test, with -b
ok 10 - another test, with -b --ignore-space-at-eol
ok 11 - another test, with --ignore-space-at-eol
ok 12 - check mixed spaces and tabs in indent
ok 13 - check mixed tabs and spaces in indent
ok 14 - check with no whitespace errors
ok 15 - check with trailing whitespace
ok 16 - check with space before tab in indent
ok 17 - --check and --exit-code are not exclusive
ok 18 - --check and --quiet are not exclusive
ok 19 - check staged with no whitespace errors
ok 20 - check staged with trailing whitespace
ok 21 - check staged with space before tab in indent
ok 22 - check with no whitespace errors (diff-index)
ok 23 - check with trailing whitespace (diff-index)
ok 24 - check with space before tab in indent (diff-index)
ok 25 - check staged with no whitespace errors (diff-index)
ok 26 - check staged with trailing whitespace (diff-index)
ok 27 - check staged with space before tab in indent (diff-index)
ok 28 - check with no whitespace errors (diff-tree)
ok 29 - check with trailing whitespace (diff-tree)
ok 30 - check with space before tab in indent (diff-tree)
ok 31 - check trailing whitespace (trailing-space: off)
ok 32 - check trailing whitespace (trailing-space: on)
ok 33 - check space before tab in indent (space-before-tab: off)
ok 34 - check space before tab in indent (space-before-tab: on)
ok 35 - check spaces as indentation (indent-with-non-tab: off)
ok 36 - check spaces as indentation (indent-with-non-tab: on)
not ok - 37 ditto, but tabwidth=9
#	
#	
#		git config core.whitespace "indent-with-non-tab,tabwidth=9" &&
#		git diff --check
#	
#	
ok 38 - check tabs and spaces as indentation (indent-with-non-tab: on)
ok 39 - ditto, but tabwidth=10
not ok - 40 ditto, but tabwidth=20
#	
#	
#		git config core.whitespace "indent-with-non-tab,tabwidth=20" &&
#		git diff --check
#	
#	
ok 41 - check tabs as indentation (tab-in-indent: off)
ok 42 - check tabs as indentation (tab-in-indent: on)
ok 43 - check tabs and spaces as indentation (tab-in-indent: on)
ok 44 - ditto, but tabwidth=1 (must be irrelevant)
ok 45 - check tab-in-indent and indent-with-non-tab conflict
ok 46 - check tab-in-indent excluded from wildcard whitespace attribute
ok 47 - line numbers in --check output are correct
ok 48 - checkdiff detects new trailing blank lines (1)
ok 49 - checkdiff detects new trailing blank lines (2)
ok 50 - checkdiff allows new blank lines
ok 51 - whitespace-only changes not reported
ok 52 - whitespace-only changes reported across renames
ok 53 - rename empty
ok 54 - combined diff with autocrlf conversion
ok 55 - setup diff colors
ok 56 - diff that introduces a line with only tabs
# failed 2 among 56 test(s)
1..56

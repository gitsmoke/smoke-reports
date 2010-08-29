ok 1 - initial
ok 2 - mixed case
ok 3 - similar section
ok 4 - similar section
ok 5 - replace with non-match
ok 6 - replace with non-match (actually matching)
ok 7 - non-match result
ok 8 - unset with cont. lines
ok 9 - unset with cont. lines is correct
ok 10 - multiple unset
ok 11 - multiple unset is correct
ok 12 - --replace-all missing value
ok 13 - --replace-all
ok 14 - all replaced
ok 15 - really mean test
ok 16 - really really mean test
ok 17 - get value
ok 18 - unset
ok 19 - multivar
ok 20 - non-match
ok 21 - non-match value
ok 22 - ambiguous get
ok 23 - get multivar
ok 24 - multivar replace
ok 25 - ambiguous value
ok 26 - ambiguous unset
ok 27 - invalid unset
ok 28 - multivar unset
ok 29 - invalid key
ok 30 - correct key
ok 31 - hierarchical section
ok 32 - hierarchical section value
ok 33 - working --list
ok 34 - --get-regexp
ok 35 - --add
ok 36 - get variable with no value
ok 37 - get variable with empty value
ok 38 - get-regexp variable with no value
ok 39 - get-regexp variable with empty value
ok 40 - get bool variable with no value
ok 41 - get bool variable with empty value
ok 42 - no arguments, but no crash
ok 43 - new section is partial match of another
ok 44 - new variable inserts into proper section
ok 45 - alternative GIT_CONFIG (non-existing file should fail)
ok 46 - alternative GIT_CONFIG
ok 47 - alternative GIT_CONFIG (--file)
ok 48 - refer config from subdirectory
ok 49 - --set in alternative GIT_CONFIG
ok 50 - rename section
ok 51 - rename succeeded
ok 52 - rename non-existing section
ok 53 - rename succeeded
ok 54 - rename another section
ok 55 - rename succeeded
ok 56 - rename a section with a var on the same line
ok 57 - rename succeeded
ok 58 - remove section
ok 59 - section was removed properly
ok 60 - section ending
ok 61 - numbers
ok 62 - invalid unit
ok 63 - bool
ok 64 - invalid bool (--get)
ok 65 - invalid bool (set)
ok 66 - set --bool
ok 67 - set --int
ok 68 - get --bool-or-int
ok 69 - set --bool-or-int
not ok - 70 set --path
#	
#		git config --path path.home "~/" &&
#		git config --path path.normal "/dev/null" &&
#		git config --path path.trailingtilde "foo~" &&
#		test_cmp expect .git/config
not ok - 71 get --path
#	
#		git config --get --path path.home > result &&
#		git config --get --path path.normal >> result &&
#		git config --get --path path.trailingtilde >> result &&
#		test_cmp expect result
#	
not ok - 72 get --path copes with unset $HOME
#	
#		(
#			unset HOME;
#			test_must_fail git config --get --path path.home \
#				>result 2>msg &&
#			git config --get --path path.normal >>result &&
#			git config --get --path path.trailingtilde >>result
#		) &&
#		grep "[Ff]ailed to expand.*~/" msg &&
#		test_cmp expect result
#	
ok 73 - quoting
ok 74 - key with newline
ok 75 - value with newline
ok 76 - value continued on next line
ok 77 - --null --list
ok 78 - --null --get-regexp
ok 79 - inner whitespace kept verbatim
ok 80 # skip symlinked configuration (missing SYMLINKS of SYMLINKS)
ok 81 - check split_cmdline return
ok 82 - git -c "key=value" support
# failed 3 among 82 test(s)
1..82

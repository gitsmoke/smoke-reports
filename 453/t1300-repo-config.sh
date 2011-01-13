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
not ok - 34 --list without repo produces empty output
#	
#		git --git-dir=nonexistent config --list >output &&
#		test_cmp expect output
#	
ok 35 - --get-regexp
ok 36 - --add
ok 37 - get variable with no value
ok 38 - get variable with empty value
ok 39 - get-regexp variable with no value
ok 40 - get-regexp variable with empty value
ok 41 - get bool variable with no value
ok 42 - get bool variable with empty value
ok 43 - no arguments, but no crash
ok 44 - new section is partial match of another
ok 45 - new variable inserts into proper section
ok 46 - alternative GIT_CONFIG (non-existing file should fail)
ok 47 - alternative GIT_CONFIG
ok 48 - alternative GIT_CONFIG (--file)
ok 49 - refer config from subdirectory
ok 50 - --set in alternative GIT_CONFIG
ok 51 - rename section
ok 52 - rename succeeded
ok 53 - rename non-existing section
ok 54 - rename succeeded
ok 55 - rename another section
ok 56 - rename succeeded
ok 57 - rename a section with a var on the same line
ok 58 - rename succeeded
ok 59 - remove section
ok 60 - section was removed properly
ok 61 - section ending
ok 62 - numbers
ok 63 - invalid unit
ok 64 - bool
ok 65 - invalid bool (--get)
ok 66 - invalid bool (set)
ok 67 - set --bool
ok 68 - set --int
ok 69 - get --bool-or-int
ok 70 - set --bool-or-int
ok 71 - set --path
ok 72 - get --path
ok 73 - get --path copes with unset $HOME
ok 74 - quoting
ok 75 - key with newline
ok 76 - value with newline
ok 77 - value continued on next line
ok 78 - --null --list
ok 79 - --null --get-regexp
ok 80 - inner whitespace kept verbatim
ok 81 - symlinked configuration
ok 82 - nonexistent configuration
ok 83 - symlink to nonexistent configuration
ok 84 - check split_cmdline return
ok 85 - git -c "key=value" support
# failed 1 among 85 test(s)
1..85

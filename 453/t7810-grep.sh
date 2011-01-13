ok 1 - setup
ok 2 - grep should not segfault with a bad input
ok 3 - grep -w HEAD
ok 4 - grep -w HEAD (w)
ok 5 - grep -w HEAD (x)
ok 6 - grep -w HEAD (y-1)
ok 7 - grep -w HEAD (y-2)
ok 8 - grep -w HEAD (z)
ok 9 - grep HEAD (t-1)
ok 10 - grep HEAD (t-2)
ok 11 - grep HEAD (t-3)
ok 12 - grep -c HEAD (no /dev/null)
ok 13 - grep --max-depth -1 HEAD
ok 14 - grep --max-depth 0 HEAD
ok 15 - grep --max-depth 0 -- '*' HEAD
ok 16 - grep --max-depth 1 HEAD
ok 17 - grep --max-depth 0 -- t HEAD
ok 18 - grep --max-depth 0 -- . t HEAD
ok 19 - grep --max-depth 0 -- t . HEAD
ok 20 - grep -w in working tree
ok 21 - grep -w in working tree (w)
ok 22 - grep -w in working tree (x)
ok 23 - grep -w in working tree (y-1)
ok 24 - grep -w in working tree (y-2)
ok 25 - grep -w in working tree (z)
ok 26 - grep in working tree (t-1)
ok 27 - grep in working tree (t-2)
ok 28 - grep in working tree (t-3)
ok 29 - grep -c in working tree (no /dev/null)
ok 30 - grep --max-depth -1 in working tree
ok 31 - grep --max-depth 0 in working tree
ok 32 - grep --max-depth 0 -- '*' in working tree
ok 33 - grep --max-depth 1 in working tree
ok 34 - grep --max-depth 0 -- t in working tree
ok 35 - grep --max-depth 0 -- . t in working tree
ok 36 - grep --max-depth 0 -- t . in working tree
ok 37 - grep -e A --and -e B
ok 38 - grep ( -e A --or -e B ) --and -e B
ok 39 - grep -e A --and --not -e B
ok 40 - grep should ignore GREP_OPTIONS
ok 41 - grep -f, non-existent file
ok 42 - grep -f, one pattern
ok 43 - grep -f, multiple patterns
ok 44 - grep -f, ignore empty lines
ok 45 - grep -q, silently report matches
ok 46 - grep -C1, hunk mark between files
ok 47 - grep -C1 hunk mark between files
ok 48 - log grep setup
ok 49 - log grep (1)
ok 50 - log grep (2)
ok 51 - log grep (3)
ok 52 - log grep (4)
ok 53 - log grep (5)
ok 54 - log grep (6)
ok 55 - log --grep --author implicitly uses all-match
not ok - 56 log with multiple --author uses union
#	
#		git log --author="Thor" --author="Aster" --format=%s >actual &&
#		{
#		    echo third && echo second && echo initial
#		} >expect &&
#		test_cmp expect actual
#	
not ok - 57 log with --grep and multiple --author uses all-match
#	
#		git log --author="Thor" --author="Night" --grep=i --format=%s >actual &&
#		{
#		    echo third && echo initial
#		} >expect &&
#		test_cmp expect actual
#	
ok 58 - log with --grep and multiple --author uses all-match
ok 59 - grep with CE_VALID file
ok 60 - grep -p with userdiff
ok 61 - grep -p
ok 62 - grep -p -B5
ok 63 - grep from a subdirectory to search wider area (1)
ok 64 - grep from a subdirectory to search wider area (2)
ok 65 - grep -Fi
ok 66 - outside of git repository
ok 67 - inside git repository but with --no-index
ok 68 - setup double-dash tests
ok 69 - grep -- pattern
ok 70 - grep -- pattern -- pathspec
ok 71 - grep -e pattern -- path
ok 72 - grep -e -- -- path
# failed 2 among 72 test(s)
1..72

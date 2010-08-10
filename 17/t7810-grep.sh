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
ok 18 - grep -w in working tree
ok 19 - grep -w in working tree (w)
ok 20 - grep -w in working tree (x)
ok 21 - grep -w in working tree (y-1)
ok 22 - grep -w in working tree (y-2)
ok 23 - grep -w in working tree (z)
ok 24 - grep in working tree (t-1)
ok 25 - grep in working tree (t-2)
ok 26 - grep in working tree (t-3)
ok 27 - grep -c in working tree (no /dev/null)
ok 28 - grep --max-depth -1 in working tree
ok 29 - grep --max-depth 0 in working tree
ok 30 - grep --max-depth 0 -- '*' in working tree
ok 31 - grep --max-depth 1 in working tree
ok 32 - grep --max-depth 0 -- t in working tree
ok 33 - grep -e A --and -e B
ok 34 - grep ( -e A --or -e B ) --and -e B
ok 35 - grep -e A --and --not -e B
ok 36 - grep should ignore GREP_OPTIONS
ok 37 - grep -f, non-existent file
ok 38 - grep -f, one pattern
ok 39 - grep -f, multiple patterns
ok 40 - grep -f, ignore empty lines
ok 41 - grep -q, silently report matches
ok 42 - grep -C1, hunk mark between files
ok 43 - grep -C1 hunk mark between files
ok 44 - log grep setup
ok 45 - log grep (1)
ok 46 - log grep (2)
ok 47 - log grep (3)
ok 48 - log grep (4)
ok 49 - log grep (5)
ok 50 - log grep (6)
ok 51 - log --grep --author implicitly uses all-match
ok 52 - grep with CE_VALID file
ok 53 - grep -p with userdiff
ok 54 - grep -p
ok 55 - grep -p -B5
ok 56 - grep from a subdirectory to search wider area (1)
ok 57 - grep from a subdirectory to search wider area (2)
ok 58 - grep -Fi
ok 59 - outside of git repository
ok 60 - inside git repository but with --no-index
ok 61 - setup double-dash tests
ok 62 - grep -- pattern
ok 63 - grep -- pattern -- pathspec
ok 64 - grep -e pattern -- path
ok 65 - grep -e -- -- path
# passed all 65 test(s)
1..65

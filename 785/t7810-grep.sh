ok 1 - setup
ok 2 - grep should not segfault with a bad input
ok 3 - grep -w HEAD
ok 4 - grep -w HEAD
ok 5 - grep -w HEAD
ok 6 - grep -w HEAD (w)
ok 7 - grep -w HEAD (x)
ok 8 - grep -w HEAD (y-1)
ok 9 - grep -w HEAD (y-2)
ok 10 - grep -w HEAD (z)
ok 11 - grep HEAD (t-1)
ok 12 - grep HEAD (t-2)
ok 13 - grep HEAD (t-3)
ok 14 - grep -c HEAD (no /dev/null)
ok 15 - grep --max-depth -1 HEAD
ok 16 - grep --max-depth 0 HEAD
ok 17 - grep --max-depth 0 -- '*' HEAD
ok 18 - grep --max-depth 1 HEAD
ok 19 - grep --max-depth 0 -- t HEAD
ok 20 - grep --max-depth 0 -- . t HEAD
ok 21 - grep --max-depth 0 -- t . HEAD
ok 22 - grep -w in working tree
ok 23 - grep -w in working tree
ok 24 - grep -w in working tree
ok 25 - grep -w in working tree (w)
ok 26 - grep -w in working tree (x)
ok 27 - grep -w in working tree (y-1)
ok 28 - grep -w in working tree (y-2)
ok 29 - grep -w in working tree (z)
ok 30 - grep in working tree (t-1)
ok 31 - grep in working tree (t-2)
ok 32 - grep in working tree (t-3)
ok 33 - grep -c in working tree (no /dev/null)
ok 34 - grep --max-depth -1 in working tree
ok 35 - grep --max-depth 0 in working tree
ok 36 - grep --max-depth 0 -- '*' in working tree
ok 37 - grep --max-depth 1 in working tree
ok 38 - grep --max-depth 0 -- t in working tree
ok 39 - grep --max-depth 0 -- . t in working tree
ok 40 - grep --max-depth 0 -- t . in working tree
ok 41 - grep -e A --and -e B
ok 42 - grep ( -e A --or -e B ) --and -e B
ok 43 - grep -e A --and --not -e B
ok 44 - grep should ignore GREP_OPTIONS
ok 45 - grep -f, non-existent file
ok 46 - grep -f, one pattern
ok 47 - grep -f, multiple patterns
ok 48 - grep -f, ignore empty lines
ok 49 - grep -f, ignore empty lines, read patterns from stdin
ok 50 - grep -q, silently report matches
ok 51 - grep -C1, hunk mark between files
ok 52 - grep -C1 hunk mark between files
ok 53 - log grep setup
ok 54 - log grep (1)
ok 55 - log grep (2)
ok 56 - log grep (3)
ok 57 - log grep (4)
ok 58 - log grep (5)
ok 59 - log grep (6)
ok 60 - log --grep --author implicitly uses all-match
ok 61 - log with multiple --author uses union
ok 62 - log with --grep and multiple --author uses all-match
ok 63 - log with --grep and multiple --author uses all-match
ok 64 - grep with CE_VALID file
ok 65 - grep -p with userdiff
ok 66 - grep -p
ok 67 - grep -p -B5
ok 68 - grep from a subdirectory to search wider area (1)
ok 69 - grep from a subdirectory to search wider area (2)
ok 70 - grep -Fi
ok 71 - outside of git repository
ok 72 - inside git repository but with --no-index
ok 73 - setup double-dash tests
ok 74 - grep -- pattern
ok 75 - grep -- pattern -- pathspec
ok 76 - grep -e pattern -- path
ok 77 - grep -e -- -- path
# passed all 77 test(s)
1..77

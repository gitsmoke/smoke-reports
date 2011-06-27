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
ok 22 - grep HEAD with grep.extendedRegexp=false
ok 23 - grep HEAD with grep.extendedRegexp=true
ok 24 - grep -w in working tree
ok 25 - grep -w in working tree
ok 26 - grep -w in working tree
ok 27 - grep -w in working tree (w)
ok 28 - grep -w in working tree (x)
ok 29 - grep -w in working tree (y-1)
ok 30 - grep -w in working tree (y-2)
ok 31 - grep -w in working tree (z)
ok 32 - grep in working tree (t-1)
ok 33 - grep in working tree (t-2)
ok 34 - grep in working tree (t-3)
ok 35 - grep -c in working tree (no /dev/null)
ok 36 - grep --max-depth -1 in working tree
ok 37 - grep --max-depth 0 in working tree
ok 38 - grep --max-depth 0 -- '*' in working tree
ok 39 - grep --max-depth 1 in working tree
ok 40 - grep --max-depth 0 -- t in working tree
ok 41 - grep --max-depth 0 -- . t in working tree
ok 42 - grep --max-depth 0 -- t . in working tree
ok 43 - grep in working tree with grep.extendedRegexp=false
ok 44 - grep in working tree with grep.extendedRegexp=true
ok 45 - grep -e A --and -e B
ok 46 - grep ( -e A --or -e B ) --and -e B
ok 47 - grep -e A --and --not -e B
ok 48 - grep should ignore GREP_OPTIONS
ok 49 - grep -f, non-existent file
ok 50 - grep -f, one pattern
ok 51 - grep -f, multiple patterns
ok 52 - grep -f, ignore empty lines
ok 53 - grep -f, ignore empty lines, read patterns from stdin
ok 54 - grep -q, silently report matches
ok 55 - grep -C1, hunk mark between files
ok 56 - grep -C1 hunk mark between files
ok 57 - log grep setup
ok 58 - log grep (1)
ok 59 - log grep (2)
ok 60 - log grep (3)
ok 61 - log grep (4)
ok 62 - log grep (5)
ok 63 - log grep (6)
ok 64 - log --grep --author implicitly uses all-match
ok 65 - log with multiple --author uses union
ok 66 - log with --grep and multiple --author uses all-match
ok 67 - log with --grep and multiple --author uses all-match
ok 68 - grep with CE_VALID file
ok 69 - grep -p with userdiff
ok 70 - grep -p
ok 71 - grep -p -B5
ok 72 - grep from a subdirectory to search wider area (1)
ok 73 - grep from a subdirectory to search wider area (2)
ok 74 - grep -Fi
ok 75 - outside of git repository
ok 76 - inside git repository but with --no-index
ok 77 - setup double-dash tests
ok 78 - grep -- pattern
ok 79 - grep -- pattern -- pathspec
ok 80 - grep -e pattern -- path
ok 81 - grep -e -- -- path
ok 82 # skip grep --perl-regexp pattern (missing LIBPCRE)
ok 83 # skip grep -P pattern (missing LIBPCRE)
ok 84 - grep pattern with grep.extendedRegexp=true
ok 85 # skip grep -P pattern with grep.extendedRegexp=true (missing LIBPCRE)
ok 86 # skip grep -P -v pattern (missing LIBPCRE)
ok 87 # skip grep -P -i pattern (missing LIBPCRE)
ok 88 # skip grep -P -w pattern (missing LIBPCRE)
ok 89 - grep -G invalidpattern properly dies 
ok 90 - grep -E invalidpattern properly dies 
ok 91 # skip grep -P invalidpattern properly dies  (missing LIBPCRE)
ok 92 - grep -G -E -F pattern
ok 93 - grep -E -F -G pattern
ok 94 - grep -F -G -E pattern
ok 95 - grep -G -F -P -E pattern
ok 96 # skip grep -G -F -E -P pattern (missing LIBPCRE)
ok 97 - grep --color, separator
ok 98 - grep --break
ok 99 - grep --break with context
ok 100 - grep --heading
ok 101 - mimic ack-grep --group
# passed all 101 test(s)
1..101

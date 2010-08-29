ok 1 - setup
ok 2 - change file1 with copy-edit of file0 and remove file0
ok 3 - run diff with -B
ok 4 - validate result of -B (#1)
ok 5 - run diff with -B and -M
ok 6 - validate result of -B -M (#2)
ok 7 - swap file0 and file1
ok 8 - run diff with -B
ok 9 - validate result of -B (#3)
ok 10 - run diff with -B and -M
ok 11 - validate result of -B -M (#4)
ok 12 # skip make file0 into something completely different (missing SYMLINKS of SYMLINKS)
ok 13 - run diff with -B
ok 14 # skip validate result of -B (#5) (missing SYMLINKS of SYMLINKS)
ok 15 - run diff with -B -M
ok 16 # skip validate result of -B -M (#6) (missing SYMLINKS of SYMLINKS)
ok 17 - run diff with -M
ok 18 # skip validate result of -M (#7) (missing SYMLINKS of SYMLINKS)
ok 19 - file1 edited to look like file0 and file0 rename-edited to file2
ok 20 - run diff with -B
ok 21 - validate result of -B (#8)
ok 22 - run diff with -B -M
ok 23 - validate result of -B -M (#9)
# passed all 23 test(s)
1..23

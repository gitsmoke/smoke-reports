ok 1 - setup
ok 2 - describe HEAD
ok 3 - describe HEAD^
ok 4 - describe HEAD^^
ok 5 - describe HEAD^^2
ok 6 - describe HEAD^^2^
ok 7 - describe HEAD^^^
ok 8 - describe --tags HEAD
ok 9 - describe --tags HEAD^
ok 10 - describe --tags HEAD^^
ok 11 - describe --tags HEAD^^2
ok 12 - describe --tags HEAD^^2^
ok 13 - describe --tags HEAD^^^
ok 14 - describe --all HEAD
ok 15 - describe --all HEAD^
ok 16 - describe --all HEAD^^^
ok 17 - describe --long HEAD^^2^
ok 18 - describe --long HEAD^^2
ok 19 - describe --all A^0
ok 20 - no warning was displayed for A
ok 21 - rename tag A to Q locally
ok 22 - describe HEAD
ok 23 - warning was displayed for Q
ok 24 - rename tag Q back to A
ok 25 - pack tag refs
ok 26 - describe HEAD
ok 27 - describe --dirty
ok 28 - set-up dirty work tree
ok 29 - describe --dirty
ok 30 - describe --dirty=.mod
ok 31 - describe --dirty HEAD
ok 32 - set-up matching pattern tests
ok 33 - describe --match=test-*
ok 34 - describe --tags --match=test1-*
ok 35 - describe --tags --match=test2-*
ok 36 - describe --long --tags --match=test2-* HEAD^
# passed all 36 test(s)
1..36

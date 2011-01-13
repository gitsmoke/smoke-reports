Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3002-ls-files-dashpath/.git/
expecting success: echo frotz >path0 &&
	echo frotz >./-foo &&
	echo frotz >./--

ok 1 - setup
expecting success: git ls-files --others >output &&
     test_cmp output - <<EOF
--
-foo
output
path0
EOF

ok 2 - git ls-files without path restriction.

expecting success: git ls-files --others path0 >output &&
	test_cmp output - <<EOF
path0
EOF

ok 3 - git ls-files with path restriction.

expecting success: git ls-files --others -- path0 >output &&
	test_cmp output - <<EOF
path0
EOF

ok 4 - git ls-files with path restriction with --.

expecting success: git ls-files --others -- -- >output &&
	test_cmp output - <<EOF
--
EOF


ok 5 - git ls-files with path restriction with -- --.

expecting success: git ls-files --others -- >output &&
	test_cmp output - <<EOF
--
-foo
output
path0
EOF

ok 6 - git ls-files with no path restriction.

# passed all 6 test(s)
1..6

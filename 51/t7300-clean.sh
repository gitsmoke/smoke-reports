ok 1 - setup
ok 2 - git clean with skip-worktree .gitignore
ok 3 - git clean
ok 4 - git clean src/
ok 5 - git clean src/ src/
ok 6 - git clean with prefix
ok 7 - git clean with relative prefix
ok 8 - git clean with absolute path
ok 9 - git clean with out of work tree relative path
ok 10 - git clean with out of work tree absolute path
ok 11 - git clean -d with prefix and path
ok 12 - git clean symbolic link
ok 13 - git clean with wildcard
ok 14 - git clean -n
ok 15 - git clean -d
ok 16 - git clean -d src/ examples/
ok 17 - git clean -x
ok 18 - git clean -d -x
ok 19 - git clean -X
ok 20 - git clean -d -X
ok 21 - clean.requireForce defaults to true
ok 22 - clean.requireForce
ok 23 - clean.requireForce and -n
ok 24 - clean.requireForce and -f
ok 25 - core.excludesfile
ok 26 # skip removal failure (missing SANITY of SANITY)
ok 27 - nested git work tree
ok 28 - force removal of nested git work tree
not ok - 29 git clean -e
#	
#		rm -fr repo &&
#		mkdir repo &&
#		(
#			cd repo &&
#			git init &&
#			touch 1 2 3 known &&
#			git add known &&
#			git clean -f -e 1 -e 2 &&
#			test -e 1 &&
#			test -e 2 &&
#			! (test -e 3) &&
#			test -e known
#		)
#	
# failed 1 among 29 test(s)
1..29

ok 1 - setup
ok 2 - remote information for the origin
ok 3 - add another remote
ok 4 - remote forces tracking branches
ok 5 - remove remote
ok 6 - remove remote
not ok - 7 remove remote protects local branches
#	
#	(
#		cd test &&
#		{ cat >expect1 <<EOF
#	Note: A branch outside the refs/remotes/ hierarchy was not removed;
#	to delete it, use:
#	  git branch -d master
#	EOF
#		} &&
#		{ cat >expect2 <<EOF
#	Note: Some branches outside the refs/remotes/ hierarchy were not removed;
#	to delete them, use:
#	  git branch -d foobranch
#	  git branch -d master
#	EOF
#		} &&
#		git tag footag &&
#		git config --add remote.oops.fetch "+refs/*:refs/*" &&
#		git remote rm oops 2>actual1 &&
#		git branch foobranch &&
#		git config --add remote.oops.fetch "+refs/*:refs/*" &&
#		git remote rm oops 2>actual2 &&
#		git branch -d foobranch &&
#		git tag -d footag &&
#		test_cmp expect1 actual1 &&
#		test_cmp expect2 actual2
#	)
#	
ok 8 - show
ok 9 - show -n
ok 10 - prune
ok 11 - set-head --delete
ok 12 - set-head --auto
ok 13 - set-head --auto fails w/multiple HEADs
ok 14 - set-head explicit
ok 15 - prune --dry-run
ok 16 - add --mirror && prune
ok 17 - add alt && prune
ok 18 - add with reachable tags (default)
ok 19 - add --tags
ok 20 - add --no-tags
ok 21 - reject --no-no-tags
ok 22 - update
ok 23 - update with arguments
ok 24 - update --prune
ok 25 - update default
ok 26 - update default (overridden, with funny whitespace)
ok 27 - update (with remotes.default defined)
ok 28 - "remote show" does not show symbolic refs
ok 29 - reject adding remote with an invalid name
ok 30 - rename a remote
ok 31 - migrate a remote from named file in $GIT_DIR/remotes
ok 32 - migrate a remote from named file in $GIT_DIR/branches
ok 33 - remote prune to cause a dangling symref
ok 34 - show empty remote
ok 35 - remote set-branches requires a remote
ok 36 - remote set-branches
ok 37 - remote set-branches with --mirror
ok 38 - new remote
ok 39 - remote set-url bar
ok 40 - remote set-url baz bar
ok 41 - remote set-url zot bar
ok 42 - remote set-url --push zot baz
ok 43 - remote set-url --push zot
ok 44 - remote set-url --push qux zot
ok 45 - remote set-url --push foo qu+x
ok 46 - remote set-url --push --add aaa
ok 47 - remote set-url --push bar aaa
ok 48 - remote set-url --push --delete bar
ok 49 - remote set-url --push --delete foo
ok 50 - remote set-url --add bbb
ok 51 - remote set-url --delete .*
ok 52 - remote set-url --delete bbb
ok 53 - remote set-url --delete baz
ok 54 - remote set-url --add ccc
ok 55 - remote set-url --delete baz
# failed 1 among 55 test(s)
1..55

ok 1 - setup
ok 2 - pretty
ok 3 - pretty (tformat)
ok 4 - pretty (shortcut)
ok 5 - format
ok 6 - format %w(12,1,2)
ok 7 - format %w(,1,2)
ok 8 - oneline
not ok - 9 diff-filter=A
#	
#	
#		git log --pretty="format:%s" --diff-filter=A HEAD > actual &&
#		git log --pretty="format:%s" --diff-filter A HEAD > actual-separate &&
#		printf "fifth\nfourth\nthird\ninitial" > expect &&
#		test_cmp expect actual &&
#		test_cmp expect actual-separate
#	
#	
ok 10 - diff-filter=M
ok 11 - diff-filter=D
ok 12 - diff-filter=R
ok 13 - diff-filter=C
ok 14 - git log --follow
ok 15 - git log --no-walk <commits> sorts by commit time
ok 16 - git show <commits> leaves list of commits as given
ok 17 - setup case sensitivity tests
ok 18 - log --grep
not ok - 19 log --grep option parsing
#	
#		echo second >expect &&
#		git log -1 --pretty="tformat:%s" --grep sec >actual &&
#		test_cmp expect actual &&
#		test_must_fail git log -1 --pretty="tformat:%s" --grep
#	
ok 20 - log -i --grep
ok 21 - log --grep -i
ok 22 - simple log --graph
ok 23 - set up merge history
ok 24 - log --graph with merge
ok 25 - log --graph with full output
ok 26 - set up more tangled history
ok 27 - log --graph with merge
ok 28 - log.decorate configuration
not ok - 29 show added path under "--follow -M"
#	
#		# This tests for a regression introduced in v1.7.2-rc0~103^2~2
#		test_create_repo regression &&
#		(
#			cd regression &&
#			test_commit needs-another-commit &&
#			test_commit foo.bar &&
#			git log -M --follow -p foo.bar.t &&
#			git log -M --follow --stat foo.bar.t &&
#			git log -M --follow --name-only foo.bar.t
#		)
#	
# failed 3 among 29 test(s)
1..29

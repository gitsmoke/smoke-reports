ok 1 - set up test data and helpers
ok 2 - setup
ok 3 - test option parsing
ok 4 - merge -h with invalid index
ok 5 - reject non-strategy with a git-merge-foo name
ok 6 - merge c0 with c1
ok 7 - merge c0 with c1 with --ff-only
ok 8 - merge from unborn branch
ok 9 - merge c1 with c2
ok 10 - merge c1 with c2 and c3
ok 11 - failing merges with --ff-only
ok 12 - merge c0 with c1 (no-commit)
ok 13 - merge c1 with c2 (no-commit)
ok 14 - merge c1 with c2 and c3 (no-commit)
ok 15 - merge c0 with c1 (squash)
ok 16 - merge c0 with c1 (squash, ff-only)
ok 17 - merge c1 with c2 (squash)
ok 18 - unsuccesful merge of c1 with c2 (squash, ff-only)
ok 19 - merge c1 with c2 and c3 (squash)
not ok - 20 merge c1 with c2 (no-commit in config)
#	
#		git reset --hard c1 &&
#		git config branch.master.mergeoptions "--no-commit" &&
#		git merge c2 &&
#		verify_merge file result.1-5 &&
#		verify_head $c1 &&
#		verify_mergeheads $c2
#	
not ok - 21 merge c1 with c2 (log in config)
#	
#		git config branch.master.mergeoptions "" &&
#		git reset --hard c1 &&
#		git merge --log c2 &&
#		git show -s --pretty=tformat:%s%n%b >expect &&
#	
#		git config branch.master.mergeoptions --log &&
#		git reset --hard c1 &&
#		git merge c2 &&
#		git show -s --pretty=tformat:%s%n%b >actual &&
#	
#		test_cmp expect actual
#	
not ok - 22 merge c1 with c2 (log in config gets overridden)
#	
#		(
#			git config --remove-section branch.master
#			git config --remove-section merge
#		)
#		git reset --hard c1 &&
#		git merge c2 &&
#		git show -s --pretty=tformat:%s%n%b >expect &&
#	
#		git config branch.master.mergeoptions "--no-log" &&
#		git config merge.log true &&
#		git reset --hard c1 &&
#		git merge c2 &&
#		git show -s --pretty=tformat:%s%n%b >actual &&
#	
#		test_cmp expect actual
#	
not ok - 23 merge c1 with c2 (squash in config)
#	
#		git reset --hard c1 &&
#		git config branch.master.mergeoptions "--squash" &&
#		git merge c2 &&
#		verify_merge file result.1-5 &&
#		verify_head $c1 &&
#		verify_no_mergehead &&
#		test_cmp squash.1-5 .git/SQUASH_MSG
#	
not ok - 24 override config option -n with --summary
#	
#		git reset --hard c1 &&
#		git config branch.master.mergeoptions "-n" &&
#		test_tick &&
#		git merge --summary c2 >diffstat.txt &&
#		verify_merge file result.1-5 msg.1-5 &&
#		verify_parents $c1 $c2 &&
#		if ! grep "^ file |  *2 +-$" diffstat.txt
#		then
#			echo "[OOPS] diffstat was not generated with --summary"
#			false
#		fi
#	
not ok - 25 override config option -n with --stat
#	
#		git reset --hard c1 &&
#		git config branch.master.mergeoptions "-n" &&
#		test_tick &&
#		git merge --stat c2 >diffstat.txt &&
#		verify_merge file result.1-5 msg.1-5 &&
#		verify_parents $c1 $c2 &&
#		if ! grep "^ file |  *2 +-$" diffstat.txt
#		then
#			echo "[OOPS] diffstat was not generated with --stat"
#			false
#		fi
#	
not ok - 26 override config option --stat
#	
#		git reset --hard c1 &&
#		git config branch.master.mergeoptions "--stat" &&
#		test_tick &&
#		git merge -n c2 >diffstat.txt &&
#		verify_merge file result.1-5 msg.1-5 &&
#		verify_parents $c1 $c2 &&
#		if grep "^ file |  *2 +-$" diffstat.txt
#		then
#			echo "[OOPS] diffstat was generated"
#			false
#		fi
#	
not ok - 27 merge c1 with c2 (override --no-commit)
#	
#		git reset --hard c1 &&
#		git config branch.master.mergeoptions "--no-commit" &&
#		test_tick &&
#		git merge --commit c2 &&
#		verify_merge file result.1-5 msg.1-5 &&
#		verify_parents $c1 $c2
#	
not ok - 28 merge c1 with c2 (override --squash)
#	
#		git reset --hard c1 &&
#		git config branch.master.mergeoptions "--squash" &&
#		test_tick &&
#		git merge --no-squash c2 &&
#		verify_merge file result.1-5 msg.1-5 &&
#		verify_parents $c1 $c2
#	
not ok - 29 merge c0 with c1 (no-ff)
#	
#		git reset --hard c0 &&
#		git config branch.master.mergeoptions "" &&
#		test_tick &&
#		git merge --no-ff c1 &&
#		verify_merge file result.1 &&
#		verify_parents $c0 $c1
#	
not ok - 30 combining --squash and --no-ff is refused
#	
#		test_must_fail git merge --squash --no-ff c1 &&
#		test_must_fail git merge --no-ff --squash c1
#	
not ok - 31 combining --ff-only and --no-ff is refused
#	
#		test_must_fail git merge --ff-only --no-ff c1 &&
#		test_must_fail git merge --no-ff --ff-only c1
#	
not ok - 32 merge c0 with c1 (ff overrides no-ff)
#	
#		git reset --hard c0 &&
#		git config branch.master.mergeoptions "--no-ff" &&
#		git merge --ff c1 &&
#		verify_merge file result.1 &&
#		verify_head $c1
#	
not ok - 33 merge log message
#	
#		git reset --hard c0 &&
#		git merge --no-log c2 &&
#		git show -s --pretty=format:%b HEAD >msg.act &&
#		test_cmp msg.nolog msg.act &&
#	
#		git merge --log c3 &&
#		git show -s --pretty=format:%b HEAD >msg.act &&
#		test_cmp msg.log msg.act &&
#	
#		git reset --hard HEAD^ &&
#		git config merge.log yes &&
#		git merge c3 &&
#		git show -s --pretty=format:%b HEAD >msg.act &&
#		test_cmp msg.log msg.act
#	
not ok - 34 merge c1 with c0, c2, c0, and c1
#	
#	       git reset --hard c1 &&
#	       git config branch.master.mergeoptions "" &&
#	       test_tick &&
#	       git merge c0 c2 c0 c1 &&
#	       verify_merge file result.1-5 &&
#	       verify_parents $c1 $c2
#	
not ok - 35 merge c1 with c0, c2, c0, and c1
#	
#	       git reset --hard c1 &&
#	       git config branch.master.mergeoptions "" &&
#	       test_tick &&
#	       git merge c0 c2 c0 c1 &&
#	       verify_merge file result.1-5 &&
#	       verify_parents $c1 $c2
#	
not ok - 36 merge c1 with c1 and c2
#	
#	       git reset --hard c1 &&
#	       git config branch.master.mergeoptions "" &&
#	       test_tick &&
#	       git merge c1 c2 &&
#	       verify_merge file result.1-5 &&
#	       verify_parents $c1 $c2
#	
not ok - 37 merge fast-forward in a dirty tree
#	
#	       git reset --hard c0 &&
#	       mv file file1 &&
#	       cat file1 >file &&
#	       rm -f file1 &&
#	       git merge c2
#	
not ok - 38 in-index merge
#	
#		git reset --hard c0 &&
#		git merge --no-ff -s resolve c1 >out &&
#		test_i18ngrep "Wonderful." out &&
#		verify_parents $c0 $c1
#	
not ok - 39 refresh the index before merging
#	
#		git reset --hard c1 &&
#		cp file file.n && mv -f file.n file &&
#		git merge c3
#	
not ok - 40 merge early part of c2
#	
#		git reset --hard c3 &&
#		echo c4 >c4.c &&
#		git add c4.c &&
#		git commit -m c4 &&
#		git tag c4 &&
#		echo c5 >c5.c &&
#		git add c5.c &&
#		git commit -m c5 &&
#		git tag c5 &&
#		git reset --hard c3 &&
#		echo c6 >c6.c &&
#		git add c6.c &&
#		git commit -m c6 &&
#		git tag c6 &&
#		git branch -f c5-branch c5 &&
#		git merge c5-branch~1 &&
#		git show -s --pretty=format:%s HEAD >actual.branch &&
#		git reset --keep HEAD^ &&
#		git merge c5~1 &&
#		git show -s --pretty=format:%s HEAD >actual.tag &&
#		test_cmp expected.branch actual.branch &&
#		test_cmp expected.tag actual.tag
#	
not ok - 41 merge --no-ff --no-commit && commit
#	
#		git reset --hard c0 &&
#		git merge --no-ff --no-commit c1 &&
#		EDITOR=: git commit &&
#		verify_parents $c0 $c1
#	
not ok - 42 amending no-ff merge commit
#	
#		EDITOR=: git commit --amend &&
#		verify_parents $c0 $c1
#	
# failed 23 among 42 test(s)
1..42

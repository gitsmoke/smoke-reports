ok 1 - setup
ok 2 - git diff --raw HEAD
ok 3 - git diff-index --raw HEAD
ok 4 - git diff-files --raw
ok 5 - git diff HEAD
ok 6 - git diff HEAD with dirty submodule (work tree)
ok 7 - git diff HEAD with dirty submodule (index)
ok 8 - git diff HEAD with dirty submodule (untracked)
not ok - 9 git diff HEAD with dirty submodule (work tree, refs match)
#	
#		git commit -m "x" sub &&
#		echo >>sub/world &&
#		git diff HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subprev $subprev-dirty &&
#		test_cmp expect.body actual.body &&
#		git diff --ignore-submodules HEAD >actual2 &&
#		! test -s actual2 &&
#		git diff --ignore-submodules=untracked HEAD >actual3 &&
#		sed -e "1,/^@@/d" actual3 >actual3.body &&
#		expect_from_to >expect.body $subprev $subprev-dirty &&
#		test_cmp expect.body actual3.body &&
#		git diff --ignore-submodules=dirty HEAD >actual4 &&
#		! test -s actual4
#	
not ok - 10 git diff HEAD with dirty submodule (work tree, refs match) [.git/config]
#	
#		git config diff.ignoreSubmodules all &&
#		git diff HEAD >actual &&
#		! test -s actual &&
#		git config submodule.subname.ignore none &&
#		git config submodule.subname.path sub &&
#		git diff HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subprev $subprev-dirty &&
#		test_cmp expect.body actual.body &&
#		git config submodule.subname.ignore all &&
#		git diff HEAD >actual2 &&
#		! test -s actual2 &&
#		git config submodule.subname.ignore untracked &&
#		git diff HEAD >actual3 &&
#		sed -e "1,/^@@/d" actual3 >actual3.body &&
#		expect_from_to >expect.body $subprev $subprev-dirty &&
#		test_cmp expect.body actual3.body &&
#		git config submodule.subname.ignore dirty &&
#		git diff HEAD >actual4 &&
#		! test -s actual4 &&
#		git diff HEAD --ignore-submodules=none >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subprev $subprev-dirty &&
#		test_cmp expect.body actual.body &&
#		git config --remove-section submodule.subname &&
#		git config --unset diff.ignoreSubmodules
#	
not ok - 11 git diff HEAD with dirty submodule (work tree, refs match) [.gitmodules]
#	
#		git config diff.ignoreSubmodules dirty &&
#		git diff HEAD >actual &&
#		! test -s actual &&
#		git config --add -f .gitmodules submodule.subname.ignore none &&
#		git config --add -f .gitmodules submodule.subname.path sub &&
#		git diff HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subprev $subprev-dirty &&
#		test_cmp expect.body actual.body &&
#		git config -f .gitmodules submodule.subname.ignore all &&
#		git config -f .gitmodules submodule.subname.path sub &&
#		git diff HEAD >actual2 &&
#		! test -s actual2 &&
#		git config -f .gitmodules submodule.subname.ignore untracked &&
#		git diff HEAD >actual3 &&
#		sed -e "1,/^@@/d" actual3 >actual3.body &&
#		expect_from_to >expect.body $subprev $subprev-dirty &&
#		test_cmp expect.body actual3.body &&
#		git config -f .gitmodules submodule.subname.ignore dirty &&
#		git diff HEAD >actual4 &&
#		! test -s actual4 &&
#		git config submodule.subname.ignore none &&
#		git config submodule.subname.path sub &&
#		git diff HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subprev $subprev-dirty &&
#		test_cmp expect.body actual.body &&
#		git config --remove-section submodule.subname &&
#		git config --remove-section -f .gitmodules submodule.subname &&
#		git config --unset diff.ignoreSubmodules &&
#		rm .gitmodules
#	
ok 12 - git diff HEAD with dirty submodule (index, refs match)
not ok - 13 git diff HEAD with dirty submodule (untracked, refs match)
#	
#		(
#			cd sub &&
#			git reset --hard &&
#			git clean -qfdx &&
#			>cruft
#		) &&
#		git diff HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subprev $subprev-dirty &&
#		test_cmp expect.body actual.body &&
#		git diff --ignore-submodules=all HEAD >actual2 &&
#		! test -s actual2 &&
#		git diff --ignore-submodules=untracked HEAD >actual3 &&
#		! test -s actual3 &&
#		git diff --ignore-submodules=dirty HEAD >actual4 &&
#		! test -s actual4
#	
not ok - 14 git diff HEAD with dirty submodule (untracked, refs match) [.git/config]
#	
#		git config submodule.subname.ignore all &&
#		git config submodule.subname.path sub &&
#		git diff HEAD >actual2 &&
#		! test -s actual2 &&
#		git config submodule.subname.ignore untracked &&
#		git diff HEAD >actual3 &&
#		! test -s actual3 &&
#		git config submodule.subname.ignore dirty &&
#		git diff HEAD >actual4 &&
#		! test -s actual4 &&
#		git diff --ignore-submodules=none HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subprev $subprev-dirty &&
#		test_cmp expect.body actual.body &&
#		git config --remove-section submodule.subname
#	
not ok - 15 git diff HEAD with dirty submodule (untracked, refs match) [.gitmodules]
#	
#		git config --add -f .gitmodules submodule.subname.ignore all &&
#		git config --add -f .gitmodules submodule.subname.path sub &&
#		git diff HEAD >actual2 &&
#		! test -s actual2 &&
#		git config -f .gitmodules submodule.subname.ignore untracked &&
#		git diff HEAD >actual3 &&
#		! test -s actual3 &&
#		git config -f .gitmodules submodule.subname.ignore dirty &&
#		git diff HEAD >actual4 &&
#		! test -s actual4 &&
#		git config submodule.subname.ignore none &&
#		git config submodule.subname.path sub &&
#		git diff HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subprev $subprev-dirty &&
#		test_cmp expect.body actual.body &&
#		git config --remove-section submodule.subname &&
#		git config --remove-section -f .gitmodules submodule.subname &&
#		rm .gitmodules
#	
not ok - 16 git diff between submodule commits
#	
#		git diff HEAD^..HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subtip $subprev &&
#		test_cmp expect.body actual.body &&
#		git diff --ignore-submodules=dirty HEAD^..HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subtip $subprev &&
#		test_cmp expect.body actual.body &&
#		git diff --ignore-submodules HEAD^..HEAD >actual &&
#		! test -s actual
#	
not ok - 17 git diff between submodule commits [.git/config]
#	
#		git diff HEAD^..HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subtip $subprev &&
#		test_cmp expect.body actual.body &&
#		git config submodule.subname.ignore dirty &&
#		git config submodule.subname.path sub &&
#		git diff HEAD^..HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subtip $subprev &&
#		test_cmp expect.body actual.body &&
#		git config submodule.subname.ignore all &&
#		git diff HEAD^..HEAD >actual &&
#		! test -s actual &&
#		git diff --ignore-submodules=dirty HEAD^..HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subtip $subprev &&
#		git config --remove-section submodule.subname
#	
not ok - 18 git diff between submodule commits [.gitmodules]
#	
#		git diff HEAD^..HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subtip $subprev &&
#		test_cmp expect.body actual.body &&
#		git config --add -f .gitmodules submodule.subname.ignore dirty &&
#		git config --add -f .gitmodules submodule.subname.path sub &&
#		git diff HEAD^..HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subtip $subprev &&
#		test_cmp expect.body actual.body &&
#		git config -f .gitmodules submodule.subname.ignore all &&
#		git diff HEAD^..HEAD >actual &&
#		! test -s actual &&
#		git config submodule.subname.ignore dirty &&
#		git config submodule.subname.path sub &&
#		git diff  HEAD^..HEAD >actual &&
#		sed -e "1,/^@@/d" actual >actual.body &&
#		expect_from_to >expect.body $subtip $subprev &&
#		git config --remove-section submodule.subname &&
#		git config --remove-section -f .gitmodules submodule.subname &&
#		rm .gitmodules
#	
ok 19 - git diff (empty submodule dir)
ok 20 - conflicted submodule setup
ok 21 - combined (empty submodule)
ok 22 - combined (with submodule)
# failed 9 among 22 test(s)
1..22

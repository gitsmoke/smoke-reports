Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4027-diff-submodule/.git/
expecting success: 
	test_tick &&
	test_create_repo sub &&
	(
		cd sub &&
		echo hello >world &&
		git add world &&
		git commit -m submodule
	) &&

	test_tick &&
	echo frotz >nitfol &&
	git add nitfol sub &&
	git commit -m superproject &&

	(
		cd sub &&
		echo goodbye >world &&
		git add world &&
		git commit -m "submodule #2"
	) &&

	set x $(
		cd sub &&
		git rev-list HEAD
	) &&
	echo ":160000 160000 $3 $_z40 M	sub" >expect &&
	subtip=$3 subprev=$2
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4027-diff-submodule/sub/.git/
[master (root-commit) 4431e0b] submodule
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 world
[master (root-commit) 5b035b6] superproject
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 nitfol
 create mode 160000 sub
[master 2dd69d6] submodule #2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	git diff --raw --abbrev=40 HEAD >actual &&
	test_cmp expect actual

ok 2 - git diff --raw HEAD

expecting success: 
	git diff-index --raw HEAD >actual.index &&
	test_cmp expect actual.index

ok 3 - git diff-index --raw HEAD

expecting success: 
	git diff-files --raw >actual.files &&
	test_cmp expect actual.files

ok 4 - git diff-files --raw

expecting success: 
	git diff HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subtip $subprev &&
	test_cmp expect.body actual.body

ok 5 - git diff HEAD

expecting success: 
	echo >>sub/world &&
	git diff HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subtip $subprev-dirty &&
	test_cmp expect.body actual.body

ok 6 - git diff HEAD with dirty submodule (work tree)

expecting success: 
	(
		cd sub &&
		git reset --hard &&
		echo >>world &&
		git add world
	) &&
	git diff HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subtip $subprev-dirty &&
	test_cmp expect.body actual.body
HEAD is now at 2dd69d6 submodule #2
ok 7 - git diff HEAD with dirty submodule (index)
expecting success: 
	(
		cd sub &&
		git reset --hard &&
		git clean -qfdx &&
		>cruft
	) &&
	git diff HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subtip $subprev-dirty &&
	test_cmp expect.body actual.body
HEAD is now at 2dd69d6 submodule #2
ok 8 - git diff HEAD with dirty submodule (untracked)
expecting success: 
	git commit -m "x" sub &&
	echo >>sub/world &&
	git diff HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subprev $subprev-dirty &&
	test_cmp expect.body actual.body &&
	git diff --ignore-submodules HEAD >actual2 &&
	! test -s actual2 &&
	git diff --ignore-submodules=untracked HEAD >actual3 &&
	sed -e "1,/^@@/d" actual3 >actual3.body &&
	expect_from_to >expect.body $subprev $subprev-dirty &&
	test_cmp expect.body actual3.body &&
	git diff --ignore-submodules=dirty HEAD >actual4 &&
	! test -s actual4
[master e6ee575] x
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 9 - git diff HEAD with dirty submodule (work tree, refs match)
expecting success: 
	git config diff.ignoreSubmodules all &&
	git diff HEAD >actual &&
	! test -s actual &&
	git config submodule.subname.ignore none &&
	git config submodule.subname.path sub &&
	git diff HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subprev $subprev-dirty &&
	test_cmp expect.body actual.body &&
	git config submodule.subname.ignore all &&
	git diff HEAD >actual2 &&
	! test -s actual2 &&
	git config submodule.subname.ignore untracked &&
	git diff HEAD >actual3 &&
	sed -e "1,/^@@/d" actual3 >actual3.body &&
	expect_from_to >expect.body $subprev $subprev-dirty &&
	test_cmp expect.body actual3.body &&
	git config submodule.subname.ignore dirty &&
	git diff HEAD >actual4 &&
	! test -s actual4 &&
	git diff HEAD --ignore-submodules=none >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subprev $subprev-dirty &&
	test_cmp expect.body actual.body &&
	git config --remove-section submodule.subname &&
	git config --unset diff.ignoreSubmodules

ok 10 - git diff HEAD with dirty submodule (work tree, refs match) [.git/config]

expecting success: 
	git config diff.ignoreSubmodules dirty &&
	git diff HEAD >actual &&
	! test -s actual &&
	git config --add -f .gitmodules submodule.subname.ignore none &&
	git config --add -f .gitmodules submodule.subname.path sub &&
	git diff HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subprev $subprev-dirty &&
	test_cmp expect.body actual.body &&
	git config -f .gitmodules submodule.subname.ignore all &&
	git config -f .gitmodules submodule.subname.path sub &&
	git diff HEAD >actual2 &&
	! test -s actual2 &&
	git config -f .gitmodules submodule.subname.ignore untracked &&
	git diff HEAD >actual3 &&
	sed -e "1,/^@@/d" actual3 >actual3.body &&
	expect_from_to >expect.body $subprev $subprev-dirty &&
	test_cmp expect.body actual3.body &&
	git config -f .gitmodules submodule.subname.ignore dirty &&
	git diff HEAD >actual4 &&
	! test -s actual4 &&
	git config submodule.subname.ignore none &&
	git config submodule.subname.path sub &&
	git diff HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subprev $subprev-dirty &&
	test_cmp expect.body actual.body &&
	git config --remove-section submodule.subname &&
	git config --remove-section -f .gitmodules submodule.subname &&
	git config --unset diff.ignoreSubmodules &&
	rm .gitmodules

ok 11 - git diff HEAD with dirty submodule (work tree, refs match) [.gitmodules]

expecting success: 
	(
		cd sub &&
		git reset --hard &&
		echo >>world &&
		git add world
	) &&
	git diff HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subprev $subprev-dirty &&
	test_cmp expect.body actual.body
HEAD is now at 2dd69d6 submodule #2
ok 12 - git diff HEAD with dirty submodule (index, refs match)
expecting success: 
	(
		cd sub &&
		git reset --hard &&
		git clean -qfdx &&
		>cruft
	) &&
	git diff HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subprev $subprev-dirty &&
	test_cmp expect.body actual.body &&
	git diff --ignore-submodules=all HEAD >actual2 &&
	! test -s actual2 &&
	git diff --ignore-submodules=untracked HEAD >actual3 &&
	! test -s actual3 &&
	git diff --ignore-submodules=dirty HEAD >actual4 &&
	! test -s actual4
HEAD is now at 2dd69d6 submodule #2
ok 13 - git diff HEAD with dirty submodule (untracked, refs match)
expecting success: 
	git config submodule.subname.ignore all &&
	git config submodule.subname.path sub &&
	git diff HEAD >actual2 &&
	! test -s actual2 &&
	git config submodule.subname.ignore untracked &&
	git diff HEAD >actual3 &&
	! test -s actual3 &&
	git config submodule.subname.ignore dirty &&
	git diff HEAD >actual4 &&
	! test -s actual4 &&
	git diff --ignore-submodules=none HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subprev $subprev-dirty &&
	test_cmp expect.body actual.body &&
	git config --remove-section submodule.subname

ok 14 - git diff HEAD with dirty submodule (untracked, refs match) [.git/config]

expecting success: 
	git config --add -f .gitmodules submodule.subname.ignore all &&
	git config --add -f .gitmodules submodule.subname.path sub &&
	git diff HEAD >actual2 &&
	! test -s actual2 &&
	git config -f .gitmodules submodule.subname.ignore untracked &&
	git diff HEAD >actual3 &&
	! test -s actual3 &&
	git config -f .gitmodules submodule.subname.ignore dirty &&
	git diff HEAD >actual4 &&
	! test -s actual4 &&
	git config submodule.subname.ignore none &&
	git config submodule.subname.path sub &&
	git diff HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subprev $subprev-dirty &&
	test_cmp expect.body actual.body &&
	git config --remove-section submodule.subname &&
	git config --remove-section -f .gitmodules submodule.subname &&
	rm .gitmodules

ok 15 - git diff HEAD with dirty submodule (untracked, refs match) [.gitmodules]

expecting success: 
	git diff HEAD^..HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subtip $subprev &&
	test_cmp expect.body actual.body &&
	git diff --ignore-submodules=dirty HEAD^..HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subtip $subprev &&
	test_cmp expect.body actual.body &&
	git diff --ignore-submodules HEAD^..HEAD >actual &&
	! test -s actual

ok 16 - git diff between submodule commits

expecting success: 
	git diff HEAD^..HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subtip $subprev &&
	test_cmp expect.body actual.body &&
	git config submodule.subname.ignore dirty &&
	git config submodule.subname.path sub &&
	git diff HEAD^..HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subtip $subprev &&
	test_cmp expect.body actual.body &&
	git config submodule.subname.ignore all &&
	git diff HEAD^..HEAD >actual &&
	! test -s actual &&
	git diff --ignore-submodules=dirty HEAD^..HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subtip $subprev &&
	git config --remove-section submodule.subname

ok 17 - git diff between submodule commits [.git/config]

expecting success: 
	git diff HEAD^..HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subtip $subprev &&
	test_cmp expect.body actual.body &&
	git config --add -f .gitmodules submodule.subname.ignore dirty &&
	git config --add -f .gitmodules submodule.subname.path sub &&
	git diff HEAD^..HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subtip $subprev &&
	test_cmp expect.body actual.body &&
	git config -f .gitmodules submodule.subname.ignore all &&
	git diff HEAD^..HEAD >actual &&
	! test -s actual &&
	git config submodule.subname.ignore dirty &&
	git config submodule.subname.path sub &&
	git diff  HEAD^..HEAD >actual &&
	sed -e "1,/^@@/d" actual >actual.body &&
	expect_from_to >expect.body $subtip $subprev &&
	git config --remove-section submodule.subname &&
	git config --remove-section -f .gitmodules submodule.subname &&
	rm .gitmodules

ok 18 - git diff between submodule commits [.gitmodules]

expecting success: 
	: >empty &&
	rm -rf sub/* sub/.git &&
	git diff > actual.empty &&
	test_cmp empty actual.empty

ok 19 - git diff (empty submodule dir)

expecting success: 

	# 39 efs
	c=fffffffffffffffffffffffffffffffffffffff &&
	(
		echo "000000 $_z40 0	sub" &&
		echo "160000 1$c 1	sub" &&
		echo "160000 2$c 2	sub" &&
		echo "160000 3$c 3	sub"
	) | git update-index --index-info &&
	echo >expect.nosub 'diff --cc sub
index 2ffffff,3ffffff..0000000
--- a/sub
+++ b/sub
@@@ -1,1 -1,1 +1,1 @@@
- Subproject commit 2fffffffffffffffffffffffffffffffffffffff
 -Subproject commit 3fffffffffffffffffffffffffffffffffffffff
++Subproject commit 0000000000000000000000000000000000000000' &&

	hh=$(git rev-parse HEAD) &&
	sed -e "s/$_z40/$hh/" expect.nosub >expect.withsub

ok 20 - conflicted submodule setup

expecting success: 
	rm -fr sub && mkdir sub &&
	git diff >actual &&
	test_cmp expect.nosub actual

ok 21 - combined (empty submodule)

expecting success: 
	rm -fr sub &&
	git clone --no-checkout . sub &&
	git diff >actual &&
	test_cmp expect.withsub actual
Cloning into sub...
done.
ok 22 - combined (with submodule)
# passed all 22 test(s)
1..22

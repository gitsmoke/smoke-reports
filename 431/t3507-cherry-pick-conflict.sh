Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3507-cherry-pick-conflict/.git/
expecting success: 

	echo unrelated >unrelated &&
	git add unrelated &&
	test_commit initial foo a &&
	test_commit base foo b &&
	test_commit picked foo c &&
	git config advice.detachedhead false


[master (root-commit) df2a63d] initial
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 foo
 create mode 100644 unrelated
[master dc0113b] base
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 7e6d412] picked
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 

	git checkout -f initial^0 &&
	git read-tree -u --reset HEAD &&
	git clean -d -f -f -q -x &&

	git update-index --refresh &&
	git diff-index --exit-code HEAD &&

	head=$(git rev-parse HEAD) &&
	test_must_fail git cherry-pick picked &&
	newhead=$(git rev-parse HEAD) &&

	test "$head" = "$newhead"

Auto-merging foo
CONFLICT (content): Merge conflict in foo

ok 2 - failed cherry-pick does not advance HEAD

expecting success: 
	git checkout -f initial^0 &&
	git read-tree -u --reset HEAD &&
	git clean -d -f -f -q -x &&

	git update-index --refresh &&
	git diff-index --exit-code HEAD &&

	picked=$(git rev-parse --short picked) &&
	cat <<-EOF >expected &&
	error: could not apply $picked... picked
	hint: after resolving the conflicts, mark the corrected paths
	hint: with 'git add <paths>' or 'git rm <paths>'
	hint: and commit the result with 'git commit -c $picked'
	EOF
	test_must_fail git cherry-pick picked 2>actual &&

	test_cmp expected actual
Auto-merging foo
CONFLICT (content): Merge conflict in foo

ok 3 - advice from failed cherry-pick

expecting success: 

	git checkout -f initial^0 &&
	git read-tree -u --reset HEAD &&
	git clean -d -f -f -q -x &&

	git update-index --refresh &&
	git diff-index --exit-code HEAD &&

	test_must_fail git cherry-pick picked &&

	test_must_fail git update-index --refresh -q &&
	test_must_fail git diff-index --exit-code HEAD

Auto-merging foo
CONFLICT (content): Merge conflict in foo
foo: needs merge
:100644 100644 78981922613b2afb6025042ff6bd878ac1994e85 0000000000000000000000000000000000000000 M	foo

ok 4 - failed cherry-pick produces dirty index

expecting success: 

	git read-tree -u --reset HEAD &&
	git clean -d -f -f -q -x &&
	{
		git checkout base -- foo &&
		git ls-files --stage foo &&
		git checkout initial -- foo &&
		git ls-files --stage foo &&
		git checkout picked -- foo &&
		git ls-files --stage foo
	} > stages &&
	sed "
		1 s/ 0	/ 1	/
		2 s/ 0	/ 2	/
		3 s/ 0	/ 3	/
	" < stages > expected &&
	git checkout -f initial^0 &&

	git update-index --refresh &&
	git diff-index --exit-code HEAD &&

	test_must_fail git cherry-pick picked &&
	git ls-files --stage --unmerged > actual &&

	test_cmp expected actual

Auto-merging foo
CONFLICT (content): Merge conflict in foo

ok 5 - failed cherry-pick registers participants in index

expecting success: 

	git checkout -f initial^0 &&
	git read-tree -u --reset HEAD &&
	git clean -d -f -f -q -x &&
	cat <<-EOF > expected &&
	<<<<<<< HEAD
	a
	=======
	c
	>>>>>>> objid picked
	EOF

	git update-index --refresh &&
	git diff-index --exit-code HEAD &&

	test_must_fail git cherry-pick picked &&

	sed "s/[a-f0-9]*\.\.\./objid/" foo > actual &&
	test_cmp expected actual

Auto-merging foo
CONFLICT (content): Merge conflict in foo

ok 6 - failed cherry-pick describes conflict in work tree

expecting success: 

	git config merge.conflictstyle diff3 &&
	git checkout -f initial^0 &&
	git read-tree -u --reset HEAD &&
	git clean -d -f -f -q -x &&
	cat <<-EOF > expected &&
	<<<<<<< HEAD
	a
	||||||| parent of objid picked
	b
	=======
	c
	>>>>>>> objid picked
	EOF

	git update-index --refresh &&
	git diff-index --exit-code HEAD &&

	test_must_fail git cherry-pick picked &&

	sed "s/[a-f0-9]*\.\.\./objid/" foo > actual &&
	test_cmp expected actual

Auto-merging foo
CONFLICT (content): Merge conflict in foo

ok 7 - diff3 -m style

expecting success: 

	git config --unset merge.conflictstyle &&
	git read-tree -u --reset HEAD &&
	git clean -d -f -f -q -x &&
	cat <<-EOF > expected &&
	<<<<<<< HEAD
	a
	=======
	b
	>>>>>>> parent of objid picked
	EOF
	{
		git checkout picked -- foo &&
		git ls-files --stage foo &&
		git checkout initial -- foo &&
		git ls-files --stage foo &&
		git checkout base -- foo &&
		git ls-files --stage foo
	} > stages &&
	sed "
		1 s/ 0	/ 1	/
		2 s/ 0	/ 2	/
		3 s/ 0	/ 3	/
	" < stages > expected-stages &&
	git checkout -f initial^0 &&

	git update-index --refresh &&
	git diff-index --exit-code HEAD &&

	head=$(git rev-parse HEAD) &&
	test_must_fail git revert picked &&
	newhead=$(git rev-parse HEAD) &&
	git ls-files --stage --unmerged > actual-stages &&

	test "$head" = "$newhead" &&
	test_must_fail git update-index --refresh -q &&
	test_must_fail git diff-index --exit-code HEAD &&
	test_cmp expected-stages actual-stages &&
	sed "s/[a-f0-9]*\.\.\./objid/" foo > actual &&
	test_cmp expected actual
Auto-merging foo
CONFLICT (content): Merge conflict in foo
foo: needs merge
:100644 100644 78981922613b2afb6025042ff6bd878ac1994e85 0000000000000000000000000000000000000000 M	foo

ok 8 - revert also handles conflicts sanely

expecting success: 
	git config merge.conflictstyle diff3 &&
	git checkout -f initial^0 &&
	git read-tree -u --reset HEAD &&
	git clean -d -f -f -q -x &&
	cat <<-EOF > expected &&
	<<<<<<< HEAD
	a
	||||||| objid picked
	c
	=======
	b
	>>>>>>> parent of objid picked
	EOF

	git update-index --refresh &&
	git diff-index --exit-code HEAD &&

	test_must_fail git revert picked &&

	sed "s/[a-f0-9]*\.\.\./objid/" foo > actual &&
	test_cmp expected actual

Auto-merging foo
CONFLICT (content): Merge conflict in foo

ok 9 - revert conflict, diff3 -m style

# passed all 9 test(s)
1..9

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3508-cherry-pick-many-commits/.git/
expecting success: 
	echo first > file1 &&
	git add file1 &&
	test_tick &&
	git commit -m "first" &&
	git tag first &&

	git checkout -b other &&
	for val in second third fourth
	do
		echo $val >> file1 &&
		git add file1 &&
		test_tick &&
		git commit -m "$val" &&
		git tag $val
	done

[master (root-commit) 0c72e4f] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1
[other 453a047] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[other e85abe2] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[other 94d3184] fourth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 
	cat <<-\EOF >expected &&
	[master OBJID] second
	 Author: A U Thor <author@example.com>
	 1 files changed, 1 insertions(+), 0 deletions(-)
	[master OBJID] third
	 Author: A U Thor <author@example.com>
	 1 files changed, 1 insertions(+), 0 deletions(-)
	[master OBJID] fourth
	 Author: A U Thor <author@example.com>
	 1 files changed, 1 insertions(+), 0 deletions(-)
	EOF

	git checkout -f master &&
	git reset --hard first &&
	test_tick &&
	git cherry-pick first..fourth >actual &&
	git diff --quiet other &&
	git diff --quiet HEAD other &&

	sed -e "s/$_x05[0-9a-f][0-9a-f]/OBJID/" <actual >actual.fuzzy &&
	test_cmp expected actual.fuzzy &&
	check_head_differs_from fourth

HEAD is now at 0c72e4f first

ok 2 - cherry-pick first..fourth works

expecting success: 
	cat <<-\EOF >expected &&
	Trying simple merge.
	[master OBJID] second
	 Author: A U Thor <author@example.com>
	 1 files changed, 1 insertions(+), 0 deletions(-)
	Trying simple merge.
	[master OBJID] third
	 Author: A U Thor <author@example.com>
	 1 files changed, 1 insertions(+), 0 deletions(-)
	Trying simple merge.
	[master OBJID] fourth
	 Author: A U Thor <author@example.com>
	 1 files changed, 1 insertions(+), 0 deletions(-)
	EOF

	git checkout -f master &&
	git reset --hard first &&
	test_tick &&
	git cherry-pick --strategy resolve first..fourth >actual &&
	git diff --quiet other &&
	git diff --quiet HEAD other &&
	sed -e "s/$_x05[0-9a-f][0-9a-f]/OBJID/" <actual >actual.fuzzy &&
	test_cmp expected actual.fuzzy &&
	check_head_differs_from fourth

HEAD is now at 0c72e4f first

ok 3 - cherry-pick --strategy resolve first..fourth works

expecting success: 
	git checkout -f master &&
	git reset --hard first &&
	test_tick &&
	git cherry-pick --ff first..fourth &&
	git diff --quiet other &&
	git diff --quiet HEAD other &&
	check_head_equals fourth

HEAD is now at 0c72e4f first

ok 4 - cherry-pick --ff first..fourth works

expecting success: 
	git checkout -f master &&
	git reset --hard first &&
	test_tick &&
	git cherry-pick -n first..fourth &&
	git diff --quiet other &&
	git diff --cached --quiet other &&
	git diff --quiet HEAD first

HEAD is now at 0c72e4f first

ok 5 - cherry-pick -n first..fourth works

expecting success: 
	git checkout -f master &&
	git reset --hard fourth &&
	test_tick &&
	git revert first..fourth &&
	git diff --quiet first &&
	git diff --cached --quiet first &&
	git diff --quiet HEAD first

HEAD is now at 94d3184 fourth
[master c20509a] Revert "fourth"
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
[master 5c15a57] Revert "third"
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
[master 76d1a2e] Revert "second"
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)

ok 6 - revert first..fourth works

expecting success: 
	git checkout -f master &&
	git reset --hard fourth &&
	test_tick &&
	git revert ^first fourth &&
	git diff --quiet first &&
	git diff --cached --quiet first &&
	git diff --quiet HEAD first

HEAD is now at 94d3184 fourth
[master aa52aa6] Revert "fourth"
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
[master 7128690] Revert "third"
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
[master 2b0bc01] Revert "second"
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)

ok 7 - revert ^first fourth works

expecting success: 
	git checkout -f master &&
	git reset --hard fourth &&
	test_tick &&
	git revert fourth fourth~1 fourth~2 &&
	git diff --quiet first &&
	git diff --cached --quiet first &&
	git diff --quiet HEAD first

HEAD is now at 94d3184 fourth
[master e7406a3] Revert "fourth"
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
[master 0039f72] Revert "third"
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
[master 6fceae4] Revert "second"
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)

ok 8 - revert fourth fourth~1 fourth~2 works

expecting success: 
	git checkout -f master &&
	git reset --hard first &&
	test_tick &&
	git cherry-pick -3 fourth &&
	git diff --quiet other &&
	git diff --quiet HEAD other &&
	check_head_differs_from fourth
HEAD is now at 0c72e4f first
[master de54420] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 5fbc3d8] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 0f9850f] fourth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 9 - cherry-pick -3 fourth works
expecting success: 
	git checkout -f master &&
	git reset --hard first &&
	test_tick &&
	git rev-list --reverse first..fourth | git cherry-pick --stdin &&
	git diff --quiet other &&
	git diff --quiet HEAD other &&
	check_head_differs_from fourth
HEAD is now at 0c72e4f first
[master 058f589] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 013cb83] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 79f9008] fourth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 10 - cherry-pick --stdin works

# passed all 10 test(s)
1..10

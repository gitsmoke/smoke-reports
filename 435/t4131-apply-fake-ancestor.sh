Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4131-apply-fake-ancestor/.git/
expecting success: 
	test_commit 1 &&
	test_commit 2 &&
	mkdir sub &&
	test_commit 3 sub/3 &&
	test_commit 4
[master (root-commit) d0dcf97] 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 1.t
[master 82335b2] 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 2.t
[master 41336fb] 3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 sub/3
[master 79e8c37] 4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 4.t

ok 1 - setup

expecting success: 
	git checkout 2 &&
	echo "A" > 1.t &&
	git diff > 1.patch &&
	git reset --hard &&
	git checkout 1 &&
	git apply --build-fake-ancestor 1.ancestor 1.patch
HEAD is now at 82335b2 2
ok 2 - apply --build-fake-ancestor

expecting success: 
	git checkout 3 &&
	echo "C" > sub/3.t &&
	git diff > 3.patch &&
	git reset --hard &&
	git checkout 4 &&
	(
		cd sub &&
		git apply --build-fake-ancestor 3.ancestor ../3.patch &&
		test -f 3.ancestor
	) &&
	git apply --build-fake-ancestor 3.ancestor 3.patch &&
	test_cmp sub/3.ancestor 3.ancestor
HEAD is now at 41336fb 3
ok 3 - apply --build-fake-ancestor in a subdirectory

# passed all 3 test(s)
1..3

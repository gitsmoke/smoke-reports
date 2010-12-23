Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0004-unwritable/.git/
expecting success: 

	>file &&
	git add file &&
	test_tick &&
	git commit -m initial &&
	echo >file &&
	git add file
[master (root-commit) 1bd44cb] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup

expecting success: 
	test_when_finished "chmod 775 .git/objects .git/objects/??" &&
	chmod a-w .git/objects .git/objects/?? &&
	test_must_fail git write-tree
ok 2 - write-tree should notice unwritable repository
expecting success: 
	test_when_finished "chmod 775 .git/objects .git/objects/??" &&
	chmod a-w .git/objects .git/objects/?? &&
	test_must_fail git commit -m second
ok 3 - commit should notice unwritable repository
expecting success: 
	test_when_finished "chmod 775 .git/objects .git/objects/??" &&
	echo 6O >file &&
	chmod a-w .git/objects .git/objects/?? &&
	test_must_fail git update-index file
ok 4 - update-index should notice unwritable repository
expecting success: 
	test_when_finished "chmod 775 .git/objects .git/objects/??" &&
	echo b >file &&
	chmod a-w .git/objects .git/objects/?? &&
	test_must_fail git add file
ok 5 - add should notice unwritable repository
# passed all 5 test(s)
1..5

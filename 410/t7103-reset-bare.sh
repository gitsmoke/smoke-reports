Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7103-reset-bare/.git/
expecting success: 
	echo one >file &&
	git add file &&
	git commit -m one &&
	echo two >file &&
	git commit -a -m two
[master (root-commit) b4dbd02] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 8df5af8] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup non-bare

expecting success: 
	(cd .git &&
	 test_must_fail git reset --hard)


ok 2 - "hard" reset requires a worktree

expecting success: 
	(cd .git &&
	 test_must_fail git reset --merge)

ok 3 - "merge" reset requires a worktree

expecting success: 
	(cd .git &&
	 test_must_fail git reset --keep)


ok 4 - "keep" reset requires a worktree

expecting success: 
	(cd .git && git reset)

Unstaged changes after reset:
M	file

ok 5 - "mixed" reset is ok

expecting success: 
	(cd .git && git reset --soft)


ok 6 - "soft" reset is ok

expecting success: 
	mkdir worktree &&
	GIT_WORK_TREE=$PWD/worktree GIT_DIR=$PWD/.git git reset --hard &&
	test_cmp file worktree/file

HEAD is now at 8df5af8 two

ok 7 - hard reset works with GIT_WORK_TREE

expecting success: 
	git clone --bare . bare.git &&
	cd bare.git

Cloning into bare repository bare.git...
done.

ok 8 - setup bare

expecting success: 
	test_must_fail git reset --hard HEAD^


ok 9 - "hard" reset is not allowed in bare

expecting success: 
	test_must_fail git reset --merge HEAD^


ok 10 - "merge" reset is not allowed in bare

expecting success: 
	test_must_fail git reset --keep HEAD^

ok 11 - "keep" reset is not allowed in bare

expecting success: 
	test_must_fail git reset --mixed HEAD^


ok 12 - "mixed" reset is not allowed in bare

expecting success: 
	git reset --soft HEAD^ &&
	test "`git show --pretty=format:%s | head -n 1`" = "one"


ok 13 - "soft" reset is allowed in bare

# passed all 13 test(s)
1..13

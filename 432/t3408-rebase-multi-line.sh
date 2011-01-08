Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3408-rebase-multi-line/.git/
expecting success: 

	>file &&
	git add file &&
	test_tick &&
	git commit -m initial &&

	echo hello >file &&
	test_tick &&
	git commit -a -m "A sample commit log message that has a long
summary that spills over multiple lines.

But otherwise with a sane description." &&

	git branch side &&

	git reset --hard HEAD^ &&
	>elif &&
	git add elif &&
	test_tick &&
	git commit -m second
[master (root-commit) 1bd44cb] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 1708bf0] A sample commit log message that has a long summary that spills over multiple lines.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
HEAD is now at 1bd44cb initial
[master e79e348] second
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 elif

ok 1 - setup

expecting success: 

	git checkout side &&
	git rebase master &&
	git cat-file commit HEAD | sed -e "1,/^\$/d" >actual &&
	git cat-file commit side@{1} | sed -e "1,/^\$/d" >expect &&
	test_cmp expect actual


First, rewinding head to replay your work on top of it...
Applying: A sample commit log message that has a long
ok 2 - rebase

# passed all 2 test(s)
1..2

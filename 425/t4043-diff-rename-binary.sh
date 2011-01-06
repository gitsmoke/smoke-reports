Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4043-diff-rename-binary/.git/
expecting success: 
	git init &&
	echo foo > foo &&
	echo "barQ" | q_to_nul > bar &&
	git add . &&
	git commit -m "Initial commit"
Reinitialized existing Git repository in /Users/trast/git-smoke/t/trash directory.t4043-diff-rename-binary/.git/
[master (root-commit) 4856b8d] Initial commit
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 bar
 create mode 100644 foo

ok 1 - prepare repository

expecting success: 
	mkdir sub &&
	git mv bar foo sub/ &&
	git commit -m "Moved to sub/"
[master 3720cf9] Moved to sub/
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename bar => sub/bar (100%)
 rename foo => sub/foo (100%)

ok 2 - move the files into a "sub" directory
expecting success: 
	git show -C -C --raw --binary --stat | tail -n 12 > current &&
	test_cmp expected current

ok 3 - git show -C -C report renames

# passed all 3 test(s)
1..3

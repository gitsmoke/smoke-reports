Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3417-rebase-whitespace-fix/.git/
expecting success: 
	git commit --allow-empty -m "Initial empty commit" &&
	git add file && git commit -m first &&
	mv second file &&
	git add file &&	git commit -m second &&
	git rebase --whitespace=fix HEAD^^ &&
	git diff --exit-code HEAD^:file expect-first &&
	test_cmp file expect-second

[master (root-commit) 733e850] Initial empty commit
 Author: A U Thor <author@example.com>
[master 0604fa1] first
 Author: A U Thor <author@example.com>
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 6d3be91] second
 Author: A U Thor <author@example.com>
 1 files changed, 7 insertions(+), 0 deletions(-)
Current branch master is up to date, rebase forced.
First, rewinding head to replay your work on top of it...
Applying: first
Applying: second

ok 1 - blank line at end of file; extend at end of file

expecting success: 
	cp third file && git add file && git commit -m third &&
	git rebase --whitespace=fix HEAD^^ &&
	git diff --exit-code HEAD^:file expect-second &&
	test_cmp file expect-third

[master d49e42a] third
 Author: A U Thor <author@example.com>
 1 files changed, 7 insertions(+), 0 deletions(-)
Current branch master is up to date, rebase forced.
First, rewinding head to replay your work on top of it...
Applying: second
Applying: third

ok 2 - two blanks line at end of file; extend at end of file

expecting success: 
	git config core.whitespace "-blank-at-eol" &&
	git reset --hard HEAD^ &&
	cp third file && git add file && git commit -m third &&
	git rebase --whitespace=fix HEAD^^ &&
	git diff --exit-code HEAD^:file expect-second &&
	test_cmp file third

HEAD is now at f1a24f1 second
[master fd6ef4a] third
 Author: A U Thor <author@example.com>
 1 files changed, 7 insertions(+), 0 deletions(-)
Current branch master is up to date, rebase forced.
First, rewinding head to replay your work on top of it...
Applying: second
Applying: third

ok 3 - same, but do not remove trailing spaces

expecting success: 
	git config core.whitespace "blank-at-eol" &&
	cp beginning file &&
	git commit -m beginning file &&
	for i in 1 2 3 4 5; do
		echo $i
	done >> file &&
	git commit -m more file	&&
	git rebase --whitespace=fix HEAD^^ &&
	test_cmp file expect-beginning

[master 1e3745a] beginning
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 13 deletions(-)
[master 4ca1d50] more
 Author: A U Thor <author@example.com>
 1 files changed, 5 insertions(+), 0 deletions(-)
Current branch master is up to date, rebase forced.
First, rewinding head to replay your work on top of it...
Applying: beginning
Applying: more

ok 4 - at beginning of file

# passed all 4 test(s)
1..4

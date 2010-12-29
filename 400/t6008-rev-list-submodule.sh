Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6008-rev-list-submodule/.git/
expecting success: 
	: > file &&
	git add file &&
	test_tick &&
	git commit -m initial &&
	echo 1 > file &&
	test_tick &&
	git commit -m second file &&
	echo 2 > file &&
	test_tick &&
	git commit -m third file &&

	rm .git/index &&

	: > super-file &&
	git add super-file &&
	git submodule add "$(pwd)" sub &&
	git symbolic-ref HEAD refs/heads/super &&
	test_tick &&
	git commit -m super-initial &&
	echo 1 > super-file &&
	test_tick &&
	git commit -m super-first super-file &&
	echo 2 > super-file &&
	test_tick &&
	git commit -m super-second super-file

[master (root-commit) 1bd44cb] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 534ad2c] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 1795412] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Cloning into sub
done.
[super (root-commit) 0c57fea] super-initial
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 sub
 create mode 100644 super-file
[super 539abc0] super-first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[super 2faea3e] super-second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
ok 1 - setup
expecting success: 
	git rev-list --objects super master ^super^
2faea3eea01e32dfb36516d04cc85f4027e5dbf8
17954123b4d2a45f7e0fec2fea14972db2b90a1f
534ad2c6e7b5b68dcaa4f008327c6c2ab1fa47ff
1bd44cb9d13204b0fe1958db0082f5028a16eb3a
688c57d335c59e17c9d966aae5d4194910518cc8 
0cfbf08886fca9a91cb753ec8734c84fcbe52c9f super-file
d9cc608eedd5d2cc63c262272b7a0f6ab6aed5dd 
f27c6ae26adb8396d3861976ba268f87ad8afa0b 
df2b8fc99e1c1d4dbc0a854d9f72157f1d6ea078 
e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 file

ok 2 - Ilari's test

# passed all 2 test(s)
1..2

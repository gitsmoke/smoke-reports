Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5702-clone-options/.git/
expecting success: 

	mkdir parent &&
	(cd parent && git init &&
	 echo one >file && git add file &&
	 git commit -m one)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5702-clone-options/parent/.git/
[master (root-commit) 8844af9] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup

expecting success: 

	git clone -o foo parent clone-o &&
	(cd clone-o && git rev-parse --verify refs/remotes/foo/master)
Cloning into clone-o...
done.
8844af99eee127cf9074c478fa9a5052f7b77192

ok 2 - clone -o

expecting success: 

	git clone "file://$(pwd)/parent" clone-redirected >out 2>err &&
	test ! -s err

ok 3 - redirected clone

expecting success: 

	git clone --progress "file://$(pwd)/parent" clone-redirected-progress \
		>out 2>err &&
	test -s err



ok 4 - redirected clone -v

# passed all 4 test(s)
1..4

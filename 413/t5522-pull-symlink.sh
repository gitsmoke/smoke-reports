Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5522-pull-symlink/.git/
expecting success: 
	mkdir subdir &&
	echo file >subdir/file &&
	git add subdir/file &&
	git commit -q -m file &&
	git clone -q . clone-repo &&
	ln -s clone-repo/subdir/ subdir-link &&
	(
		cd clone-repo &&
		git config receive.denyCurrentBranch warn
	) &&
	git config receive.denyCurrentBranch warn

ok 1 - setup

expecting success: 
	(
		echo real >subdir/file &&
		git commit -m real subdir/file &&
		cd clone-repo/subdir/ &&
		git pull &&
		test real = $(cat file)
	)

[master d34cd82] real
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Updating b70da14..d34cd82
Fast-forward
 subdir/file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 2 - pulling from real subdir

expecting success: 
	(
		echo link >subdir/file &&
		git commit -m link subdir/file &&
		cd subdir-link/ &&
		git pull &&
		test link = $(cat file)
	)

[master ec39c9e] link
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Updating d34cd82..ec39c9e
Fast-forward
 subdir/file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 3 - pulling from symlinked subdir

expecting success: 
	(
		cd subdir-link/ &&
		echo push >file &&
		git commit -m push ./file &&
		git push
	) &&
	test push = $(git show HEAD:subdir/file)

[master f9ac4e8] push
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
ok 4 - pushing from symlinked subdir
# passed all 4 test(s)
1..4

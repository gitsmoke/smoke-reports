Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2106-update-index-assume-unchanged/.git/
expecting success: : >file &&
	 git add file &&
	 git commit -m initial &&
	 git branch other &&
	 echo upstream >file &&
	 git add file &&
	 git commit -m upstream
[master (root-commit) 7f28464] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 5067197] upstream
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup
expecting success: git reset --hard &&
	 git checkout other &&
	 echo dirt >file &&
	 git update-index --assume-unchanged file &&
	 test_must_fail git checkout master
HEAD is now at 5067197 upstream
Aborting

ok 2 - do not switch branches with dirty file
# passed all 2 test(s)
1..2

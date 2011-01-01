Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2105-update-index-gitfile/.git/
expecting success: 
	mkdir sub1 &&
	(cd sub1 &&
	 git init &&
	 REAL="$(pwd)/.real" &&
	 mv .git "$REAL" &&
	 echo "gitdir: $REAL" >.git &&
	 test_commit first)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2105-update-index-gitfile/sub1/.git/
[master (root-commit) 50e526b] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 first.t

ok 1 - submodule with absolute .git file
expecting success: 
	git update-index --add -- sub1

ok 2 - add gitlink to absolute .git file
expecting success: 
	mkdir sub2 &&
	(cd sub2 &&
	 git init &&
	 mv .git .real &&
	 echo "gitdir: .real" >.git &&
	 test_commit first)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2105-update-index-gitfile/sub2/.git/
[master (root-commit) 50e526b] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 first.t

ok 3 - submodule with relative .git file
expecting success: 
	git update-index --add -- sub2

ok 4 - add gitlink to relative .git file

# passed all 4 test(s)
1..4

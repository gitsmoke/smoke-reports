Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1009-read-tree-new-index/.git/
expecting success: 
	echo one >a &&
	git add a &&
	git commit -m initial
[master (root-commit) 56e4a28] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a

ok 1 - setup
expecting success: 
	rm -f new-index &&
	GIT_INDEX_FILE=new-index git read-tree master

ok 2 - non-existent index file
expecting success: 
	rm -f new-index &&
	> new-index &&
	GIT_INDEX_FILE=new-index git read-tree master

ok 3 - empty index file

# passed all 3 test(s)
1..3

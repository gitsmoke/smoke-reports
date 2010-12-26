Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1003-read-tree-prefix/.git/
expecting success: 
	echo hello >one &&
	git update-index --add one &&
	tree=`git write-tree` &&
	echo tree is $tree
tree is 700196ec4e5b1c75e9f5481e5b545d78533ff917

ok 1 - setup
expecting success: 
	git read-tree --prefix=two/ $tree &&
	git ls-files >actual &&
	cmp expect actual

ok 2 - read-tree --prefix

# passed all 2 test(s)
1..2

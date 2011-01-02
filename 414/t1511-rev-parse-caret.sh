Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1511-rev-parse-caret/.git/
expecting success: 
	echo blob >a-blob &&
	git tag -a -m blob blob-tag `git hash-object -w a-blob`
	mkdir a-tree &&
	echo moreblobs >a-tree/another-blob &&
	git add . &&
	TREE_SHA1=`git write-tree` &&
	git tag -a -m tree tree-tag "$TREE_SHA1" &&
	git commit -m Initial &&
	git tag -a -m commit commit-tag &&
	git branch ref &&
	git checkout master &&
	echo modified >>a-blob &&
	git add -u &&
	git commit -m Modified
[master (root-commit) 40c08cb] Initial
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 a-blob
 create mode 100644 a-tree/another-blob
[master f4aee6f] Modified
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 
	test_must_fail git rev-parse ref^{non-existent}
ref^{non-existent}

ok 2 - ref^{non-existent}

expecting success: 
	git rev-parse ref >expected &&
	git rev-parse ref^{} >actual &&
	test_cmp expected actual &&
	git rev-parse commit-tag^{} >actual &&
	test_cmp expected actual

ok 3 - ref^{}

expecting success: 
	git rev-parse ref >expected &&
	git rev-parse ref^{commit} >actual &&
	test_cmp expected actual &&
	git rev-parse commit-tag^{commit} >actual &&
	test_cmp expected actual &&
	test_must_fail git rev-parse tree-tag^{commit} &&
	test_must_fail git rev-parse blob-tag^{commit}

tree-tag^{commit}
blob-tag^{commit}

ok 4 - ref^{commit}

expecting success: 
	echo $TREE_SHA1 >expected &&
	git rev-parse ref^{tree} >actual &&
	test_cmp expected actual &&
	git rev-parse commit-tag^{tree} >actual &&
	test_cmp expected actual &&
	git rev-parse tree-tag^{tree} >actual &&
	test_cmp expected actual &&
	test_must_fail git rev-parse blob-tag^{tree}
blob-tag^{tree}

ok 5 - ref^{tree}

expecting success: 
	git rev-parse master >expected &&
	git rev-parse master^{/.} >actual &&
	test_cmp expected actual


ok 6 - ref^{/.}
expecting success: 
	test_must_fail git rev-parse master^{/non-existent}

master^{/non-existent}

ok 7 - ref^{/non-existent}

expecting success: 
	git rev-parse ref >expected &&
	git rev-parse master^{/Initial} >actual &&
	test_cmp expected actual
ok 8 - ref^{/Initial}
# passed all 8 test(s)
1..8

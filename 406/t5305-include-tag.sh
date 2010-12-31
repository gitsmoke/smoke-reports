Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5305-include-tag/.git/
expecting success: 
	echo c >d &&
	git update-index --add d &&
	tree=`git write-tree` &&
	commit=`git commit-tree $tree </dev/null` &&
	echo "object $commit" >sig &&
	echo "type commit" >>sig &&
	echo "tag mytag" >>sig &&
	echo "tagger $(git var GIT_COMMITTER_IDENT)" >>sig &&
	echo >>sig &&
	echo "our test tag" >>sig &&
	tag=`git mktag <sig` &&
	rm d sig &&
	git update-ref refs/tags/mytag $tag && {
		echo $tree &&
		echo $commit &&
		git ls-tree $tree | sed -e "s/.* \([0-9a-f]*\)	.*/\1/"
	} >obj-list

ok 1 - setup
expecting success: 
	packname_1=$(git pack-objects \
		--window=0 \
		test-1 <obj-list)

ok 2 - pack without --include-tag

expecting success: 
	(
		GIT_DIR=clone.git &&
		export GIT_DIR &&
		git init &&
		git unpack-objects -n <test-1-${packname_1}.pack &&
		git unpack-objects <test-1-${packname_1}.pack
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5305-include-tag/clone.git/

ok 3 - unpack objects

expecting success: 
	git rev-list --objects $commit >list.expect &&
	(
		GIT_DIR=clone.git &&
		export GIT_DIR &&
		test_must_fail git cat-file -e $tag &&
		git rev-list --objects $commit
	) >list.actual &&
	test_cmp list.expect list.actual

ok 4 - check unpacked result (have commit, no tag)

expecting success: 
	packname_1=$(git pack-objects \
		--window=0 \
		--include-tag \
		test-2 <obj-list)


ok 5 - pack with --include-tag

expecting success: 
	(
		GIT_DIR=clone.git &&
		export GIT_DIR &&
		git init &&
		git unpack-objects -n <test-2-${packname_1}.pack &&
		git unpack-objects <test-2-${packname_1}.pack
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5305-include-tag/clone.git/

ok 6 - unpack objects

expecting success: 
	git rev-list --objects mytag >list.expect &&
	(
		GIT_DIR=clone.git &&
		export GIT_DIR &&
		git rev-list --objects $tag
	) >list.actual &&
	test_cmp list.expect list.actual


ok 7 - check unpacked result (have commit, have tag)

# passed all 7 test(s)
1..7

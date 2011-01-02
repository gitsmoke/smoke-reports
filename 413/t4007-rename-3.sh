Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4007-rename-3/.git/
expecting success: 
	mkdir path0 path1 &&
	cp "$TEST_DIRECTORY"/../COPYING path0/COPYING &&
	git update-index --add path0/COPYING &&
	tree=$(git write-tree) &&
	echo $tree
89474195ee2590413b2a17811a6b4f7956337afb

ok 1 - prepare reference tree

expecting success: 
	cp path0/COPYING path1/COPYING &&
	git update-index --add --remove path0/COPYING path1/COPYING

ok 2 - prepare work tree

expecting success: 
	git diff-index -C --find-copies-harder $tree >current &&
	compare_diff_raw current expected


ok 3 - copy detection

expecting success: 
	git diff-index -C --find-copies-harder --cached $tree >current &&
	compare_diff_raw current expected


ok 4 - copy detection, cached

expecting success: 
	git diff-index -C --find-copies-harder $tree path1 >current &&
	compare_diff_raw current expected


ok 5 - copy, limited to a subtree

expecting success: 
	rm -f path0/COPYING &&
	git update-index --remove path0/COPYING


ok 6 - tweak work tree

expecting success: 
	git diff-index -C --find-copies-harder $tree >current &&
	compare_diff_raw current expected


ok 7 - rename detection

expecting success: 
	git diff-index -C --find-copies-harder $tree path1 >current &&
	compare_diff_raw current expected


ok 8 - rename, limited to a subtree

# passed all 8 test(s)
1..8

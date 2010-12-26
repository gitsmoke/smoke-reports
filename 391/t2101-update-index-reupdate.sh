Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2101-update-index-reupdate/.git/
expecting success: echo hello world >file1 &&
	 echo goodbye people >file2 &&
	 git update-index --add file1 file2 &&
	 git ls-files -s >current &&
	 cmp current expected

ok 1 - update-index --add

expecting success: rm -f file1 &&
	echo hello everybody >file2 &&
	if git update-index --again
	then
		echo should have refused to remove file1
		exit 1
	else
		echo happy - failed as expected
	fi &&
	 git ls-files -s >current &&
	 cmp current expected
happy - failed as expected

ok 2 - update-index --again

expecting success: git update-index --remove --again &&
	 git ls-files -s >current &&
	 cmp current expected

ok 3 - update-index --remove --again

expecting success: git commit -m initial
[master (root-commit) d4e41c5] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2

ok 4 - first commit

expecting success: mkdir -p dir1 &&
	echo hello world >dir1/file3 &&
	echo goodbye people >file2 &&
	git update-index --add file2 dir1/file3 &&
	echo hello everybody >file2 &&
	echo happy >dir1/file3 &&
	git update-index --again &&
	git ls-files -s >current &&
	cmp current expected

ok 5 - update-index again
expecting success: echo not so happy >file2 &&
	(cd dir1 &&
	cat ../file2 >file3 &&
	git update-index --again
	) &&
	git ls-files -s >current &&
	cmp current expected

ok 6 - update-index --update from subdir

expecting success: echo very happy >file2 &&
	cat file2 >dir1/file3 &&
	git update-index --again dir1/ &&
	git ls-files -s >current &&
	cmp current expected

ok 7 - update-index --update with pathspec

# passed all 7 test(s)
1..7

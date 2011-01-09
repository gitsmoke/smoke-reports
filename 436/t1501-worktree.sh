Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1501-worktree/.git/
expecting success: 
	EMPTY_TREE=$(git write-tree) &&
	EMPTY_BLOB=$(git hash-object -t blob --stdin </dev/null) &&
	CHANGED_BLOB=$(echo changed | git hash-object -t blob --stdin) &&
	ZEROES=0000000000000000000000000000000000000000 &&
	EMPTY_BLOB7=$(echo $EMPTY_BLOB | sed "s/\(.......\).*/\1/") &&
	CHANGED_BLOB7=$(echo $CHANGED_BLOB | sed "s/\(.......\).*/\1/") &&

	mkdir -p work/sub/dir &&
	mkdir -p work2 &&
	mv .git repo.git

ok 1 - setup

expecting success: 
	test_rev_parse() {
		echo $1 >expected.bare &&
		echo $2 >expected.inside-git &&
		echo $3 >expected.inside-worktree &&
		if test $# -ge 4
		then
			echo $4 >expected.prefix
		fi &&

		git rev-parse --is-bare-repository >actual.bare &&
		git rev-parse --is-inside-git-dir >actual.inside-git &&
		git rev-parse --is-inside-work-tree >actual.inside-worktree &&
		if test $# -ge 4
		then
			git rev-parse --show-prefix >actual.prefix
		fi &&

		test_cmp expected.bare actual.bare &&
		test_cmp expected.inside-git actual.inside-git &&
		test_cmp expected.inside-worktree actual.inside-worktree &&
		if test $# -ge 4
		then
			# rev-parse --show-prefix should output
			# a single newline when at the top of the work tree,
			# but we test for that separately.
			test -z "$4" && ! test -s actual.prefix ||
			test_cmp expected.prefix actual.prefix
		fi
	}


ok 2 - setup: helper for testing rev-parse

expecting success: 
	unset GIT_WORK_TREE;
	GIT_DIR=repo.git &&
	GIT_CONFIG="$(pwd)"/$GIT_DIR/config &&
	export GIT_DIR GIT_CONFIG &&
	git config core.worktree ../work


ok 3 - setup: core.worktree = relative path

expecting success: 
	test_rev_parse false false false

ok 4 - outside

expecting success: 
	(
		cd work &&
		GIT_DIR=../repo.git &&
		GIT_CONFIG="$(pwd)"/$GIT_DIR/config &&
		test_rev_parse false false true ""
	)

ok 5 - inside work tree

checking known breakage: 
	echo >expected &&
	(
		cd work &&
		GIT_DIR=../repo.git &&
		GIT_CONFIG="$(pwd)"/$GIT_DIR/config &&
		git rev-parse --show-prefix >../actual
	) &&
	test_cmp expected actual
--- expected	2011-01-09 04:06:00.000000000 +0000
+++ actual	2011-01-09 04:06:00.000000000 +0000
@@ -1 +0,0 @@
-

not ok 6 - empty prefix is actually written out # TODO known breakage

expecting success: 
	(
		cd work/sub/dir &&
		GIT_DIR=../../../repo.git &&
		GIT_CONFIG="$(pwd)"/$GIT_DIR/config &&
		test_rev_parse false false true sub/dir/
	)

ok 7 - subdir of work tree

expecting success: 
	unset GIT_WORK_TREE;
	GIT_DIR=$(pwd)/repo.git &&
	GIT_CONFIG=$GIT_DIR/config &&
	export GIT_DIR GIT_CONFIG &&
	git config core.worktree "$(pwd)/work"

ok 8 - setup: core.worktree = absolute path

expecting success: 
	test_rev_parse false false false &&
	(
		cd work2 &&
		test_rev_parse false false false
	)

ok 9 - outside

expecting success: 
	(
		cd work &&
		test_rev_parse false false true ""
	)

ok 10 - inside work tree

expecting success: 
	(
		cd work/sub/dir &&
		test_rev_parse false false true sub/dir/
	)

ok 11 - subdir of work tree

expecting success: 
	GIT_DIR=$(pwd)/repo.git &&
	GIT_CONFIG=$GIT_DIR/config &&
	git config core.worktree non-existent &&
	GIT_WORK_TREE=work &&
	export GIT_DIR GIT_CONFIG GIT_WORK_TREE

ok 12 - setup: GIT_WORK_TREE=relative (override core.worktree)

expecting success: 
	test_rev_parse false false false &&
	(
		cd work2 &&
		test_rev_parse false false false
	)

ok 13 - outside

expecting success: 
	(
		cd work &&
		GIT_WORK_TREE=. &&
		test_rev_parse false false true ""
	)

ok 14 - inside work tree

expecting success: 
	(
		cd work/sub/dir &&
		GIT_WORK_TREE=../.. &&
		test_rev_parse false false true sub/dir/
	)

ok 15 - subdir of work tree

expecting success: 
	mv work repo.git/work &&
	mv work2 repo.git/work2 &&
	GIT_DIR=$(pwd)/repo.git &&
	GIT_CONFIG=$GIT_DIR/config &&
	GIT_WORK_TREE=$(pwd)/repo.git/work &&
	export GIT_DIR GIT_CONFIG GIT_WORK_TREE


ok 16 - setup: GIT_WORK_TREE=absolute, below git dir

expecting success: 
	echo outside &&
	test_rev_parse false false false

outside

ok 17 - outside

expecting success: 
	(
		cd repo.git &&
		test_rev_parse false true false
	) &&
	(
		cd repo.git/objects &&
		test_rev_parse false true false
	) &&
	(
		cd repo.git/work2 &&
		test_rev_parse false true false
	)

ok 18 - in repo.git

expecting success: 
	(
		cd repo.git/work &&
		test_rev_parse false true true ""
	)

ok 19 - inside work tree

expecting success: 
	(
		cd repo.git/work/sub/dir &&
		test_rev_parse false true true sub/dir/
	)

ok 20 - subdir of work tree

expecting success: 
	echo sub/dir/untracked >expected &&
	cat <<-\EOF >repo.git/work/.gitignore &&
	expected.*
	actual.*
	.gitignore
	EOF
	>repo.git/work/sub/dir/untracked &&
	(
		cd repo.git &&
		git ls-files --others --exclude-standard >../actual
	) &&
	test_cmp expected actual


ok 21 - find work tree from repo

expecting success: 
	echo sub/dir/tracked >expected &&
	>repo.git/work/sub/dir/tracked &&
	(
		cd repo.git/work/sub/dir &&
		git --git-dir=../../.. add tracked
	) &&
	(
		cd repo.git &&
		git ls-files >../actual
	) &&
	test_cmp expected actual

ok 22 - find work tree from work tree

expecting success: 
	(
		cd repo.git/work/sub/dir &&
		GIT_DIR=../../.. &&
		GIT_WORK_TREE=../.. &&
		GIT_PAGER= &&
		export GIT_DIR GIT_WORK_TREE GIT_PAGER &&

		git diff --exit-code tracked &&
		echo changed >tracked &&
		test_must_fail git diff --exit-code tracked
	)

diff --git a/sub/dir/tracked b/sub/dir/tracked
index e69de29..5ea2ed4 100644
--- a/sub/dir/tracked
+++ b/sub/dir/tracked
@@ -0,0 +1 @@
+changed

ok 23 - _gently() groks relative GIT_DIR & GIT_WORK_TREE

expecting success: 
	cat >diff-index-cached.expected <<-EOF &&
	:000000 100644 $ZEROES $EMPTY_BLOB A	sub/dir/tracked
	EOF
	cat >diff-index.expected <<-EOF &&
	:000000 100644 $ZEROES $ZEROES A	sub/dir/tracked
	EOF

	(
		GIT_DIR=repo.git &&
		GIT_WORK_TREE=repo.git/work &&
		export GIT_DIR GIT_WORK_TREE &&
		git diff-index $EMPTY_TREE >diff-index.actual &&
		git diff-index --cached $EMPTY_TREE >diff-index-cached.actual
	) &&
	test_cmp diff-index.expected diff-index.actual &&
	test_cmp diff-index-cached.expected diff-index-cached.actual

ok 24 - diff-index respects work tree under .git dir

expecting success: 
	cat >diff-files.expected <<-EOF &&
	:100644 100644 $EMPTY_BLOB $ZEROES M	sub/dir/tracked
	EOF

	(
		GIT_DIR=repo.git &&
		GIT_WORK_TREE=repo.git/work &&
		export GIT_DIR GIT_WORK_TREE &&
		git diff-files >diff-files.actual
	) &&
	test_cmp diff-files.expected diff-files.actual

ok 25 - diff-files respects work tree under .git dir

expecting success: 
	cat >diff-TREE.expected <<-EOF &&
	diff --git a/sub/dir/tracked b/sub/dir/tracked
	new file mode 100644
	index 0000000..$CHANGED_BLOB7
	--- /dev/null
	+++ b/sub/dir/tracked
	@@ -0,0 +1 @@
	+changed
	EOF
	cat >diff-TREE-cached.expected <<-EOF &&
	diff --git a/sub/dir/tracked b/sub/dir/tracked
	new file mode 100644
	index 0000000..$EMPTY_BLOB7
	EOF
	cat >diff-FILES.expected <<-EOF &&
	diff --git a/sub/dir/tracked b/sub/dir/tracked
	index $EMPTY_BLOB7..$CHANGED_BLOB7 100644
	--- a/sub/dir/tracked
	+++ b/sub/dir/tracked
	@@ -0,0 +1 @@
	+changed
	EOF

	(
		GIT_DIR=repo.git &&
		GIT_WORK_TREE=repo.git/work &&
		export GIT_DIR GIT_WORK_TREE &&
		git diff $EMPTY_TREE >diff-TREE.actual &&
		git diff --cached $EMPTY_TREE >diff-TREE-cached.actual &&
		git diff >diff-FILES.actual
	) &&
	test_cmp diff-TREE.expected diff-TREE.actual &&
	test_cmp diff-TREE-cached.expected diff-TREE-cached.actual &&
	test_cmp diff-FILES.expected diff-FILES.actual

ok 26 - git diff respects work tree under .git dir

expecting success: 
	echo dir/tracked >expected.grep &&
	(
		cd repo.git/work/sub &&
		GIT_DIR=../.. &&
		GIT_WORK_TREE=.. &&
		export GIT_DIR GIT_WORK_TREE &&
		git grep -l changed >../../../actual.grep
	) &&
	test_cmp expected.grep actual.grep


ok 27 - git grep

expecting success: 
	(
		cd repo.git &&
		GIT_DIR=. GIT_WORK_TREE=work git commit -a -m done
	)
[master (root-commit) 33bac56] done
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 sub/dir/tracked

ok 28 - git commit

expecting success: 
	(
		cd repo.git &&
		test_might_fail git config --unset core.worktree &&
		test_must_fail git log HEAD -- /home
	)


ok 29 - absolute pathspec should fail gracefully

expecting success: 
	>dummy_file
	echo git --git-dir="$(pwd)//repo.git" --work-tree="$(pwd)" add dummy_file &&
	git --git-dir="$(pwd)//repo.git" --work-tree="$(pwd)" add dummy_file

git --git-dir=/Users/trast/git-smoke/t/trash directory.t1501-worktree//repo.git --work-tree=/Users/trast/git-smoke/t/trash directory.t1501-worktree add dummy_file

ok 30 - make_relative_path handles double slashes in GIT_DIR

expecting success: 
	GIT_DIR=repo.git GIT_WORK_TREE=repo.git/work \
	test-subprocess --setup-work-tree rev-parse --show-toplevel >actual &&
	echo "$TRASH_DIRECTORY/repo.git/work" >expected &&
	test_cmp expected actual
ok 31 - relative $GIT_WORK_TREE and git subprocesses
# still have 1 known breakage(s)
# passed all remaining 30 test(s)
1..31

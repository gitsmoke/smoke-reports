Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2200-add-update/.git/
expecting success: 
	echo initial >check &&
	echo initial >top &&
	echo initial >foo &&
	mkdir dir1 dir2 &&
	echo initial >dir1/sub1 &&
	echo initial >dir1/sub2 &&
	echo initial >dir2/sub3 &&
	git add check dir1 dir2 top foo &&
	test_tick &&
	git commit -m initial &&

	echo changed >check &&
	echo changed >top &&
	echo changed >dir2/sub3 &&
	rm -f dir1/sub1 &&
	echo other >dir2/other
[master (root-commit) ec46c19] initial
 Author: A U Thor <author@example.com>
 6 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 check
 create mode 100644 dir1/sub1
 create mode 100644 dir1/sub2
 create mode 100644 dir2/sub3
 create mode 100644 foo
 create mode 100644 top

ok 1 - setup

expecting success: 
	git add -u dir1 dir2

ok 2 - update

expecting success: 
	test "$(git ls-files dir1/sub1)" = ""


ok 3 - update noticed a removal

expecting success: 
	test "$(git diff-files --name-status dir2/sub3)" = ""


ok 4 - update touched correct path

expecting success: 
	test "$(git diff-files --name-status check)" = "M	check" &&
	test "$(git diff-files --name-status top)" = "M	top"


ok 5 - update did not touch other tracked files

expecting success: 
	test "$(git ls-files dir2/other)" = ""


ok 6 - update did not touch untracked files

expecting success: 

	git ls-files -s |
	sed -e "s/ 0	/	/" >expect &&
	git ls-tree -r $(git write-tree) |
	sed -e "s/ blob / /" >current &&
	test_cmp expect current

ok 7 - cache tree has not been corrupted

expecting success: 
	(
		cd dir1 &&
		echo more >sub2 &&
		git add -u sub2
	)

ok 8 - update from a subdirectory

expecting success: 

	test "$(git diff-files --name-status dir1)" = ""

ok 9 - change gets noticed

expecting success: 

	rm foo &&
	ln -s top foo &&
	git add -u -- foo

ok 10 - replace a file with a symlink

expecting success: 

	git add -u &&
	test -z "$(git diff-files)"

ok 11 - add everything changed

expecting success: 

	touch check &&
	git add -u &&
	test -z "$(git diff-files)"

ok 12 - touch and then add -u

expecting success: 

	touch check &&
	git add check &&
	test -z "$(git diff-files)"

ok 13 - touch and then add explicitly

expecting success: 

	(
		echo "add 'check'" &&
		echo "remove 'top'"
	) >expect &&
	before=$(git ls-files -s check top) &&
	echo changed >>check &&
	rm -f top &&
	git add -n -u >actual &&
	after=$(git ls-files -s check top) &&

	test "$before" = "$after" &&
	test_cmp expect actual

ok 14 - add -n -u should not add but just report

expecting success: 
	git reset --hard &&
	one=$(echo 1 | git hash-object -w --stdin) &&
	two=$(echo 2 | git hash-object -w --stdin) &&
	three=$(echo 3 | git hash-object -w --stdin) &&
	{
		for path in path1 path2
		do
			echo "100644 $one 1	$path"
			echo "100644 $two 2	$path"
			echo "100644 $three 3	$path"
		done
		echo "100644 $one 1	path3"
		echo "100644 $one 1	path4"
		echo "100644 $one 3	path5"
		echo "100644 $one 3	path6"
	} |
	git update-index --index-info &&
	echo 3 >path1 &&
	echo 2 >path3 &&
	echo 2 >path5 &&
	git add -u &&
	git ls-files -s path1 path2 path3 path4 path5 path6 >actual &&
	{
		echo "100644 $three 0	path1"
		echo "100644 $one 1	path3"
		echo "100644 $one 1	path4"
		echo "100644 $one 3	path5"
		echo "100644 $one 3	path6"
	} >expect &&
	test_cmp expect actual &&

	# Bonus tests.  Explicit resolving
	git add path3 path5 &&
	test_must_fail git add path4 &&
	test_must_fail git add path6 &&
	git rm path4 &&
	git rm path6 &&

	git ls-files -s "path?" >actual &&
	{
		echo "100644 $three 0	path1"
		echo "100644 $two 0	path3"
		echo "100644 $two 0	path5"
	} >expect
HEAD is now at ec46c19 initial
path4: needs merge
path6: needs merge
rm 'path4'
path6: needs merge
rm 'path6'

ok 15 - add -u resolves unmerged paths
expecting success: 
	test_must_fail git add -u non-existent &&
	! (git ls-files | grep "non-existent")
ok 16 - "add -u non-existent" should fail

# passed all 16 test(s)
1..16

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6012-rev-list-simplify/.git/
expecting success: 
	echo "Hi there" >file &&
	git add file &&
	test_tick && git commit -m "Initial file" &&
	note A &&

	git branch other-branch &&

	echo "Hello" >file &&
	git add file &&
	test_tick && git commit -m "Modified file" &&
	note B &&

	git checkout other-branch &&

	echo "Hello" >file &&
	git add file &&
	test_tick && git commit -m "Modified the file identically" &&
	note C &&

	echo "This is a stupid example" >another-file &&
	git add another-file &&
	test_tick && git commit -m "Add another file" &&
	note D &&

	test_tick && git merge -m "merge" master &&
	note E &&

	echo "Yet another" >elif &&
	git add elif &&
	test_tick && git commit -m "Irrelevant change" &&
	note F &&

	git checkout master &&
	echo "Yet another" >elif &&
	git add elif &&
	test_tick && git commit -m "Another irrelevant change" &&
	note G &&

	test_tick && git merge -m "merge" other-branch &&
	note H &&

	echo "Final change" >file &&
	test_tick && git commit -a -m "Final change" &&
	note I
[master (root-commit) bbceb0a] Initial file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 8bc585a] Modified file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[other-branch 472aab3] Modified the file identically
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[other-branch e1dcd83] Add another file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 another-file
Merging:
e1dcd83 Add another file
virtual master
found 1 common ancestor(s):
bbceb0a Initial file
Merge made by recursive.
[other-branch 06624f7] Irrelevant change
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 elif
[master 49ea9b0] Another irrelevant change
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 elif
Merging:
49ea9b0 Another irrelevant change
virtual other-branch
found 1 common ancestor(s):
8bc585a Modified file
Merge made by recursive.
 another-file |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 another-file
[master 03917cc] Final change
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		git log --pretty="$FMT" --parents $param |
		unnote >actual &&
		sed -e "s/^.*	\([^ ]*\) .*/\1/" >check <actual &&
		test_cmp expect check || {
			cat actual
			false
		}
	

ok 2 - log --full-history

expecting success: 
		git log --pretty="$FMT" --parents $param |
		unnote >actual &&
		sed -e "s/^.*	\([^ ]*\) .*/\1/" >check <actual &&
		test_cmp expect check || {
			cat actual
			false
		}
	

ok 3 - log --full-history -- file

expecting success: 
		git log --pretty="$FMT" --parents $param |
		unnote >actual &&
		sed -e "s/^.*	\([^ ]*\) .*/\1/" >check <actual &&
		test_cmp expect check || {
			cat actual
			false
		}
	

ok 4 - log --full-history --topo-order -- file
expecting success: 
		git log --pretty="$FMT" --parents $param |
		unnote >actual &&
		sed -e "s/^.*	\([^ ]*\) .*/\1/" >check <actual &&
		test_cmp expect check || {
			cat actual
			false
		}
	

ok 5 - log --full-history --date-order -- file

expecting success: 
		git log --pretty="$FMT" --parents $param |
		unnote >actual &&
		sed -e "s/^.*	\([^ ]*\) .*/\1/" >check <actual &&
		test_cmp expect check || {
			cat actual
			false
		}
	

ok 6 - log --simplify-merges -- file

expecting success: 
		git log --pretty="$FMT" --parents $param |
		unnote >actual &&
		sed -e "s/^.*	\([^ ]*\) .*/\1/" >check <actual &&
		test_cmp expect check || {
			cat actual
			false
		}
	

ok 7 - log -- file

expecting success: 
		git log --pretty="$FMT" --parents $param |
		unnote >actual &&
		sed -e "s/^.*	\([^ ]*\) .*/\1/" >check <actual &&
		test_cmp expect check || {
			cat actual
			false
		}
	

ok 8 - log --topo-order -- file

# passed all 8 test(s)
1..8

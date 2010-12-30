Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6031-merge-recursive/.git/
expecting success: 
	: >file1 &&
	git add file1 &&
	git commit -m initial &&
	git checkout -b a1 master &&
	: >dummy &&
	git add dummy &&
	git commit -m a &&
	git checkout -b b1 master &&
	test_chmod +x file1 &&
	git commit -m b1 &&
	git checkout a1 &&
	git merge-recursive master -- a1 b1 &&
	git ls-files -s file1 | grep ^100755

[master (root-commit) 117805d] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file1
[a1 6ed7f6b] a
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 dummy
[b1 3ac3780] b1
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 file1
Merging a1 with b1
Merging:
6ed7f6b a
3ac3780 b1
found 1 common ancestor(s):
117805d initial
100755 e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 0	file1

ok 1 - mode change in one branch: keep changed version

expecting success: 
	test -x file1


ok 2 - verify executable bit on file

expecting success: 
	git reset --hard HEAD &&
	git checkout -b a2 master &&
	: >file2 &&
	H=$(git hash-object file2) &&
	test_chmod +x file2 &&
	git commit -m a2 &&
	git checkout -b b2 master &&
	: >file2 &&
	git add file2 &&
	git commit -m b2 &&
	git checkout a2 &&
	(
		git merge-recursive master -- a2 b2
		test $? = 1
	) &&
	git ls-files -u >actual &&
	(
		echo "100755 $H 2	file2"
		echo "100644 $H 3	file2"
	) >expect &&
	test_cmp actual expect &&
	git ls-files -s file2 | grep ^100755

HEAD is now at 6ed7f6b a
[a2 7da5924] a2
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100755 file2
[b2 8a01f13] b2
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file2
Merging a2 with b2
Merging:
7da5924 a2
8a01f13 b2
found 1 common ancestor(s):
117805d initial
Auto-merging file2
CONFLICT (add/add): Merge conflict in file2
100755 e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 2	file2

ok 3 - mode change in both branches: expect conflict

expecting success: 
	test -x file2


ok 4 - verify executable bit on file

expecting success: 
	git reset --hard HEAD &&
	git checkout -b main &&
	git rm -rf . &&

	echo "just a file" >sub1 &&
	mkdir -p sub2 &&
	echo content1 >sub2/file1 &&
	echo content2 >sub2/file2 &&
	echo content3 >sub2/file3 &&
	mkdir simple &&
	echo base >simple/bar &&
	git add -A &&
	test_tick &&
	git commit -m base &&

	git checkout -b other &&
	echo more >>simple/bar &&
	test_tick &&
	git commit -a -m changesimplefile &&

	git checkout main &&
	git rm sub1 &&
	git mv sub2 sub1 &&
	test_tick &&
	git commit -m changefiletodir &&

	test_tick &&
	git merge other
HEAD is now at 7da5924 a2
rm 'file1'
rm 'file2'
[main 443fa7a] base
 Author: A U Thor <author@example.com>
 7 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 actual
 create mode 100644 expect
 delete mode 100644 file1
 delete mode 100755 file2
 create mode 100644 simple/bar
 create mode 100644 sub1
 create mode 100644 sub2/file1
 create mode 100644 sub2/file2
 create mode 100644 sub2/file3
[other b358870] changesimplefile
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
rm 'sub1'
[main 842c571] changefiletodir
 Author: A U Thor <author@example.com>
 4 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 sub1
 rename {sub2 => sub1}/file1 (100%)
 rename {sub2 => sub1}/file2 (100%)
 rename {sub2 => sub1}/file3 (100%)
Merging:
842c571 changefiletodir
virtual other
found 1 common ancestor(s):
443fa7a base
Skipped sub1/file1 (merged same as existing)
Skipped sub1/file2 (merged same as existing)
Skipped sub1/file3 (merged same as existing)
Merge made by recursive.
 simple/bar |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 5 - merging with triple rename across D/F conflict
# passed all 5 test(s)
1..5

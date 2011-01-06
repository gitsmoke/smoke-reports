Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3031-merge-criscross/.git/
expecting success: 
	mkdir data &&

	# create a bunch of files
	n=1 &&
	while test $n -le 10
	do
		echo $n > data/$n &&
		n=$(($n+1)) ||
		break
	done &&

	# check them in
	git add data &&
	git commit -m A &&
	git branch A &&

	# a file in one branch
	git checkout -b B A &&
	git rm data/9 &&
	git add data &&
	git commit -m B &&

	# with a branch off of it
	git branch D &&

	# put some commits on D
	git checkout D &&
	echo testD > data/testD &&
	git add data &&
	git commit -m D &&

	# back up to the top, create another branch and cause
	# a rename conflict with the file we deleted earlier
	git checkout -b C A &&
	git mv data/9 data/new-9 &&
	git add data &&
	git commit -m C &&

	# with a branch off of it
	git branch E &&

	# put a commit on E
	git checkout E &&
	echo testE > data/testE &&
	git add data &&
	git commit -m E &&

	# now, merge E into B
	git checkout B &&
	test_must_fail git merge E &&
	# force-resolve
	git add data &&
	git commit -m F &&
	git branch F &&

	# and merge D into C
	git checkout C &&
	test_must_fail git merge D &&
	# force-resolve
	git add data &&
	git commit -m G &&
	git branch G
[master (root-commit) 45e1ce2] A
 Author: A U Thor <author@example.com>
 10 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 data/1
 create mode 100644 data/10
 create mode 100644 data/2
 create mode 100644 data/3
 create mode 100644 data/4
 create mode 100644 data/5
 create mode 100644 data/6
 create mode 100644 data/7
 create mode 100644 data/8
 create mode 100644 data/9
rm 'data/9'
[B 8bc0a59] B
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 data/9
[D ab3a815] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 data/testD
[C 7eb3758] C
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename data/{9 => new-9} (100%)
[E dba0eed] E
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 data/testE
Merging:
8bc0a59 B
virtual E
found 1 common ancestor(s):
45e1ce2 A
CONFLICT (rename/delete): Rename data/9->data/new-9 in E and deleted in HEAD
Automatic merge failed; fix conflicts and then commit the result.
[B a48450b] F
 Author: A U Thor <author@example.com>
Merging:
7eb3758 C
virtual D
found 1 common ancestor(s):
45e1ce2 A
CONFLICT (rename/delete): Rename data/9->data/new-9 in HEAD and deleted in D
Automatic merge failed; fix conflicts and then commit the result.
[C 5763300] G
 Author: A U Thor <author@example.com>

ok 1 - setup repo with criss-cross history

expecting success: 
	git merge F
Merging:
5763300 G
virtual F
found 2 common ancestor(s):
7eb3758 C
8bc0a59 B
  Merging:
  7eb3758 C
  8bc0a59 B
  found 1 common ancestor(s):
  45e1ce2 A
  CONFLICT (rename/delete): Rename data/9->data/new-9 in Temporary merge branch 1 and deleted in Temporary merge branch 2
Merge made by recursive.
 data/testE |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 data/testE

ok 2 - recursive merge between F and G, causes segfault

# passed all 2 test(s)
1..2

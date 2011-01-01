Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7405-submodule-merge/.git/
expecting success: 

	mkdir sub &&
	(cd sub &&
	 git init &&
	 echo original > file &&
	 git add file &&
	 test_tick &&
	 git commit -m sub-root) &&
	git add sub &&
	test_tick &&
	git commit -m root &&

	git checkout -b a master &&
	(cd sub &&
	 echo A > file &&
	 git add file &&
	 test_tick &&
	 git commit -m sub-a) &&
	git add sub &&
	test_tick &&
	git commit -m a &&

	git checkout -b b master &&
	(cd sub &&
	 echo B > file &&
	 git add file &&
	 test_tick &&
	 git commit -m sub-b) &&
	git add sub &&
	test_tick &&
	git commit -m b &&

	git checkout -b c a &&
	git merge -s ours b &&

	git checkout -b d b &&
	git merge -s ours a
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7405-submodule-merge/sub/.git/
[master (root-commit) 0998b33] sub-root
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master (root-commit) 5c9ada4] root
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 160000 sub
[master d98dfef] sub-a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[a 6102a2a] a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
M	sub
[master ce35c37] sub-b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[b 0405d8c] b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
M	sub
Merge made by ours.
Merge made by ours.

ok 1 - setup

expecting success: 
	mkdir merge-search &&
	(cd merge-search &&
	git init &&
	mkdir sub &&
	(cd sub &&
	 git init &&
	 echo "file-a" > file-a &&
	 git add file-a &&
	 git commit -m "sub-a" &&
	 git branch sub-a) &&
	git add sub &&
	git commit -m "a" &&
	git branch a &&

	git checkout -b b &&
	(cd sub &&
	 git checkout -b sub-b &&
	 echo "file-b" > file-b &&
	 git add file-b &&
	 git commit -m "sub-b") &&
	git commit -a -m "b" &&

	git checkout -b c a &&
	(cd sub &&
	 git checkout -b sub-c sub-a &&
	 echo "file-c" > file-c &&
	 git add file-c &&
	 git commit -m "sub-c") &&
	git commit -a -m "c" &&

	git checkout -b d a &&
	(cd sub &&
	 git checkout -b sub-d sub-b &&
	 git merge sub-c) &&
	git commit -a -m "d" &&
	git branch test b)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7405-submodule-merge/merge-search/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7405-submodule-merge/merge-search/sub/.git/
[master (root-commit) 9c64145] sub-a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file-a
[master (root-commit) 8558e28] a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 160000 sub
[sub-b 1e4c5d4] sub-b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file-b
[b 0d3ac3a] b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
M	sub
[sub-c 18cac7c] sub-c
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file-c
[c bfb8374] c
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
M	sub
Merging:
1e4c5d4 sub-b
virtual sub-c
found 1 common ancestor(s):
9c64145 sub-a
Merge made by recursive.
 file-c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file-c
[d 6411de1] d
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 2 - setup for merge search

expecting success: 
	(cd merge-search &&
	 git checkout -b test-forward b &&
	 git merge d &&
	 git ls-tree test-forward sub | cut -f1 | cut -f3 -d" " > actual &&
	 (cd sub &&
	  git rev-parse sub-d > ../expect) &&
	 test_cmp actual expect)

M	sub
Merging:
0d3ac3a b
virtual d
found 1 common ancestor(s):
8558e28 a
Auto-merging sub
Merge made by recursive.
 sub |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 3 - merge with one side as a fast-forward of the other

expecting success: 
	(cd merge-search &&
	 git checkout -b test-nonforward b &&
	 (cd sub &&
	  git rev-parse sub-d > ../expect) &&
	 test_must_fail git merge c 2> actual  &&
	 grep $(cat expect) actual > /dev/null &&
	 git reset --hard)

M	sub
Merging:
0d3ac3a b
virtual c
found 1 common ancestor(s):
8558e28 a
Auto-merging sub
CONFLICT (submodule): Merge conflict in sub
Automatic merge failed; fix conflicts and then commit the result.
HEAD is now at 0d3ac3a b

ok 4 - merging should conflict for non fast-forward

expecting success: 
	(cd merge-search &&
	git checkout -b test-ambiguous b &&
	(cd sub &&
	 git checkout -b ambiguous sub-b &&
	 git merge sub-c &&
	 git rev-parse sub-d > ../expect1 &&
	 git rev-parse ambiguous > ../expect2) &&
	test_must_fail git merge c 2> actual &&
	grep $(cat expect1) actual > /dev/null &&
	grep $(cat expect2) actual > /dev/null &&
	git reset --hard)

M	sub
Merging:
1e4c5d4 sub-b
virtual sub-c
found 1 common ancestor(s):
9c64145 sub-a
Merge made by recursive.
 file-c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file-c
Merging:
0d3ac3a b
virtual c
found 1 common ancestor(s):
8558e28 a
Auto-merging sub
CONFLICT (submodule): Merge conflict in sub
Automatic merge failed; fix conflicts and then commit the result.
HEAD is now at 0d3ac3a b

ok 5 - merging should fail for ambiguous common parent

expecting success: 
	(cd merge-search &&
	git checkout -b bb a &&
	(cd sub &&
	 git checkout sub-b) &&
	git commit -a -m "bb" &&

	git checkout -b e bb &&
	(cd sub &&
	 git checkout sub-a) &&
	git commit -a -m "e" &&

	git checkout -b f bb &&
	(cd sub &&
	 git checkout sub-d) &&
	git commit -a -m "f" &&

	git checkout -b test-backward e &&
	test_must_fail git merge f)

M	sub
[bb e0e5b01] bb
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[e 850fa67] e
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
M	sub
[f 7f695ba] f
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
M	sub
Merging:
850fa67 e
virtual f
found 1 common ancestor(s):
e0e5b01 bb
Auto-merging sub
CONFLICT (submodule): Merge conflict in sub
Automatic merge failed; fix conflicts and then commit the result.

ok 6 - merging should fail for changes that are backwards

expecting success: 
	git reset --hard HEAD &&
	git checkout -b test2 c &&
	git merge d

HEAD is now at f35b3af Merge branch 'a' into d
M	sub
Merging:
74288c7 Merge branch 'b' into c
virtual d
found 2 common ancestor(s):
6102a2a a
0405d8c b
  Merging:
  6102a2a a
  0405d8c b
  found 1 common ancestor(s):
  5c9ada4 root
  Auto-merging sub
Already up-to-date!
Merge made by recursive.

ok 7 - merging with a modify/modify conflict between merge bases

# passed all 7 test(s)
1..7

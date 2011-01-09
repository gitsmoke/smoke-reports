Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7608-merge-messages/.git/
expecting success: 
	test_commit master-1 &&
	git checkout -b local-branch &&
	test_commit branch-1 &&
	git checkout master &&
	test_commit master-2 &&
	git merge local-branch &&
	check_oneline "Merge branch Qlocal-branchQ"
[master (root-commit) 7b5416a] master-1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 master-1.t
[local-branch f064301] branch-1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 branch-1.t
[master 04af5f8] master-2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 master-2.t
Merging:
04af5f8 master-2
virtual local-branch
found 1 common ancestor(s):
7b5416a master-1
Merge made by recursive.
 branch-1.t |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 branch-1.t

ok 1 - merge local branch
expecting success: 
	git checkout -b octopus-a master &&
	test_commit octopus-1 &&
	git checkout -b octopus-b master &&
	test_commit octopus-2 &&
	git checkout master &&
	git merge octopus-a octopus-b &&
	check_oneline "Merge branches Qoctopus-aQ and Qoctopus-bQ"
[octopus-a 7226ae8] octopus-1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 octopus-1.t
[octopus-b 9679e1e] octopus-2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 octopus-2.t
Fast-forwarding to: octopus-a
Trying simple merge with octopus-b
Merge made by octopus.
 octopus-1.t |    1 +
 octopus-2.t |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 octopus-1.t
 create mode 100644 octopus-2.t

ok 2 - merge octopus branches
expecting success: 
	git checkout -b tag-branch master &&
	test_commit tag-1 &&
	git checkout master &&
	test_commit master-3 &&
	git merge tag-1 &&
	check_oneline "Merge commit Qtag-1Q"
[tag-branch 727cec4] tag-1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 tag-1.t
[master 1834f00] master-3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 master-3.t
Merging:
1834f00 master-3
virtual tag-1
found 1 common ancestor(s):
b5672c0 Merge branches 'octopus-a' and 'octopus-b'
Merge made by recursive.
 tag-1.t |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 tag-1.t

ok 3 - merge tag

expecting success: 
	git checkout -b ambiguous master &&
	test_commit ambiguous &&
	git checkout master &&
	test_commit master-4 &&
	git merge ambiguous &&
	check_oneline "Merge commit QambiguousQ"
[ambiguous c7ed140] ambiguous
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ambiguous.t
[master cacb121] master-4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 master-4.t
Merging:
cacb121 master-4
virtual ambiguous
found 1 common ancestor(s):
8a73bbb Merge commit 'tag-1'
Merge made by recursive.
 ambiguous.t |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 ambiguous.t

ok 4 - ambiguous tag
expecting success: 
	git checkout -b remote master &&
	test_commit remote-1 &&
	git update-ref refs/remotes/origin/master remote &&
	git checkout master &&
	test_commit master-5 &&
	git merge origin/master &&
	check_oneline "Merge remote-tracking branch Qorigin/masterQ"
[remote 8fd733d] remote-1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 remote-1.t
[master 5d7a1b5] master-5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 master-5.t
Merging:
5d7a1b5 master-5
virtual origin/master
found 1 common ancestor(s):
e239cc6 Merge commit 'ambiguous'
Merge made by recursive.
 remote-1.t |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 remote-1.t

ok 5 - remote-tracking branch

# passed all 5 test(s)
1..5

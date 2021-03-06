Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3401-rebase-partial/.git/
expecting success: echo First > A &&
     git update-index --add A &&
     git commit -m "Add A." &&

     git checkout -b my-topic-branch &&

     echo Second > B &&
     git update-index --add B &&
     git commit -m "Add B." &&

     echo AnotherSecond > C &&
     git update-index --add C &&
     git commit -m "Add C." &&

     git checkout -f master &&

     echo Third >> A &&
     git update-index A &&
     git commit -m "Modify A."
[master (root-commit) 5ce9a2e] Add A.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A
[my-topic-branch c761ac5] Add B.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B
[my-topic-branch ffe82b0] Add C.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C
[master 1d1beec] Modify A.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - prepare repository with topic branch
expecting success: git cherry-pick my-topic-branch^0 &&
     git checkout -f my-topic-branch &&
     git branch master-merge master &&
     git branch my-topic-branch-merge my-topic-branch
[master 1951f1c] Add C.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C
ok 2 - pick top patch from topic branch into master
expecting success: git rebase master && test ! -d .git/rebase-apply
First, rewinding head to replay your work on top of it...
Applying: Add B.
ok 3 - rebase topic branch against new master and check git am did not get halted
expecting success: git checkout -f my-topic-branch-merge &&
	 git rebase --merge master-merge &&
	 test ! -d .git/rebase-merge
First, rewinding head to replay your work on top of it...
Merging master-merge with HEAD~1
Merging:
1951f1c Add C.
c761ac5 Add B.
found 1 common ancestor(s):
5ce9a2e Add A.
[detached HEAD ce5628b] Add B.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B
Committed: 0001 Add B.
Merging master-merge with HEAD~0
Merging:
ce5628b Add B.
ffe82b0 Add C.
found 1 common ancestor(s):
c761ac5 Add B.
Already applied: 0002 Add C.
All done.
ok 4 - rebase --merge topic branch that was partially merged upstream

# passed all 4 test(s)
1..4

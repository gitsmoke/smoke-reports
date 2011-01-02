Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3411-rebase-preserve-around-merges/.git/
expecting success: 
	test_commit A1 &&
	test_commit B1 &&
	test_commit C1 &&
	git reset --hard B1 &&
	test_commit D1 &&
	test_merge E1 C1 &&
	test_commit F1

[master (root-commit) 6fb0b66] A1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A1.t
[master 37e5de5] B1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B1.t
[master 9db6c33] C1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C1.t
HEAD is now at 37e5de5 B1
[master 98f5076] D1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 D1.t
Merging:
98f5076 D1
virtual C1
found 1 common ancestor(s):
37e5de5 B1
Merge made by recursive.
 C1.t |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C1.t
[master 0f3967e] F1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F1.t

ok 1 - setup

expecting success: 
	FAKE_LINES="1 squash 3 2" git rebase -i -p B1 &&
	test "$(git rev-parse HEAD^2)" = "$(git rev-parse C1)" &&
	test "$(git rev-parse HEAD~2)" = "$(git rev-parse B1)" &&
	git tag E2

rebase -i script before editing:
pick 98f5076 D1
pick b855587 E1
pick 0f3967e F1

rebase -i script after editing:
pick 98f5076 D1
squash 0f3967e F1
pick b855587 E1
Rebasing (1/3)Rebasing (2/3)[detached HEAD 5d81168] D1
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 D1.t
 create mode 100644 F1.t
Rebasing (3/3)
ok 2 - squash F1 into D1

expecting success: 
	test_commit G1 &&
	test_commit H1 &&
	test_commit I1 &&
	git checkout -b branch3 H1 &&
	test_commit J1 &&
	test_merge K1 I1 &&
	git checkout -b branch2 G1 &&
	test_commit L1 &&
	test_merge M1 K1 &&
	GIT_EDITOR=: git rebase -i -p E2 &&
	test "$(git rev-parse HEAD~3)" = "$(git rev-parse E2)" &&
	test "$(git rev-parse HEAD~2)" = "$(git rev-parse HEAD^2^2~2)" &&
	test "$(git rev-parse HEAD^2^1^1)" = "$(git rev-parse HEAD^2^2^1)"

[master 87b0b56] G1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 G1.t
[master 5045da3] H1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 H1.t
[master 403cbe8] I1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 I1.t
[branch3 18bc9a8] J1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 J1.t
Merging:
18bc9a8 J1
virtual I1
found 1 common ancestor(s):
5045da3 H1
Merge made by recursive.
 I1.t |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 I1.t
[branch2 c7ddfbe] L1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 L1.t
Merging:
c7ddfbe L1
virtual K1
found 1 common ancestor(s):
87b0b56 G1
Merge made by recursive.
 H1.t |    1 +
 I1.t |    1 +
 J1.t |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 H1.t
 create mode 100644 I1.t
 create mode 100644 J1.t
Rebasing (1/7)Rebasing (2/7)Rebasing (3/7)Rebasing (4/7)Rebasing (5/7)Rebasing (6/7)Rebasing (7/7)
ok 3 - rebase two levels of merge
# passed all 3 test(s)
1..3

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3414-rebase-preserve-onto/.git/
expecting success: 
	test_commit A1 &&
	test_commit B1 &&
	test_commit C1 &&
	test_commit D1 &&
	git reset --hard B1 &&
	test_commit E1 &&
	test_commit F1 &&
	test_merge G1 D1 &&
	git reset --hard A1 &&
	test_commit H1

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
[master d7157d8] D1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 D1.t
HEAD is now at 37e5de5 B1
[master b959d6c] E1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 E1.t
[master 81dc3a6] F1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F1.t
Merging:
81dc3a6 F1
virtual D1
found 1 common ancestor(s):
37e5de5 B1
Merge made by recursive.
 C1.t |    1 +
 D1.t |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 C1.t
 create mode 100644 D1.t
HEAD is now at 6fb0b66 A1
[master 4950a7c] H1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 H1.t

ok 1 - setup

expecting success: 
	git checkout G1 &&
	git rebase -p --onto H1 B1 &&
	test "$(git rev-parse HEAD^1^1^1)" = "$(git rev-parse H1)" &&
	test "$(git rev-parse HEAD^2^1^1)" = "$(git rev-parse H1)"
Rebasing (1/5)Rebasing (2/5)Rebasing (3/5)Rebasing (4/5)Rebasing (5/5)
ok 2 - rebase from B1 onto H1

expecting success: 
	git checkout G1 &&
	git rebase -p --onto H1 E1 &&
	test "$(git rev-parse HEAD^1^1)" = "$(git rev-parse H1)" &&
	test "$(git rev-parse HEAD^2)" = "$(git rev-parse D1)"

Rebasing (1/2)Rebasing (2/2)
ok 3 - rebase from E1 onto H1

expecting success: 
	git checkout G1 &&
	git rev-list --first-parent --pretty=oneline C1..G1 &&
	git rebase -p --onto H1 C1 &&
	test "$(git rev-parse HEAD^2^1)" = "$(git rev-parse H1)" &&
	test "$(git rev-parse HEAD^1)" = "$(git rev-parse F1)"

52308dd60394ebd5599b39fb69108f164975ed7a G1
81dc3a6494c9a0091f921c65194433ffa66d8dac F1
b959d6cc0d4f2d10f0d432e45cd5578c75065af5 E1
Rebasing (1/2)Rebasing (2/2)
ok 4 - rebase from C1 onto H1

# passed all 4 test(s)
1..4

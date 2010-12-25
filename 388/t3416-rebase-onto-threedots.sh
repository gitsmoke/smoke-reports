Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3416-rebase-onto-threedots/.git/
expecting success: 
	test_commit A &&
	test_commit B &&
	git branch side &&
	test_commit C &&
	git branch topic &&
	git checkout side &&
	test_commit H &&
	git checkout master &&
	test_tick &&
	git merge H &&
	git tag D &&
	test_commit E &&
	git checkout topic &&
	test_commit F &&
	test_commit G &&
	git checkout side &&
	test_tick &&
	git merge C &&
	git tag I &&
	test_commit J &&
	test_commit K

[master (root-commit) 0ddfaf1] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A.t
[master d9df450] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B.t
[master 35a8500] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C.t
[side e9f30f6] H
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 H.t
Merging:
35a8500 C
virtual H
found 1 common ancestor(s):
d9df450 B
Merge made by recursive.
 H.t |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 H.t
[master bb25593] E
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 E.t
[topic 0fb828b] F
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F.t
[topic a08c965] G
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 G.t
Merging:
e9f30f6 H
virtual C
found 1 common ancestor(s):
d9df450 B
Merge made by recursive.
 C.t |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C.t
[side 8bdbfec] J
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 J.t
[side 83de897] K
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 K.t

ok 1 - setup

expecting success: 
	git reset --hard &&
	git checkout topic &&
	git reset --hard G &&

	git rebase --onto master...topic F &&
	git rev-parse HEAD^1 >actual &&
	git rev-parse C^0 >expect &&
	test_cmp expect actual

HEAD is now at 83de897 K
HEAD is now at a08c965 G
First, rewinding head to replay your work on top of it...
Applying: G

ok 2 - rebase --onto master...topic

expecting success: 
	git reset --hard &&
	git checkout topic &&
	git reset --hard G &&

	git rebase --onto master... F &&
	git rev-parse HEAD^1 >actual &&
	git rev-parse C^0 >expect &&
	test_cmp expect actual

HEAD is now at f576ef2 G
HEAD is now at a08c965 G
First, rewinding head to replay your work on top of it...
Applying: G

ok 3 - rebase --onto master...

expecting success: 
	git reset --hard &&
	git checkout side &&
	git reset --hard K &&

	test_must_fail git rebase --onto master...side J

HEAD is now at f576ef2 G
HEAD is now at 83de897 K

ok 4 - rebase --onto master...side

expecting success: 
	git reset --hard &&
	git checkout topic &&
	git reset --hard G &&
	set_fake_editor &&
	EXPECT_COUNT=1 git rebase -i --onto master...topic F &&
	git rev-parse HEAD^1 >actual &&
	git rev-parse C^0 >expect &&
	test_cmp expect actual

HEAD is now at 83de897 K
HEAD is now at a08c965 G
Rebasing (1/1)
ok 5 - rebase -i --onto master...topic

expecting success: 
	git reset --hard &&
	git checkout topic &&
	git reset --hard G &&
	set_fake_editor &&
	EXPECT_COUNT=1 git rebase -i --onto master... F &&
	git rev-parse HEAD^1 >actual &&
	git rev-parse C^0 >expect &&
	test_cmp expect actual
HEAD is now at f576ef2 G
HEAD is now at a08c965 G
Rebasing (1/1)
ok 6 - rebase -i --onto master...

expecting success: 
	git reset --hard &&
	git checkout side &&
	git reset --hard K &&

	test_must_fail git rebase -i --onto master...side J
HEAD is now at f576ef2 G
HEAD is now at 83de897 K

ok 7 - rebase -i --onto master...side

# passed all 7 test(s)
1..7

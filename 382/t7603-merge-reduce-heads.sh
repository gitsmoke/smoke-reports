Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7603-merge-reduce-heads/.git/
expecting success: 
	echo c0 > c0.c &&
	git add c0.c &&
	git commit -m c0 &&
	git tag c0 &&
	echo c1 > c1.c &&
	git add c1.c &&
	git commit -m c1 &&
	git tag c1 &&
	git reset --hard c0 &&
	echo c2 > c2.c &&
	git add c2.c &&
	git commit -m c2 &&
	git tag c2 &&
	git reset --hard c0 &&
	echo c3 > c3.c &&
	git add c3.c &&
	git commit -m c3 &&
	git tag c3 &&
	git reset --hard c0 &&
	echo c4 > c4.c &&
	git add c4.c &&
	git commit -m c4 &&
	git tag c4 &&
	echo c5 > c5.c &&
	git add c5.c &&
	git commit -m c5 &&
	git tag c5
[master (root-commit) b091d54] c0
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c0.c
[master 4c62478] c1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c1.c
HEAD is now at b091d54 c0
[master 6c53a3e] c2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c2.c
HEAD is now at b091d54 c0
[master ec0f2ef] c3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c3.c
HEAD is now at b091d54 c0
[master 2ad01b2] c4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c4.c
[master d7c7f71] c5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c5.c

ok 1 - setup
expecting success: 
	git reset --hard c1 &&
	git merge c2 c3 c4 c5 &&
	test "$(git rev-parse c1)" != "$(git rev-parse HEAD)" &&
	test "$(git rev-parse c1)" = "$(git rev-parse HEAD^1)" &&
	test "$(git rev-parse c2)" = "$(git rev-parse HEAD^2)" &&
	test "$(git rev-parse c3)" = "$(git rev-parse HEAD^3)" &&
	test "$(git rev-parse c5)" = "$(git rev-parse HEAD^4)" &&
	git diff --exit-code &&
	test -f c0.c &&
	test -f c1.c &&
	test -f c2.c &&
	test -f c3.c &&
	test -f c4.c &&
	test -f c5.c
HEAD is now at 4c62478 c1
Trying simple merge with c2
Trying simple merge with c3
Trying simple merge with c4
Trying simple merge with c5
Merge made by octopus.
 c2.c |    1 +
 c3.c |    1 +
 c4.c |    1 +
 c5.c |    1 +
 4 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 c2.c
 create mode 100644 c3.c
 create mode 100644 c4.c
 create mode 100644 c5.c

ok 2 - merge c1 with c2, c3, c4, c5

expecting success: 
	for i in A B C D E
	do
		echo $i > $i.c &&
		git add $i.c &&
		git commit -m $i &&
		git tag $i
	done &&
	git reset --hard A &&
	for i in F G H I
	do
		echo $i > $i.c &&
		git add $i.c &&
		git commit -m $i &&
		git tag $i
	done
[master 6c14511] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A.c
[master 21d2965] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B.c
[master 88d2092] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C.c
[master 5cd010f] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 D.c
[master 1b34209] E
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 E.c
HEAD is now at 6c14511 A
[master 0db9520] F
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 F.c
[master 30ed1cd] G
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 G.c
[master 0f05a1a] H
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 H.c
[master 2e9c213] I
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 I.c

ok 3 - setup

expecting success: 
	git reset --hard A &&
	git merge E I
HEAD is now at 6c14511 A
Fast-forwarding to: E
Trying simple merge with I
Merge made by octopus.
 B.c |    1 +
 C.c |    1 +
 D.c |    1 +
 E.c |    1 +
 F.c |    1 +
 G.c |    1 +
 H.c |    1 +
 I.c |    1 +
 8 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 B.c
 create mode 100644 C.c
 create mode 100644 D.c
 create mode 100644 E.c
 create mode 100644 F.c
 create mode 100644 G.c
 create mode 100644 H.c
 create mode 100644 I.c

ok 4 - merge E and I

expecting success: 
	test $(git rev-parse HEAD^1) = $(git rev-parse E) &&
	test $(git rev-parse HEAD^2) = $(git rev-parse I)

ok 5 - verify merge result

expecting success: 
	git reset --hard E &&
	echo foo > file.c &&
	git add file.c &&
	git commit -m E2 &&
	git tag E2 &&
	git reset --hard I &&
	echo bar >file.c &&
	git add file.c &&
	git commit -m I2 &&
	git tag I2
HEAD is now at 1b34209 E
[master fa08a36] E2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file.c
HEAD is now at 2e9c213 I
[master d0a0a32] I2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file.c

ok 6 - add conflicts
expecting success: 
	git reset --hard A &&
	test_must_fail git merge E2 I2 &&
	echo baz > file.c &&
	git add file.c &&
	git commit -m "resolve conflict"
HEAD is now at 6c14511 A
Fast-forwarding to: E2
Trying simple merge with I2
Simple merge did not work, trying automatic merge.
Added file.c in both, but differently.
ERROR: content conflict in file.c
Automatic merge failed; fix conflicts and then commit the result.
[master 77b941d] resolve conflict
 Author: A U Thor <author@example.com>

ok 7 - merge E2 and I2, causing a conflict and resolve it

expecting success: 
	test $(git rev-parse HEAD^1) = $(git rev-parse E2) &&
	test $(git rev-parse HEAD^2) = $(git rev-parse I2)

ok 8 - verify merge result

# passed all 8 test(s)
1..8

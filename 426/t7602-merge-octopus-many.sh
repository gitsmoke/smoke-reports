Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7602-merge-octopus-many/.git/
expecting success: 
	echo c0 > c0.c &&
	git add c0.c &&
	git commit -m c0 &&
	git tag c0 &&
	i=1 &&
	while test $i -le 30
	do
		git reset --hard c0 &&
		echo c$i > c$i.c &&
		git add c$i.c &&
		git commit -m c$i &&
		git tag c$i &&
		i=`expr $i + 1` || return 1
	done
[master (root-commit) 55fbf4f] c0
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c0.c
HEAD is now at 55fbf4f c0
[master 7a6ac7b] c1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c1.c
HEAD is now at 55fbf4f c0
[master 731b273] c2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c2.c
HEAD is now at 55fbf4f c0
[master 34dcbc1] c3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c3.c
HEAD is now at 55fbf4f c0
[master 20f7f94] c4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c4.c
HEAD is now at 55fbf4f c0
[master 7e62bc8] c5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c5.c
HEAD is now at 55fbf4f c0
[master 8d481b5] c6
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c6.c
HEAD is now at 55fbf4f c0
[master 3bf5825] c7
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c7.c
HEAD is now at 55fbf4f c0
[master acb50a7] c8
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c8.c
HEAD is now at 55fbf4f c0
[master 3fa28d1] c9
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c9.c
HEAD is now at 55fbf4f c0
[master e751f81] c10
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c10.c
HEAD is now at 55fbf4f c0
[master 1069ea6] c11
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c11.c
HEAD is now at 55fbf4f c0
[master 259d29c] c12
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c12.c
HEAD is now at 55fbf4f c0
[master 7edeab9] c13
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c13.c
HEAD is now at 55fbf4f c0
[master 85949e2] c14
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c14.c
HEAD is now at 55fbf4f c0
[master 0d20ad6] c15
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c15.c
HEAD is now at 55fbf4f c0
[master ae6eb83] c16
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c16.c
HEAD is now at 55fbf4f c0
[master 3459574] c17
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c17.c
HEAD is now at 55fbf4f c0
[master 69e55d2] c18
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c18.c
HEAD is now at 55fbf4f c0
[master 7ac9eee] c19
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c19.c
HEAD is now at 55fbf4f c0
[master 4a74cc6] c20
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c20.c
HEAD is now at 55fbf4f c0
[master 81103b7] c21
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c21.c
HEAD is now at 55fbf4f c0
[master 7d74089] c22
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c22.c
HEAD is now at 55fbf4f c0
[master f36f54b] c23
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c23.c
HEAD is now at 55fbf4f c0
[master ad5582e] c24
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c24.c
HEAD is now at 55fbf4f c0
[master 5f665e5] c25
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c25.c
HEAD is now at 55fbf4f c0
[master 0fb6456] c26
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c26.c
HEAD is now at 55fbf4f c0
[master b0df01e] c27
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c27.c
HEAD is now at 55fbf4f c0
[master e38c6de] c28
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c28.c
HEAD is now at 55fbf4f c0
[master eb87bd5] c29
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c29.c
HEAD is now at 55fbf4f c0
[master 48cbe25] c30
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c30.c

ok 1 - setup

expecting success: 
	git reset --hard c1 &&
	i=2 &&
	refs="" &&
	while test $i -le 30
	do
		refs="$refs c$i"
		i=`expr $i + 1`
	done &&
	git merge $refs &&
	test "$(git rev-parse c1)" != "$(git rev-parse HEAD)" &&
	i=1 &&
	while test $i -le 30
	do
		test "$(git rev-parse c$i)" = "$(git rev-parse HEAD^$i)" &&
		i=`expr $i + 1` || return 1
	done &&
	git diff --exit-code &&
	i=1 &&
	while test $i -le 30
	do
		test -f c$i.c &&
		i=`expr $i + 1` || return 1
	done
HEAD is now at 7a6ac7b c1
Trying simple merge with c2
Trying simple merge with c3
Trying simple merge with c4
Trying simple merge with c5
Trying simple merge with c6
Trying simple merge with c7
Trying simple merge with c8
Trying simple merge with c9
Trying simple merge with c10
Trying simple merge with c11
Trying simple merge with c12
Trying simple merge with c13
Trying simple merge with c14
Trying simple merge with c15
Trying simple merge with c16
Trying simple merge with c17
Trying simple merge with c18
Trying simple merge with c19
Trying simple merge with c20
Trying simple merge with c21
Trying simple merge with c22
Trying simple merge with c23
Trying simple merge with c24
Trying simple merge with c25
Trying simple merge with c26
Trying simple merge with c27
Trying simple merge with c28
Trying simple merge with c29
Trying simple merge with c30
Merge made by octopus.
 c10.c |    1 +
 c11.c |    1 +
 c12.c |    1 +
 c13.c |    1 +
 c14.c |    1 +
 c15.c |    1 +
 c16.c |    1 +
 c17.c |    1 +
 c18.c |    1 +
 c19.c |    1 +
 c2.c  |    1 +
 c20.c |    1 +
 c21.c |    1 +
 c22.c |    1 +
 c23.c |    1 +
 c24.c |    1 +
 c25.c |    1 +
 c26.c |    1 +
 c27.c |    1 +
 c28.c |    1 +
 c29.c |    1 +
 c3.c  |    1 +
 c30.c |    1 +
 c4.c  |    1 +
 c5.c  |    1 +
 c6.c  |    1 +
 c7.c  |    1 +
 c8.c  |    1 +
 c9.c  |    1 +
 29 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 c10.c
 create mode 100644 c11.c
 create mode 100644 c12.c
 create mode 100644 c13.c
 create mode 100644 c14.c
 create mode 100644 c15.c
 create mode 100644 c16.c
 create mode 100644 c17.c
 create mode 100644 c18.c
 create mode 100644 c19.c
 create mode 100644 c2.c
 create mode 100644 c20.c
 create mode 100644 c21.c
 create mode 100644 c22.c
 create mode 100644 c23.c
 create mode 100644 c24.c
 create mode 100644 c25.c
 create mode 100644 c26.c
 create mode 100644 c27.c
 create mode 100644 c28.c
 create mode 100644 c29.c
 create mode 100644 c3.c
 create mode 100644 c30.c
 create mode 100644 c4.c
 create mode 100644 c5.c
 create mode 100644 c6.c
 create mode 100644 c7.c
 create mode 100644 c8.c
 create mode 100644 c9.c

ok 2 - merge c1 with c2, c3, c4, ... c29

expecting success: 
	git reset --hard c1 &&
	git merge c2 c3 c4 >actual &&
	test_cmp actual expected
HEAD is now at 7a6ac7b c1
ok 3 - merge output uses pretty names
expecting success: 
	git merge c4 c5 >actual &&
	test_cmp actual expected

ok 4 - merge up-to-date output uses pretty names

expecting success: 
	git reset --hard c0 &&
	git merge c1 c2 >actual &&
	test_cmp actual expected

HEAD is now at 55fbf4f c0

ok 5 - merge fast-forward output uses pretty names

# passed all 5 test(s)
1..5

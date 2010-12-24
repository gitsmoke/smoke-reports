Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5307-pack-missing-commit/.git/
expecting success: 
	for i in 1 2 3 4 5
	do
		echo "$i" >"file$i" &&
		git add "file$i" &&
		test_tick &&
		git commit -m "$i" &&
		git tag "tag$i"
	done &&
	obj=$(git rev-parse --verify tag3) &&
	fanout=$(expr "$obj" : "\(..\)") &&
	remainder=$(expr "$obj" : "..\(.*\)") &&
	rm -f ".git/objects/$fanout/$remainder"

[master (root-commit) f1e5f64] 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1
[master 464ac64] 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
[master 4b3f9fe] 3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file3
[master 4387cd0] 4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file4
[master 18dfde5] 5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file5

ok 1 - setup

expecting success: 
	test_must_fail git fsck
missing commit 4b3f9fe85f6c3449091baf9783e2641f38efdd8e
dangling tree 5907482de36080ec355b7811e41e23276d5799ba

ok 2 - check corruption
expecting success: 
	test_must_fail git rev-list HEAD
18dfde5380f75061a4c4e203210947d874f34b14
ok 3 - rev-list notices corruption (1)
expecting success: 
	test_must_fail git rev-list --objects HEAD
18dfde5380f75061a4c4e203210947d874f34b14
ok 4 - rev-list notices corruption (2)
expecting success: 
	echo HEAD |
	test_must_fail git pack-objects --revs pack
ok 5 - pack-objects notices corruption

# passed all 5 test(s)
1..5

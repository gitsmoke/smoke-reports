Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3306-notes-prune/.git/
expecting success: 

	: > file1 &&
	git add file1 &&
	test_tick &&
	git commit -m 1st &&
	git notes add -m "Note #1" &&
	: > file2 &&
	git add file2 &&
	test_tick &&
	git commit -m 2nd &&
	git notes add -m "Note #2" &&
	: > file3 &&
	git add file3 &&
	test_tick &&
	git commit -m 3rd &&
	git notes add -m "Note #3"

[master (root-commit) ab5f302] 1st
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file1
[master 08341ad] 2nd
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file2
[master 5ee1c35] 3rd
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file3

ok 1 - setup: create a few commits with notes
expecting success: 

	git log > actual &&
	test_cmp expect actual

ok 2 - verify commits and notes

expecting success: 

	git reset --hard HEAD~1 &&
	git reflog expire --expire=now HEAD &&
	git gc --prune=now
HEAD is now at 08341ad 2nd

ok 3 - remove some commits

expecting success: 

	test_must_fail git cat-file -p 5ee1c35e83ea47cd3cc4f8cbee0568915fbbbd29 &&
	git cat-file -p 08341ad9e94faa089d60fd3f523affb25c6da189 &&
	git cat-file -p ab5f302035f2e7aaf04265f08b42034c23256e1f

tree aefde3a01f6e10d72fd4899ce14c8b2654d3eb45
parent ab5f302035f2e7aaf04265f08b42034c23256e1f
author A U Thor <author@example.com> 1112912053 -0700
committer C O Mitter <committer@example.com> 1112912053 -0700

2nd
tree ad24149d789e59d4b5f9ce41cda90110ca0f98b7
author A U Thor <author@example.com> 1112911993 -0700
committer C O Mitter <committer@example.com> 1112911993 -0700

1st

ok 4 - verify that commits are gone

expecting success: 

	git notes show 5ee1c35e83ea47cd3cc4f8cbee0568915fbbbd29 &&
	git notes show 08341ad9e94faa089d60fd3f523affb25c6da189 &&
	git notes show ab5f302035f2e7aaf04265f08b42034c23256e1f

Note #3
Note #2
Note #1

ok 5 - verify that notes are still present

expecting success: 

	git notes list > expect &&
	git notes prune -n &&
	git notes list > actual &&
	test_cmp expect actual
5ee1c35e83ea47cd3cc4f8cbee0568915fbbbd29
ok 6 - prune -n does not remove notes
expecting success: 


	git notes prune -n > actual &&
	test_cmp expect actual

ok 7 - prune -n lists prunable notes

expecting success: 

	git notes prune

ok 8 - prune notes

expecting success: 

	test_must_fail git notes show 5ee1c35e83ea47cd3cc4f8cbee0568915fbbbd29 &&
	git notes show 08341ad9e94faa089d60fd3f523affb25c6da189 &&
	git notes show ab5f302035f2e7aaf04265f08b42034c23256e1f
Note #2
Note #1
ok 9 - verify that notes are gone
expecting success: 

	git reset --hard HEAD~1 &&
	git reflog expire --expire=now HEAD &&
	git gc --prune=now
HEAD is now at ab5f302 1st
ok 10 - remove some commits
expecting success: 

	git notes prune -v > actual &&
	test_cmp expect actual

ok 11 - prune -v notes

expecting success: 

	test_must_fail git notes show 5ee1c35e83ea47cd3cc4f8cbee0568915fbbbd29 &&
	test_must_fail git notes show 08341ad9e94faa089d60fd3f523affb25c6da189 &&
	git notes show ab5f302035f2e7aaf04265f08b42034c23256e1f

Note #1

ok 12 - verify that notes are gone

# passed all 12 test(s)
1..12

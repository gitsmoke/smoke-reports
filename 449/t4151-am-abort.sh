Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4151-am-abort/.git/
expecting success: 
	for i in a b c d e f g
	do
		echo $i
	done >file-1 &&
	cp file-1 file-2 &&
	test_tick &&
	git add file-1 file-2 &&
	git commit -m initial &&
	git tag initial &&
	for i in 2 3 4 5 6
	do
		echo $i >>file-1 &&
		echo $i >otherfile-$i &&
		git add otherfile-$i &&
		test_tick &&
		git commit -a -m $i || break
	done &&
	git format-patch --no-numbered initial &&
	git checkout -b side initial &&
	echo local change >file-2-expect
[master (root-commit) 1732241] initial
 Author: A U Thor <author@example.com>
 2 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 file-1
 create mode 100644 file-2
[master a485f10] 2
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 otherfile-2
[master b72e0d7] 3
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 otherfile-3
[master f1dbda2] 4
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 otherfile-4
[master 73a4960] 5
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 otherfile-5
[master 87a053c] 6
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 otherfile-6
0001-2.patch
0002-3.patch
0003-4.patch
0004-5.patch
0005-6.patch

ok 1 - setup

expecting success: 

		git reset --hard initial &&
		cp file-2-expect file-2 &&

		test_must_fail git am$with3 000[1245]-*.patch &&
		git log --pretty=tformat:%s >actual &&
		for i in 3 2 initial
		do
			echo $i
		done >expect &&
		test_cmp expect actual
	
HEAD is now at 1732241 initial
Applying: 2
Applying: 3
Applying: 5
Patch failed at 0003 5
When you have resolved this problem run gitam--resolved.
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.

ok 2 - am stops at a patch that does not apply

expecting success: 
		test_must_fail git am$with3 --skip >output &&
		test "$(grep "^Applying" output)" = "Applying: 6" &&
		test_cmp file-2-expect file-2 &&
		test ! -f .git/MERGE_RR
	

ok 3 - am --skip continue after failed am

expecting success: 
		git am --abort &&
		git rev-parse HEAD >actual &&
		git rev-parse initial >expect &&
		test_cmp expect actual &&
		test_cmp file-2-expect file-2 &&
		git diff-index --exit-code --cached HEAD &&
		test ! -f .git/MERGE_RR
	
Unstaged changes after reset:
M	file-2

ok 4 - am --abort goes back after failed am

expecting success: 

		git reset --hard initial &&
		cp file-2-expect file-2 &&

		test_must_fail git am$with3 000[1245]-*.patch &&
		git log --pretty=tformat:%s >actual &&
		for i in 3 2 initial
		do
			echo $i
		done >expect &&
		test_cmp expect actual
	
HEAD is now at 1732241 initial
Applying: 2
Applying: 3
Applying: 5
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with 5
Merging:
62dd7f8 3
virtual 5
found 1 common ancestor(s):
virtual 2e4b8a989c579cac9d3cc1897320a3e27805d080
Auto-merging file-1
CONFLICT (content): Merge conflict in file-1
Failed to merge in the changes.
Patch failed at 0003 5
When you have resolved this problem run gitam--resolved.
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.

ok 5 - am -3 stops at a patch that does not apply

expecting success: 
		test_must_fail git am$with3 --skip >output &&
		test "$(grep "^Applying" output)" = "Applying: 6" &&
		test_cmp file-2-expect file-2 &&
		test ! -f .git/MERGE_RR
	

ok 6 - am -3 --skip continue after failed am -3

expecting success: 
		git am --abort &&
		git rev-parse HEAD >actual &&
		git rev-parse initial >expect &&
		test_cmp expect actual &&
		test_cmp file-2-expect file-2 &&
		git diff-index --exit-code --cached HEAD &&
		test ! -f .git/MERGE_RR
	
Unstaged changes after reset:
M	file-2
ok 7 - am --abort goes back after failed am -3

expecting success: 
	test_must_fail git am 0004-*.patch &&
	test_commit unrelated &&
	git rev-parse HEAD >expect &&
	git am --abort &&
	git rev-parse HEAD >actual &&
	test_cmp expect actual
Applying: 5
Patch failed at 0001 5
When you have resolved this problem run gitam--resolved.
If you would prefer to skip this patch, instead run gitam--skip.
To restore the original branch and stop patching run gitam--abort.
[side f386b22] unrelated
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 unrelated.t

ok 8 - am --abort will keep the local commits intact

# passed all 8 test(s)
1..8

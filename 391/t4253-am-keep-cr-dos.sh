Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4253-am-keep-cr-dos/.git/
expecting success: 
	append_cr <file1 >file &&
	git add file &&
	git commit -m Initial &&
	git tag initial &&
	append_cr <file2 >file &&
	git commit -a -m Second &&
	append_cr <file3 >file &&
	git commit -a -m Third
[master (root-commit) 08d6dfa] Initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master af75ed7] Second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master a1dd7a7] Third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup repository with dos files

expecting success: 
	git checkout -b dosfiles initial &&
	git format-patch -k initial..master &&
	test_must_fail git am -k -3 000*.patch &&
	git am --abort &&
	rm -rf .git/rebase-apply 000*.patch

0001-Second.patch
0002-Third.patch
Applying: Second
Using index info to reconstruct a base tree...
Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Cannot fall back to three-way merge.
Patch failed at 0001 Second
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".

ok 2 - am with dos files without --keep-cr

expecting success: 
	git checkout -b dosfiles-keep-cr initial &&
	git format-patch -k --stdout initial..master | git am --keep-cr -k -3 &&
	git diff --exit-code master
Applying: Second
Applying: Third

ok 3 - am with dos files with --keep-cr

expecting success: 
	git config am.keepcr 1 &&
	git checkout -b dosfiles-conf-keepcr initial &&
	git format-patch -k --stdout initial..master | git am -k -3 &&
	git diff --exit-code master
Applying: Second
Applying: Third

ok 4 - am with dos files config am.keepcr

expecting success: 
	git config am.keepcr 1 &&
	git checkout -b dosfiles-conf-keepcr-override initial &&
	git format-patch -k initial..master &&
	test_must_fail git am -k -3 --no-keep-cr 000*.patch &&
	git am --abort &&
	rm -rf .git/rebase-apply 000*.patch

0001-Second.patch
0002-Third.patch
Applying: Second
Using index info to reconstruct a base tree...
Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Cannot fall back to three-way merge.
Patch failed at 0001 Second
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".

ok 5 - am with dos files config am.keepcr overriden by --no-keep-cr

expecting success: 
	git checkout -b dosfiles-keep-cr-continue initial &&
	git format-patch -k initial..master &&
	append_cr <file1a >file &&
	git commit -m "different patch" file &&
	test_must_fail git am --keep-cr -k -3 000*.patch &&
	append_cr <file2 >file &&
	git add file &&
	git am -3 --resolved &&
	git diff --exit-code master
0001-Second.patch
0002-Third.patch
[dosfiles-keep-cr-continue bb5d64a] different patch
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Applying: Second
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Merging HEAD with Second
Merging:
bb5d64a different patch
virtual Second
found 1 common ancestor(s):
virtual 0626bbef2b13f86fc002fb580ec5fac3fd75fa44
Auto-merging file
CONFLICT (content): Merge conflict in file
Failed to merge in the changes.
Patch failed at 0001 Second
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".
Applying: Second
Applying: Third

ok 6 - am with dos files with --keep-cr continue

expecting success: 
	git config am.keepcr 1 &&
	git checkout -b unixfiles-conf-keepcr-override initial &&
	cp -f file1 file &&
	git commit -m "line ending to unix" file &&
	git format-patch -k initial..master &&
	git am -k -3 --no-keep-cr 000*.patch &&
	git diff --exit-code -w master
[unixfiles-conf-keepcr-override 6552605] line ending to unix
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
0001-Second.patch
0002-Third.patch
Applying: Second
Applying: Third

ok 7 - am with unix files config am.keepcr overriden by --no-keep-cr

# passed all 7 test(s)
1..7

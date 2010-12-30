Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4204-patch-id/.git/
expecting success: 
	test_commit initial foo a &&
	test_commit first foo b &&
	git checkout -b same HEAD^ &&
	test_commit same-msg foo b &&
	git checkout -b notsame HEAD^ &&
	test_commit notsame-msg foo c
[master (root-commit) 764e46a] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master 5069627] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[same 85d7715] same-msg
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[notsame 83adb69] notsame-msg
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	git log -p -1 | git patch-id > output &&
	grep "^[a-f0-9]\{40\} $(git rev-parse HEAD)$" output
a3bf8751720a8272b18f7a7d9e664a119c26e2fa 83adb69066b12367ff9efd62c322013a811b206b

ok 2 - patch-id output is well-formed

expecting success: 
	get_patch_id master &&
	get_patch_id same &&
	test_cmp patch-id_master patch-id_same


ok 3 - patch-id detects equality

expecting success: 
	get_patch_id master &&
	get_patch_id notsame &&
	! test_cmp patch-id_master patch-id_notsame
--- patch-id_master	2010-12-30 04:01:46.000000000 +0000
+++ patch-id_notsame	2010-12-30 04:01:46.000000000 +0000
@@ -1 +1 @@
-c842dbf772722a83c8ae80344a1a684eb72cb08d
+a3bf8751720a8272b18f7a7d9e664a119c26e2fa

ok 4 - patch-id detects inequality

expecting success: 
	get_patch_id master &&
	git checkout same &&
	git format-patch -1 --stdout | calc_patch_id same &&
	test_cmp patch-id_master patch-id_same &&
	set `git format-patch -1 --stdout | git patch-id` &&
	test "$2" = `git rev-parse HEAD`


ok 5 - patch-id supports git-format-patch output

expecting success: 
	get_patch_id master &&
	git checkout same &&
	git format-patch -1 --stdout | sed "s/ \$//" | calc_patch_id same &&
	test_cmp patch-id_master patch-id_same


ok 6 - whitespace is irrelevant in footer

expecting success: 
	get_patch_id master &&
	git checkout same &&
	git format-patch -1 --attach --stdout | calc_patch_id same &&
	test_cmp patch-id_master patch-id_same

ok 7 - patch-id supports git-format-patch MIME output

# passed all 7 test(s)
1..7

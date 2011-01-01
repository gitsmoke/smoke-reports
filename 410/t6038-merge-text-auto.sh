Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6038-merge-text-auto/.git/
expecting success: 
	git config core.autocrlf false &&

	echo first line | append_cr >file &&
	echo first line >control_file &&
	echo only line >inert_file &&

	git add file control_file inert_file &&
	test_tick &&
	git commit -m "Initial" &&
	git tag initial &&
	git branch side &&

	echo "* text=auto" >.gitattributes &&
	touch file &&
	git add .gitattributes file &&
	test_tick &&
	git commit -m "normalize file" &&

	echo same line | append_cr >>file &&
	echo same line >>control_file &&
	git add file control_file &&
	test_tick &&
	git commit -m "add line from a" &&
	git tag a &&

	git rm .gitattributes &&
	rm file &&
	git checkout file &&
	test_tick &&
	git commit -m "remove .gitattributes" &&
	git tag c &&

	git checkout side &&
	echo same line | append_cr >>file &&
	echo same line >>control_file &&
	git add file control_file &&
	test_tick &&
	git commit -m "add line from b" &&
	git tag b &&

	git checkout master
[master (root-commit) 1c56df1] Initial
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 control_file
 create mode 100644 file
 create mode 100644 inert_file
[master 2747e77] normalize file
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 1 deletions(-)
 create mode 100644 .gitattributes
[master 99f8882] add line from a
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
rm '.gitattributes'
[master 2f716ad] remove .gitattributes
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 .gitattributes
[side 0d9ffb6] add line from b
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
ok 1 - setup

expecting success: 
	fuzz_conflict() {
		sed $SED_OPTIONS -e "s/^\([<>=]......\) .*/\1/" "$@"
	}

ok 2 - set up fuzz_conflict() helper

expecting success: 
	cat <<-\EOF >expected &&
	first line
	same line
	EOF

	git config merge.renormalize true &&
	git rm -fr . &&
	rm -f .gitattributes &&
	git reset --hard a &&
	git merge b &&
	test_cmp expected file

rm 'control_file'
rm 'file'
rm 'inert_file'
HEAD is now at 99f8882 add line from a
Merging:
99f8882 add line from a
virtual b
found 1 common ancestor(s):
1c56df1 Initial
Skipped file (merged same as existing)
Merge made by recursive.

ok 3 - Merge after setting text=auto

expecting success: 
	cat <<-\EOF >expected &&
	first line
	same line
	EOF

	git config merge.renormalize true &&
	git rm -fr . &&
	rm -f .gitattributes &&
	git reset --hard b &&
	git merge a &&
	test_cmp expected file
rm '.gitattributes'
rm 'control_file'
rm 'file'
rm 'inert_file'
HEAD is now at 0d9ffb6 add line from b
Merging:
0d9ffb6 add line from b
virtual a
found 1 common ancestor(s):
1c56df1 Initial
Auto-merging file
Merge made by recursive.
 .gitattributes |    1 +
 file           |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)
 create mode 100644 .gitattributes

ok 4 - Merge addition of text=auto

expecting success: 
	q_to_cr <<-\EOF >expected &&
	<<<<<<<
	first line
	same line
	=======
	first lineQ
	same lineQ
	>>>>>>>
	EOF

	git config merge.renormalize false &&
	rm -f .gitattributes &&
	git reset --hard a &&
	test_must_fail git merge b &&
	fuzz_conflict file >file.fuzzy &&
	test_cmp expected file.fuzzy

HEAD is now at 99f8882 add line from a
Merging:
99f8882 add line from a
virtual b
found 1 common ancestor(s):
1c56df1 Initial
Auto-merging file
CONFLICT (content): Merge conflict in file
Automatic merge failed; fix conflicts and then commit the result.

ok 5 - Detect CRLF/LF conflict after setting text=auto

expecting success: 
	q_to_cr <<-\EOF >expected &&
	<<<<<<<
	first lineQ
	same lineQ
	=======
	first line
	same line
	>>>>>>>
	EOF

	git config merge.renormalize false &&
	rm -f .gitattributes &&
	git reset --hard b &&
	test_must_fail git merge a &&
	fuzz_conflict file >file.fuzzy &&
	test_cmp expected file.fuzzy
HEAD is now at 0d9ffb6 add line from b
Merging:
0d9ffb6 add line from b
virtual a
found 1 common ancestor(s):
1c56df1 Initial
Auto-merging file
CONFLICT (content): Merge conflict in file
Automatic merge failed; fix conflicts and then commit the result.

ok 6 - Detect LF/CRLF conflict from addition of text=auto

checking known breakage: 
	cat <<-\EOF >expected &&
	first line
	same line
	EOF

	git config merge.renormalize true &&
	git rm -fr . &&
	rm -f .gitattributes &&
	git reset --hard initial &&
	git checkout a -- . &&
	git checkout -m b &&
	test_cmp expected file

file: needs merge
rm '.gitattributes'
rm 'control_file'
rm 'file'
rm 'file'
rm 'file'
rm 'inert_file'
HEAD is now at 1c56df1 Initial
M	file
--- expected	2011-01-01 04:02:29.000000000 +0000
+++ file	2011-01-01 04:02:29.000000000 +0000
@@ -1,2 +1,7 @@
+<<<<<<< b
+first line
+same line
+=======
 first line
 same line
+>>>>>>> local

not ok 7 - checkout -m after setting text=auto # TODO known breakage

checking known breakage: 
	cat <<-\EOF >expected &&
	first line
	same line
	EOF

	git config merge.renormalize true &&
	git rm -fr . &&
	rm -f .gitattributes file &&
	git reset --hard initial &&
	git checkout b -- . &&
	git checkout -m a &&
	test_cmp expected file

file: needs merge
rm 'control_file'
rm 'file'
rm 'file'
rm 'file'
rm 'inert_file'
HEAD is now at 1c56df1 Initial
M	file
--- expected	2011-01-01 04:02:29.000000000 +0000
+++ file	2011-01-01 04:02:29.000000000 +0000
@@ -1,2 +1,7 @@
+<<<<<<< a
 first line
 same line
+=======
+first line
+same line
+>>>>>>> local

not ok 8 - checkout -m addition of text=auto # TODO known breakage

checking known breakage: 
	append_cr <<-\EOF >expected &&
	first line
	same line
	EOF

	git config merge.renormalize true &&
	git rm -fr . &&
	git reset --hard b &&
	test_must_fail git cherry-pick a >err 2>&1 &&
	grep "[Nn]othing added" err &&
	test_cmp expected file

file: needs merge
rm '.gitattributes'
rm 'control_file'
rm 'file'
rm 'file'
rm 'file'
rm 'inert_file'
HEAD is now at 0d9ffb6 add line from b

not ok 9 - cherry-pick patch from after text=auto was added # TODO known breakage

expecting success: 
	git checkout -f side &&
	git rm -fr . &&
	rm -f .gitattributes &&
	git reset --hard initial &&
	git rm file &&
	git commit -m "remove file" &&
	git checkout master &&
	git reset --hard a^ &&
	git merge side

rm 'control_file'
rm 'file'
rm 'inert_file'
HEAD is now at 1c56df1 Initial
rm 'file'
[side 7dc5d25] remove file
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 file
HEAD is now at 2747e77 normalize file
Merging:
2747e77 normalize file
virtual side
found 1 common ancestor(s):
1c56df1 Initial
Removing file
Merge made by recursive.
 file |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 file
ok 10 - Test delete/normalize conflict

# still have 3 known breakage(s)
# passed all remaining 7 test(s)
1..10

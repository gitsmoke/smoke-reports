Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7102-reset/.git/
expecting success: 
	test_tick &&
	echo "1st file" >first &&
	git add first &&
	git commit -m "create 1st file" &&

	echo "2nd file" >second &&
	git add second &&
	git commit -m "create 2nd file" &&

	echo "2nd line 1st file" >>first &&
	git commit -a -m "modify 1st file" &&

	git rm first &&
	git mv second secondfile &&
	git commit -a -m "remove 1st and rename 2nd" &&

	echo "1st line 2nd file" >secondfile &&
	echo "2nd line 2nd file" >>secondfile &&
	git commit -a -m "modify 2nd file"
[master (root-commit) 811bbdf] create 1st file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 first
[master ba22ccd] create 2nd file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 second
[master ddaefe0] modify 1st file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
rm 'first'
[master d1a4bc3] remove 1st and rename 2nd
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 2 deletions(-)
 delete mode 100644 first
 rename second => secondfile (100%)
[master 3ec3965] modify 2nd file
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 1 deletions(-)

ok 1 - creating initial files and commits
expecting success: 
	test_must_fail git reset aaaaaa &&
	test_must_fail git reset --mixed aaaaaa &&
	test_must_fail git reset --soft aaaaaa &&
	test_must_fail git reset --hard aaaaaa &&
	check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc
ok 2 - giving a non existing revision should fail

expecting success: 
	touch .git/MERGE_HEAD &&
	echo "100644 44c5b5884550c17758737edcced463447b91d42b 1	un" |
		git update-index --index-info &&
	test_must_fail git reset --soft HEAD &&
	rm .git/MERGE_HEAD &&
	git rm --cached -- un
un: needs merge
rm 'un'
ok 3 - reset --soft with unmerged index should fail
expecting success: 
	test_must_fail git reset --soft -- first &&
	test_must_fail git reset --hard -- first &&
	test_must_fail git reset --soft HEAD^ -- first &&
	test_must_fail git reset --hard HEAD^ -- first &&
	check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc
ok 4 - giving paths with options different than --mixed should fail

expecting success: 
	test_must_fail git reset --other &&
	test_must_fail git reset -o &&
	test_must_fail git reset --mixed --other &&
	test_must_fail git reset --mixed -o &&
	test_must_fail git reset --soft --other &&
	test_must_fail git reset --soft -o &&
	test_must_fail git reset --hard --other &&
	test_must_fail git reset --hard -o &&
	check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc

ok 5 - giving unrecognized options should fail

expecting success: 
	git branch branch1 &&
	git branch branch2 &&

	git checkout branch1 &&
	echo "3rd line in branch1" >>secondfile &&
	git commit -a -m "change in branch1" &&

	git checkout branch2 &&
	echo "3rd line in branch2" >>secondfile &&
	git commit -a -m "change in branch2" &&

	test_must_fail git merge branch1 &&
	test_must_fail git reset --soft &&

	printf "1st line 2nd file
2nd line 2nd file
3rd line" >secondfile &&
	git commit -a -m "the change in branch2" &&

	git checkout master &&
	git branch -D branch1 branch2 &&
	check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc
[branch1 4a775ee] change in branch1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[branch2 77abb33] change in branch2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Merging:
77abb33 change in branch2
virtual branch1
found 1 common ancestor(s):
3ec3965 modify 2nd file
Auto-merging secondfile
CONFLICT (content): Merge conflict in secondfile
Automatic merge failed; fix conflicts and then commit the result.
[branch2 a360825] the change in branch2
 Author: A U Thor <author@example.com>
Deleted branch branch1 (was 4a775ee).
Deleted branch branch2 (was a360825).

ok 6 - trying to do reset --soft with pending merge should fail
expecting success: 
	git branch branch3 &&
	git branch branch4 &&

	git checkout branch3 &&
	echo "3rd line in branch3" >>secondfile &&
	git commit -a -m "line in branch3" &&

	git checkout branch4 &&
	echo "3rd line in branch4" >>secondfile &&

	git checkout -m branch3 &&
	test_must_fail git reset --soft &&

	printf "1st line 2nd file
2nd line 2nd file
3rd line" >secondfile &&
	git commit -a -m "the line in branch3" &&

	git checkout master &&
	git branch -D branch3 branch4 &&
	check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc
[branch3 09b7c70] line in branch3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
M	secondfile
[branch3 a7b4407] the line in branch3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Deleted branch branch3 (was a7b4407).
Deleted branch branch4 (was 3ec3965).
ok 7 - trying to do reset --soft with pending checkout merge should fail

expecting success: 
	git reset --hard &&
		check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc &&
	git reset --hard HEAD &&
		check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc &&
	git reset --soft &&
		check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc &&
	git reset --soft HEAD &&
		check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc &&
	git reset --mixed &&
		check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc &&
	git reset --mixed HEAD &&
		check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc &&
	git reset &&
		check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc &&
	git reset HEAD &&
		check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc
HEAD is now at 3ec3965 modify 2nd file
HEAD is now at 3ec3965 modify 2nd file

ok 8 - resetting to HEAD with no changes should succeed and do nothing

expecting success: 
	git reset --soft HEAD^ &&
	check_changes d1a4bc3abce4829628ae2dcb0d60ef3d1a78b1c4 &&
	test "$(git rev-parse ORIG_HEAD)" = \
			3ec39651e7f44ea531a5de18a9fa791c0fd370fc


ok 9 - --soft reset only should show changes in diff --cached

expecting success: 
	echo "3rd line 2nd file" >>secondfile &&
	git commit -a -C ORIG_HEAD &&
	check_changes 3d3b7be011a58ca0c179ae45d94e6c83c0b0cd0d &&
	test "$(git rev-parse ORIG_HEAD)" = \
			3ec39651e7f44ea531a5de18a9fa791c0fd370fc

[master 3d3b7be] modify 2nd file
 Author: A U Thor <author@example.com>
 1 files changed, 3 insertions(+), 1 deletions(-)

ok 10 - changing files and redo the last commit should succeed

expecting success: 
	git reset --hard HEAD~2 &&
	check_changes ddaefe00f1da16864591c61fdc7adb5d7cd6b74e &&
	test "$(git rev-parse ORIG_HEAD)" = \
			3d3b7be011a58ca0c179ae45d94e6c83c0b0cd0d

HEAD is now at ddaefe0 modify 1st file

ok 11 - --hard reset should change the files and undo commits permanently

expecting success: 
	git rm first &&
	git mv second secondfile &&

	echo "1st line 2nd file" >secondfile &&
	echo "2nd line 2nd file" >>secondfile &&
	git add secondfile &&
	check_changes ddaefe00f1da16864591c61fdc7adb5d7cd6b74e

rm 'first'

ok 12 - redoing changes adding them without commit them should succeed

expecting success: 
	git reset &&
	check_changes ddaefe00f1da16864591c61fdc7adb5d7cd6b74e &&
	test "$(git rev-parse ORIG_HEAD)" = \
			ddaefe00f1da16864591c61fdc7adb5d7cd6b74e

Unstaged changes after reset:
M	first
M	second

ok 13 - --mixed reset to HEAD should unadd the files

expecting success: 
	git add secondfile &&
	git reset --hard ddaefe00f1da16864591c61fdc7adb5d7cd6b74e &&

	git rm first &&
	git mv second secondfile &&
	git commit -a -m "remove 1st and rename 2nd" &&

	echo "1st line 2nd file" >secondfile &&
	echo "2nd line 2nd file" >>secondfile &&
	git commit -a -m "modify 2nd file" &&
	check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc

HEAD is now at ddaefe0 modify 1st file
rm 'first'
[master d1a4bc3] remove 1st and rename 2nd
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 2 deletions(-)
 delete mode 100644 first
 rename second => secondfile (100%)
[master 3ec3965] modify 2nd file
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 1 deletions(-)

ok 14 - redoing the last two commits should succeed

expecting success: 
	git branch branch1 &&
	git branch branch2 &&

	git checkout branch1 &&
	echo "3rd line in branch1" >>secondfile &&
	git commit -a -m "change in branch1" &&

	git checkout branch2 &&
	echo "3rd line in branch2" >>secondfile &&
	git commit -a -m "change in branch2" &&

	test_must_fail git pull . branch1 &&
	git reset --hard &&
	check_changes 77abb337073fb4369a7ad69ff6f5ec0e4d6b54bb

[branch1 4a775ee] change in branch1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[branch2 77abb33] change in branch2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Merging:
77abb33 change in branch2
virtual 4a775ee1b5fc5eafec2c2e60ed1fce971783c565
found 1 common ancestor(s):
3ec3965 modify 2nd file
Auto-merging secondfile
CONFLICT (content): Merge conflict in secondfile
Automatic merge failed; fix conflicts and then commit the result.
HEAD is now at 77abb33 change in branch2

ok 15 - --hard reset to HEAD should clear a failed merge

expecting success: 
	git reset --hard HEAD^ &&
	check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc &&

	git pull . branch1 &&
	git reset --hard ORIG_HEAD &&
	check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc &&

	git checkout master &&
	git branch -D branch1 branch2 &&
	check_changes 3ec39651e7f44ea531a5de18a9fa791c0fd370fc

HEAD is now at 3ec3965 modify 2nd file
Updating 3ec3965..4a775ee
Fast-forward
 secondfile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
HEAD is now at 3ec3965 modify 2nd file
Deleted branch branch1 (was 4a775ee).
Deleted branch branch2 (was 3ec3965).

ok 16 - --hard reset to ORIG_HEAD should clear a fast-forward merge

expecting success: 
	echo 1 > file1 &&
	echo 2 > file2 &&
	git add file1 file2 &&
	test_tick &&
	git commit -m files &&
	git rm file2 &&
	echo 3 > file3 &&
	echo 4 > file4 &&
	echo 5 > file1 &&
	git add file1 file3 file4 &&
	test_must_fail git reset HEAD -- file1 file2 file3 &&
	git diff > output &&
	test_cmp output expect &&
	git diff --cached > output &&
	test_cmp output cached_expect

[master 1a12fe9] files
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
rm 'file2'
Unstaged changes after reset:
M	file1
M	file2

ok 17 - test --mixed <paths>

expecting success: 

	mkdir sub &&
	>sub/file1 &&
	>sub/file2 &&
	git update-index --add sub/file1 sub/file2 &&
	T=$(git write-tree) &&
	test_must_fail git reset HEAD sub/file2 &&
	U=$(git write-tree) &&
	echo "$T" &&
	echo "$U" &&
	test_must_fail git diff-index --cached --exit-code "$T" &&
	test "$T" != "$U"


Unstaged changes after reset:
M	file1
M	file2
9571d9b5fb34d9c1274612948c5356f0615744bc
88880074c0c9957f91fd21817fee120b773fc32c
:100644 000000 e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 0000000000000000000000000000000000000000 D	sub/file2

ok 18 - test resetting the index at give paths

expecting success: 
	git reset --hard &&
	git reset -- file1 &&
	git diff-files --exit-code &&
	git diff-index --cached --exit-code HEAD

HEAD is now at 1a12fe9 files

ok 19 - resetting an unmodified path is a no-op

expecting success: 
	echo 123 >> file2 &&
	git reset --mixed HEAD > output &&
	test_cmp expect output


ok 20 - --mixed refreshes the index

expecting success: 

	git reset --hard &&
	>secondfile &&
	git add secondfile &&
	test_must_fail git reset secondfile &&
	test -z "$(git diff --cached --name-only)" &&
	test -f secondfile &&
	test ! -s secondfile


HEAD is now at 1a12fe9 files
Unstaged changes after reset:
M	secondfile

ok 21 - disambiguation (1)

expecting success: 

	git reset --hard &&
	>secondfile &&
	git add secondfile &&
	rm -f secondfile &&
	test_must_fail git reset secondfile &&
	test -n "$(git diff --cached --name-only -- secondfile)" &&
	test ! -f secondfile


HEAD is now at 1a12fe9 files

ok 22 - disambiguation (2)

expecting success: 

	git reset --hard &&
	>secondfile &&
	git add secondfile &&
	rm -f secondfile &&
	test_must_fail git reset HEAD secondfile &&
	test -z "$(git diff --cached --name-only)" &&
	test ! -f secondfile


HEAD is now at 1a12fe9 files
Unstaged changes after reset:
M	secondfile

ok 23 - disambiguation (3)

expecting success: 

	git reset --hard &&
	>secondfile &&
	git add secondfile &&
	rm -f secondfile &&
	test_must_fail git reset -- secondfile &&
	test -z "$(git diff --cached --name-only)" &&
	test ! -f secondfile

HEAD is now at 1a12fe9 files
Unstaged changes after reset:
M	secondfile

ok 24 - disambiguation (4)

# passed all 24 test(s)
1..24

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6020-merge-df/.git/
expecting success: 
	echo Hello >init &&
	git add init &&
	git commit -m initial &&

	git branch B &&
	mkdir dir &&
	echo foo >dir/foo &&
	git add dir/foo &&
	git commit -m "File: dir/foo" &&

	git checkout B &&
	echo file dir >dir &&
	git add dir &&
	git commit -m "File: dir"
[master (root-commit) a5b80f7] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 init
[master c8f7cbc] File: dir/foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 dir/foo
[B 4d832fe] File: dir
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 dir

ok 1 - prepare repository

expecting success: 
	test_expect_code 1 git merge "merge msg" B master
Merging:
4d832fe File: dir
virtual master
found 1 common ancestor(s):
a5b80f7 initial
Removing dir to make room for subdirectory; may re-add later.
Adding dir/foo
CONFLICT (file/directory): There is a directory with name dir in master. Adding dir as dir~B
Automatic merge failed; fix conflicts and then commit the result.

ok 2 - Merge with d/f conflicts

expecting success: 
	git reset --hard &&
	git checkout master &&
	rm .git/index &&

	mkdir before &&
	echo FILE >before/one &&
	echo FILE >after &&
	git add . &&
	git commit -m first &&

	rm -f after &&
	git mv before after &&
	git commit -m move &&

	git checkout -b para HEAD^ &&
	echo COMPLETELY ANOTHER FILE >another &&
	git add . &&
	git commit -m para &&

	git merge master
HEAD is now at 4d832fe File: dir
[master 8a8fd03] first
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 after
 create mode 100644 before/one
 create mode 100644 dir~B
[master 498ed04] move
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 after
 rename {before => after}/one (100%)
[para fcb093d] para
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 another
Merging:
fcb093d para
virtual master
found 1 common ancestor(s):
8a8fd03 first
Removing after to make room for subdirectory; may re-add later.
Removing after
Skipped after/one (merged same as existing)
Merge made by recursive.
 after                 |    1 -
 {before => after}/one |    0
 2 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 after
 rename {before => after}/one (100%)

ok 3 - F/D conflict
expecting success: 
	git checkout --orphan modify &&
	git rm -rf . &&
	git clean -fdqx &&

	printf "a
b
c
d
e
f
g
h
" >letters &&
	git add letters &&
	git commit -m initial &&

	echo i >>letters &&
	git add letters &&
	git commit -m modified &&

	git checkout -b delete HEAD^ &&
	git rm letters &&
	mkdir letters &&
	>letters/file &&
	git add letters &&
	git commit -m deleted
rm 'after/one'
rm 'another'
rm 'dir/foo'
rm 'dir~B'
rm 'init'
[modify (root-commit) 401242d] initial
 Author: A U Thor <author@example.com>
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 letters
[modify 59620ca] modified
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
rm 'letters'
[delete ef8d041] deleted
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 8 deletions(-)
 delete mode 100644 letters
 create mode 100644 letters/file

ok 4 - setup modify/delete + directory/file conflict
expecting success: 
	git checkout delete^0 &&
	test_must_fail git merge modify &&

	test 3 = $(git ls-files -s | wc -l) &&
	test 2 = $(git ls-files -u | wc -l) &&
	test 1 = $(git ls-files -o | wc -l) &&

	test -f letters/file &&
	test -f letters~modify
Merging:
ef8d041 deleted
virtual modify
found 1 common ancestor(s):
401242d initial
Adding letters/file
CONFLICT (delete/modify): letters deleted in HEAD and modified in modify. Version modify of letters left in tree at letters~modify.
Automatic merge failed; fix conflicts and then commit the result.
ok 5 - modify/delete + directory/file conflict
expecting success: 
	git reset --hard &&
	git clean -f &&
	git checkout modify^0 &&
	test_must_fail git merge delete &&

	test 3 = $(git ls-files -s | wc -l) &&
	test 2 = $(git ls-files -u | wc -l) &&
	test 1 = $(git ls-files -o | wc -l) &&

	test -f letters/file &&
	test -f letters~HEAD
HEAD is now at ef8d041 deleted
Removing letters~modify
Merging:
59620ca modified
virtual delete
found 1 common ancestor(s):
401242d initial
Removing letters to make room for subdirectory; may re-add later.
Adding letters/file
CONFLICT (delete/modify): letters deleted in delete and modified in HEAD. Version HEAD of letters left in tree at letters~HEAD.
Automatic merge failed; fix conflicts and then commit the result.

ok 6 - modify/delete + directory/file conflict; other way

# passed all 6 test(s)
1..6

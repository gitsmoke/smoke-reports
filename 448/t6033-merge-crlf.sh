Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6033-merge-crlf/.git/
expecting success: 
	git config core.autocrlf true &&
	echo foo | append_cr >file &&
	git add file &&
	git commit -m "Initial" &&
	git tag initial &&
	git branch side &&
	echo line from a | append_cr >file &&
	git commit -m "add line from a" file &&
	git tag a &&
	git checkout side &&
	echo line from b | append_cr >file &&
	git commit -m "add line from b" file &&
	git tag b &&
	git checkout master

[master (root-commit) 249291c] Initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master b62a522] add line from a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side a788a0b] add line from b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	git reset --hard initial &&
	git merge side -s ours &&
	cat file | remove_cr | append_cr >file.temp &&
	test_cmp file file.temp

HEAD is now at 249291c Initial
Merge made by ours.

ok 2 - Check "ours" is CRLF

expecting success: 
	git reset --hard a &&
	test_must_fail git merge side &&
	cat file | remove_cr | append_cr >file.temp &&
	test_cmp file file.temp

HEAD is now at b62a522 add line from a
Merging:
b62a522 add line from a
virtual side
found 1 common ancestor(s):
249291c Initial
Auto-merging file
CONFLICT (content): Merge conflict in file
Automatic merge failed; fix conflicts and then commit the result.

ok 3 - Check that conflict file is CRLF

# passed all 3 test(s)
1..3

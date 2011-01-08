Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4038-diff-combined/.git/
expecting success: 
	>file &&
	git add file &&
	test_tick &&
	git commit -m initial &&

	git branch withone &&
	git branch sansone &&

	git checkout withone &&
	setup_helper one withone sidewithone &&

	git checkout sansone &&
	setup_helper "" sansone sidesansone
[master (root-commit) 1bd44cb] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[withone 61ad3a5] withone
 Author: A U Thor <author@example.com>
 1 files changed, 4 insertions(+), 0 deletions(-)
[sidewithone 04e7a65] sidewithone
 Author: A U Thor <author@example.com>
 1 files changed, 4 insertions(+), 0 deletions(-)
Merging:
04e7a65 sidewithone
virtual withone
found 1 common ancestor(s):
1bd44cb initial
Auto-merging file
CONFLICT (content): Merge conflict in file
Automatic merge failed; fix conflicts and then commit the result.
[sidewithone 70465e9] merge withone into sidewithone
 Author: A U Thor <author@example.com>
[sansone e4cdba2] sansone
 Author: A U Thor <author@example.com>
 1 files changed, 3 insertions(+), 0 deletions(-)
[sidesansone d31bb1b] sidesansone
 Author: A U Thor <author@example.com>
 1 files changed, 3 insertions(+), 0 deletions(-)
Merging:
d31bb1b sidesansone
virtual sansone
found 1 common ancestor(s):
1bd44cb initial
Auto-merging file
CONFLICT (content): Merge conflict in file
Automatic merge failed; fix conflicts and then commit the result.
[sidesansone a02eb57] merge sansone into sidesansone
 Author: A U Thor <author@example.com>
ok 1 - setup
expecting success: 
	git show sidewithone -- >sidewithone &&
	verify_helper sidewithone

ok 2 - check combined output (1)
expecting success: 
	git show sidesansone -- >sidesansone &&
	verify_helper sidesansone

ok 3 - check combined output (2)
expecting success: 
	>file &&
	git add file &&
	git commit --amend -C HEAD &&
	git show >out &&
	grep "diff --cc file" out
[sidesansone 3fd518e] merge sansone into sidesansone
 Author: A U Thor <author@example.com>
diff --cc file
ok 4 - diagnose truncated file

# passed all 4 test(s)
1..4

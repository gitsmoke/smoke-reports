Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7607-merge-overwrite/.git/
expecting success: 
	test_commit c0 c0.c &&
	test_commit c1 c1.c &&
	test_commit c1a c1.c "c1 a" &&
	git reset --hard c0 &&
	test_commit c2 c2.c &&
	git reset --hard c0 &&
	mkdir sub &&
	echo "sub/f" > sub/f &&
	mkdir sub2 &&
	echo "sub2/f" > sub2/f &&
	git add sub/f sub2/f &&
	git commit -m sub &&
	git tag sub &&
	echo "VERY IMPORTANT CHANGES" > important
[master (root-commit) 934056f] c0
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c0.c
[master 7b51d7c] c1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c1.c
[master 4e7fedb] c1a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 934056f c0
[master 48f99e1] c2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c2.c
HEAD is now at 934056f c0
[master 55608b7] sub
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 sub/f
 create mode 100644 sub2/f

ok 1 - setup

expecting success: 
	git reset --hard c1 &&
	cp important c2.c &&
	test_must_fail git merge c2 &&
	test_path_is_missing .git/MERGE_HEAD &&
	test_cmp important c2.c
HEAD is now at 7b51d7c c1
Merging:
7b51d7c c1
virtual c2
found 1 common ancestor(s):
934056f c0
Aborting

ok 2 - will not overwrite untracked file

expecting success: 
	git reset --hard c1 &&
	cp important c2.c &&
	git add c2.c &&
	git commit -m important &&
	git checkout c2

HEAD is now at 7b51d7c c1
[master b7e8e56] important
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c2.c

ok 3 - will overwrite tracked file

expecting success: 
	git reset --hard c1 &&
	cp important c2.c &&
	git add c2.c &&
	test_must_fail git merge c2 &&
	test_path_is_missing .git/MERGE_HEAD &&
	test_cmp important c2.c
HEAD is now at 7b51d7c c1
Merging:
7b51d7c c1
virtual c2
found 1 common ancestor(s):
934056f c0
Aborting

ok 4 - will not overwrite new file

expecting success: 
	git reset --hard c1 &&
	cp important c2.c &&
	git add c2.c &&
	rm c2.c &&
	test_must_fail git merge c2 &&
	test_path_is_missing .git/MERGE_HEAD &&
	git checkout c2.c &&
	test_cmp important c2.c
HEAD is now at 7b51d7c c1
Merging:
7b51d7c c1
virtual c2
found 1 common ancestor(s):
934056f c0
Aborting

ok 5 - will not overwrite staged changes

expecting success: 
	git reset --hard c1 &&
	git rm c1.c &&
	git commit -m "rm c1.c" &&
	cp important c1.c &&
	test_must_fail git merge c1a &&
	test_cmp important c1.c
HEAD is now at 7b51d7c c1
rm 'c1.c'
[detached HEAD 86e44d1] rm c1.c
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 c1.c
Merging:
86e44d1 rm c1.c
virtual c1a
found 1 common ancestor(s):
7b51d7c c1
CONFLICT (delete/modify): c1.c deleted in HEAD and modified in c1a. Version c1a of c1.c left in tree.
Automatic merge failed; fix conflicts and then commit the result.

ok 6 - will not overwrite removed file

expecting success: 
	git reset --hard c1 &&
	git rm c1.c &&
	git commit -m "rm c1.c" &&
	cp important c1.c &&
	git add c1.c &&
	test_must_fail git merge c1a &&
	test_path_is_missing .git/MERGE_HEAD &&
	test_cmp important c1.c
HEAD is now at 7b51d7c c1
rm 'c1.c'
[detached HEAD 86e44d1] rm c1.c
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 c1.c
Merging:
86e44d1 rm c1.c
virtual c1a
found 1 common ancestor(s):
7b51d7c c1
Aborting
ok 7 - will not overwrite re-added file

expecting success: 
	git reset --hard c1 &&
	git rm c1.c &&
	git commit -m "rm c1.c" &&
	cp important c1.c &&
	git add c1.c &&
	rm c1.c &&
	test_must_fail git merge c1a &&
	test_path_is_missing .git/MERGE_HEAD &&
	git checkout c1.c &&
	test_cmp important c1.c
HEAD is now at 7b51d7c c1
rm 'c1.c'
[detached HEAD 86e44d1] rm c1.c
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 c1.c
Merging:
86e44d1 rm c1.c
virtual c1a
found 1 common ancestor(s):
7b51d7c c1
Aborting
ok 8 - will not overwrite removed file with staged changes
expecting success: 
	git reset --hard c0 &&
	rm -rf sub &&
	mkdir -p sub/f &&
	cp important sub/f/important &&
	test_must_fail git merge sub &&
	test_path_is_missing .git/MERGE_HEAD &&
	test_cmp important sub/f/important
HEAD is now at 934056f c0
Updating 934056f..55608b7
Aborting
ok 9 - will not overwrite untracked subtree
expecting success: 
	git reset --hard c0 &&
	rm -rf sub &&
	cp important sub &&
	cp important sub2 &&
	test_must_fail git merge sub 2>out &&
	test_cmp out expect &&
	test_path_is_missing .git/MERGE_HEAD &&
	test_cmp important sub &&
	test_cmp important sub2 &&
	rm -f sub sub2
HEAD is now at 934056f c0
Updating 934056f..55608b7
Aborting

ok 10 - will not overwrite untracked file in leading path

checking known breakage: 
	git reset --hard c0 &&
	rm -rf sub &&
	mkdir sub2 &&
	ln -s sub2 sub &&
	test_must_fail git merge sub &&
	test_path_is_missing .git/MERGE_HEAD
HEAD is now at 934056f c0
Updating 934056f..55608b7
Fast-forward
 sub/f  |    1 +
 sub2/f |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 sub/f
 create mode 100644 sub2/f
not ok 11 - will not overwrite untracked symlink in leading path # TODO known breakage
expecting success: 
	git reset --hard c0 &&
	rm -rf sub &&
	ln -s sub2 sub &&
	git add sub &&
	git commit -m ln &&
	git checkout sub
HEAD is now at 934056f c0
[detached HEAD 6d387d8] ln
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 sub
ok 12 - will not be confused by symlink in leading path
expecting success: 
	git reset --hard c0 &&
	git rm -fr . &&
	git checkout --orphan new &&
	cp important c0.c &&
	test_must_fail git merge c0 2>out &&
	test_cmp out expect &&
	test_path_is_missing .git/MERGE_HEAD &&
	test_cmp important c0.c
HEAD is now at 934056f c0
rm 'c0.c'
D	c0.c
ok 13 - will not overwrite untracked file on unborn branch

expecting success: 
	git symbolic-ref HEAD refs/heads/unborn &&
	rm -f .git/index &&
	echo foo > tracked-file &&
	git add tracked-file &&
	echo bar > untracked-file

ok 14 - set up unborn branch and content

checking known breakage: 
	git merge master &&
	grep foo tracked-file &&
	git show :tracked-file >expect &&
	grep foo expect &&
	grep bar untracked-file
not ok 15 - will not clobber WT/index when merging into unborn # TODO known breakage

# still have 2 known breakage(s)
# passed all remaining 13 test(s)
1..15

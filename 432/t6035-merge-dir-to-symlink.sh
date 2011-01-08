Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6035-merge-dir-to-symlink/.git/
expecting success: 
	mkdir -p a/b/c a/b-2/c &&
	> a/b/c/d &&
	> a/b-2/c/d &&
	> a/x &&
	git add -A &&
	git commit -m base &&
	git tag start &&
	rm -rf a/b &&
	ln -s b-2 a/b &&
	git add -A &&
	git commit -m "dir to symlink"
[master (root-commit) b9b1e29] base
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a/b-2/c/d
 create mode 100644 a/b/c/d
 create mode 100644 a/x
[master 9062be1] dir to symlink
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 a/b
 delete mode 100644 a/b/c/d

ok 1 - create a commit where dir a/b changed to symlink

expecting success: 
	git checkout HEAD^0 &&
	git reset --hard master &&
	git rm --cached a/b &&
	git commit -m "untracked symlink remains" &&
	 git checkout start^0 &&
	 test -f a/b-2/c/d

HEAD is now at 9062be1 dir to symlink
rm 'a/b'
[detached HEAD 0f25349] untracked symlink remains
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 120000 a/b

ok 2 - keep a/b-2/c/d across checkout

expecting success: 
	git checkout HEAD^0 &&
	git reset --hard master &&
	 git checkout start^0 &&
	 test -f a/b-2/c/d

HEAD is now at 9062be1 dir to symlink

ok 3 - checkout should not have deleted a/b-2/c/d

expecting success: 
	git reset --hard &&
	test -f a/b-2/c/d &&
	echo x > a/x &&
	git add a/x &&
	git commit -m x &&
	git tag baseline

HEAD is now at b9b1e29 base
[detached HEAD 50314f7] x
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
ok 4 - setup for merge test
expecting success: 
	git reset --hard &&
	git checkout baseline^0 &&
	git merge -s resolve master &&
	test -h a/b &&
	test -f a/b-2/c/d
HEAD is now at 50314f7 x
Trying really trivial in-index merge...
Nope.
Trying simple merge.
Simple merge failed, trying Automatic merge.
Adding a/b
Merge made by resolve.
 a/b     |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 a/b
 delete mode 100644 a/b/c/d

ok 5 - Handle D/F conflict, do not lose a/b-2/c/d in merge (resolve)

expecting success: 
	git reset --hard &&
	git checkout baseline^0 &&
	git merge -s recursive master &&
	test -h a/b &&
	test -f a/b-2/c/d

HEAD is now at 0b3c067 Merge branch 'master' into HEAD
Merging:
50314f7 x
virtual master
found 1 common ancestor(s):
b9b1e29 base
Removing a/b/c/d
Adding a/b
Merge made by recursive.
 a/b     |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 a/b
 delete mode 100644 a/b/c/d

ok 6 - Handle D/F conflict, do not lose a/b-2/c/d in merge (recursive)

expecting success: 
	git reset --hard &&
	git checkout master^0 &&
	git merge -s resolve baseline^0 &&
	test -h a/b &&
	test -f a/b-2/c/d

HEAD is now at 2215e6e Merge branch 'master' into HEAD
Trying really trivial in-index merge...
Nope.
Trying simple merge.
Simple merge failed, trying Automatic merge.
Merge made by resolve.
 a/x |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 7 - Handle F/D conflict, do not lose a/b-2/c/d in merge (resolve)

expecting success: 
	git reset --hard &&
	git checkout master^0 &&
	git merge -s recursive baseline^0 &&
	test -h a/b &&
	test -f a/b-2/c/d

HEAD is now at 05129e4 Merge commit 'baseline^0' into HEAD
Merging:
9062be1 dir to symlink
virtual baseline^0
found 1 common ancestor(s):
b9b1e29 base
Removing a/b to make room for subdirectory; may re-add later.
Adding a/b
Merge made by recursive.
 a/x |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 8 - Handle F/D conflict, do not lose a/b-2/c/d in merge (recursive)

checking known breakage: 
	git reset --hard &&
	git checkout baseline^0 &&
	>a/b/c/e &&
	test_must_fail git merge -s resolve master &&
	test -f a/b/c/e &&
	test -f a/b-2/c/d

HEAD is now at ccff0c9 Merge commit 'baseline^0' into HEAD
Trying really trivial in-index merge...
Nope.
Trying simple merge.
Simple merge failed, trying Automatic merge.
Adding a/b
Merge made by resolve.
 a/b     |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 a/b
 delete mode 100644 a/b/c/d

not ok 9 - do not lose untracked in merge (resolve) # TODO known breakage

expecting success: 
	git reset --hard &&
	git checkout baseline^0 &&
	>a/b/c/e &&
	test_must_fail git merge -s recursive master &&
	test -f a/b/c/e &&
	test -f a/b-2/c/d

HEAD is now at 9e3d5ce Merge branch 'master' into HEAD
Merging:
50314f7 x
virtual master
found 1 common ancestor(s):
b9b1e29 base
Removing a/b/c/d
CONFLICT (directory/file): There is a directory with name a/b in HEAD. Adding a/b as a/b~master
Automatic merge failed; fix conflicts and then commit the result.

ok 10 - do not lose untracked in merge (recursive)

expecting success: 
	git reset --hard &&
	git checkout baseline^0 &&
	echo more content >>a/b/c/d &&
	test_must_fail git merge -s resolve master

HEAD is now at 50314f7 x
Trying really trivial in-index merge...
Nope.

ok 11 - do not lose modifications in merge (resolve)

expecting success: 
	git reset --hard &&
	git checkout baseline^0 &&
	echo more content >>a/b/c/d &&
	test_must_fail git merge -s recursive master

HEAD is now at 50314f7 x
Merging:
50314f7 x
virtual master
found 1 common ancestor(s):
b9b1e29 base
Aborting

ok 12 - do not lose modifications in merge (recursive)

expecting success: 
	git reset --hard &&
	git checkout start^0 &&
	rm -rf a/b-2 &&
	ln -s b a/b-2 &&
	git add -A &&
	git commit -m "dir a/b-2 to symlink" &&
	git tag test2

HEAD is now at 50314f7 x
[detached HEAD 17bf3e8] dir a/b-2 to symlink
 Author: A U Thor <author@example.com>
 3 files changed, 2 insertions(+), 0 deletions(-)
 create mode 120000 a/b-2
 rename a/{b-2/c/d => b/c/e} (100%)
 create mode 120000 a/b~master

ok 13 - setup a merge where dir a/b-2 changed to symlink

expecting success: 
	git reset --hard &&
	git checkout baseline^0 &&
	git merge -s resolve test2 &&
	test -h a/b-2 &&
	test -f a/b/c/d

HEAD is now at 17bf3e8 dir a/b-2 to symlink
Trying really trivial in-index merge...
Nope.
Trying simple merge.
Simple merge failed, trying Automatic merge.
Adding a/b-2
Merge made by resolve.
 a/b-2                |    1 +
 a/{b-2/c/d => b/c/e} |    0
 a/b~master           |    1 +
 3 files changed, 2 insertions(+), 0 deletions(-)
 create mode 120000 a/b-2
 rename a/{b-2/c/d => b/c/e} (100%)
 create mode 120000 a/b~master

ok 14 - merge should not have D/F conflicts (resolve)

expecting success: 
	git reset --hard &&
	git checkout baseline^0 &&
	git merge -s recursive test2 &&
	test -h a/b-2 &&
	test -f a/b/c/d

HEAD is now at 676fef2 Merge commit 'test2' into HEAD
Merging:
50314f7 x
virtual test2
found 1 common ancestor(s):
b9b1e29 base
Skipped a/b/c/e (merged same as existing)
Adding a/b-2
Merge made by recursive.
 a/b-2                |    1 +
 a/{b-2/c/d => b/c/e} |    0
 a/b~master           |    1 +
 3 files changed, 2 insertions(+), 0 deletions(-)
 create mode 120000 a/b-2
 rename a/{b-2/c/d => b/c/e} (100%)
 create mode 120000 a/b~master

ok 15 - merge should not have D/F conflicts (recursive)

expecting success: 
	git reset --hard &&
	git checkout -b foo test2 &&
	git merge -s recursive baseline^0 &&
	test -h a/b-2 &&
	test -f a/b/c/d

HEAD is now at 676fef2 Merge commit 'test2' into HEAD
Merging:
17bf3e8 dir a/b-2 to symlink
virtual baseline^0
found 1 common ancestor(s):
b9b1e29 base
Removing a/b-2 to make room for subdirectory; may re-add later.
Skipped a/b/c/e (merged same as existing)
Adding a/b-2
Merge made by recursive.
 a/x |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 16 - merge should not have F/D conflicts (recursive)

# still have 1 known breakage(s)
# passed all remaining 15 test(s)
1..16

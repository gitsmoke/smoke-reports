Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6025-merge-symlinks/.git/
expecting success: 
git config core.symlinks false &&
> file &&
git add file &&
git commit -m initial &&
git branch b-symlink &&
git branch b-file &&
l=$(printf file | git hash-object -t blob -w --stdin) &&
echo "120000 $l	symlink" | git update-index --index-info &&
git commit -m master &&
git checkout b-symlink &&
l=$(printf file-different | git hash-object -t blob -w --stdin) &&
echo "120000 $l	symlink" | git update-index --index-info &&
git commit -m b-symlink &&
git checkout b-file &&
echo plain-file > symlink &&
git add symlink &&
git commit -m b-file
[master (root-commit) 197f61a] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 3a01fdc] master
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 symlink
[b-symlink 3987660] b-symlink
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 symlink
[b-file 920c24b] b-file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 symlink

ok 1 - setup

expecting success: 
git checkout b-symlink &&
test_must_fail git merge master
Merging:
3987660 b-symlink
virtual master
found 1 common ancestor(s):
197f61a initial
Auto-merging symlink
CONFLICT (add/add): Merge conflict in symlink
Automatic merge failed; fix conflicts and then commit the result.

ok 2 - merge master into b-symlink, which has a different symbolic link

expecting success: 
test -f symlink

ok 3 - the merge result must be a file

expecting success: 
git reset --hard && git checkout b-file &&
test_must_fail git merge master
HEAD is now at 3987660 b-symlink
Merging:
920c24b b-file
virtual master
found 1 common ancestor(s):
197f61a initial
Auto-merging symlink
CONFLICT (add/add): Merge conflict in symlink
Automatic merge failed; fix conflicts and then commit the result.

ok 4 - merge master into b-file, which has a file instead of a symbolic link

expecting success: 
test -f symlink

ok 5 - the merge result must be a file

expecting success: 
git reset --hard &&
git checkout master &&
test_must_fail git merge b-file
HEAD is now at 920c24b b-file
Merging:
3a01fdc master
virtual b-file
found 1 common ancestor(s):
197f61a initial
Auto-merging symlink
CONFLICT (add/add): Merge conflict in symlink
Automatic merge failed; fix conflicts and then commit the result.

ok 6 - merge b-file, which has a file instead of a symbolic link, into master

expecting success: 
test -f symlink

ok 7 - the merge result must be a file

# passed all 7 test(s)
1..7

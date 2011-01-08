Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6021-merge-criss-cross/.git/
expecting success: echo "1
2
3
4
5
6
7
8
9" > file &&
git add file &&
git commit -m "Initial commit" file &&
git branch A &&
git branch B &&
git checkout A &&
echo "1
2
3
4
5
6
7
8 changed in B8, branch A
9" > file &&
git commit -m "B8" file &&
git checkout B &&
echo "1
2
3 changed in C3, branch B
4
5
6
7
8
9
" > file &&
git commit -m "C3" file &&
git branch C3 &&
git merge "pre E3 merge" B A &&
echo "1
2
3 changed in E3, branch B. New file size
4
5
6
7
8 changed in B8, branch A
9
" > file &&
git commit -m "E3" file &&
git checkout A &&
git merge "pre D8 merge" A C3 &&
echo "1
2
3 changed in C3, branch B
4
5
6
7
8 changed in D8, branch A. New file size 2
9" > file &&
git commit -m D8 file
[master (root-commit) fd84054] Initial commit
 Author: A U Thor <author@example.com>
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 file
[A 6c40566] B8
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[B ea6df96] C3
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 1 deletions(-)
Merging:
ea6df96 C3
virtual A
found 1 common ancestor(s):
fd84054 Initial commit
Auto-merging file
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
[B 9c8dd63] E3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merging:
6c40566 B8
virtual C3
found 1 common ancestor(s):
fd84054 Initial commit
Auto-merging file
Merge made by recursive.
 file |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)
[A e956e05] D8
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 2 deletions(-)

ok 1 - prepare repository

expecting success: git merge "final merge" A B
Merging:
e956e05 D8
virtual B
found 2 common ancestor(s):
ea6df96 C3
6c40566 B8
  Merging:
  ea6df96 C3
  6c40566 B8
  found 1 common ancestor(s):
  fd84054 Initial commit
  Auto-merging file
Auto-merging file
Merge made by recursive.
 file |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 2 - Criss-cross merge

expecting success: cmp file file-expect

ok 3 - Criss-cross merge result

expecting success: git reset --hard A^ &&
test_must_fail git merge -s resolve -m "final merge" B
HEAD is now at e956e05 D8
Trying simple merge.
Simple merge failed, trying Automatic merge.
Auto-merging file
ERROR: content conflict in file
Automatic merge failed; fix conflicts and then commit the result.

ok 4 - Criss-cross merge fails (-s resolve)

# passed all 4 test(s)
1..4

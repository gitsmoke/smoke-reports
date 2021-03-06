Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6024-recursive-merge/.git/
expecting success: 
echo 1 > a1 &&
git add a1 &&
GIT_AUTHOR_DATE="2006-12-12 23:00:00" git commit -m 1 a1 &&

git checkout -b A master &&
echo A > a1 &&
GIT_AUTHOR_DATE="2006-12-12 23:00:01" git commit -m A a1 &&

git checkout -b B master &&
echo B > a1 &&
GIT_AUTHOR_DATE="2006-12-12 23:00:02" git commit -m B a1 &&

git checkout -b D A &&
git rev-parse B > .git/MERGE_HEAD &&
echo D > a1 &&
git update-index a1 &&
GIT_AUTHOR_DATE="2006-12-12 23:00:03" git commit -m D &&

git symbolic-ref HEAD refs/heads/other &&
echo 2 > a1 &&
GIT_AUTHOR_DATE="2006-12-12 23:00:04" git commit -m 2 a1 &&

git checkout -b C &&
echo C > a1 &&
GIT_AUTHOR_DATE="2006-12-12 23:00:05" git commit -m C a1 &&

git checkout -b E C &&
git rev-parse B > .git/MERGE_HEAD &&
echo E > a1 &&
git update-index a1 &&
GIT_AUTHOR_DATE="2006-12-12 23:00:06" git commit -m E &&

git checkout -b G E &&
git rev-parse A > .git/MERGE_HEAD &&
echo G > a1 &&
git update-index a1 &&
GIT_AUTHOR_DATE="2006-12-12 23:00:07" git commit -m G &&

git checkout -b F D &&
git rev-parse C > .git/MERGE_HEAD &&
echo F > a1 &&
git update-index a1 &&
GIT_AUTHOR_DATE="2006-12-12 23:00:08" git commit -m F
[master (root-commit) 2cb59ab] 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a1
[A 9d821b5] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[B 7082aa6] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[D e1146db] D
 Author: A U Thor <author@example.com>
[other (root-commit) 216d386] 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a1
[C d264643] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[E 939285a] E
 Author: A U Thor <author@example.com>
[G 26f86b6] G
 Author: A U Thor <author@example.com>
[F 71b2f3d] F
 Author: A U Thor <author@example.com>

ok 1 - setup tests

expecting success: 
	test_must_fail git merge -m final G
Merging:
71b2f3d F
virtual G
found 3 common ancestor(s):
d264643 C
7082aa6 B
9d821b5 A
  Merging:
  d264643 C
  7082aa6 B
  found 0 common ancestor(s):
  Auto-merging a1
  CONFLICT (add/add): Merge conflict in a1
  Merging:
  virtual merged tree
  9d821b5 A
  found 1 common ancestor(s):
  2cb59ab 1
  Auto-merging a1
  CONFLICT (content): Merge conflict in a1
Auto-merging a1
CONFLICT (content): Merge conflict in a1
Automatic merge failed; fix conflicts and then commit the result.

ok 2 - combined merge conflicts

expecting success: test_cmp expect a1

ok 3 - result contains a conflict

expecting success: test_cmp expect out

ok 4 - virtual trees were processed

expecting success: 
	git reset --hard &&
	printf " " > binary-file &&
	git add binary-file &&
	git commit -m binary &&
	git checkout G &&
	printf "  " > binary-file &&
	git add binary-file &&
	git commit -m binary2 &&
	test_must_fail git merge F > merge.out 2> merge.err &&
	grep "Cannot merge binary files: binary-file (HEAD vs. F)" merge.err

HEAD is now at 71b2f3d F
[F 8435eae] binary
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 binary-file
[G 5556d3a] binary2
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 binary-file
warning: Cannot merge binary files: binary-file (HEAD vs. F)

ok 5 - refuse to merge binary files

expecting success: 

	git reset --hard &&
	git checkout -b delete &&
	git rm a1 &&
	test_tick &&
	git commit -m delete &&
	git checkout -b rename HEAD^ &&
	git mv a1 a2 &&
	test_tick &&
	git commit -m rename &&
	test_must_fail git merge delete &&
	test 1 = $(git ls-files --unmerged | wc -l) &&
	git rev-parse --verify :2:a2 &&
	test_must_fail git rev-parse --verify :3:a2 &&
	git checkout -f delete &&
	test_must_fail git merge rename &&
	test 1 = $(git ls-files --unmerged | wc -l) &&
	test_must_fail git rev-parse --verify :2:a2 &&
	git rev-parse --verify :3:a2


HEAD is now at 5556d3a binary2
rm 'a1'
[delete fb22522] delete
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 a1
[rename 38eb0a4] rename
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename a1 => a2 (100%)
Merging:
38eb0a4 rename
virtual delete
found 1 common ancestor(s):
5556d3a binary2
CONFLICT (rename/delete): Rename a1->a2 in HEAD and deleted in delete
Automatic merge failed; fix conflicts and then commit the result.
fd7923529855d0b274795ae3349c5e0438333979
Merging:
fb22522 delete
virtual rename
found 1 common ancestor(s):
5556d3a binary2
CONFLICT (rename/delete): Rename a1->a2 in rename and deleted in HEAD
Automatic merge failed; fix conflicts and then commit the result.
fd7923529855d0b274795ae3349c5e0438333979
ok 6 - mark rename/delete as unmerged

# passed all 6 test(s)
1..6

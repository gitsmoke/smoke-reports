Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6022-merge-rename/.git/
expecting success: 
cat >A <<\EOF &&
a aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
b bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
c cccccccccccccccccccccccccccccccccccccccccccccccc
d dddddddddddddddddddddddddddddddddddddddddddddddd
e eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
f ffffffffffffffffffffffffffffffffffffffffffffffff
g gggggggggggggggggggggggggggggggggggggggggggggggg
h hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
i iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
j jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
k kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
l llllllllllllllllllllllllllllllllllllllllllllllll
m mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
n nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
o oooooooooooooooooooooooooooooooooooooooooooooooo
EOF

cat >M <<\EOF &&
A AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
B BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
C CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
D DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
E EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
F FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
G GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
H HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
I IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
J JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
K KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK
L LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
M MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
N NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
O OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
EOF

git add A M &&
git commit -m "initial has A and M" &&
git branch white &&
git branch red &&
git branch blue &&
git branch yellow &&
git branch change &&
git branch change+rename &&

sed -e "/^g /s/.*/g : master changes a line/" <A >A+ &&
mv A+ A &&
git commit -a -m "master updates A" &&

git checkout yellow &&
rm -f M &&
git commit -a -m "yellow removes M" &&

git checkout white &&
sed -e "/^g /s/.*/g : white changes a line/" <A >B &&
sed -e "/^G /s/.*/G : colored branch changes a line/" <M >N &&
rm -f A M &&
git update-index --add --remove A B M N &&
git commit -m "white renames A->B, M->N" &&

git checkout red &&
sed -e "/^g /s/.*/g : red changes a line/" <A >B &&
sed -e "/^G /s/.*/G : colored branch changes a line/" <M >N &&
rm -f A M &&
git update-index --add --remove A B M N &&
git commit -m "red renames A->B, M->N" &&

git checkout blue &&
sed -e "/^g /s/.*/g : blue changes a line/" <A >C &&
sed -e "/^G /s/.*/G : colored branch changes a line/" <M >N &&
rm -f A M &&
git update-index --add --remove A C M N &&
git commit -m "blue renames A->C, M->N" &&

git checkout change &&
sed -e "/^g /s/.*/g : changed line/" <A >A+ &&
mv A+ A &&
git commit -q -a -m "changed" &&

git checkout change+rename &&
sed -e "/^g /s/.*/g : changed line/" <A >B &&
rm A &&
git update-index --add B &&
git commit -q -a -m "changed and renamed" &&

git checkout master
[master (root-commit) fb9d0f7] initial has A and M
 Author: A U Thor <author@example.com>
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 A
 create mode 100644 M
[master 4ccd750] master updates A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[yellow 6cc5300] yellow removes M
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 15 deletions(-)
 delete mode 100644 M
[white 3fb5924] white renames A->B, M->N
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename A => B (93%)
 rename M => N (93%)
[red af69431] red renames A->B, M->N
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename A => B (93%)
 rename M => N (93%)
[blue 32afd8c] blue renames A->C, M->N
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename A => C (93%)
 rename M => N (93%)
ok 1 - setup

expecting success: 
	git show-branch &&
	test_expect_code 1 git pull . white &&
	git ls-files -s &&
	git ls-files -u B >b.stages &&
	test_line_count = 3 b.stages &&
	git ls-files -s N >n.stages &&
	test_line_count = 1 n.stages &&
	sed -ne "/^g/{
	p
	q
	}" B | grep master &&
	git diff --exit-code white N
! [blue] blue renames A->C, M->N
 ! [change] changed
  ! [change+rename] changed and renamed
   * [master] master updates A
    ! [red] red renames A->B, M->N
     ! [white] white renames A->B, M->N
      ! [yellow] yellow removes M
-------
      + [yellow] yellow removes M
     +  [white] white renames A->B, M->N
    +   [red] red renames A->B, M->N
   *    [master] master updates A
  +     [change+rename] changed and renamed
 +      [change] changed
+       [blue] blue renames A->C, M->N
+++*+++ [yellow^] initial has A and M
Merging:
4ccd750 master updates A
virtual 3fb5924f26cdce3fa4a42469c5adb339c506eabb
found 1 common ancestor(s):
fb9d0f7 initial has A and M
Auto-merging B
CONFLICT (content): Merge conflict in B
Auto-merging N
Automatic merge failed; fix conflicts and then commit the result.
100644 aed72d761b68c20ffce8249a5a0426494098d376 1	B
100644 c68856fe0bfce4eb453d8e12329c47ab60c8107b 2	B
100644 2d603156dc5bdf6295c789cac08e3c9942a0b82a 3	B
100644 ba41fb96393979b22691106b06bf5231eab57b85 0	N
g : master changes a line
ok 2 - pull renaming branch into unrenaming one

expecting success: 
	rm -f B &&
	git reset --hard &&
	git checkout red &&
	test_expect_code 1 git pull . white &&
	git ls-files -u B >b.stages &&
	test_line_count = 3 b.stages &&
	git ls-files -s N >n.stages &&
	test_line_count = 1 n.stages &&
	sed -ne "/^g/{
	p
	q
	}" B | grep red &&
	git diff --exit-code white N
HEAD is now at 4ccd750 master updates A
Merging:
af69431 red renames A->B, M->N
virtual 3fb5924f26cdce3fa4a42469c5adb339c506eabb
found 1 common ancestor(s):
fb9d0f7 initial has A and M
Auto-merging B
CONFLICT (content): Merge conflict in B
Skipped N (merged same as existing)
Automatic merge failed; fix conflicts and then commit the result.
g : red changes a line

ok 3 - pull renaming branch into another renaming one

expecting success: 
	git reset --hard &&
	git show-branch &&
	test_expect_code 1 git pull . master &&
	git ls-files -u B >b.stages &&
	test_line_count = 3 b.stages &&
	git ls-files -s N >n.stages &&
	test_line_count = 1 n.stages &&
	sed -ne "/^g/{
	p
	q
	}" B | grep red &&
	git diff --exit-code white N

HEAD is now at af69431 red renames A->B, M->N
! [blue] blue renames A->C, M->N
 ! [change] changed
  ! [change+rename] changed and renamed
   ! [master] master updates A
    * [red] red renames A->B, M->N
     ! [white] white renames A->B, M->N
      ! [yellow] yellow removes M
-------
      + [yellow] yellow removes M
     +  [white] white renames A->B, M->N
    *   [red] red renames A->B, M->N
   +    [master] master updates A
  +     [change+rename] changed and renamed
 +      [change] changed
+       [blue] blue renames A->C, M->N
++++*++ [yellow^] initial has A and M
Merging:
af69431 red renames A->B, M->N
virtual 4ccd7506027af937db554a820529d4634ec4530a
found 1 common ancestor(s):
fb9d0f7 initial has A and M
Auto-merging B
CONFLICT (content): Merge conflict in B
Skipped N (merged same as existing)
Automatic merge failed; fix conflicts and then commit the result.
g : red changes a line
ok 4 - pull unrenaming branch into renaming one

expecting success: 
	git reset --hard &&
	git show-branch &&
	test_expect_code 1 git pull . blue &&
	git ls-files -u A >a.stages &&
	test_line_count = 1 a.stages &&
	git ls-files -u B >b.stages &&
	test_line_count = 1 b.stages &&
	git ls-files -u C >c.stages &&
	test_line_count = 1 c.stages &&
	git ls-files -s N >n.stages &&
	test_line_count = 1 n.stages &&
	sed -ne "/^g/{
	p
	q
	}" B | grep red &&
	git diff --exit-code white N
HEAD is now at af69431 red renames A->B, M->N
! [blue] blue renames A->C, M->N
 ! [change] changed
  ! [change+rename] changed and renamed
   ! [master] master updates A
    * [red] red renames A->B, M->N
     ! [white] white renames A->B, M->N
      ! [yellow] yellow removes M
-------
      + [yellow] yellow removes M
     +  [white] white renames A->B, M->N
    *   [red] red renames A->B, M->N
   +    [master] master updates A
  +     [change+rename] changed and renamed
 +      [change] changed
+       [blue] blue renames A->C, M->N
++++*++ [yellow^] initial has A and M
Merging:
af69431 red renames A->B, M->N
virtual 32afd8c3697dc085954b30bb2a28b88aff576280
found 1 common ancestor(s):
fb9d0f7 initial has A and M
Skipped N (merged same as existing)
CONFLICT (rename/rename): Rename "A"->"B" in branch "HEAD" rename "A"->"C" in "32afd8c3697dc085954b30bb2a28b88aff576280"
Automatic merge failed; fix conflicts and then commit the result.
g : red changes a line

ok 5 - pull conflicting renames

expecting success: 
	git reset --hard &&
	git show-branch &&
	echo >A this file should not matter &&
	test_expect_code 1 git pull . white &&
	test_path_is_file A
HEAD is now at af69431 red renames A->B, M->N
! [blue] blue renames A->C, M->N
 ! [change] changed
  ! [change+rename] changed and renamed
   ! [master] master updates A
    * [red] red renames A->B, M->N
     ! [white] white renames A->B, M->N
      ! [yellow] yellow removes M
-------
      + [yellow] yellow removes M
     +  [white] white renames A->B, M->N
    *   [red] red renames A->B, M->N
   +    [master] master updates A
  +     [change+rename] changed and renamed
 +      [change] changed
+       [blue] blue renames A->C, M->N
++++*++ [yellow^] initial has A and M
Merging:
af69431 red renames A->B, M->N
virtual 3fb5924f26cdce3fa4a42469c5adb339c506eabb
found 1 common ancestor(s):
fb9d0f7 initial has A and M
Auto-merging B
CONFLICT (content): Merge conflict in B
Skipped N (merged same as existing)
Automatic merge failed; fix conflicts and then commit the result.

ok 6 - interference with untracked working tree file

expecting success: 
	git reset --hard &&
	git checkout white &&
	git show-branch &&
	rm -f A &&
	echo >A this file should not matter &&
	test_expect_code 1 git pull . red &&
	test_path_is_file A
HEAD is now at af69431 red renames A->B, M->N
! [blue] blue renames A->C, M->N
 ! [change] changed
  ! [change+rename] changed and renamed
   ! [master] master updates A
    ! [red] red renames A->B, M->N
     * [white] white renames A->B, M->N
      ! [yellow] yellow removes M
-------
      + [yellow] yellow removes M
     *  [white] white renames A->B, M->N
    +   [red] red renames A->B, M->N
   +    [master] master updates A
  +     [change+rename] changed and renamed
 +      [change] changed
+       [blue] blue renames A->C, M->N
+++++*+ [yellow^] initial has A and M
Merging:
3fb5924 white renames A->B, M->N
virtual af694318592be7a8eb6bdb557c1ef8d39bd3f700
found 1 common ancestor(s):
fb9d0f7 initial has A and M
Auto-merging B
CONFLICT (content): Merge conflict in B
Skipped N (merged same as existing)
Automatic merge failed; fix conflicts and then commit the result.

ok 7 - interference with untracked working tree file

expecting success: 
	git reset --hard &&
	rm -f A M &&
	git checkout -f master &&
	git tag -f anchor &&
	git show-branch &&
	git pull . yellow &&
	test_path_is_missing M &&
	git reset --hard anchor

HEAD is now at 3fb5924 white renames A->B, M->N
Updated tag 'anchor' (was 0000000)
! [blue] blue renames A->C, M->N
 ! [change] changed
  ! [change+rename] changed and renamed
   * [master] master updates A
    ! [red] red renames A->B, M->N
     ! [white] white renames A->B, M->N
      ! [yellow] yellow removes M
-------
      + [yellow] yellow removes M
     +  [white] white renames A->B, M->N
    +   [red] red renames A->B, M->N
   *    [master] master updates A
  +     [change+rename] changed and renamed
 +      [change] changed
+       [blue] blue renames A->C, M->N
+++*+++ [yellow^] initial has A and M
Merging:
4ccd750 master updates A
virtual 6cc5300e25d9f33e2b1c9382b39ef588249e2f62
found 1 common ancestor(s):
fb9d0f7 initial has A and M
Removing M
Merge made by recursive.
 M |   15 ---------------
 1 files changed, 0 insertions(+), 15 deletions(-)
 delete mode 100644 M
HEAD is now at 4ccd750 master updates A

ok 8 - interference with untracked working tree file

expecting success: 
	git reset --hard &&
	rm -f A M &&
	git checkout -f master &&
	git tag -f anchor &&
	git show-branch &&
	echo >>M one line addition &&
	cat M >M.saved &&
	test_expect_code 128 git pull . yellow &&
	test_cmp M M.saved &&
	rm -f M.saved

HEAD is now at 4ccd750 master updates A
! [blue] blue renames A->C, M->N
 ! [change] changed
  ! [change+rename] changed and renamed
   * [master] master updates A
    ! [red] red renames A->B, M->N
     ! [white] white renames A->B, M->N
      ! [yellow] yellow removes M
-------
      + [yellow] yellow removes M
     +  [white] white renames A->B, M->N
    +   [red] red renames A->B, M->N
   *    [master] master updates A
  +     [change+rename] changed and renamed
 +      [change] changed
+       [blue] blue renames A->C, M->N
+++*+++ [yellow^] initial has A and M
Merging:
4ccd750 master updates A
virtual 6cc5300e25d9f33e2b1c9382b39ef588249e2f62
found 1 common ancestor(s):
fb9d0f7 initial has A and M
Aborting

ok 9 - updated working tree file should prevent the merge

expecting success: 
	git reset --hard &&
	rm -f A M &&
	git checkout -f master &&
	git tag -f anchor &&
	git show-branch &&
	echo >>M one line addition &&
	cat M >M.saved &&
	git update-index M &&
	test_expect_code 128 git pull . yellow &&
	test_cmp M M.saved &&
	rm -f M.saved

HEAD is now at 4ccd750 master updates A
! [blue] blue renames A->C, M->N
 ! [change] changed
  ! [change+rename] changed and renamed
   * [master] master updates A
    ! [red] red renames A->B, M->N
     ! [white] white renames A->B, M->N
      ! [yellow] yellow removes M
-------
      + [yellow] yellow removes M
     +  [white] white renames A->B, M->N
    +   [red] red renames A->B, M->N
   *    [master] master updates A
  +     [change+rename] changed and renamed
 +      [change] changed
+       [blue] blue renames A->C, M->N
+++*+++ [yellow^] initial has A and M
Merging:
4ccd750 master updates A
virtual 6cc5300e25d9f33e2b1c9382b39ef588249e2f62
found 1 common ancestor(s):
fb9d0f7 initial has A and M
Aborting

ok 10 - updated working tree file should prevent the merge

expecting success: 
	git reset --hard &&
	rm -f A M &&
	git checkout -f yellow &&
	git tag -f anchor &&
	git show-branch &&
	echo >M this file should not matter &&
	git pull . master &&
	test_path_is_file M &&
	! {
		git ls-files -s |
		grep M
	} &&
	git reset --hard anchor
HEAD is now at 4ccd750 master updates A
Updated tag 'anchor' (was 4ccd750)
! [blue] blue renames A->C, M->N
 ! [change] changed
  ! [change+rename] changed and renamed
   ! [master] master updates A
    ! [red] red renames A->B, M->N
     ! [white] white renames A->B, M->N
      * [yellow] yellow removes M
-------
      * [yellow] yellow removes M
     +  [white] white renames A->B, M->N
    +   [red] red renames A->B, M->N
   +    [master] master updates A
  +     [change+rename] changed and renamed
 +      [change] changed
+       [blue] blue renames A->C, M->N
++++++* [yellow^] initial has A and M
Merging:
6cc5300 yellow removes M
virtual 4ccd7506027af937db554a820529d4634ec4530a
found 1 common ancestor(s):
fb9d0f7 initial has A and M
Merge made by recursive.
 A |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 6cc5300 yellow removes M

ok 11 - interference with untracked working tree file

expecting success: 
	rm -f A M N &&
	git reset --hard &&
	git checkout change+rename &&
	GIT_MERGE_VERBOSITY=3 git merge change | grep "^Skipped B" &&
	git reset --hard HEAD^ &&
	git checkout change &&
	GIT_MERGE_VERBOSITY=3 git merge change+rename | grep "^Skipped B"

HEAD is now at 6cc5300 yellow removes M
Skipped B (merged same as existing)
HEAD is now at dcf2e90 changed and renamed
Skipped B (merged same as existing)

ok 12 - merge of identical changes in a renamed file

expecting success: 
	git reset --hard &&
	git checkout --orphan dir-in-way &&
	git rm -rf . &&

	mkdir sub &&
	mkdir dir &&
	printf "1
2
3
4
5
6
7
8
9
10
" >sub/file &&
	echo foo >dir/file-in-the-way &&
	git add -A &&
	git commit -m "Common commmit" &&

	echo 11 >>sub/file &&
	echo more >>dir/file-in-the-way &&
	git add -u &&
	git commit -m "Commit to merge, with dir in the way" &&

	git checkout -b dir-not-in-way &&
	git reset --soft HEAD^ &&
	git rm -rf dir &&
	git commit -m "Commit to merge, with dir removed" -- dir sub/file &&

	git checkout -b renamed-file-has-no-conflicts dir-in-way~1 &&
	git rm -rf dir &&
	git rm sub/file &&
	printf "1
2
3
4
5555
6
7
8
9
10
" >dir &&
	git add dir &&
	git commit -m "Independent change" &&

	git checkout -b renamed-file-has-conflicts dir-in-way~1 &&
	git rm -rf dir &&
	git mv sub/file dir &&
	echo 12 >>dir &&
	git add dir &&
	git commit -m "Conflicting change"

HEAD is now at e2ed921 Merge branch 'change+rename' into change
rm 'B'
rm 'M'
[dir-in-way (root-commit) c406c00] Common commmit
 Author: A U Thor <author@example.com>
 6 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 a.stages
 create mode 100644 b.stages
 create mode 100644 c.stages
 create mode 100644 dir/file-in-the-way
 create mode 100644 n.stages
 create mode 100644 sub/file
[dir-in-way eee4132] Commit to merge, with dir in the way
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
rm 'dir/file-in-the-way'
[dir-not-in-way e7b4353] Commit to merge, with dir removed
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 delete mode 100644 dir/file-in-the-way
rm 'dir/file-in-the-way'
rm 'sub/file'
[renamed-file-has-no-conflicts 2717236] Independent change
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 2 deletions(-)
 rename sub/file => dir (79%)
 delete mode 100644 dir/file-in-the-way
rm 'dir/file-in-the-way'
[renamed-file-has-conflicts f7d6b21] Conflicting change
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename sub/file => dir (87%)
 delete mode 100644 dir/file-in-the-way

ok 13 - setup for rename + d/f conflicts

expecting success: 
	git reset --hard &&
	git checkout -q renamed-file-has-no-conflicts^0 &&
	git merge --strategy=recursive dir-not-in-way &&
	git diff --quiet &&
	test -f dir &&
	test_cmp expected dir

HEAD is now at f7d6b21 Conflicting change
Merging:
2717236 Independent change
virtual dir-not-in-way
found 1 common ancestor(s):
c406c00 Common commmit
Removing dir to make room for subdirectory; may re-add later.
Auto-merging dir
Merge made by recursive.
 dir |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 14 - Rename+D/F conflict; renamed file merges + dir not in way

expecting success: 
	git reset --hard &&
	rm -rf dir~* &&
	git checkout -q renamed-file-has-no-conflicts^0 &&
	test_must_fail git merge --strategy=recursive dir-in-way >output &&

	grep "CONFLICT (delete/modify): dir/file-in-the-way" output &&
	grep "Auto-merging dir" output &&
	grep "Adding as dir~HEAD instead" output &&

	test 2 -eq "$(git ls-files -u | wc -l)" &&
	test 2 -eq "$(git ls-files -u dir/file-in-the-way | wc -l)" &&

	test_must_fail git diff --quiet &&
	test_must_fail git diff --cached --quiet &&

	test -f dir/file-in-the-way &&
	test -f dir~HEAD &&
	test_cmp expected dir~HEAD

HEAD is now at 16b921b Merge branch 'dir-not-in-way' into HEAD
CONFLICT (delete/modify): dir/file-in-the-way deleted in HEAD and modified in dir-in-way. Version dir-in-way of dir/file-in-the-way left in tree.
Auto-merging dir
Adding as dir~HEAD instead

ok 15 - Rename+D/F conflict; renamed file merges but dir in way

expecting success: 
	git reset --hard &&
	rm -rf dir~* &&
	git checkout -q dir-in-way^0 &&
	test_must_fail git merge --strategy=recursive renamed-file-has-no-conflicts >output 2>errors &&

	! grep "error: refusing to lose untracked file at" errors &&
	grep "CONFLICT (delete/modify): dir/file-in-the-way" output &&
	grep "Auto-merging dir" output &&
	grep "Adding as dir~renamed-file-has-no-conflicts instead" output &&

	test 2 -eq "$(git ls-files -u | wc -l)" &&
	test 2 -eq "$(git ls-files -u dir/file-in-the-way | wc -l)" &&

	test_must_fail git diff --quiet &&
	test_must_fail git diff --cached --quiet &&

	test -f dir/file-in-the-way &&
	test -f dir~renamed-file-has-no-conflicts &&
	test_cmp expected dir~renamed-file-has-no-conflicts

HEAD is now at 2717236 Independent change
CONFLICT (delete/modify): dir/file-in-the-way deleted in renamed-file-has-no-conflicts and modified in HEAD. Version HEAD of dir/file-in-the-way left in tree.
Auto-merging dir
Adding as dir~renamed-file-has-no-conflicts instead

ok 16 - Same as previous, but merged other way

expecting success: 
	git reset --hard &&
	rm -rf dir~* &&
	git checkout -q renamed-file-has-conflicts^0 &&
	test_must_fail git merge --strategy=recursive dir-not-in-way &&

	test 3 -eq "$(git ls-files -u | wc -l)" &&
	test 3 -eq "$(git ls-files -u dir | wc -l)" &&

	test_must_fail git diff --quiet &&
	test_must_fail git diff --cached --quiet &&

	test -f dir &&
	test_cmp expected dir

HEAD is now at eee4132 Commit to merge, with dir in the way
Merging:
f7d6b21 Conflicting change
virtual dir-not-in-way
found 1 common ancestor(s):
c406c00 Common commmit
Removing dir to make room for subdirectory; may re-add later.
Auto-merging dir
CONFLICT (content): Merge conflict in dir
Automatic merge failed; fix conflicts and then commit the result.

ok 17 - Rename+D/F conflict; renamed file cannot merge, dir not in way

expecting success: 
	modify s/dir-not-in-way/dir-in-way/ expected &&

	git reset --hard &&
	rm -rf dir~* &&
	git checkout -q renamed-file-has-conflicts^0 &&
	test_must_fail git merge --strategy=recursive dir-in-way &&

	test 5 -eq "$(git ls-files -u | wc -l)" &&
	test 3 -eq "$(git ls-files -u dir | grep -v file-in-the-way | wc -l)" &&
	test 2 -eq "$(git ls-files -u dir/file-in-the-way | wc -l)" &&

	test_must_fail git diff --quiet &&
	test_must_fail git diff --cached --quiet &&

	test -f dir/file-in-the-way &&
	test -f dir~HEAD &&
	test_cmp expected dir~HEAD

HEAD is now at f7d6b21 Conflicting change
Merging:
f7d6b21 Conflicting change
virtual dir-in-way
found 1 common ancestor(s):
c406c00 Common commmit
Removing dir to make room for subdirectory; may re-add later.
CONFLICT (delete/modify): dir/file-in-the-way deleted in HEAD and modified in dir-in-way. Version dir-in-way of dir/file-in-the-way left in tree.
Auto-merging dir
CONFLICT (content): Merge conflict in dir
Adding as dir~HEAD instead
Automatic merge failed; fix conflicts and then commit the result.

ok 18 - Rename+D/F conflict; renamed file cannot merge and dir in the way

expecting success: 
	git reset --hard &&
	rm -rf dir~* &&
	git checkout -q dir-in-way^0 &&
	test_must_fail git merge --strategy=recursive renamed-file-has-conflicts &&

	test 5 -eq "$(git ls-files -u | wc -l)" &&
	test 3 -eq "$(git ls-files -u dir | grep -v file-in-the-way | wc -l)" &&
	test 2 -eq "$(git ls-files -u dir/file-in-the-way | wc -l)" &&

	test_must_fail git diff --quiet &&
	test_must_fail git diff --cached --quiet &&

	test -f dir/file-in-the-way &&
	test -f dir~renamed-file-has-conflicts &&
	test_cmp expected dir~renamed-file-has-conflicts

HEAD is now at f7d6b21 Conflicting change
Merging:
eee4132 Commit to merge, with dir in the way
virtual renamed-file-has-conflicts
found 1 common ancestor(s):
c406c00 Common commmit
CONFLICT (delete/modify): dir/file-in-the-way deleted in renamed-file-has-conflicts and modified in HEAD. Version HEAD of dir/file-in-the-way left in tree.
Auto-merging dir
CONFLICT (content): Merge conflict in dir
Adding as dir~renamed-file-has-conflicts instead
Automatic merge failed; fix conflicts and then commit the result.

ok 19 - Same as previous, but merged other way

expecting success: 
	git reset --hard &&
	git checkout --orphan rename-dest &&
	git rm -rf . &&
	git clean -fdqx &&

	mkdir one &&
	echo stuff >one/file &&
	git add -A &&
	git commit -m "Common commmit" &&

	git mv one/file destdir &&
	git commit -m "Renamed to destdir" &&

	git checkout -b source-conflict HEAD~1 &&
	git rm -rf one &&
	mkdir destdir &&
	touch one destdir/foo &&
	git add -A &&
	git commit -m "Conflicts in the way"
HEAD is now at eee4132 Commit to merge, with dir in the way
rm 'a.stages'
rm 'b.stages'
rm 'c.stages'
rm 'dir/file-in-the-way'
rm 'n.stages'
rm 'sub/file'
[rename-dest (root-commit) ce353a0] Common commmit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 one/file
[rename-dest eaaf5ab] Renamed to destdir
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename one/file => destdir (100%)
rm 'one/file'
[source-conflict 855da9a] Conflicts in the way
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 create mode 100644 destdir/foo
 create mode 100644 one
 delete mode 100644 one/file

ok 20 - setup both rename source and destination involved in D/F conflict

expecting success: 
	git reset --hard &&
	rm -rf dir~* &&
	git checkout -q rename-dest^0 &&
	test_must_fail git merge --strategy=recursive source-conflict &&

	test 1 -eq "$(git ls-files -u | wc -l)" &&

	test_must_fail git diff --quiet &&

	test -f destdir/foo &&
	test -f one &&
	test -f destdir~HEAD &&
	test "stuff" = "$(cat destdir~HEAD)"

HEAD is now at 855da9a Conflicts in the way
Merging:
eaaf5ab Renamed to destdir
virtual source-conflict
found 1 common ancestor(s):
ce353a0 Common commmit
Removing destdir to make room for subdirectory; may re-add later.
Adding destdir/foo
Adding one
CONFLICT (rename/delete): Rename one/file->destdir in HEAD and deleted in source-conflict
Automatic merge failed; fix conflicts and then commit the result.

ok 21 - both rename source and destination involved in D/F conflict

expecting success: 
	git reset --hard &&
	git checkout --orphan rename-two &&
	git rm -rf . &&
	git clean -fdqx &&

	mkdir one &&
	mkdir two &&
	echo stuff >one/file &&
	echo other >two/file &&
	git add -A &&
	git commit -m "Common commmit" &&

	git rm -rf one &&
	git mv two/file one &&
	git commit -m "Rename two/file -> one" &&

	git checkout -b rename-one HEAD~1 &&
	git rm -rf two &&
	git mv one/file two &&
	rm -r one &&
	git commit -m "Rename one/file -> two"

HEAD is now at eaaf5ab Renamed to destdir
rm 'destdir'
[rename-two (root-commit) 066ce5f] Common commmit
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 one/file
 create mode 100644 two/file
rm 'one/file'
[rename-two 4cb3145] Rename two/file -> one
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 1 deletions(-)
 rename two/file => one (100%)
 delete mode 100644 one/file
rm 'two/file'
[rename-one a1a5a3e] Rename one/file -> two
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 1 deletions(-)
 rename one/file => two (100%)
 delete mode 100644 two/file

ok 22 - setup pair rename to parent of other (D/F conflicts)

expecting success: 
	git checkout -q rename-one^0 &&
	mkdir one &&
	test_must_fail git merge --strategy=recursive rename-two &&

	test 2 -eq "$(git ls-files -u | wc -l)" &&
	test 1 -eq "$(git ls-files -u one | wc -l)" &&
	test 1 -eq "$(git ls-files -u two | wc -l)" &&

	test_must_fail git diff --quiet &&

	test 4 -eq $(find . | grep -v .git | wc -l) &&

	test -d one &&
	test -f one~rename-two &&
	test -f two &&
	test "other" = $(cat one~rename-two) &&
	test "stuff" = $(cat two)
Merging:
a1a5a3e Rename one/file -> two
virtual rename-two
found 1 common ancestor(s):
066ce5f Common commmit
Removing two to make room for subdirectory; may re-add later.
CONFLICT (rename/delete): Rename one/file->two in HEAD and deleted in rename-two
CONFLICT (rename/delete): Rename two/file->one in rename-two and deleted in HEAD
Automatic merge failed; fix conflicts and then commit the result.

ok 23 - pair rename to parent of other (D/F conflicts) w/ untracked dir

expecting success: 
	git reset --hard &&
	git clean -fdqx &&
	test_must_fail git merge --strategy=recursive rename-two &&

	test 2 -eq "$(git ls-files -u | wc -l)" &&
	test 1 -eq "$(git ls-files -u one | wc -l)" &&
	test 1 -eq "$(git ls-files -u two | wc -l)" &&

	test_must_fail git diff --quiet &&

	test 3 -eq $(find . | grep -v .git | wc -l) &&

	test -f one &&
	test -f two &&
	test "other" = $(cat one) &&
	test "stuff" = $(cat two)

HEAD is now at a1a5a3e Rename one/file -> two
Merging:
a1a5a3e Rename one/file -> two
virtual rename-two
found 1 common ancestor(s):
066ce5f Common commmit
Removing two to make room for subdirectory; may re-add later.
CONFLICT (rename/delete): Rename one/file->two in HEAD and deleted in rename-two
CONFLICT (rename/delete): Rename two/file->one in rename-two and deleted in HEAD
Automatic merge failed; fix conflicts and then commit the result.

ok 24 - pair rename to parent of other (D/F conflicts) w/ clean start

expecting success: 
	git reset --hard &&
	git checkout --orphan first-rename &&
	git rm -rf . &&
	git clean -fdqx &&

	echo stuff >original &&
	git add -A &&
	git commit -m "Common commmit" &&

	mkdir two &&
	>two/file &&
	git add two/file &&
	git mv original one &&
	git commit -m "Put two/file in the way, rename to one" &&

	git checkout -b second-rename HEAD~1 &&
	mkdir one &&
	>one/file &&
	git add one/file &&
	git mv original two &&
	git commit -m "Put one/file in the way, rename to two"

HEAD is now at a1a5a3e Rename one/file -> two
rm 'two'
[first-rename (root-commit) e13c319] Common commmit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 original
[first-rename a290218] Put two/file in the way, rename to one
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename original => one (100%)
 create mode 100644 two/file
[second-rename 4dbbdba] Put one/file in the way, rename to two
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 one/file
 rename original => two (100%)

ok 25 - setup rename of one file to two, with directories in the way

expecting success: 
	git checkout -q first-rename^0 &&
	test_must_fail git merge --strategy=recursive second-rename &&

	test 5 -eq "$(git ls-files -s | wc -l)" &&
	test 3 -eq "$(git ls-files -u | wc -l)" &&
	test 1 -eq "$(git ls-files -u one | wc -l)" &&
	test 1 -eq "$(git ls-files -u two | wc -l)" &&
	test 1 -eq "$(git ls-files -u original | wc -l)" &&
	test 2 -eq "$(git ls-files -o | wc -l)" &&

	test -f one/file &&
	test -f two/file &&
	test -f one~HEAD &&
	test -f two~second-rename &&
	! test -f original

Merging:
a290218 Put two/file in the way, rename to one
virtual second-rename
found 1 common ancestor(s):
e13c319 Common commmit
Removing one to make room for subdirectory; may re-add later.
Adding one/file
Adding two/file
CONFLICT (rename/rename): Rename "original"->"one" in branch "HEAD" rename "original"->"two" in "second-rename"
one is a directory in second-rename adding as one~HEAD instead
two is a directory in HEAD adding as two~second-rename instead
Automatic merge failed; fix conflicts and then commit the result.

ok 26 - check handling of differently renamed file with D/F conflicts

expecting success: 
	git reset --hard &&
	git checkout --orphan first-rename-redo &&
	git rm -rf . &&
	git clean -fdqx &&

	echo stuff >original &&
	mkdir one two &&
	touch one/file two/file &&
	git add -A &&
	git commit -m "Common commmit" &&

	git rm -rf one &&
	git mv original one &&
	git commit -m "Rename to one" &&

	git checkout -b second-rename-redo HEAD~1 &&
	git rm -rf two &&
	git mv original two &&
	git commit -m "Rename to two"

HEAD is now at a290218 Put two/file in the way, rename to one
rm 'one'
rm 'two/file'
[first-rename-redo (root-commit) 3f0c3f9] Common commmit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 one/file
 create mode 100644 original
 create mode 100644 two/file
rm 'one/file'
[first-rename-redo 9096ec7] Rename to one
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename original => one (100%)
 delete mode 100644 one/file
rm 'two/file'
[second-rename-redo 5a7d1f7] Rename to two
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename original => two (100%)
 delete mode 100644 two/file

ok 27 - setup rename one file to two; directories moving out of the way

expecting success: 
	git checkout -q first-rename-redo^0 &&
	test_must_fail git merge --strategy=recursive second-rename-redo &&

	test 3 -eq "$(git ls-files -u | wc -l)" &&
	test 1 -eq "$(git ls-files -u one | wc -l)" &&
	test 1 -eq "$(git ls-files -u two | wc -l)" &&
	test 1 -eq "$(git ls-files -u original | wc -l)" &&
	test 0 -eq "$(git ls-files -o | wc -l)" &&

	test -f one &&
	test -f two &&
	! test -f original
Merging:
9096ec7 Rename to one
virtual second-rename-redo
found 1 common ancestor(s):
3f0c3f9 Common commmit
Removing one to make room for subdirectory; may re-add later.
Removing two/file
CONFLICT (rename/rename): Rename "original"->"one" in branch "HEAD" rename "original"->"two" in "second-rename-redo"
Automatic merge failed; fix conflicts and then commit the result.
ok 28 - check handling of differently renamed file with D/F conflicts

# passed all 28 test(s)
1..28

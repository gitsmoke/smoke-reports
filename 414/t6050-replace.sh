Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6050-replace/.git/
expecting success: 
     echo "line 1" >> hello &&
     echo "line 2" >> hello &&
     echo "line 3" >> hello &&
     echo "line 4" >> hello &&
     add_and_commit_file hello "4 lines" &&
     HASH1=$(git rev-parse --verify HEAD) &&
     echo "line BUG" >> hello &&
     echo "line 6" >> hello &&
     echo "line 7" >> hello &&
     echo "line 8" >> hello &&
     add_and_commit_file hello "4 more lines with a BUG" &&
     HASH2=$(git rev-parse --verify HEAD) &&
     echo "line 9" >> hello &&
     echo "line 10" >> hello &&
     add_and_commit_file hello "2 more lines" &&
     HASH3=$(git rev-parse --verify HEAD) &&
     echo "line 11" >> hello &&
     add_and_commit_file hello "1 more line" &&
     HASH4=$(git rev-parse --verify HEAD) &&
     sed -e "s/BUG/5/" hello > hello.new &&
     mv hello.new hello &&
     add_and_commit_file hello "BUG fixed" &&
     HASH5=$(git rev-parse --verify HEAD) &&
     echo "line 12" >> hello &&
     echo "line 13" >> hello &&
     add_and_commit_file hello "2 more lines" &&
     HASH6=$(git rev-parse --verify HEAD) &&
     echo "line 14" >> hello &&
     echo "line 15" >> hello &&
     echo "line 16" >> hello &&
     add_and_commit_file hello "again 3 more lines" &&
     HASH7=$(git rev-parse --verify HEAD)

ok 1 - set up buggy branch

expecting success: 
     git cat-file commit $HASH2 | grep "author A U Thor" &&
     R=$(git cat-file commit $HASH2 | sed -e "s/A U/O/" | git hash-object -t commit --stdin -w) &&
     git cat-file commit $R | grep "author O Thor" &&
     git update-ref refs/replace/$HASH2 $R &&
     git show HEAD~5 | grep "O Thor" &&
     git show $HASH2 | grep "O Thor"

author A U Thor <author@example.com> 1112912053 -0700
author O Thor <author@example.com> 1112912053 -0700
Author: O Thor <author@example.com>
Author: O Thor <author@example.com>

ok 2 - replace the author

expecting success: 
     git cat-file commit $HASH2 | grep "author O Thor" &&
     git --no-replace-objects cat-file commit $HASH2 | grep "author A U Thor" &&
     git show $HASH2 | grep "O Thor" &&
     git --no-replace-objects show $HASH2 | grep "A U Thor"
author O Thor <author@example.com> 1112912053 -0700
author A U Thor <author@example.com> 1112912053 -0700
Author: O Thor <author@example.com>
Author: A U Thor <author@example.com>
ok 3 - test --no-replace-objects option
expecting success: 
     GIT_NO_REPLACE_OBJECTS=1 git cat-file commit $HASH2 | grep "author A U Thor" &&
     GIT_NO_REPLACE_OBJECTS=1 git show $HASH2 | grep "A U Thor"
author A U Thor <author@example.com> 1112912053 -0700
Author: A U Thor <author@example.com>
ok 4 - test GIT_NO_REPLACE_OBJECTS env variable
expecting success: 
     git mktag <tag.sig >.git/refs/tags/mytag 2>message

ok 5 - tag replaced commit

expecting success: 
     git fsck master > fsck_master.out &&
     grep "dangling commit $R" fsck_master.out &&
     grep "dangling tag $(cat .git/refs/tags/mytag)" fsck_master.out &&
     test -z "$(git fsck)"

dangling commit c06ac9b8cd2f38349af40ec00e5d5c761b3bf513
dangling tag e25dc7954f0832d962347872884aab2dffb426c5

ok 6 - "git fsck" works

expecting success: 
     git repack -a -d &&
     git clone --no-hardlinks . clone_dir &&
     (
	  cd clone_dir &&
	  git show HEAD~5 | grep "A U Thor" &&
	  git show $HASH2 | grep "A U Thor" &&
	  git cat-file commit $R &&
	  git repack -a -d &&
	  test_must_fail git cat-file commit $R &&
	  git fetch ../ "refs/replace/*:refs/replace/*" &&
	  git show HEAD~5 | grep "O Thor" &&
	  git show $HASH2 | grep "O Thor" &&
	  git cat-file commit $R
     )
Cloning into clone_dir
done.
Author: A U Thor <author@example.com>
Author: A U Thor <author@example.com>
tree 242e3e36d5c0616fbf715682c322254dadb55168
parent 00ad688edb1a79423184992de45a5f0322c8bdf5
author O Thor <author@example.com> 1112912053 -0700
committer C O Mitter <committer@example.com> 1112912053 -0700

hello: 4 more lines with a BUG
Author: O Thor <author@example.com>
Author: O Thor <author@example.com>
tree 242e3e36d5c0616fbf715682c322254dadb55168
parent 00ad688edb1a79423184992de45a5f0322c8bdf5
author O Thor <author@example.com> 1112912053 -0700
committer C O Mitter <committer@example.com> 1112912053 -0700

hello: 4 more lines with a BUG

ok 7 - repack, clone and fetch work

expecting success: 
     test "$HASH2" = "$(git replace -l)" &&
     test "$HASH2" = "$(git replace)" &&
     aa=${HASH2%??????????????????????????????????????} &&
     test "$HASH2" = "$(git replace -l "$aa*")" &&
     test_must_fail git replace -d $R &&
     test_must_fail git replace -d &&
     test_must_fail git replace -l -d $HASH2 &&
     git replace -d $HASH2 &&
     git show $HASH2 | grep "A U Thor" &&
     test -z "$(git replace -l)"

Deleted replace ref '4217adb325b9db7bfc0c7b223183cc8546638cf0'
Author: A U Thor <author@example.com>

ok 8 - "git replace" listing and deleting

expecting success: 
     git replace $HASH2 $R &&
     git show $HASH2 | grep "O Thor" &&
     test_must_fail git replace $HASH2 $R &&
     git replace -f $HASH2 $R &&
     test_must_fail git replace -f &&
     test "$HASH2" = "$(git replace)"

Author: O Thor <author@example.com>

ok 9 - "git replace" replacing

expecting success: 
     git replace -d $HASH2 &&
     git show $HASH2 | grep "A U Thor" &&
     git checkout $HASH1 &&
     git cherry-pick $HASH2 &&
     git show $HASH5 | git apply &&
     git commit --amend -m "hello: 4 more lines WITHOUT the bug" hello &&
     PARA2=$(git rev-parse --verify HEAD) &&
     git cherry-pick $HASH3 &&
     PARA3=$(git rev-parse --verify HEAD) &&
     git cherry-pick $HASH4 &&
     PARA4=$(git rev-parse --verify HEAD) &&
     git cherry-pick $HASH6 &&
     PARA6=$(git rev-parse --verify HEAD) &&
     git replace $HASH6 $PARA6 &&
     git checkout master &&
     cur=$(git rev-parse --verify HEAD) &&
     test "$cur" = "$HASH7" &&
     git log --pretty=oneline | grep $PARA2 &&
     git remote add cloned ./clone_dir

Deleted replace ref '4217adb325b9db7bfc0c7b223183cc8546638cf0'
Author: A U Thor <author@example.com>
[detached HEAD dcda230] hello: 4 more lines with a BUG
 Author: A U Thor <author@example.com>
 1 files changed, 4 insertions(+), 0 deletions(-)
[detached HEAD af6d994] hello: 4 more lines WITHOUT the bug
 Author: A U Thor <author@example.com>
 1 files changed, 4 insertions(+), 0 deletions(-)
Auto-merging hello
[detached HEAD a3fb2e1] hello: 2 more lines
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
Auto-merging hello
[detached HEAD f486255] hello: 1 more line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[detached HEAD 911408d] hello: 2 more lines
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
af6d994c7106b0846fb80f09fa5bcbc460432c6d hello: 4 more lines WITHOUT the bug

ok 10 - create parallel branch without the bug

expecting success: 
     git push cloned $HASH6^:refs/heads/parallel &&
     (
	  cd clone_dir &&
	  git checkout parallel &&
	  git log --pretty=oneline | grep $PARA2
     )

af6d994c7106b0846fb80f09fa5bcbc460432c6d hello: 4 more lines WITHOUT the bug

ok 11 - push to cloned repo

expecting success: 
     git cat-file commit $PARA3 | grep "author A U Thor" &&
     S=$(git cat-file commit $PARA3 | sed -e "s/A U/O/" | git hash-object -t commit --stdin -w) &&
     git cat-file commit $S | grep "author O Thor" &&
     git replace $PARA3 $S &&
     git show $HASH6~2 | grep "O Thor" &&
     git show $PARA3 | grep "O Thor" &&
     git push cloned $HASH6^:refs/heads/parallel2 &&
     (
	  cd clone_dir &&
	  git checkout parallel2 &&
	  git log --pretty=oneline | grep $PARA3 &&
	  git show $PARA3 | grep "A U Thor"
     )

author A U Thor <author@example.com> 1112912113 -0700
author O Thor <author@example.com> 1112912113 -0700
Author: O Thor <author@example.com>
Author: O Thor <author@example.com>
a3fb2e1845a1aaf129b7975048973414dc172173 hello: 2 more lines
Author: A U Thor <author@example.com>

ok 12 - push branch with replacement

expecting success: 
     git branch tofetch $HASH6 &&
     (
	  cd clone_dir &&
	  git fetch origin refs/heads/tofetch:refs/heads/parallel3 &&
	  git log --pretty=oneline parallel3 > output.txt &&
	  ! grep $PARA3 output.txt &&
	  git show $PARA3 > para3.txt &&
	  grep "A U Thor" para3.txt &&
	  git fetch origin "refs/replace/*:refs/replace/*" &&
	  git log --pretty=oneline parallel3 > output.txt &&
	  grep $PARA3 output.txt &&
	  git show $PARA3 > para3.txt &&
	  grep "O Thor" para3.txt
     )
Author: A U Thor <author@example.com>
a3fb2e1845a1aaf129b7975048973414dc172173 hello: 2 more lines
Author: O Thor <author@example.com>

ok 13 - fetch branch with replacement

expecting success: 
     git bisect start $HASH7 $HASH1 &&
     test "$PARA3" = "$(git rev-parse --verify HEAD)" &&
     git bisect reset &&
     GIT_NO_REPLACE_OBJECTS=1 git bisect start $HASH7 $HASH1 &&
     test "$HASH4" = "$(git rev-parse --verify HEAD)" &&
     git bisect reset &&
     git --no-replace-objects bisect start $HASH7 $HASH1 &&
     test "$HASH4" = "$(git rev-parse --verify HEAD)" &&
     git bisect reset
Bisecting: 2 revisions left to test after this (roughly 1 step)
[a3fb2e1845a1aaf129b7975048973414dc172173] hello: 2 more lines
Bisecting: 2 revisions left to test after this (roughly 2 steps)
[40237c8b8add42b8ca9d277edebf9dd36b4edbd8] hello: 1 more line
Bisecting: 2 revisions left to test after this (roughly 2 steps)
[40237c8b8add42b8ca9d277edebf9dd36b4edbd8] hello: 1 more line

ok 14 - bisect and replacements

expecting success: 
	git --no-replace-objects rev-list --objects HEAD |
	git --no-replace-objects pack-objects test- &&
	git index-pack test-*.pack

4329659a4ce55e99fa2e8322432d787878f5c0c8
4329659a4ce55e99fa2e8322432d787878f5c0c8

ok 15 - index-pack and replacements

# passed all 15 test(s)
1..15

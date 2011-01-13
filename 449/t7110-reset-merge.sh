Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7110-reset-merge/.git/
expecting success: 
    for i in 1 2 3; do echo line $i; done >file1 &&
    cat file1 >file2 &&
    git add file1 file2 &&
    test_tick &&
    git commit -m "Initial commit" &&
    git tag initial &&
    echo line 4 >>file1 &&
    cat file1 >file2 &&
    test_tick &&
    git commit -m "add line 4 to file1" file1 &&
    git tag second
[master (root-commit) 294b13e] Initial commit
 Author: A U Thor <author@example.com>
 2 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 file1
 create mode 100644 file2
[master 91b6f65] add line 4 to file1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 
    git reset --merge HEAD^ &&
    ! grep 4 file1 &&
    grep 4 file2 &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse initial)" &&
    test -z "$(git diff --cached)"
line 4

ok 2 - reset --merge is ok with changes in file it does not touch

expecting success: 
    git reset --merge second &&
    grep 4 file1 &&
    grep 4 file2 &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse second)" &&
    test -z "$(git diff --cached)"

line 4
line 4

ok 3 - reset --merge is ok when switching back

expecting success: 
    git reset --hard second &&
    cat file1 >file2 &&
    git reset --keep HEAD^ &&
    ! grep 4 file1 &&
    grep 4 file2 &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse initial)" &&
    test -z "$(git diff --cached)"

HEAD is now at 91b6f65 add line 4 to file1
line 4

ok 4 - reset --keep is ok with changes in file it does not touch

expecting success: 
    git reset --keep second &&
    grep 4 file1 &&
    grep 4 file2 &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse second)" &&
    test -z "$(git diff --cached)"

line 4
line 4

ok 5 - reset --keep is ok when switching back

expecting success: 
    git reset --hard second &&
    cat file1 >file2 &&
    echo "line 5" >> file1 &&
    git add file1 &&
    git reset --merge HEAD^ &&
    ! grep 4 file1 &&
    ! grep 5 file1 &&
    grep 4 file2 &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse initial)" &&
    test -z "$(git diff --cached)"

HEAD is now at 91b6f65 add line 4 to file1
line 4

ok 6 - reset --merge discards changes added to index (1)

expecting success: 
    git reset --hard initial &&
    echo "line 5" >> file2 &&
    git add file2 &&
    git reset --merge second &&
    ! grep 4 file2 &&
    ! grep 5 file1 &&
    grep 4 file1 &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse second)" &&
    test -z "$(git diff --cached)"

HEAD is now at 294b13e Initial commit
line 4

ok 7 - reset --merge is ok again when switching back (1)

expecting success: 
    git reset --hard second &&
    echo "line 5" >> file1 &&
    git add file1 &&
    test_must_fail git reset --keep HEAD^

HEAD is now at 91b6f65 add line 4 to file1

ok 8 - reset --keep fails with changes in index in files it touches

expecting success: 
    git reset --hard second &&
    echo "line 4" >> file2 &&
    git add file2 &&
    git reset --merge HEAD^ &&
    ! grep 4 file2 &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse initial)" &&
    test -z "$(git diff)" &&
    test -z "$(git diff --cached)"

HEAD is now at 91b6f65 add line 4 to file1

ok 9 - reset --merge discards changes added to index (2)

expecting success: 
    git reset --hard initial &&
    git reset --merge second &&
    ! grep 4 file2 &&
    grep 4 file1 &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse second)" &&
    test -z "$(git diff --cached)"

HEAD is now at 294b13e Initial commit
line 4

ok 10 - reset --merge is ok again when switching back (2)

expecting success: 
    git reset --hard second &&
    echo "line 4" >> file2 &&
    git add file2 &&
    git reset --keep HEAD^ &&
    grep 4 file2 &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse initial)" &&
    test -z "$(git diff --cached)"

HEAD is now at 91b6f65 add line 4 to file1
line 4

ok 11 - reset --keep keeps changes it does not touch

expecting success: 
    git reset --keep second &&
    grep 4 file2 &&
    grep 4 file1 &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse second)" &&
    test -z "$(git diff --cached)"

line 4
line 4

ok 12 - reset --keep keeps changes when switching back

expecting success: 
    git reset --hard second &&
    echo "line 5" >> file1 &&
    test_tick &&
    git commit -m "add line 5" file1 &&
    sed -e "s/line 1/changed line 1/" <file1 >file3 &&
    mv file3 file1 &&
    test_must_fail git reset --merge HEAD^ 2>err.log &&
    grep file1 err.log | grep "not uptodate"

HEAD is now at 91b6f65 add line 4 to file1
[master 7799e7c] add line 5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
error: Entry 'file1' not uptodate. Cannot merge.

ok 13 - reset --merge fails with changes in file it touches

expecting success: 
    git reset --hard second &&
    echo "line 5" >> file1 &&
    test_tick &&
    git commit -m "add line 5" file1 &&
    sed -e "s/line 1/changed line 1/" <file1 >file3 &&
    mv file3 file1 &&
    test_must_fail git reset --keep HEAD^ 2>err.log &&
    grep file1 err.log | grep "not uptodate"

HEAD is now at 91b6f65 add line 4 to file1
[master f1894d3] add line 5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
error: Entry 'file1' not uptodate. Cannot merge.

ok 14 - reset --keep fails with changes in file it touches

expecting success: 
    git reset --hard second &&
    git branch branch1 &&
    git branch branch2 &&
    git branch branch3 &&
    git checkout branch1 &&
    echo "line 5 in branch1" >> file1 &&
    test_tick &&
    git commit -a -m "change in branch1" &&
    git checkout branch2 &&
    echo "line 5 in branch2" >> file1 &&
    test_tick &&
    git commit -a -m "change in branch2" &&
    git tag third &&
    git checkout branch3 &&
    echo a new file >file3 &&
    rm -f file1 &&
    git add file3 &&
    test_tick &&
    git commit -a -m "change in branch3"

HEAD is now at 91b6f65 add line 4 to file1
[branch1 4afd189] change in branch1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[branch2 077fd6d] change in branch2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[branch3 05419f2] change in branch3
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 4 deletions(-)
 delete mode 100644 file1
 create mode 100644 file3

ok 15 - setup 3 different branches

expecting success: 
    git checkout third &&
    test_must_fail git merge branch1 &&
    git reset --merge HEAD^ &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse second)" &&
    test -z "$(git diff --cached)" &&
    test -z "$(git diff)"

Merging:
077fd6d change in branch2
virtual branch1
found 1 common ancestor(s):
91b6f65 add line 4 to file1
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.

ok 16 - "reset --merge HEAD^" is ok with pending merge

expecting success: 
    git reset --hard third &&
    test_must_fail git merge branch1 &&
    test_must_fail git reset --keep HEAD^ 2>err.log &&
    grep "middle of a merge" err.log

HEAD is now at 077fd6d change in branch2
Merging:
077fd6d change in branch2
virtual branch1
found 1 common ancestor(s):
91b6f65 add line 4 to file1
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.
fatal: Cannot do a keep reset in the middle of a merge.

ok 17 - "reset --keep HEAD^" fails with pending merge

expecting success: 
    git reset --hard third &&
    test_must_fail git merge branch1 &&
    git reset --merge HEAD &&
    test "$(git rev-parse HEAD)" = "$(git rev-parse third)" &&
    test -z "$(git diff --cached)" &&
    test -z "$(git diff)"

HEAD is now at 077fd6d change in branch2
Merging:
077fd6d change in branch2
virtual branch1
found 1 common ancestor(s):
91b6f65 add line 4 to file1
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.

ok 18 - "reset --merge HEAD" is ok with pending merge

expecting success: 
    git reset --hard third &&
    test_must_fail git merge branch1 &&
    test_must_fail git reset --keep HEAD 2>err.log &&
    grep "middle of a merge" err.log

HEAD is now at 077fd6d change in branch2
Merging:
077fd6d change in branch2
virtual branch1
found 1 common ancestor(s):
91b6f65 add line 4 to file1
Auto-merging file1
CONFLICT (content): Merge conflict in file1
Automatic merge failed; fix conflicts and then commit the result.
fatal: Cannot do a keep reset in the middle of a merge.

ok 19 - "reset --keep HEAD" fails with pending merge

expecting success: 
    git reset --hard third &&
    rm -f file2 &&
    test_must_fail git merge branch3 &&
    ! test -f file2 &&
    test -f file3 &&
    git diff --exit-code file3 &&
    git diff --exit-code branch3 file3 &&
    git reset --merge HEAD &&
    ! test -f file3 &&
    ! test -f file2 &&
    git diff --exit-code --cached
HEAD is now at 077fd6d change in branch2
Merging:
077fd6d change in branch2
virtual branch3
found 1 common ancestor(s):
91b6f65 add line 4 to file1
CONFLICT (delete/modify): file1 deleted in branch3 and modified in HEAD. Version HEAD of file1 left in tree.
Automatic merge failed; fix conflicts and then commit the result.

ok 20 - --merge is ok with added/deleted merge

expecting success: 
    git reset --hard third &&
    rm -f file2 &&
    test_must_fail git merge branch3 &&
    ! test -f file2 &&
    test -f file3 &&
    git diff --exit-code file3 &&
    git diff --exit-code branch3 file3 &&
    test_must_fail git reset --keep HEAD 2>err.log &&
    grep "middle of a merge" err.log
HEAD is now at 077fd6d change in branch2
Merging:
077fd6d change in branch2
virtual branch3
found 1 common ancestor(s):
91b6f65 add line 4 to file1
CONFLICT (delete/modify): file1 deleted in branch3 and modified in HEAD. Version HEAD of file1 left in tree.
Automatic merge failed; fix conflicts and then commit the result.
fatal: Cannot do a keep reset in the middle of a merge.

ok 21 - --keep fails with added/deleted merge

# passed all 21 test(s)
1..21

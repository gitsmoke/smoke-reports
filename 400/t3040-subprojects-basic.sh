Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3040-subprojects-basic/.git/
expecting success: : >Makefile &&
    git add Makefile &&
    git commit -m "Superproject created"
[master (root-commit) 4de0552] Superproject created
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 Makefile

ok 1 - Super project creation
expecting success: mkdir sub1 &&
    ( cd sub1 && git init && : >Makefile && git add * &&
    git commit -q -m "subproject 1" ) &&
    mkdir sub2 &&
    ( cd sub2 && git init && : >Makefile && git add * &&
    git commit -q -m "subproject 2" ) &&
    git update-index --add sub1 &&
    git add sub2 &&
    git commit -q -m "subprojects added" &&
    git diff-tree --abbrev=5 HEAD^ HEAD |cut -d" " -f-3,5- >current &&
    test_cmp expected current
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3040-subprojects-basic/sub1/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3040-subprojects-basic/sub2/.git/

ok 2 - create subprojects

expecting success: git fsck --full

ok 3 - check if fsck ignores the subprojects

expecting success: ( cd sub1 &&
    echo "all:" >>Makefile &&
    echo "	true" >>Makefile &&
    git commit -q -a -m "make all" ) && {
        git diff-files --exit-code
	test $? = 1
    }
:160000 160000 127309e7b3689b1555578cbc0a1aac9afe57daa9 0000000000000000000000000000000000000000 M	sub1

ok 4 - check if commit in a subproject detected

expecting success: git commit -q -a -m "sub1 changed" && {
	git diff-tree --exit-code HEAD^ HEAD
	test $? = 1
    }
:160000 160000 127309e7b3689b1555578cbc0a1aac9afe57daa9 4dfe68889912ef7c925524dacbe92752348268ac M	sub1

ok 5 - check if a changed subproject HEAD can be committed

expecting success: git diff-index --exit-code --cached save -- sub1
    test $? = 1
:160000 160000 127309e7b3689b1555578cbc0a1aac9afe57daa9 4dfe68889912ef7c925524dacbe92752348268ac M	sub1

ok 6 - check if diff-index works for subproject elements

expecting success: git diff-tree --exit-code HEAD^ HEAD -- sub1
    test $? = 1
:160000 160000 127309e7b3689b1555578cbc0a1aac9afe57daa9 4dfe68889912ef7c925524dacbe92752348268ac M	sub1

ok 7 - check if diff-tree works for subproject elements

expecting success: git diff --exit-code HEAD^ HEAD
    test $? = 1
diff --git a/sub1 b/sub1
index 127309e..4dfe688 160000
--- a/sub1
+++ b/sub1
@@ -1 +1 @@
-Subproject commit 127309e7b3689b1555578cbc0a1aac9afe57daa9
+Subproject commit 4dfe68889912ef7c925524dacbe92752348268ac

ok 8 - check if git diff works for subproject elements
expecting success: git ls-files -s >expected &&
    git clone -l -s . cloned &&
    ( cd cloned && git ls-files -s ) >current &&
    test_cmp expected current
Cloning into cloned
done.

ok 9 - check if clone works

expecting success: git update-index --force-remove -- sub2 &&
    mv sub2 sub3 &&
    git add sub3 &&
    git commit -q -m "renaming a subproject" && {
	git diff -M --name-status --exit-code HEAD^ HEAD
	test $? = 1
    }
R100	sub2	sub3

ok 10 - removing and adding subproject

expecting success: git checkout save &&
    git diff-index --exit-code --raw --cached save -- sub1
M	sub1

ok 11 - checkout in superproject

# passed all 11 test(s)
1..11

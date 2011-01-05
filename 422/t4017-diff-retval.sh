Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4017-diff-retval/.git/
expecting success: 
	echo "1 " >a &&
	git add . &&
	git commit -m zeroth &&
	echo 1 >a &&
	git add . &&
	git commit -m first &&
	echo 2 >b &&
	git add . &&
	git commit -a -m second

[master (root-commit) 864b1fe] zeroth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a
[master 74aad52] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 2e7ee7f] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 b

ok 1 - setup

expecting success: 
	git diff --quiet -w HEAD^^ HEAD^


ok 2 - git diff --quiet -w  HEAD^^ HEAD^

expecting success: 
	test_must_fail git diff --quiet HEAD^^ HEAD^


ok 3 - git diff --quiet HEAD^^ HEAD^

expecting success: 
	test_must_fail git diff --quiet -w HEAD^ HEAD


ok 4 - git diff --quiet -w  HEAD^ HEAD

expecting success: 
	test_expect_code 1 git diff-tree --exit-code HEAD^ HEAD

:000000 100644 0000000000000000000000000000000000000000 0cfbf08886fca9a91cb753ec8734c84fcbe52c9f A	b

ok 5 - git diff-tree HEAD^ HEAD

expecting success: 
	git diff-tree --exit-code HEAD^ HEAD -- a


ok 6 - git diff-tree HEAD^ HEAD -- a

expecting success: 
	test_expect_code 1 git diff-tree --exit-code HEAD^ HEAD -- b

:000000 100644 0000000000000000000000000000000000000000 0cfbf08886fca9a91cb753ec8734c84fcbe52c9f A	b

ok 7 - git diff-tree HEAD^ HEAD -- b

expecting success: 
	echo $(git rev-parse HEAD) | test_expect_code 1 git diff-tree --exit-code --stdin

2e7ee7fbfdaa8671b1c5893c70470427b363066b
:000000 100644 0000000000000000000000000000000000000000 0cfbf08886fca9a91cb753ec8734c84fcbe52c9f A	b

ok 8 - echo HEAD | git diff-tree --stdin

expecting success: 
	git diff-tree --exit-code HEAD HEAD


ok 9 - git diff-tree HEAD HEAD

expecting success: 
	git diff-files --exit-code


ok 10 - git diff-files

expecting success: 
	git diff-index --exit-code --cached HEAD


ok 11 - git diff-index --cached HEAD

expecting success: 
	test_expect_code 1 git diff-index --exit-code --cached HEAD^
:000000 100644 0000000000000000000000000000000000000000 0cfbf08886fca9a91cb753ec8734c84fcbe52c9f A	b

ok 12 - git diff-index --cached HEAD^

expecting success: 
	echo text >>b &&
	echo 3 >c &&
	git add . &&
	test_expect_code 1 git diff-index --exit-code --cached HEAD^

:000000 100644 0000000000000000000000000000000000000000 6ba94de6433d6530a0fb55e5e6da01023a4bc9e3 A	b
:000000 100644 0000000000000000000000000000000000000000 00750edc07d6415dcc07ae0351e9397b0222b7ba A	c

ok 13 - git diff-index --cached HEAD^

expecting success: 
	git commit -m "text in b" &&
	test_expect_code 1 git diff-tree -p --exit-code -Stext HEAD^ HEAD -- b

[master 30f822d] text in b
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 c
diff --git a/b b/b
index 0cfbf08..6ba94de 100644
--- a/b
+++ b/b
@@ -1 +1,2 @@
 2
+text

ok 14 - git diff-tree -Stext HEAD^ HEAD -- b

expecting success: 
	git diff-tree -p --exit-code -Snot-found HEAD^ HEAD -- b
ok 15 - git diff-tree -Snot-found HEAD^ HEAD -- b

expecting success: 
	echo 3 >>c &&
	test_expect_code 1 git diff-files --exit-code
:100644 100644 00750edc07d6415dcc07ae0351e9397b0222b7ba 0000000000000000000000000000000000000000 M	c

ok 16 - git diff-files

expecting success: 
	git update-index c &&
	test_expect_code 1 git diff-index --exit-code --cached HEAD
:100644 100644 00750edc07d6415dcc07ae0351e9397b0222b7ba a5c8806279fa7d6b7d04418a47e21b7e89ab18f8 M	c

ok 17 - git diff-index --cached HEAD
expecting success: 

	git diff --check --exit-code

ok 18 - --check --exit-code returns 0 for no difference

expecting success: 

	echo "good" > a &&
	test_expect_code 1 git diff --check --exit-code

ok 19 - --check --exit-code returns 1 for a clean difference

expecting success: 

	echo "bad   " >> a &&
	test_expect_code 3 git diff --check --exit-code
a:2: trailing whitespace.
+bad   

ok 20 - --check --exit-code returns 3 for a dirty difference
expecting success: 

	test_expect_code 2 git --no-pager diff --check
a:2: trailing whitespace.
+bad   

ok 21 - --check with --no-pager returns 2 for dirty difference

expecting success: 
	echo "" >>a &&
	test_expect_code 2 git --no-pager diff --check
a:2: trailing whitespace.
+bad   
a:3: new blank line at EOF.

ok 22 - check should test not just the last line
expecting success: 
	git reset --hard &&
	git checkout HEAD^ &&
	echo binary >>b &&
	git commit -m "side" b &&
	test_must_fail git merge master &&
	git add b &&
	test_expect_code 2 git --no-pager diff --cached --check >test.out &&
	test 3 = $(grep "conflict marker" test.out | wc -l) &&
	git reset --hard
HEAD is now at 30f822d text in b
[detached HEAD 3f25420] side
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Merging:
3f25420 side
virtual master
found 1 common ancestor(s):
2e7ee7f second
Auto-merging b
CONFLICT (content): Merge conflict in b
Automatic merge failed; fix conflicts and then commit the result.
HEAD is now at 3f25420 side

ok 23 - check detects leftover conflict markers
expecting success: 
	git reset --hard &&
	echo ">>>>>>> boo" >>b &&
	echo "======" >>a &&
	git diff --check a &&
	test_expect_code 2 git diff --check b &&
	git reset --hard &&
	echo ">>>>>>>> boo" >>b &&
	echo "========" >>a &&
	git diff --check &&
	echo "b conflict-marker-size=8" >.gitattributes &&
	test_expect_code 2 git diff --check b &&
	git diff --check a &&
	git reset --hard
HEAD is now at 3f25420 side
b:3: leftover conflict marker
HEAD is now at 3f25420 side
b:3: leftover conflict marker
HEAD is now at 3f25420 side

ok 24 - check honors conflict marker length

# passed all 24 test(s)
1..24

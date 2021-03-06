Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7701-repack-unpack-unreachable/.git/
expecting success: 
	echo content > file1 &&
	git add . &&
	test_tick &&
	git commit -m initial_commit &&
	# create a transient branch with unique content
	git checkout -b transient_branch &&
	echo more content >> file1 &&
	# record the objects created in the database for file, commit, tree
	fsha1=$(git hash-object file1) &&
	test_tick &&
	git commit -a -m more_content &&
	csha1=$(git rev-parse HEAD^{commit}) &&
	tsha1=$(git rev-parse HEAD^{tree}) &&
	git checkout master &&
	echo even more content >> file1 &&
	test_tick &&
	git commit -a -m even_more_content &&
	# delete the transient branch
	git branch -D transient_branch &&
	# pack the repo
	git repack -A -d -l &&
	# verify objects are packed in repository
	test 3 = $(git verify-pack -v -- .git/objects/pack/*.idx |
		   egrep "^($fsha1|$csha1|$tsha1) " |
		   sort | uniq | wc -l) &&
	git show $fsha1 &&
	git show $csha1 &&
	git show $tsha1 &&
	# now expire the reflog, while keeping reachable ones but expiring
	# unreachables immediately
	test_tick &&
	sometimeago=$(( $test_tick - 10000 )) &&
	git reflog expire --expire=$sometimeago --expire-unreachable=$test_tick --all &&
	# and repack
	git repack -A -d -l &&
	# verify objects are retained unpacked
	test 0 = $(git verify-pack -v -- .git/objects/pack/*.idx |
		   egrep "^($fsha1|$csha1|$tsha1) " |
		   sort | uniq | wc -l) &&
	git show $fsha1 &&
	git show $csha1 &&
	git show $tsha1

[master (root-commit) 5236a77] initial_commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file1
[transient_branch 24d3dd6] more_content
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 934cb86] even_more_content
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Deleted branch transient_branch (was 24d3dd6).
content
more content
commit 24d3dd69fb58e8ee7cf49dd5cf55ba09486cf335
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:14:13 2005 -0700

    more_content

diff --git a/file1 b/file1
index d95f3ad..86436d0 100644
--- a/file1
+++ b/file1
@@ -1 +1,2 @@
 content
+more content
tree 23dcdce1632612f22c2c58e14a653890ee9cb0aa

file1
content
more content
commit 24d3dd69fb58e8ee7cf49dd5cf55ba09486cf335
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:14:13 2005 -0700

    more_content

diff --git a/file1 b/file1
index d95f3ad..86436d0 100644
--- a/file1
+++ b/file1
@@ -1 +1,2 @@
 content
+more content
tree 23dcdce1632612f22c2c58e14a653890ee9cb0aa

file1

ok 1 - -A with -d option leaves unreachable objects unpacked

expecting success: 
	fsha1path=$(echo "$fsha1" | sed -e "s|\(..\)|\1/|") &&
	fsha1path=".git/objects/$fsha1path" &&
	csha1path=$(echo "$csha1" | sed -e "s|\(..\)|\1/|") &&
	csha1path=".git/objects/$csha1path" &&
	tsha1path=$(echo "$tsha1" | sed -e "s|\(..\)|\1/|") &&
	tsha1path=".git/objects/$tsha1path" &&
	git branch transient_branch $csha1 &&
	git repack -a -d -l &&
	test ! -f "$fsha1path" &&
	test ! -f "$csha1path" &&
	test ! -f "$tsha1path" &&
	test 1 = $(ls -1 .git/objects/pack/pack-*.pack | wc -l) &&
	packfile=$(ls .git/objects/pack/pack-*.pack) &&
	git branch -D transient_branch &&
	test_tick &&
	git repack -A -l &&
	test ! -f "$fsha1path" &&
	test ! -f "$csha1path" &&
	test ! -f "$tsha1path" &&
	git show $fsha1 &&
	git show $csha1 &&
	git show $tsha1

Deleted branch transient_branch (was 24d3dd6).
content
more content
commit 24d3dd69fb58e8ee7cf49dd5cf55ba09486cf335
Author: A U Thor <author@example.com>
Date:   Thu Apr 7 15:14:13 2005 -0700

    more_content

diff --git a/file1 b/file1
index d95f3ad..86436d0 100644
--- a/file1
+++ b/file1
@@ -1 +1,2 @@
 content
+more content
tree 23dcdce1632612f22c2c58e14a653890ee9cb0aa

file1

ok 2 - -A without -d option leaves unreachable objects packed
expecting success: 
	tmppack=".git/objects/pack/tmp_pack" &&
	ln "$packfile" "$tmppack" &&
	git repack -A -l -d &&
	test-chmtime -v +0 "$tmppack" "$fsha1path" "$csha1path" "$tsha1path" \
		> mtimes &&
	compare_mtimes < mtimes
ok 3 - unpacked objects receive timestamp of pack file

# passed all 3 test(s)
1..3

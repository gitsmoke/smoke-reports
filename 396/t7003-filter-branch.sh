Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7003-filter-branch/.git/
expecting success: 
	test_commit A &&
	test_commit B &&
	git checkout -b branch B &&
	test_commit D &&
	mkdir dir &&
	test_commit dir/D &&
	test_commit E &&
	git checkout master &&
	test_commit C &&
	git checkout branch &&
	git merge C &&
	git tag F &&
	test_commit G &&
	test_commit H
[master (root-commit) 0ddfaf1] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A.t
[master d9df450] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 B.t
[branch 0d4dc40] D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 D.t
[branch 4e03b39] dir/D
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 dir/D.t
[branch 65ac4e8] E
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 E.t
[master a983d32] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C.t
Merging:
65ac4e8 E
virtual C
found 1 common ancestor(s):
d9df450 B
Merge made by recursive.
 C.t |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 C.t
[branch b2abff4] G
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 G.t
[branch 7e8e428] H
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 H.t

ok 1 - setup
expecting success: 
	git filter-branch branch
Rewrite 0ddfaf193ff13d6ab39b7cbd9eed645e3ee2f050 (1/9)Rewrite d9df4505cb3522088b9e29d6051ac16f1564154a (2/9)Rewrite 0d4dc400483ec74c9bb511f6b55de5b4a252e539 (3/9)Rewrite 4e03b399e1202af07f2b9fd5eb05753253212d7e (4/9)Rewrite 65ac4e85ada4d3f56edb2faa5ccc49e4f582941c (5/9)Rewrite a983d32f44b8190bfe2779dda742a13d0dad0e5e (6/9)Rewrite 63ee39cf09bfb5599c4295f1daeeb353f8ae54c8 (7/9)Rewrite b2abff4f3a9090e4e03b495b54add2900f8396af (8/9)Rewrite 7e8e4286aa8a1c25600c2bb599777f2fbcee7a44 (9/9)
ok 2 - rewrite identically

expecting success: 
	test $H = $(git rev-parse HEAD)

ok 3 - result is really identical

expecting success: 
	(git config core.bare true && cd .git &&
	 git filter-branch branch > filter-output 2>&1 &&
	! fgrep fatal filter-output)

ok 4 - rewrite bare repository identically

expecting success: 
	test $H = $(git rev-parse HEAD)


ok 5 - result is really identical

expecting success: 
	mkdir drepo &&
	( cd drepo &&
	git init &&
	test_commit drepo &&
	git filter-branch -d "$TRASHDIR/dfoo" \
		--index-filter "cp \"$TRASHDIR\"/dfoo/backup-refs \"$TRASHDIR\"" \
	) &&
	grep drepo "$TRASHDIR/backup-refs"
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7003-filter-branch/drepo/.git/
[master (root-commit) 2893e45] drepo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 drepo.t
Rewrite 2893e45f5562cc2cc5c9f1aacd38fae395ecb094 (1/1)
2893e45f5562cc2cc5c9f1aacd38fae395ecb094 commit	refs/tags/drepo
ok 6 - correct GIT_DIR while using -d

expecting success: 
	test_must_fail git filter-branch -f --commit-filter "exit 1" HEAD
Rewrite 0ddfaf193ff13d6ab39b7cbd9eed645e3ee2f050 (1/9)
ok 7 - Fail if commit filter fails

expecting success: 
	git filter-branch -f --tree-filter "mv D.t doh || :" HEAD
Rewrite 0ddfaf193ff13d6ab39b7cbd9eed645e3ee2f050 (1/9)Rewrite d9df4505cb3522088b9e29d6051ac16f1564154a (2/9)Rewrite 0d4dc400483ec74c9bb511f6b55de5b4a252e539 (3/9)Rewrite 4e03b399e1202af07f2b9fd5eb05753253212d7e (4/9)Rewrite 65ac4e85ada4d3f56edb2faa5ccc49e4f582941c (5/9)Rewrite a983d32f44b8190bfe2779dda742a13d0dad0e5e (6/9)Rewrite 63ee39cf09bfb5599c4295f1daeeb353f8ae54c8 (7/9)Rewrite b2abff4f3a9090e4e03b495b54add2900f8396af (8/9)Rewrite 7e8e4286aa8a1c25600c2bb599777f2fbcee7a44 (9/9)
Ref 'refs/heads/branch' was rewritten

ok 8 - rewrite, renaming a specific file

expecting success: 
	test D = "$(git show HEAD:doh --)" &&
	! test -f D.t &&
	test -f doh &&
	test D = "$(cat doh)"


ok 9 - test that the file was renamed

expecting success: 
	git filter-branch -f --tree-filter "mv dir diroh || :" HEAD
Rewrite 0ddfaf193ff13d6ab39b7cbd9eed645e3ee2f050 (1/9)Rewrite d9df4505cb3522088b9e29d6051ac16f1564154a (2/9)Rewrite ccb839d4a6815e31aabedb16180b6777bbb58fa4 (3/9)Rewrite f023e36530a5d7d3b91666d90cda63c49623ae70 (4/9)Rewrite f83fa4ff03640f83f26abcf1c30f198b3625bd9e (5/9)Rewrite a983d32f44b8190bfe2779dda742a13d0dad0e5e (6/9)Rewrite 139285ae279d64b8134f9965efaa5345fdae4a8f (7/9)Rewrite 36baf8751282d4f1407ea77602238135aca85636 (8/9)Rewrite 5efbd500bc8e3ac5001ddc374c147e74737eedd4 (9/9)
Ref 'refs/heads/branch' was rewritten

ok 10 - rewrite, renaming a specific directory

expecting success: 
	test dir/D = "$(git show HEAD:diroh/D.t --)" &&
	! test -d dir &&
	test -d diroh &&
	! test -d diroh/dir &&
	test -f diroh/D.t &&
	test dir/D = "$(cat diroh/D.t)"


ok 11 - test that the directory was renamed

expecting success: 
	git branch modD oldD &&
	git filter-branch -f --tree-filter "mv B.t boh || :" D..modD
Rewrite ccb839d4a6815e31aabedb16180b6777bbb58fa4 (1/2)Rewrite 28c083c448159ce530f5f0a3e61ad63bee0516b7 (2/2)
Ref 'refs/heads/modD' was rewritten
ok 12 - rewrite one branch, keeping a side branch
expecting success: 
	test "$(git merge-base modD D)" = "$(git rev-parse B)"

ok 13 - common ancestor is still common (unchanged)

expecting success: 
	mkdir subdir &&
	touch subdir/new &&
	git add subdir/new &&
	test_tick &&
	git commit -m "subdir" &&
	echo H > A.t &&
	test_tick &&
	git commit -m "not subdir" A.t &&
	echo A > subdir/new &&
	test_tick &&
	git commit -m "again subdir" subdir/new &&
	git rm A.t &&
	test_tick &&
	git commit -m "again not subdir" &&
	git branch sub &&
	git branch sub-earlier HEAD~2 &&
	git filter-branch -f --subdirectory-filter subdir \
		refs/heads/sub refs/heads/sub-earlier
[branch f02b56f] subdir
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 subdir/new
[branch 2a28a2a] not subdir
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[branch a670df2] again subdir
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
rm 'A.t'
[branch 0cd630d] again not subdir
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 A.t
Rewrite f02b56f7d9de5ad581b673eac06cf37ba1d53ca9 (1/2)Rewrite a670df2b7abfa3663ef5fdf07ae6b69cea84e0db (2/2)
Ref 'refs/heads/sub' was rewritten
Ref 'refs/heads/sub-earlier' was rewritten

ok 14 - filter subdirectory only

expecting success: 
	test 2 = $(git rev-list sub | wc -l) &&
	git show sub:new &&
	test_must_fail git show sub:subdir &&
	git show sub-earlier:new &&
	test_must_fail git show sub-earlier:subdir
A
ok 15 - subdirectory filter result looks okay

expecting success: 
	git checkout master &&
	mkdir subdir &&
	echo A > subdir/new &&
	git add subdir/new &&
	test_tick &&
	git commit -m "subdir on master" subdir/new &&
	git rm A.t &&
	test_tick &&
	git commit -m "again subdir on master" &&
	git merge branch
[master 9c45890] subdir on master
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 subdir/new
rm 'A.t'
[master c59015a] again subdir on master
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 A.t
Merging:
c59015a again subdir on master
virtual branch
found 1 common ancestor(s):
a983d32 C
Skipped subdir/new (merged same as existing)
Merge made by recursive.
 E.t       |    1 +
 G.t       |    1 +
 H.t       |    1 +
 diroh/D.t |    1 +
 doh       |    1 +
 5 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 E.t
 create mode 100644 G.t
 create mode 100644 H.t
 create mode 100644 diroh/D.t
 create mode 100644 doh

ok 16 - more setup
expecting success: 
	git branch directorymoved &&
	git filter-branch -f --index-filter \
		 "git ls-files -s | sed \"s-	-&newsubdir/-\" |
	          GIT_INDEX_FILE=\$GIT_INDEX_FILE.new \
			git update-index --index-info &&
		  mv \"\$GIT_INDEX_FILE.new\" \"\$GIT_INDEX_FILE\"" directorymoved &&
	git diff --exit-code HEAD directorymoved:newsubdir
Rewrite 0ddfaf193ff13d6ab39b7cbd9eed645e3ee2f050 (1/16)Rewrite d9df4505cb3522088b9e29d6051ac16f1564154a (2/16)Rewrite a983d32f44b8190bfe2779dda742a13d0dad0e5e (3/16)Rewrite 9c458907079a3e2b53e6a79396b0e03aad332216 (4/16)Rewrite c59015a6dfb6abb78d6a76aeb412df7261160e48 (5/16)Rewrite ccb839d4a6815e31aabedb16180b6777bbb58fa4 (6/16)Rewrite 28c083c448159ce530f5f0a3e61ad63bee0516b7 (7/16)Rewrite ae224841b971c42c68aa6a4ebdaf12b633f036be (8/16)Rewrite ab3739f0e336e75a440ba1b798076471faa15fe8 (9/16)Rewrite 0a280554b9e1dc4e8736cd2ed2d3657c4b356529 (10/16)Rewrite ff7cc9fe7d93c2cbcd50fc28dfc2f29f85700f66 (11/16)Rewrite f02b56f7d9de5ad581b673eac06cf37ba1d53ca9 (12/16)Rewrite 2a28a2a040901e715e6b5c4d45dc72927f1bdb59 (13/16)Rewrite a670df2b7abfa3663ef5fdf07ae6b69cea84e0db (14/16)Rewrite 0cd630d95f1a7f13ea4aa64d83bbe3759d959708 (15/16)Rewrite 7852fa17af757ec4c26d535c6642f503a3bff9d8 (16/16)
Ref 'refs/heads/directorymoved' was rewritten

ok 17 - use index-filter to move into a subdirectory

expecting success: 
	old=$(git rev-parse HEAD) &&
	test_must_fail git filter-branch -f --msg-filter false HEAD &&
	test $old = $(git rev-parse HEAD) &&
	rm -rf .git-rewrite
Rewrite 0ddfaf193ff13d6ab39b7cbd9eed645e3ee2f050 (1/16)
ok 18 - stops when msg filter fails

expecting success: 
	: > i &&
	git add i &&
	test_tick &&
	GIT_AUTHOR_NAME="B V Uips" git commit -m bvuips &&
	git branch preserved-author &&
	git filter-branch -f --msg-filter "cat; \
			test \$GIT_COMMIT != $(git rev-parse master) || \
			echo Hallo" \
		preserved-author &&
	test 1 = $(git rev-list --author="B V Uips" preserved-author | wc -l)
[master 38558be] bvuips
 Author: B V Uips <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 i
Rewrite 0ddfaf193ff13d6ab39b7cbd9eed645e3ee2f050 (1/17)Rewrite d9df4505cb3522088b9e29d6051ac16f1564154a (2/17)Rewrite a983d32f44b8190bfe2779dda742a13d0dad0e5e (3/17)Rewrite 9c458907079a3e2b53e6a79396b0e03aad332216 (4/17)Rewrite c59015a6dfb6abb78d6a76aeb412df7261160e48 (5/17)Rewrite ccb839d4a6815e31aabedb16180b6777bbb58fa4 (6/17)Rewrite 28c083c448159ce530f5f0a3e61ad63bee0516b7 (7/17)Rewrite ae224841b971c42c68aa6a4ebdaf12b633f036be (8/17)Rewrite ab3739f0e336e75a440ba1b798076471faa15fe8 (9/17)Rewrite 0a280554b9e1dc4e8736cd2ed2d3657c4b356529 (10/17)Rewrite ff7cc9fe7d93c2cbcd50fc28dfc2f29f85700f66 (11/17)Rewrite f02b56f7d9de5ad581b673eac06cf37ba1d53ca9 (12/17)Rewrite 2a28a2a040901e715e6b5c4d45dc72927f1bdb59 (13/17)Rewrite a670df2b7abfa3663ef5fdf07ae6b69cea84e0db (14/17)Rewrite 0cd630d95f1a7f13ea4aa64d83bbe3759d959708 (15/17)Rewrite 7852fa17af757ec4c26d535c6642f503a3bff9d8 (16/17)Rewrite 38558bee806196f9276aa8ac3e1474769ce0d795 (17/17)
Ref 'refs/heads/preserved-author' was rewritten

ok 19 - author information is preserved

expecting success: 
	echo i > i &&
	test_tick &&
	git commit -m i i &&
	git branch removed-author &&
	git filter-branch -f --commit-filter "\
		if [ \"\$GIT_AUTHOR_NAME\" = \"B V Uips\" ];\
		then\
			skip_commit \"\$@\";
		else\
			git commit-tree \"\$@\";\
		fi" removed-author &&
	cnt1=$(git rev-list master | wc -l) &&
	cnt2=$(git rev-list removed-author | wc -l) &&
	test $cnt1 -eq $(($cnt2 + 1)) &&
	test 0 = $(git rev-list --author="B V Uips" removed-author | wc -l)

[master f872fd3] i
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Rewrite 0ddfaf193ff13d6ab39b7cbd9eed645e3ee2f050 (1/18)Rewrite d9df4505cb3522088b9e29d6051ac16f1564154a (2/18)Rewrite a983d32f44b8190bfe2779dda742a13d0dad0e5e (3/18)Rewrite 9c458907079a3e2b53e6a79396b0e03aad332216 (4/18)Rewrite c59015a6dfb6abb78d6a76aeb412df7261160e48 (5/18)Rewrite ccb839d4a6815e31aabedb16180b6777bbb58fa4 (6/18)Rewrite 28c083c448159ce530f5f0a3e61ad63bee0516b7 (7/18)Rewrite ae224841b971c42c68aa6a4ebdaf12b633f036be (8/18)Rewrite ab3739f0e336e75a440ba1b798076471faa15fe8 (9/18)Rewrite 0a280554b9e1dc4e8736cd2ed2d3657c4b356529 (10/18)Rewrite ff7cc9fe7d93c2cbcd50fc28dfc2f29f85700f66 (11/18)Rewrite f02b56f7d9de5ad581b673eac06cf37ba1d53ca9 (12/18)Rewrite 2a28a2a040901e715e6b5c4d45dc72927f1bdb59 (13/18)Rewrite a670df2b7abfa3663ef5fdf07ae6b69cea84e0db (14/18)Rewrite 0cd630d95f1a7f13ea4aa64d83bbe3759d959708 (15/18)Rewrite 7852fa17af757ec4c26d535c6642f503a3bff9d8 (16/18)Rewrite 38558bee806196f9276aa8ac3e1474769ce0d795 (17/18)Rewrite f872fd3228691e094e488e002dbf7f3ce7267800 (18/18)
Ref 'refs/heads/removed-author' was rewritten
ok 20 - remove a certain author's commits
expecting success: 
	test_must_fail git filter-branch -f master xy-problem &&
	test_must_fail git filter-branch -f HEAD^
ok 21 - barf on invalid name

expecting success: 
	git filter-branch -f --commit-filter "\
		parent=\$(git rev-parse \$GIT_COMMIT^) &&
		mapped=\$(map \$parent) &&
		actual=\$(echo \"\$@\" | sed \"s/^.*-p //\") &&
		test \$mapped = \$actual &&
		git commit-tree \"\$@\";" master~2..master &&
	git rev-parse --verify master
Rewrite 38558bee806196f9276aa8ac3e1474769ce0d795 (1/2)Rewrite f872fd3228691e094e488e002dbf7f3ce7267800 (2/2)
f872fd3228691e094e488e002dbf7f3ce7267800

ok 22 - "map" works in commit filter
expecting success: 

	git checkout -b rerere A &&
	mkdir foo &&
	name="れれれ" &&
	>foo/$name &&
	git add foo &&
	git commit -m "Adding a file" &&
	git filter-branch --tree-filter "rm -fr foo" &&
	test_must_fail git ls-files --error-unmatch "foo/$name" &&
	test $(git rev-parse --verify rerere) != $(git rev-parse --verify A)
[rerere fccec45] Adding a file
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 "foo/\343\202\214\343\202\214\343\202\214"
Rewrite 0ddfaf193ff13d6ab39b7cbd9eed645e3ee2f050 (1/2)Rewrite fccec45dc65bd3c52b99fff7d97b99223331aa95 (2/2)
Ref 'refs/heads/rerere' was rewritten

ok 23 - Name needing quotes

expecting success: 
	git reset --hard &&
	git checkout master &&

	mkdir foo &&
	touch foo/bar &&
	git add foo &&
	test_tick &&
	git commit -m "Adding foo" &&

	git rm -r foo &&
	test_tick &&
	git commit -m "Removing foo" &&

	mkdir foo &&
	touch foo/bar &&
	git add foo &&
	test_tick &&
	git commit -m "Re-adding foo" &&

	git filter-branch -f --subdirectory-filter foo &&
	test $(git rev-list master | wc -l) = 3

HEAD is now at f1add4c Adding a file
[master 1fd6c5d] Adding foo
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 foo/bar
rm 'foo/bar'
[master d4a55ba] Removing foo
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 foo/bar
[master c479a2a] Re-adding foo
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 foo/bar
Rewrite 1fd6c5deff8f2072d621e75db69a31c1e1ae33ad (1/3)Rewrite d4a55ba576ad2c9f7f5627053cdcfd40b8eace40 (2/3)Rewrite c479a2acb1859a5772d631a0f7b9227d2fa812e3 (3/3)
Ref 'refs/heads/master' was rewritten

ok 24 - Subdirectory filter with disappearing trees

expecting success: 
	git tag -m atag T &&
	git cat-file tag T > expect &&
	git filter-branch -f --tag-name-filter cat &&
	git cat-file tag T > actual &&
	test_cmp expect actual
Rewrite 00fab7f6941b54845fb50aaac1b967be630f0bc6 (1/3)Rewrite ec8c9490e8e54d9e42a53fab45e3d75b7e941201 (2/3)Rewrite c93893b6fcf3c9192cf746510ed2334fef0d2356 (3/3)
T -> T (c93893b6fcf3c9192cf746510ed2334fef0d2356 -> c93893b6fcf3c9192cf746510ed2334fef0d2356)

ok 25 - Tag name filtering retains tag message

expecting success: 
	sha1=$(git rev-parse HEAD) &&
	sha1t=$(echo "$faux_gpg_tag" | sed -e s/XXXXXX/$sha1/ | git mktag) &&
	git update-ref "refs/tags/S" "$sha1t" &&
	echo "$faux_gpg_tag" | sed -e s/XXXXXX/$sha1/ | head -n 6 > expect &&
	git filter-branch -f --tag-name-filter cat &&
	git cat-file tag S > actual &&
	test_cmp expect actual
Rewrite 00fab7f6941b54845fb50aaac1b967be630f0bc6 (1/3)Rewrite ec8c9490e8e54d9e42a53fab45e3d75b7e941201 (2/3)Rewrite c93893b6fcf3c9192cf746510ed2334fef0d2356 (3/3)
S -> S (c93893b6fcf3c9192cf746510ed2334fef0d2356 -> c93893b6fcf3c9192cf746510ed2334fef0d2356)
T -> T (c93893b6fcf3c9192cf746510ed2334fef0d2356 -> c93893b6fcf3c9192cf746510ed2334fef0d2356)

ok 26 - Tag name filtering strips gpg signature

expecting success: 
	git tag -m tag-with-slash X/1 &&
	git cat-file tag X/1 | sed -e s,X/1,X/2, > expect &&
	git filter-branch -f --tag-name-filter "echo X/2" &&
	git cat-file tag X/2 > actual &&
	test_cmp expect actual
Rewrite 00fab7f6941b54845fb50aaac1b967be630f0bc6 (1/3)Rewrite ec8c9490e8e54d9e42a53fab45e3d75b7e941201 (2/3)Rewrite c93893b6fcf3c9192cf746510ed2334fef0d2356 (3/3)
S -> X/2 (c93893b6fcf3c9192cf746510ed2334fef0d2356 -> c93893b6fcf3c9192cf746510ed2334fef0d2356)
T -> X/2 (c93893b6fcf3c9192cf746510ed2334fef0d2356 -> c93893b6fcf3c9192cf746510ed2334fef0d2356)
X/1 -> X/2 (c93893b6fcf3c9192cf746510ed2334fef0d2356 -> c93893b6fcf3c9192cf746510ed2334fef0d2356)
ok 27 - Tag name filtering allows slashes in tag names
expecting success: 
	git rev-list HEAD > expect &&
	test_commit to_remove &&
	git filter-branch -f --index-filter "git update-index --remove to_remove.t" --prune-empty HEAD &&
	git rev-list HEAD > actual &&
	test_cmp expect actual
[master f2348f3] to_remove
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 to_remove.t
Rewrite 00fab7f6941b54845fb50aaac1b967be630f0bc6 (1/4)Rewrite ec8c9490e8e54d9e42a53fab45e3d75b7e941201 (2/4)Rewrite c93893b6fcf3c9192cf746510ed2334fef0d2356 (3/4)Rewrite f2348f36c9dc02074687c6d786da08dc589c3d7d (4/4)
Ref 'refs/heads/master' was rewritten

ok 28 - Prune empty commits

expecting success: 
	git checkout master &&
	git reset --hard A &&
	test_commit add-foo foo 1 &&
	git branch moved-foo &&
	test_commit add-bar bar a &&
	git branch invariant &&
	orig_invariant=$(git rev-parse invariant) &&
	git branch moved-bar &&
	test_commit change-foo foo 2 &&
	git filter-branch -f --remap-to-ancestor \
		moved-foo moved-bar A..master \
		-- -- foo &&
	test $(git rev-parse moved-foo) = $(git rev-parse moved-bar) &&
	test $(git rev-parse moved-foo) = $(git rev-parse master^) &&
	test $orig_invariant = $(git rev-parse invariant)

HEAD is now at 0ddfaf1 A
[master f0f3c0a] add-foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master b73af6e] add-bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 bar
[master 08adda6] change-foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rewrite f0f3c0a17d835d54f2a46a7a6de41b97b2720bed (1/2)Rewrite 08adda62ec535f958404016584f1018e7623e186 (2/2)
Ref 'refs/heads/moved-bar' was rewritten
Ref 'refs/heads/master' was rewritten
ok 29 - --remap-to-ancestor with filename filters

expecting success: 
	git checkout master &&
	git reset --hard A &&
	test_commit add-foo2 foo 1 &&
	git branch moved-foo2 &&
	test_commit add-bar2 bar a &&
	git branch invariant2 &&
	orig_invariant=$(git rev-parse invariant2) &&
	git branch moved-bar2 &&
	test_commit change-foo2 foo 2 &&
	git filter-branch -f \
		moved-foo2 moved-bar2 A..master \
		-- -- foo &&
	test $(git rev-parse moved-foo2) = $(git rev-parse moved-bar2) &&
	test $(git rev-parse moved-foo2) = $(git rev-parse master^) &&
	test $orig_invariant = $(git rev-parse invariant2)
HEAD is now at 0ddfaf1 A
[master 1e3855e] add-foo2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master 02aeea2] add-bar2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 bar
[master 4c71139] change-foo2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Rewrite 1e3855eedcd20b8bdfd8f1a0ed1e4ad6bc7bfa9f (1/2)Rewrite 4c71139afab3b012715157e25485cde8cbdc23d6 (2/2)
Ref 'refs/heads/moved-bar2' was rewritten
Ref 'refs/heads/master' was rewritten

ok 30 - automatic remapping to ancestor with filename filters
expecting success: 
	rm -fr ?* .git &&
	git init &&
	test_commit file &&
	mkdir submod &&
	submodurl="$PWD/submod" &&
	( cd submod &&
	  git init &&
	  test_commit file-in-submod ) &&
	git submodule add "$submodurl" &&
	git commit -m "added submodule" &&
	test_commit add-file &&
	( cd submod && test_commit add-in-submodule ) &&
	git add submod &&
	git commit -m "changed submodule" &&
	git branch original HEAD
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7003-filter-branch/.git/
[master (root-commit) 24bb579] file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file.t
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7003-filter-branch/submod/.git/
[master (root-commit) 902b3b7] file-in-submod
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file-in-submod.t
Adding existing repo at 'submod' to the index
[master 8bcc49f] added submodule
 Author: A U Thor <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 submod
[master 54dfc0c] add-file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 add-file.t
[master 54c9d85] add-in-submodule
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 add-in-submodule.t
[master 6312e89] changed submodule
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 31 - setup submodule
expecting success: 
	git filter-branch --tree-filter "test -d submod && {
					 rm -rf submod &&
					 git rm -rf --quiet submod &&
					 mkdir submod &&
					 : > submod/file
					 } || :" HEAD &&
	test $orig_head != `git show-ref --hash --head HEAD`
Rewrite 24bb579193c5088b9e95e8f6a02bb25c670da04c (1/4)Rewrite 8bcc49f91a6295a594f11857b45eba5581181f39 (2/4)Rewrite 54dfc0c271b1225777577f29b04847d5dac71d08 (3/4)Rewrite 6312e89fa38b68376ee7c0db3282ed44ece811ab (4/4)
Ref 'refs/heads/master' was rewritten
ok 32 - rewrite submodule with another content

expecting success: 
	git reset --hard original &&
	git filter-branch -f --tree-filter \
	    "if git ls-files --error-unmatch -- submod > /dev/null 2>&1
	     then git update-index --cacheinfo 160000 0123456789012345678901234567890123456789 submod
	     fi" HEAD &&
	test $orig_head != `git show-ref --hash --head HEAD`
HEAD is now at 6312e89 changed submodule
Rewrite 24bb579193c5088b9e95e8f6a02bb25c670da04c (1/4)Rewrite 8bcc49f91a6295a594f11857b45eba5581181f39 (2/4)Rewrite 54dfc0c271b1225777577f29b04847d5dac71d08 (3/4)Rewrite 6312e89fa38b68376ee7c0db3282ed44ece811ab (4/4)
Ref 'refs/heads/master' was rewritten

ok 33 - replace submodule revision
# passed all 33 test(s)
1..33

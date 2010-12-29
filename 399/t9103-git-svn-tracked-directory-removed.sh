Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9103-git-svn-tracked-directory-removed/.git/
expecting success: 
	mkdir import &&
	mkdir import/trunk &&
	echo hello >> import/trunk/README &&
	svn_cmd import -m initial import "$svnrepo" &&
	rm -rf import &&
	svn_cmd co "$svnrepo"/trunk trunk &&
	echo bye bye >> trunk/README &&
	svn_cmd rm -m "gone" "$svnrepo"/trunk &&
	rm -rf trunk &&
	mkdir trunk &&
	echo "new" > trunk/FOLLOWME &&
	svn_cmd import -m "new trunk" trunk "$svnrepo"/trunk
Adding         import/trunk
Adding         import/trunk/README

Committed revision 1.
A    trunk/README
Checked out revision 1.

Committed revision 2.
Adding         trunk/FOLLOWME

Committed revision 3.

ok 1 - make history for tracking

expecting success: 
	git svn clone -s "$svnrepo" x &&
	test -f x/FOLLOWME &&
	test ! -f x/README

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9103-git-svn-tracked-directory-removed/x/.git/
	A	README
r1 = b1a9a59f2492cd581df5d0f32ddc12b8066c58e2 (refs/remotes/trunk)
	D	README
	A	FOLLOWME
r3 = ea45e54574b225fb88533878ce5afff8ad53fd60 (refs/remotes/trunk)
ok 2 - clone repo with git

expecting success: 
	cd x &&
		test -n "$(git svn find-rev r1)" &&
		git reset --hard $(git svn find-rev r1) &&
		test -f README &&
		test ! -f FOLLOWME &&
		test x$(git svn find-rev r2) = x
HEAD is now at b1a9a59 initial
ok 3 - make sure r2 still has old file
# passed all 3 test(s)
1..3

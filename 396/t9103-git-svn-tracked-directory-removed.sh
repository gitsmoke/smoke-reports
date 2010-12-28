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
r1 = a1b79b15c119085621032af757d07a2b627b84cb (refs/remotes/trunk)
	D	README
	A	FOLLOWME
r3 = c58f1b1637dadd9c12ee3227c6202081d36e9b7e (refs/remotes/trunk)

ok 2 - clone repo with git

expecting success: 
	cd x &&
		test -n "$(git svn find-rev r1)" &&
		git reset --hard $(git svn find-rev r1) &&
		test -f README &&
		test ! -f FOLLOWME &&
		test x$(git svn find-rev r2) = x
HEAD is now at a1b79b1 initial

ok 3 - make sure r2 still has old file

# passed all 3 test(s)
1..3

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9156-git-svn-fetch-deleted-tag-2/.git/
expecting success: 
	mkdir -p import/branches &&
	mkdir -p import/tags &&
	mkdir -p import/trunk/subdir1 &&
	mkdir -p import/trunk/subdir2 &&
	mkdir -p import/trunk/subdir3 &&
	echo "file1" >import/trunk/subdir1/file &&
	echo "file2" >import/trunk/subdir2/file &&
	echo "file3" >import/trunk/subdir3/file &&
	svn_cmd import -m "import for git svn" import "$svnrepo" &&
	rm -rf import &&

	svn_cmd co "$svnrepo/trunk" svn_project &&
	(cd svn_project &&
		echo "change1" >>subdir1/file &&
		echo "change2" >>subdir2/file &&
		echo "change3" >>subdir3/file &&
		svn_cmd ci -m "change" .
	) &&

	svn_cmd cp -m "create mytag 1" -r2 "$svnrepo/trunk/subdir1" "$svnrepo/tags/mytag" &&
	svn_cmd rm -m "delete mytag 1" "$svnrepo/tags/mytag" &&
	svn_cmd cp -m "create mytag 2" -r2 "$svnrepo/trunk/subdir2" "$svnrepo/tags/mytag" &&
	svn_cmd rm -m "delete mytag 2" "$svnrepo/tags/mytag" &&
	svn_cmd cp -m "create mytag 3" -r2 "$svnrepo/trunk/subdir3" "$svnrepo/tags/mytag"

Adding         import/trunk
Adding         import/trunk/subdir1
Adding         import/trunk/subdir1/file
Adding         import/trunk/subdir2
Adding         import/trunk/subdir2/file
Adding         import/trunk/subdir3
Adding         import/trunk/subdir3/file
Adding         import/branches
Adding         import/tags

Committed revision 1.
A    svn_project/subdir1
A    svn_project/subdir1/file
A    svn_project/subdir2
A    svn_project/subdir2/file
A    svn_project/subdir3
A    svn_project/subdir3/file
Checked out revision 1.
Sending        subdir1/file
Sending        subdir2/file
Sending        subdir3/file
Transmitting file data ...
Committed revision 2.

Committed revision 3.

Committed revision 4.

Committed revision 5.

Committed revision 6.

Committed revision 7.

ok 1 - setup svn repo

expecting success: 
	git svn init --stdlayout "$svnrepo" git_project &&
	cd git_project &&
	git svn fetch &&

	git diff --exit-code master:subdir3/file tags/mytag:file &&
	git diff --exit-code master:subdir2/file tags/mytag^:file &&
	git diff --exit-code master:subdir1/file tags/mytag^^:file
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9156-git-svn-fetch-deleted-tag-2/git_project/.git/
	A	subdir1/file
	A	subdir2/file
	A	subdir3/file
r1 = eba4b43e21d1c403f5bff35109f942aaf2fe4534 (refs/remotes/trunk)
	M	subdir1/file
	M	subdir2/file
	M	subdir3/file
r2 = fe8db30c008b7ebd327a55b41faf8fedde909d89 (refs/remotes/trunk)
	A	file
r1 = 667430933fbdb34a1c5863bc8466b924125148f1 (refs/remotes/tags/mytag@2)
	M	file
r2 = 34837a2c61ce7110cfca8627bf72131084f58f9c (refs/remotes/tags/mytag@2)
r3 = daa334023a017babdb13cf546c318afd1ac01017 (refs/remotes/tags/mytag)
	A	file
r1 = fe56736ec440cffee719a7f0d51de4ca60c34ad2 (refs/remotes/tags/mytag@2-)
	M	file
r2 = fb79c6a8a546865b696dbb652171d55301035d1b (refs/remotes/tags/mytag@2-)
r5 = d270b18201343afeef3f297c7d92de8f369ef941 (refs/remotes/tags/mytag)
	A	file
r1 = 6dd80fff81c34db92e6f5707d43dc969725e672a (refs/remotes/tags/mytag@2--)
	M	file
r2 = 10144d78c0684ebdbc837481a108218b9774ed2c (refs/remotes/tags/mytag@2--)
r7 = 49edc2a297d4a81ababf4eefe7c901102a4ef21e (refs/remotes/tags/mytag)

ok 2 - fetch deleted tags from same revision with no checksum error

# passed all 2 test(s)
1..2

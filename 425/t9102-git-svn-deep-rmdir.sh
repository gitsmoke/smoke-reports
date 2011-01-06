Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9102-git-svn-deep-rmdir/.git/
expecting success: 
	mkdir import &&
	(
		cd import &&
		mkdir -p deeply/nested/directory/number/1 &&
		mkdir -p deeply/nested/directory/number/2 &&
		echo foo >deeply/nested/directory/number/1/file &&
		echo foo >deeply/nested/directory/number/2/another &&
		svn_cmd import -m "import for git svn" . "$svnrepo"
	)
	
Adding         deeply
Adding         deeply/nested
Adding         deeply/nested/directory
Adding         deeply/nested/directory/number
Adding         deeply/nested/directory/number/1
Adding         deeply/nested/directory/number/1/file
Adding         deeply/nested/directory/number/2
Adding         deeply/nested/directory/number/2/another

Committed revision 1.
ok 1 - initialize repo
expecting success: 
	git svn init "$svnrepo" &&
	git svn fetch &&
	git checkout -f -b test-rmdir ${remotes_git_svn}
	
	A	deeply/nested/directory/number/1/file
	A	deeply/nested/directory/number/2/another
r1 = cce0163f9c92b0e85769093c632f1a3ca0b9c0c0 (refs/remotes/git-svn)

ok 2 - mirror via git svn

expecting success: 
	git rm -f deeply/nested/directory/number/2/another &&
	git commit -a -m "remove another" &&
	git svn set-tree --rmdir HEAD &&
	svn_cmd ls -R "$svnrepo" | grep ^deeply/nested/directory/number/1
	
rm 'deeply/nested/directory/number/2/another'
[test-rmdir 197f03e] remove another
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 deeply/nested/directory/number/2/another
	D	deeply/nested/directory/number/2/another
	D+	deeply/nested/directory/number/2/
	D	deeply/nested/directory/number/2/another
	D	deeply/nested/directory/number/2/
r2 = 5a92c8bb0570fe6fc806d8e742eac8823e9a40d8 (refs/remotes/git-svn)
Done committing 1 revisions to SVN
deeply/nested/directory/number/1/
deeply/nested/directory/number/1/file

ok 3 - Try a commit on rmdir

# passed all 3 test(s)
1..3

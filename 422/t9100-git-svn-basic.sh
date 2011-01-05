Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/
define NO_SVN_TESTS to skip git svn tests
# UTF-8 locale not set, some tests skipped ()
expecting success: 
	mkdir import &&
	(
		cd import &&
		echo foo >foo &&
		ln -s foo foo.link
		mkdir -p dir/a/b/c/d/e &&
		echo "deep dir" >dir/a/b/c/d/e/file &&
		mkdir bar &&
		echo "zzz" >bar/zzz &&
		echo "#!/bin/sh" >exec.sh &&
		chmod +x exec.sh &&
		svn_cmd import -m "import for git svn" . "$svnrepo" >/dev/null
	) &&
	rm -rf import &&
	git svn init "$svnrepo"

ok 1 - initialize git svn

expecting success: git svn fetch
	A	foo.link
	A	foo
	A	bar/zzz
	A	exec.sh
	A	dir/a/b/c/d/e/file
r1 = ba04a349a9f9cdd89aa60731f92ec0a3a4bae373 (refs/remotes/git-svn)

ok 2 - import an SVN revision into git

expecting success: svn co "$svnrepo" "$SVN_TREE"
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/foo.link
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/foo
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/bar
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/bar/zzz
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/exec.sh
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/dir
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/dir/a
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/dir/a/b
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/dir/a/b/c
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/dir/a/b/c/d
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/dir/a/b/c/d/e
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/dir/a/b/c/d/e/file
Checked out revision 1.
ok 3 - checkout from svn

expecting success: 
	git checkout -f -b mybranch ${remotes_git_svn} &&
	mv dir/a/b/c/d/e/file dir/file &&
	cp dir/file file &&
	git update-index --add --remove dir/a/b/c/d/e/file dir/file file &&
	git commit -m "$name" &&
	git svn set-tree --find-copies-harder --rmdir \
		${remotes_git_svn}..mybranch &&
	svn_cmd up "$SVN_TREE" &&
	test -d "$SVN_TREE"/dir && test ! -d "$SVN_TREE"/dir/a
[mybranch 0d182cd] try a deep --rmdir with a commit
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 0 deletions(-)
 copy dir/{a/b/c/d/e => }/file (100%)
 rename dir/a/b/c/d/e/file => file (100%)
	C	dir/a/b/c/d/e/file => dir/file
	R	dir/a/b/c/d/e/file => file
	D+	dir/a/b/c/d/e/
	D+	dir/a/b/c/d/
	D+	dir/a/b/c/
	D+	dir/a/b/
	D+	dir/a/
	A	file
	D	dir/a/b/c/d/e/file
	D	dir/a/
	A	dir/file
r2 = 4117bd0925e17f908a24e813e785e00f40da8e7e (refs/remotes/git-svn)
Done committing 1 revisions to SVN
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/file
D    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/dir/a
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/dir/file
Updated to revision 2.
ok 4 - try a deep --rmdir with a commit
expecting success: 
	mkdir dir/new_file &&
	mv dir/file dir/new_file/file &&
	mv dir/new_file dir/file &&
	git update-index --remove dir/file &&
	git update-index --add dir/file/file &&
	git commit -m 'detect node change from file to directory #1' &&
	test_must_fail git svn set-tree --find-copies-harder --rmdir 		remotes/git-svn..mybranch
[mybranch 186099c] detect node change from file to directory #1
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename dir/{ => file}/file (100%)

ok 5 - detect node change from file to directory #1

expecting success: 
	rm -rf dir "$GIT_DIR"/index &&
	git checkout -f -b mybranch2 ${remotes_git_svn} &&
	mv bar/zzz zzz &&
	rm -rf bar &&
	mv zzz bar &&
	git update-index --remove -- bar/zzz &&
	git update-index --add -- bar &&
	git commit -m "$name" &&
	test_must_fail git svn set-tree --find-copies-harder --rmdir \
		${remotes_git_svn}..mybranch2
[mybranch2 2e5ccac] detect node change from directory to file #1
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename bar/zzz => bar (100%)
ok 6 - detect node change from directory to file #1

expecting success: 
	rm -f "$GIT_DIR"/index &&
	git checkout -f -b mybranch3 ${remotes_git_svn} &&
	rm bar/zzz &&
	git update-index --remove bar/zzz &&
	mkdir bar/zzz &&
	echo yyy > bar/zzz/yyy &&
	git update-index --add bar/zzz/yyy &&
	git commit -m "$name" &&
	test_must_fail git svn set-tree --find-copies-harder --rmdir \
		${remotes_git_svn}..mybranch3
[mybranch3 6fa0c1f] detect node change from file to directory #2
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 delete mode 100644 bar/zzz
 create mode 100644 bar/zzz/yyy
	D	bar/zzz

ok 7 - detect node change from file to directory #2

expecting success: 
	rm -f "$GIT_DIR"/index &&
	git checkout -f -b mybranch4 ${remotes_git_svn} &&
	rm -rf dir &&
	git update-index --remove -- dir/file &&
	touch dir &&
	echo asdf > dir &&
	git update-index --add -- dir &&
	git commit -m "$name" &&
	test_must_fail git svn set-tree --find-copies-harder --rmdir \
		${remotes_git_svn}..mybranch4
[mybranch4 8395147] detect node change from directory to file #2
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 create mode 100644 dir
 delete mode 100644 dir/file
	D	dir/file
ok 8 - detect node change from directory to file #2

expecting success: 
	rm -f "$GIT_DIR"/index &&
	git checkout -f -b mybranch5 ${remotes_git_svn} &&
	chmod -x exec.sh &&
	git update-index exec.sh &&
	git commit -m "$name" &&
	git svn set-tree --find-copies-harder --rmdir \
		${remotes_git_svn}..mybranch5 &&
	svn_cmd up "$SVN_TREE" &&
	test ! -x "$SVN_TREE"/exec.sh
[mybranch5 b0ca705] remove executable bit from a file
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 exec.sh
	M	exec.sh
	M	exec.sh
r3 = fa1b353f8adcab36f30d34118dd5fe1f613b90ac (refs/remotes/git-svn)
Done committing 1 revisions to SVN
UU   /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/exec.sh
Updated to revision 3.
ok 9 - remove executable bit from a file
expecting success: 
	chmod +x exec.sh &&
	git update-index exec.sh &&
	git commit -m "$name" &&
	git svn set-tree --find-copies-harder --rmdir \
		${remotes_git_svn}..mybranch5 &&
	svn_cmd up "$SVN_TREE" &&
	test -x "$SVN_TREE"/exec.sh
[mybranch5 04c2fa9] add executable bit back file
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 exec.sh
	M	exec.sh
	M	exec.sh
r4 = 721e6b48bb4b8dbf0899d261e236c64bd329ff3a (refs/remotes/git-svn)
Done committing 1 revisions to SVN
UU   /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/exec.sh
Updated to revision 4.

ok 10 - add executable bit back file

expecting success: 
	rm exec.sh &&
	ln -s bar/zzz exec.sh &&
	git update-index exec.sh &&
	git commit -m "$name" &&
	git svn set-tree --find-copies-harder --rmdir \
		${remotes_git_svn}..mybranch5 &&
	svn_cmd up "$SVN_TREE" &&
	test -h "$SVN_TREE"/exec.sh
[mybranch5 86e40d5] executable file becomes a symlink to bar/zzz (file)
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
 rewrite exec.sh (100%)
 mode change 100755 => 120000
	T	exec.sh
	M	exec.sh
r5 = 0b501ac50d2a3d87e6cd8252a86a67bea993a7d2 (refs/remotes/git-svn)
Done committing 1 revisions to SVN
UU   /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/exec.sh
Updated to revision 5.

ok 11 - executable file becomes a symlink to bar/zzz (file)

expecting success: 
	chmod +x bar/zzz &&
	ln -s bar/zzz exec-2.sh &&
	git update-index --add bar/zzz exec-2.sh &&
	git commit -m "$name" &&
	git svn set-tree --find-copies-harder --rmdir \
		${remotes_git_svn}..mybranch5 &&
	svn_cmd up "$SVN_TREE" &&
	test -x "$SVN_TREE"/bar/zzz &&
	test -h "$SVN_TREE"/exec-2.sh
[mybranch5 8ae7b8c] new symlink is added to a file that was also just made executable
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 bar/zzz
 create mode 120000 exec-2.sh
	C	exec.sh => exec-2.sh
	M	bar/zzz
	M	bar/zzz
	A	exec-2.sh
r6 = a0951da75da0774e18407503cccdcf5d245582ea (refs/remotes/git-svn)
Done committing 1 revisions to SVN
UU   /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/bar/zzz
A    /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/exec-2.sh
Updated to revision 6.

ok 12 - new symlink is added to a file that was also just made executable

expecting success: 
	echo git help > help || true &&
	rm exec-2.sh &&
	cp help exec-2.sh &&
	git update-index exec-2.sh &&
	git commit -m "$name" &&
	git svn set-tree --find-copies-harder --rmdir \
		${remotes_git_svn}..mybranch5 &&
	svn_cmd up "$SVN_TREE" &&
	test -f "$SVN_TREE"/exec-2.sh &&
	test ! -h "$SVN_TREE"/exec-2.sh &&
	test_cmp help "$SVN_TREE"/exec-2.sh
[mybranch5 79e4034] modify a symlink to become a file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
 rewrite exec-2.sh (100%)
 mode change 120000 => 100644
	T	exec-2.sh
	M	exec-2.sh
r7 = aa23acab5fb69de775c405c94bd79d261edd3f0d (refs/remotes/git-svn)
Done committing 1 revisions to SVN
UU   /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/.git/svn/refs/remotes/git-svn/svn-tree/exec-2.sh
Updated to revision 7.

ok 13 - modify a symlink to become a file

skipping test: commit with UTF-8 message: locale:  
	echo '# hello' >> exec-2.sh &&
	git update-index exec-2.sh &&
	git commit -m 'éï∏' &&
	git svn set-tree HEAD
ok 14 # skip commit with UTF-8 message: locale:  (missing UTF8)

expecting success: git svn init "$svnrepo" && git svn fetch &&
     git rev-list --pretty=raw ${remotes_git_svn} | grep ^tree | uniq > a &&
     git rev-list --pretty=raw remotes/alt | grep ^tree | uniq > b &&
     test_cmp a b
	A	foo.link
	A	foo
	A	bar/zzz
	A	exec.sh
	A	dir/a/b/c/d/e/file
r1 = ba04a349a9f9cdd89aa60731f92ec0a3a4bae373 (refs/remotes/alt)
	A	file
	D	dir/a/b/c/d/e/file
	D	dir/a/
	A	dir/file
r2 = c8c11d5cfb8857ebc08ddeb7bf41f751423da09e (refs/remotes/alt)
	M	exec.sh
r3 = aeacf50ae5672b1e328d204f4edd6c4404e80b17 (refs/remotes/alt)
	M	exec.sh
r4 = b4419401e6043c04ac12e711d4262ee8f2fe416c (refs/remotes/alt)
	M	exec.sh
r5 = 47f686874da36ae3ead8601e472e52ed687de006 (refs/remotes/alt)
	M	bar/zzz
	A	exec-2.sh
r6 = cae45c7e5dc6b26e13cf90aedb6e01d38be53f78 (refs/remotes/alt)
	M	exec-2.sh
r7 = 30b21061c5162765ea43f47051430d5746fdc115 (refs/remotes/alt)
ok 15 - test fetch functionality (svn => git) with alternate GIT_SVN_ID
expecting success: test_cmp a expected
ok 16 - check imported tree checksums expected tree checksums
expecting success: 
        git config --add svn-remote.svn.fetch                               bar:refs/remotes/git-svn &&
	test_must_fail git svn migrate
ok 17 - exit if remote refs are ambigious
expecting success: 
        svnadmin create "${PWD}/svnrepo2" &&
        svn mkdir -m "mkdir bar" "${svnrepo}2/bar" &&
        git config --unset svn-remote.svn.fetch \
                                "^bar:refs/${remotes_git_svn}$" &&
	test_must_fail git svn init "${svnrepo}2/bar"
        

Committed revision 1.
ok 18 - exit if init-ing a would clobber a URL
expecting success: 
        git svn init --minimize-url -i bar "$svnrepo/bar" &&
        git config --get svn-remote.svn.fetch \
                              "^bar:refs/remotes/bar$" &&
        git config --get svn-remote.svn.fetch \
                              "^:refs/${remotes_git_svn}$"
        
bar:refs/remotes/bar
:refs/remotes/git-svn

ok 19 - init allows us to connect to another directory in the same repo

expecting success: 
	git svn fetch -i bar &&
	git checkout -b my-bar refs/remotes/bar &&
	echo 1 > foo &&
	git add foo &&
	git commit -m "change 1" &&
	echo 2 > foo &&
	git add foo &&
	git commit -m "change 2" &&
	old_head=$(git rev-parse HEAD) &&
	git svn dcommit -i bar HEAD^ &&
	test $old_head = $(git rev-parse HEAD) &&
	test refs/heads/my-bar = $(git symbolic-ref HEAD) &&
	git log refs/remotes/bar | grep "change 1" &&
	! git log refs/remotes/bar | grep "change 2" &&
	git checkout master &&
	git branch -D my-bar
	
	A	zzz
r1 = 8b0bec874b884ce05a494dfa48528d481784aca2 (refs/remotes/bar)
	M	zzz
r6 = 8856a060dba0e28416199f01af73185d96ace32b (refs/remotes/bar)
[my-bar 0db50e0] change 1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[my-bar f8f4cd8] change 2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/svnrepo/bar ...
	A	foo
Committed r8
	A	foo
r8 = e64930658dace401c9160bcd93f18bd754561a42 (refs/remotes/bar)
No changes between current HEAD and refs/remotes/bar
Resetting to the latest refs/remotes/bar
dcommitted on a detached HEAD because you gave a revision argument.
The rewritten commit is: e64930658dace401c9160bcd93f18bd754561a42
    change 1
Deleted branch my-bar (was f8f4cd8).
ok 20 - dcommit $rev does not clobber current branch
expecting success: 
	git svn fetch -i bar &&
	git checkout -b my-bar refs/remotes/bar &&
	echo abc > d &&
	git update-index --add d &&
	git commit -m '/bar/d should be in the log' &&
	git svn dcommit -i bar &&
	test -z "`git diff refs/heads/my-bar refs/remotes/bar`" &&
	mkdir newdir &&
	echo new > newdir/dir &&
	git update-index --add newdir/dir &&
	git commit -m 'add a new directory' &&
	git svn dcommit -i bar &&
	test -z "`git diff refs/heads/my-bar refs/remotes/bar`" &&
	echo foo >> newdir/dir &&
	git update-index newdir/dir &&
	git commit -m 'modify a file in new directory' &&
	git svn dcommit -i bar &&
	test -z "`git diff refs/heads/my-bar refs/remotes/bar`"
	
	A	bar/foo
r8 = 011a808e2a680e5db3ddcc0b17ee6097de7d4308 (refs/remotes/alt)
[my-bar 085aea1] /bar/d should be in the log
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 d
Committing to file:///Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/svnrepo/bar ...
	A	d
Committed r9
	A	d
r9 = bc743d23810264d5606a8b0be4d8986f28ed5ad9 (refs/remotes/bar)
No changes between current HEAD and refs/remotes/bar
Resetting to the latest refs/remotes/bar
[my-bar ac4376e] add a new directory
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 newdir/dir
Committing to file:///Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/svnrepo/bar ...
	A	newdir/dir
Committed r10
	A	newdir/dir
r10 = 6d77b100e5db6cbed5616ab423e1cf3b0956722c (refs/remotes/bar)
No changes between current HEAD and refs/remotes/bar
Resetting to the latest refs/remotes/bar
[my-bar fb13ffe] modify a file in new directory
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/svnrepo/bar ...
	M	newdir/dir
Committed r11
	M	newdir/dir
r11 = 0c303280795d6a1230332a3e03605ee3ddf2da04 (refs/remotes/bar)
No changes between current HEAD and refs/remotes/bar
Resetting to the latest refs/remotes/bar

ok 21 - able to dcommit to a subdirectory

expecting success: 
	test_commit "commit-new-file-foo2" foo2 &&
	test-chmtime =-60 foo &&
	git svn dcommit

[my-bar 912c1ae] commit-new-file-foo2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo2
Committing to file:///Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/svnrepo/bar ...
	A	foo2
Committed r12
	A	foo2
r12 = 5ff0666200550b16bbf976b8b49beb42b86c6457 (refs/remotes/bar)
No changes between current HEAD and refs/remotes/bar
Resetting to the latest refs/remotes/bar

ok 22 - dcommit should not fail with a touched file

expecting success: 
	test-chmtime =-60 foo &&
	git svn rebase
Current branch my-bar is up to date.
ok 23 - rebase should not fail with a touched file
expecting success: 
	echo cba > d &&
	git update-index d &&
	git commit -m 'update /bar/d' &&
	git svn set-tree -i bar HEAD &&
	test -z "`git diff refs/heads/my-bar refs/remotes/bar`"
	
[my-bar 9d0f0ba] update /bar/d
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
	M	d
	M	d
r13 = 449b02cba124c4c2b67f64a54a2851d4f1ba2e8d (refs/remotes/bar)
Done committing 1 revisions to SVN

ok 24 - able to set-tree to a subdirectory

expecting success: 
	mkdir bare-repo &&
	( cd bare-repo &&
	git init --bare &&
	GIT_DIR=. git svn init "$svnrepo" &&
	git svn fetch ) &&
	rm -rf bare-repo
	
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9100-git-svn-basic/bare-repo/
	A	foo.link
	A	foo
	A	bar/zzz
	A	exec.sh
	A	dir/a/b/c/d/e/file
r1 = ba04a349a9f9cdd89aa60731f92ec0a3a4bae373 (refs/remotes/alt)
	A	file
	D	dir/a/b/c/d/e/file
	D	dir/a/
	A	dir/file
r2 = c8c11d5cfb8857ebc08ddeb7bf41f751423da09e (refs/remotes/alt)
	M	exec.sh
r3 = aeacf50ae5672b1e328d204f4edd6c4404e80b17 (refs/remotes/alt)
	M	exec.sh
r4 = b4419401e6043c04ac12e711d4262ee8f2fe416c (refs/remotes/alt)
	M	exec.sh
r5 = 47f686874da36ae3ead8601e472e52ed687de006 (refs/remotes/alt)
	M	bar/zzz
	A	exec-2.sh
r6 = cae45c7e5dc6b26e13cf90aedb6e01d38be53f78 (refs/remotes/alt)
	M	exec-2.sh
r7 = 30b21061c5162765ea43f47051430d5746fdc115 (refs/remotes/alt)
	A	bar/foo
r8 = 011a808e2a680e5db3ddcc0b17ee6097de7d4308 (refs/remotes/alt)
	A	bar/d
r9 = 181248bfdf5f990b8c5e533aff3a9798afb3c0dc (refs/remotes/alt)
	A	bar/newdir/dir
r10 = 87a118f755c059414387f3f691df1e0091883663 (refs/remotes/alt)
	M	bar/newdir/dir
r11 = 344d33bdaa4a115249e4a52e6362ad6585331b90 (refs/remotes/alt)
	A	bar/foo2
r12 = 7149c0eeda01917187ff1c0024d667fee31384de (refs/remotes/alt)
	M	bar/d
r13 = 20a6ea140ed80b8f3b04951c2e9f6a8490fdd5da (refs/remotes/alt)

ok 25 - git-svn works in a bare repository

# passed all 25 test(s)
1..25

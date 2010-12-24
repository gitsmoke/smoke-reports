Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9130-git-svn-authors-file/.git/
expecting success: 
	for i in aa bb cc dd
	do
		svn_cmd mkdir -m $i --username $i "$svnrepo"/$i
	done
	

Committed revision 1.

Committed revision 2.

Committed revision 3.

Committed revision 4.

ok 1 - setup svnrepo
expecting success: 
	test_must_fail git svn clone --authors-file=svn-authors "$svnrepo" x
	
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9130-git-svn-authors-file/x/.git/
r1 = 925707394ca34f644345cf218375252667a6e10b (refs/remotes/git-svn)
r2 = d4c2325c051fdcbd516ead136e6c304e43a85c51 (refs/remotes/git-svn)
ok 2 - start import with incomplete authors file
expecting success: 
	(
		cd x
		test "`git rev-list refs/remotes/git-svn | wc -l`" -eq 2 &&
		git rev-list -1 --pretty=raw refs/remotes/git-svn | \
		  grep "^author BBBBBBB BBBBBBB <bb@example\.com> " &&
		git rev-list -1 --pretty=raw refs/remotes/git-svn~1 | \
		  grep "^author AAAAAAA AAAAAAA <aa@example\.com> "
	)
	
author BBBBBBB BBBBBBB <bb@example.com> 1293163454 +0000
author AAAAAAA AAAAAAA <aa@example.com> 1293163454 +0000
ok 3 - imported 2 revisions successfully
expecting success: 
	(
		cd x
		git svn fetch --authors-file=../svn-authors &&
		test "`git rev-list refs/remotes/git-svn | wc -l`" -eq 4 &&
		git rev-list -1 --pretty=raw refs/remotes/git-svn | \
		  grep "^author DDDDDDD DDDDDDD <dd@example\.com> " &&
		git rev-list -1 --pretty=raw refs/remotes/git-svn~1 | \
		  grep "^author CCCCCCC CCCCCCC <cc@example\.com> "
	)
	
r3 = a6e691a2afebfb410aae26e6dc01d61d13919f98 (refs/remotes/git-svn)
r4 = 0d77353ddc758442a9b514cb8d0701340f1e40fc (refs/remotes/git-svn)
creating empty directory: aa
creating empty directory: bb
creating empty directory: cc
creating empty directory: dd
author DDDDDDD DDDDDDD <dd@example.com> 1293163454 +0000
author CCCCCCC CCCCCCC <cc@example.com> 1293163454 +0000

ok 4 - continues to import once authors have been added

expecting success: 
	svn_cmd mkdir -m globs --username aa \
	  "$svnrepo"/aa/trunk "$svnrepo"/aa/branches "$svnrepo"/aa/tags &&
	git svn clone --authors-file=svn-authors -s "$svnrepo"/aa aa-work &&
	for i in bb ee cc
	do
		branch="aa/branches/$i"
		svn_cmd mkdir -m "$branch" --username $i "$svnrepo/$branch"
	done
	

Committed revision 5.
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9130-git-svn-authors-file/aa-work/.git/
r5 = 613112585989bafd750a5bb16e3ec28bfb6d806b (refs/remotes/trunk)

Committed revision 6.

Committed revision 7.

Committed revision 8.

ok 5 - authors-file against globs

expecting success: 
	( cd aa-work && test_must_fail git svn fetch --authors-file=../svn-authors )
	
r6 = e3aecedd8ce40962da0adfe9accbb796a9048b43 (refs/remotes/bb)

ok 6 - fetch fails on ee

expecting success: 
	(
		cd aa-work &&
		test 6 -eq "`tmp_config_get svn-remote.svn.branches-maxRev`" &&
		test 6 -eq "`tmp_config_get svn-remote.svn.tags-maxRev`"
	)
	

ok 7 - failure happened without negative side effects

expecting success: 
	(
		cd aa-work &&
		git svn fetch --authors-file=../svn-authors &&
		test 8 -eq "`tmp_config_get svn-remote.svn.branches-maxRev`" &&
		test 8 -eq "`tmp_config_get svn-remote.svn.tags-maxRev`"
	)
	
r7 = 0e49f69427c53e4ae4e00a8c0089547c602e3d23 (refs/remotes/ee)
r8 = af106df147632dbe5fba5b1231e36b9923484d79 (refs/remotes/cc)

ok 8 - fetch continues after authors-file is fixed

expecting success: 
	(
		rm -r "$GIT_DIR" &&
		test x = x"$(git config svn.authorsfile)" &&
		test_config="$HOME"/.gitconfig &&
		unset GIT_CONFIG_NOGLOBAL &&
		unset GIT_DIR &&
		unset GIT_CONFIG &&
		git config --global \
		  svn.authorsfile "$HOME"/svn-authors &&
		test x"$HOME"/svn-authors = x"$(git config svn.authorsfile)" &&
		git svn clone "$svnrepo" gitconfig.clone &&
		cd gitconfig.clone &&
		nr_ex=$(git log | grep "^Author:.*example.com" | wc -l) &&
		nr_rev=$(git rev-list HEAD | wc -l) &&
		test $nr_rev -eq $nr_ex
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9130-git-svn-authors-file/gitconfig.clone/.git/
r1 = 925707394ca34f644345cf218375252667a6e10b (refs/remotes/git-svn)
r2 = d4c2325c051fdcbd516ead136e6c304e43a85c51 (refs/remotes/git-svn)
r3 = a6e691a2afebfb410aae26e6dc01d61d13919f98 (refs/remotes/git-svn)
r4 = 0d77353ddc758442a9b514cb8d0701340f1e40fc (refs/remotes/git-svn)
r5 = 4f3a9c3ab6926e7a1fc66c9a6bfe7558a7752727 (refs/remotes/git-svn)
r6 = 0a965bc4218a1bc669b9bcc7ba582210767b1764 (refs/remotes/git-svn)
r7 = 0eea1e1a9ef581348a271bd4e0898fc765ca2c03 (refs/remotes/git-svn)
r8 = 1c9de86e05e2ed4fd8390310202163a3e4a63186 (refs/remotes/git-svn)
creating empty directory: aa
creating empty directory: aa/branches
creating empty directory: aa/branches/bb
creating empty directory: aa/branches/cc
creating empty directory: aa/branches/ee
creating empty directory: aa/tags
creating empty directory: aa/trunk
creating empty directory: bb
creating empty directory: cc
creating empty directory: dd

ok 9 - fresh clone with svn.authors-file in config

# passed all 9 test(s)
1..9

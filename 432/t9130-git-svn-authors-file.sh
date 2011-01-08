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
r1 = 0431733a6fc2e9bb6db19b7dc7ad9bde8f7efb31 (refs/remotes/git-svn)
r2 = aa6f9968599c89d0487a0cc0fe0a9bedee3de202 (refs/remotes/git-svn)
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
	
author BBBBBBB BBBBBBB <bb@example.com> 1294459792 +0000
author AAAAAAA AAAAAAA <aa@example.com> 1294459792 +0000
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
	
r3 = 69b84e237cf4ec441cd2ac3e11d258639f2d08a9 (refs/remotes/git-svn)
r4 = f13d3904e98b218945e33f6864ff2ed36f2eebc6 (refs/remotes/git-svn)
creating empty directory: aa
creating empty directory: bb
creating empty directory: cc
creating empty directory: dd
author DDDDDDD DDDDDDD <dd@example.com> 1294459792 +0000
author CCCCCCC CCCCCCC <cc@example.com> 1294459792 +0000

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
r5 = 9076d275687e6e4bae6d41f6333adc2def3c155f (refs/remotes/trunk)

Committed revision 6.

Committed revision 7.

Committed revision 8.

ok 5 - authors-file against globs

expecting success: 
	( cd aa-work && test_must_fail git svn fetch --authors-file=../svn-authors )
	
r6 = 1caf186b32ad9e64d708630aa81a79e98da3d116 (refs/remotes/bb)

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
	
r7 = 13d0a20f8395289ac5be4b198f2443a00f8ff536 (refs/remotes/ee)
r8 = 0d4be426c73f8429eb6c4b0aace3914d56469923 (refs/remotes/cc)

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
r1 = 0431733a6fc2e9bb6db19b7dc7ad9bde8f7efb31 (refs/remotes/git-svn)
r2 = aa6f9968599c89d0487a0cc0fe0a9bedee3de202 (refs/remotes/git-svn)
r3 = 69b84e237cf4ec441cd2ac3e11d258639f2d08a9 (refs/remotes/git-svn)
r4 = f13d3904e98b218945e33f6864ff2ed36f2eebc6 (refs/remotes/git-svn)
r5 = 61adef4a04d3c20ec55899d94144df5cd0d1f236 (refs/remotes/git-svn)
r6 = 0c8a341f5e62bfd6885f439eea54484ce856f716 (refs/remotes/git-svn)
r7 = db9531a8c7d6100910a3d1867b516b2b630c0f68 (refs/remotes/git-svn)
r8 = 949bbfa599e22a754713db166d5d1ba1a086188b (refs/remotes/git-svn)
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

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
r1 = 4111a072ed362ce33c3c59f475d1e567a0c726dd (refs/remotes/git-svn)
r2 = 819dc447d8fac1657e1b7819a9dabbe25e79c842 (refs/remotes/git-svn)

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
	
author BBBBBBB BBBBBBB <bb@example.com> 1293768226 +0000
author AAAAAAA AAAAAAA <aa@example.com> 1293768226 +0000

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
	
r3 = 845f6070918220a80bd1d0201b83caf271a95f01 (refs/remotes/git-svn)
r4 = 58565d7755d6ad9689d601c13797cf34db5e563b (refs/remotes/git-svn)
creating empty directory: aa
creating empty directory: bb
creating empty directory: cc
creating empty directory: dd
author DDDDDDD DDDDDDD <dd@example.com> 1293768226 +0000
author CCCCCCC CCCCCCC <cc@example.com> 1293768226 +0000

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
r5 = 2c1d09fe1386003e96cc8d67e366a49f9eb1a8d2 (refs/remotes/trunk)

Committed revision 6.

Committed revision 7.

Committed revision 8.

ok 5 - authors-file against globs

expecting success: 
	( cd aa-work && test_must_fail git svn fetch --authors-file=../svn-authors )
	
r6 = ef701ab1f309c46e713cf87fadc516341879b957 (refs/remotes/bb)

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
	
r7 = 4cfa8787a2145a118891356f3e912f17968629f2 (refs/remotes/ee)
r8 = ad7ce4c3a3ad51b9a52a02dc2e459868b3b1195b (refs/remotes/cc)

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
r1 = 4111a072ed362ce33c3c59f475d1e567a0c726dd (refs/remotes/git-svn)
r2 = 819dc447d8fac1657e1b7819a9dabbe25e79c842 (refs/remotes/git-svn)
r3 = 845f6070918220a80bd1d0201b83caf271a95f01 (refs/remotes/git-svn)
r4 = 58565d7755d6ad9689d601c13797cf34db5e563b (refs/remotes/git-svn)
r5 = fc39456f706be1088daf5a08ae40306a19901a25 (refs/remotes/git-svn)
r6 = 832b3becdc6d5b4f9e278a6bf82670b9e9e7a0e9 (refs/remotes/git-svn)
r7 = c91b76f904202e8549246071f9f2da2cdc130831 (refs/remotes/git-svn)
r8 = 5d99944bd16d08ee9248edc6a2aef4281d34d302 (refs/remotes/git-svn)
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

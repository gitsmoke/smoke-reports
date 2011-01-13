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
r1 = cdaea3bcd80434123a95cab89920014a15b7aefe (refs/remotes/git-svn)
r2 = b54247036b3d10d35ffa38dfe6919c1414967044 (refs/remotes/git-svn)

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
	
author BBBBBBB BBBBBBB <bb@example.com> 1294891797 +0000
author AAAAAAA AAAAAAA <aa@example.com> 1294891797 +0000

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
	
r3 = 7afdfc3bd049009e416d2634850a9f5dd3867d83 (refs/remotes/git-svn)
r4 = 5619da3678d68899d37cffb93ada7f74cde716c3 (refs/remotes/git-svn)
creating empty directory: aa
creating empty directory: bb
creating empty directory: cc
creating empty directory: dd
author DDDDDDD DDDDDDD <dd@example.com> 1294891798 +0000
author CCCCCCC CCCCCCC <cc@example.com> 1294891797 +0000

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
r5 = 624d520c4b003d167ae50db9ff0534649da34a31 (refs/remotes/trunk)

Committed revision 6.

Committed revision 7.

Committed revision 8.

ok 5 - authors-file against globs

expecting success: 
	( cd aa-work && test_must_fail git svn fetch --authors-file=../svn-authors )
	
r6 = 4d300c3c105c15ca8e7e64cbf6e9292d5b96feb3 (refs/remotes/bb)

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
	
r7 = 7101401128543c6114969e8c32825ce14d03aa23 (refs/remotes/ee)
r8 = 99bbe6ca2d1c0038e972eb3815edf296e6033220 (refs/remotes/cc)

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
r1 = cdaea3bcd80434123a95cab89920014a15b7aefe (refs/remotes/git-svn)
r2 = b54247036b3d10d35ffa38dfe6919c1414967044 (refs/remotes/git-svn)
r3 = 7afdfc3bd049009e416d2634850a9f5dd3867d83 (refs/remotes/git-svn)
r4 = 5619da3678d68899d37cffb93ada7f74cde716c3 (refs/remotes/git-svn)
r5 = 847aecdf02918e8dbf09218d7dd28a66f42f2dac (refs/remotes/git-svn)
r6 = 8787e64b9a7d7d7418cd580c10c3f2a0eb411c21 (refs/remotes/git-svn)
r7 = 95766ee520da2cb436fa35dc60efecc213275de6 (refs/remotes/git-svn)
r8 = b308ef8233db6804f988cc20e285e7ddf78df840 (refs/remotes/git-svn)
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

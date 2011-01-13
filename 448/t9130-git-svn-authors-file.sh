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
r1 = 7bf1fb57c7bc0b9c7127b293eab3c57da6b7afda (refs/remotes/git-svn)
r2 = f5504e7e65945c0be11e0b29f3d2c179b79e3dac (refs/remotes/git-svn)

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
	
author BBBBBBB BBBBBBB <bb@example.com> 1294891437 +0000
author AAAAAAA AAAAAAA <aa@example.com> 1294891437 +0000

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
	
r3 = 2fe791a34f2da7ccf5b03efd208e7f414f8a0ab2 (refs/remotes/git-svn)
r4 = f4adf772eaf7e6327061f441078550fc3a419746 (refs/remotes/git-svn)
creating empty directory: aa
creating empty directory: bb
creating empty directory: cc
creating empty directory: dd
author DDDDDDD DDDDDDD <dd@example.com> 1294891437 +0000
author CCCCCCC CCCCCCC <cc@example.com> 1294891437 +0000

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
r5 = c1fdd3a2ec68e095f2f698d083d1cd51c38088dc (refs/remotes/trunk)

Committed revision 6.

Committed revision 7.

Committed revision 8.

ok 5 - authors-file against globs

expecting success: 
	( cd aa-work && test_must_fail git svn fetch --authors-file=../svn-authors )
	
r6 = bce8d1d26c56c839f633b98dab51d8114a5b9cdd (refs/remotes/bb)

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
	
r7 = a15cd2c1cbc0a0898cbf0b5d64e43906ca531c83 (refs/remotes/ee)
r8 = 68bf859a788acf1d90f4edb8d14e6513d6cb3fe4 (refs/remotes/cc)

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
r1 = 7bf1fb57c7bc0b9c7127b293eab3c57da6b7afda (refs/remotes/git-svn)
r2 = f5504e7e65945c0be11e0b29f3d2c179b79e3dac (refs/remotes/git-svn)
r3 = 2fe791a34f2da7ccf5b03efd208e7f414f8a0ab2 (refs/remotes/git-svn)
r4 = f4adf772eaf7e6327061f441078550fc3a419746 (refs/remotes/git-svn)
r5 = b941a0a285be0c9b75390cd6e7e2c5853f0edc75 (refs/remotes/git-svn)
r6 = f2e6eaeedeb4d81f7aa4db261e21df8221096a71 (refs/remotes/git-svn)
r7 = 9316d4a77501b2dec878f202f947712cf1d5282f (refs/remotes/git-svn)
r8 = b78a6fe2635c951d40714783dbe6b4d888dc0fa0 (refs/remotes/git-svn)
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

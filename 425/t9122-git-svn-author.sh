Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/.git/
expecting success: 
	svn_cmd checkout "$svnrepo" work.svn &&
	(
		cd work.svn &&
		echo >file
		svn_cmd add file
		svn_cmd commit -m "first commit" file
	)
Checked out revision 0.
A         file
Adding         file
Transmitting file data .
Committed revision 1.

ok 1 - setup svn repository

expecting success: 
	mkdir work.git &&
	(
		cd work.git &&
		git svn init "$svnrepo"
		git svn fetch &&

		echo modification >file &&
		test_tick &&
		git commit -a -m second &&

		test_tick &&
		git svn dcommit &&

		echo "further modification" >file &&
		test_tick &&
		git commit -a -m third &&

		test_tick &&
		git svn --add-author-from dcommit &&

		echo "yet further modification" >file &&
		test_tick &&
		git commit -a -m fourth &&

		test_tick &&
		git svn --add-author-from --use-log-author dcommit &&

		git log &&

		git show -s HEAD^^ >../actual.2 &&
		git show -s HEAD^  >../actual.3 &&
		git show -s HEAD   >../actual.4

	) &&

	# Make sure that --add-author-from without --use-log-author
	# did not affect the authorship information
	myself=$(grep "^Author: " actual.2) &&
	unaffected=$(grep "^Author: " actual.3) &&
	test "z$myself" = "z$unaffected" &&

	# Make sure lack of --add-author-from did not add cruft
	! grep "^    From: A U Thor " actual.2 &&

	# Make sure --add-author-from added cruft
	grep "^    From: A U Thor " actual.3 &&
	grep "^    From: A U Thor " actual.4 &&

	# Make sure --add-author-from with --use-log-author affected
	# the authorship information
	grep "^Author: A U Thor " actual.4 &&

	# Make sure there are no commit messages with excess blank lines
	test $(grep "^ " actual.2 | wc -l) = 3 &&
	test $(grep "^ " actual.3 | wc -l) = 5 &&
	test $(grep "^ " actual.4 | wc -l) = 5 &&

	# Make sure there are no svn commit messages with excess blank lines
	(
		cd work.svn &&
		svn_cmd up &&
		
		test $(svn_cmd log -r2:2 | wc -l) = 5 &&
		test $(svn_cmd log -r4:4 | wc -l) = 7
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/work.git/.git/
	A	file
r1 = db91ee4a186e41e1d7493721a1b26040e1c773e0 (refs/remotes/git-svn)
[master f03c192] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo ...
	M	file
Committed r2
	M	file
r2 = 815c29361eefd26a0b337165c2f94099e4a663c1 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
[master 72e9f67] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo ...
	M	file
Committed r3
	M	file
r3 = d6f01522f4f91a6ea6fbb908f68e9395ec3ae2be (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
[master 5cb77e8] fourth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo ...
	M	file
Committed r4
	M	file
r4 = 17d44cd0faea5338baf4d1080a7fdcefefdce031 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
commit 17d44cd0faea5338baf4d1080a7fdcefefdce031
Author: A U Thor <author@example.com>
Date:   Thu Jan 6 04:04:25 2011 +0000

    fourth
    
    From: A U Thor <author@example.com>
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@4 7c994f96-2e8d-440e-ab5f-949efde17641

commit d6f01522f4f91a6ea6fbb908f68e9395ec3ae2be
Author: trast <trast@7c994f96-2e8d-440e-ab5f-949efde17641>
Date:   Thu Jan 6 04:04:24 2011 +0000

    third
    
    From: A U Thor <author@example.com>
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@3 7c994f96-2e8d-440e-ab5f-949efde17641

commit 815c29361eefd26a0b337165c2f94099e4a663c1
Author: trast <trast@7c994f96-2e8d-440e-ab5f-949efde17641>
Date:   Thu Jan 6 04:04:23 2011 +0000

    second
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@2 7c994f96-2e8d-440e-ab5f-949efde17641

commit db91ee4a186e41e1d7493721a1b26040e1c773e0
Author: trast <trast@7c994f96-2e8d-440e-ab5f-949efde17641>
Date:   Thu Jan 6 04:04:21 2011 +0000

    first commit
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@1 7c994f96-2e8d-440e-ab5f-949efde17641
    From: A U Thor <author@example.com>
    From: A U Thor <author@example.com>
Author: A U Thor <author@example.com>
U    file
Updated to revision 4.

ok 2 - interact with it via git svn

# passed all 2 test(s)
1..2

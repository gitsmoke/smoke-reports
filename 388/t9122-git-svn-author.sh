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
r1 = d999e1cb51baed159f916aeddd8c2a8062c6cb52 (refs/remotes/git-svn)
[master 33d2192] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo ...
	M	file
Committed r2
	M	file
r2 = 3037ca72a12563fe17b669d268aaf0df1fb7d4fb (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
[master a209c7f] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo ...
	M	file
Committed r3
	M	file
r3 = c1bb4dd507f5dd71c4bbc2a2a1f5e2795bc3e39d (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
[master c9bc816] fourth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo ...
	M	file
Committed r4
	M	file
r4 = 50f40d2ab4718bda6e7674a722d0a3f3dfd99ae2 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
commit 50f40d2ab4718bda6e7674a722d0a3f3dfd99ae2
Author: A U Thor <author@example.com>
Date:   Sat Dec 25 04:03:42 2010 +0000

    fourth
    
    From: A U Thor <author@example.com>
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@4 821ba23a-e26e-4292-b3e3-4cfff57a7fef

commit c1bb4dd507f5dd71c4bbc2a2a1f5e2795bc3e39d
Author: trast <trast@821ba23a-e26e-4292-b3e3-4cfff57a7fef>
Date:   Sat Dec 25 04:03:41 2010 +0000

    third
    
    From: A U Thor <author@example.com>
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@3 821ba23a-e26e-4292-b3e3-4cfff57a7fef

commit 3037ca72a12563fe17b669d268aaf0df1fb7d4fb
Author: trast <trast@821ba23a-e26e-4292-b3e3-4cfff57a7fef>
Date:   Sat Dec 25 04:03:40 2010 +0000

    second
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@2 821ba23a-e26e-4292-b3e3-4cfff57a7fef

commit d999e1cb51baed159f916aeddd8c2a8062c6cb52
Author: trast <trast@821ba23a-e26e-4292-b3e3-4cfff57a7fef>
Date:   Sat Dec 25 04:03:38 2010 +0000

    first commit
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@1 821ba23a-e26e-4292-b3e3-4cfff57a7fef
    From: A U Thor <author@example.com>
    From: A U Thor <author@example.com>
Author: A U Thor <author@example.com>
U    file
Updated to revision 4.
ok 2 - interact with it via git svn
# passed all 2 test(s)
1..2

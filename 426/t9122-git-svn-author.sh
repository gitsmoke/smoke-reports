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
r1 = dc4f433d0b6bb569ca86932644931a477bb519b4 (refs/remotes/git-svn)
[master 99e6890] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo ...
	M	file
Committed r2
	M	file
r2 = 92b9573ea6281a4cc381c0d848d515848f4eb827 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
[master 6e5cba2] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo ...
	M	file
Committed r3
	M	file
r3 = 4761c6ea822e876a988e683f47fc7b581d19b141 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
[master 76555fb] fourth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo ...
	M	file
Committed r4
	M	file
r4 = 76c81d99a14c8f1bdea2af21d1f9240b183ff06b (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
commit 76c81d99a14c8f1bdea2af21d1f9240b183ff06b
Author: A U Thor <author@example.com>
Date:   Thu Jan 6 04:10:22 2011 +0000

    fourth
    
    From: A U Thor <author@example.com>
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@4 8d1ff4f4-fa7a-41c3-b09f-6558cbd7c82f

commit 4761c6ea822e876a988e683f47fc7b581d19b141
Author: trast <trast@8d1ff4f4-fa7a-41c3-b09f-6558cbd7c82f>
Date:   Thu Jan 6 04:10:21 2011 +0000

    third
    
    From: A U Thor <author@example.com>
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@3 8d1ff4f4-fa7a-41c3-b09f-6558cbd7c82f

commit 92b9573ea6281a4cc381c0d848d515848f4eb827
Author: trast <trast@8d1ff4f4-fa7a-41c3-b09f-6558cbd7c82f>
Date:   Thu Jan 6 04:10:20 2011 +0000

    second
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@2 8d1ff4f4-fa7a-41c3-b09f-6558cbd7c82f

commit dc4f433d0b6bb569ca86932644931a477bb519b4
Author: trast <trast@8d1ff4f4-fa7a-41c3-b09f-6558cbd7c82f>
Date:   Thu Jan 6 04:10:18 2011 +0000

    first commit
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@1 8d1ff4f4-fa7a-41c3-b09f-6558cbd7c82f
    From: A U Thor <author@example.com>
    From: A U Thor <author@example.com>
Author: A U Thor <author@example.com>
U    file
Updated to revision 4.

ok 2 - interact with it via git svn

# passed all 2 test(s)
1..2

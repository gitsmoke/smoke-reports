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
r1 = 6bc4e8a0f7a7e85f0bb14ce59b9802fb0e6fc93c (refs/remotes/git-svn)
[master 10098f3] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo ...
	M	file
Committed r2
	M	file
r2 = 7db363be6ee733dfdffcb347b55edb185b6b53e8 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
[master ab04781] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo ...
	M	file
Committed r3
	M	file
r3 = 4613a9e5c8d5f7d1dfbe4e72f723f678800caf08 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
[master 6f70cd6] fourth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo ...
	M	file
Committed r4
	M	file
r4 = 71ad89b8290b1a541798ae7274dad4f2329fcb11 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
commit 71ad89b8290b1a541798ae7274dad4f2329fcb11
Author: A U Thor <author@example.com>
Date:   Thu Dec 30 04:03:46 2010 +0000

    fourth
    
    From: A U Thor <author@example.com>
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@4 ac1ec4dd-1162-44e3-9c0b-5a2d89b9317a

commit 4613a9e5c8d5f7d1dfbe4e72f723f678800caf08
Author: trast <trast@ac1ec4dd-1162-44e3-9c0b-5a2d89b9317a>
Date:   Thu Dec 30 04:03:45 2010 +0000

    third
    
    From: A U Thor <author@example.com>
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@3 ac1ec4dd-1162-44e3-9c0b-5a2d89b9317a

commit 7db363be6ee733dfdffcb347b55edb185b6b53e8
Author: trast <trast@ac1ec4dd-1162-44e3-9c0b-5a2d89b9317a>
Date:   Thu Dec 30 04:03:44 2010 +0000

    second
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@2 ac1ec4dd-1162-44e3-9c0b-5a2d89b9317a

commit 6bc4e8a0f7a7e85f0bb14ce59b9802fb0e6fc93c
Author: trast <trast@ac1ec4dd-1162-44e3-9c0b-5a2d89b9317a>
Date:   Thu Dec 30 04:03:42 2010 +0000

    first commit
    
    git-svn-id: file:///Users/trast/git-smoke/t/trash directory.t9122-git-svn-author/svnrepo@1 ac1ec4dd-1162-44e3-9c0b-5a2d89b9317a
    From: A U Thor <author@example.com>
    From: A U Thor <author@example.com>
Author: A U Thor <author@example.com>
U    file
Updated to revision 4.

ok 2 - interact with it via git svn

# passed all 2 test(s)
1..2

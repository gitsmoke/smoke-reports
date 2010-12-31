Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/.git/
expecting success: 
	mkdir import &&
	(
		cd import &&
		for i in trunk branches/a branches/b tags/0.1 tags/0.2 tags/0.3
		do
			mkdir -p $i &&
			echo hello >>$i/README ||
			exit 1
		done &&
		svn_cmd import -m test . "$svnrepo"
	) &&
	git svn init "$svnrepo" -T trunk -b branches -t tags &&
	git svn fetch &&
	git reset --hard trunk &&
	echo bye >> README &&
	git commit -a -m bye &&
	git svn dcommit &&
	git reset --hard a &&
	echo why >> FEEDME &&
	git update-index --add FEEDME &&
	git commit -m feedme &&
	git svn dcommit &&
	git reset --hard trunk &&
	echo aye >> README &&
	git commit -a -m aye &&
	git svn dcommit &&
	git reset --hard b &&
	echo spy >> README &&
	git commit -a -m spy &&
	echo try >> README &&
	git commit -a -m try &&
	git svn dcommit
	
Adding         trunk
Adding         trunk/README
Adding         branches
Adding         branches/a
Adding         branches/a/README
Adding         branches/b
Adding         branches/b/README
Adding         tags
Adding         tags/0.2
Adding         tags/0.2/README
Adding         tags/0.3
Adding         tags/0.3/README
Adding         tags/0.1
Adding         tags/0.1/README

Committed revision 1.
	A	README
r1 = 51191fd964ccfe07cd5ed0f44939d9820a246498 (refs/remotes/tags/0.3)
	A	README
r1 = 8d90e66b0ce0820820d7f9108722ac44cc063c5a (refs/remotes/b)
	A	README
r1 = 6953c709c4b7b6e02e5bfb1b7a98c2288f5f88ef (refs/remotes/trunk)
	A	README
r1 = 6dcecc96fe4ef4cd54e6fecef8d358345159f755 (refs/remotes/tags/0.2)
	A	README
r1 = 94ca1ff801703ad069f2f62b68662be1cbc5ea6f (refs/remotes/tags/0.1)
	A	README
r1 = b4321b892e5ea24c93116e267524f22d635f134a (refs/remotes/a)
HEAD is now at 6953c70 test
[master 4b5dbe9] bye
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/trunk ...
	M	README
Committed r2
	M	README
r2 = c76f87a028ca77b9bee9275698a426d7260d08f0 (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk
HEAD is now at b4321b8 test
[master 5375a60] feedme
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 FEEDME
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/branches/a ...
	A	FEEDME
Committed r3
	A	FEEDME
r3 = da1b3e2769aa5784698720848f2f6152c8885ee6 (refs/remotes/a)
No changes between current HEAD and refs/remotes/a
Resetting to the latest refs/remotes/a
HEAD is now at c76f87a bye
[master d31b01c] aye
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/trunk ...
	M	README
Committed r4
	M	README
r4 = 04f1c0feafa3882ed3ccedd69debbcbda2b6b07b (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk
HEAD is now at 8d90e66 test
[master 11dbe99] spy
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 0fd2610] try
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/branches/b ...
	M	README
Committed r5
	M	README
r5 = c83593be0e0027679efe67e19a15eb6e25e75fcd (refs/remotes/b)
No changes between current HEAD and refs/remotes/b
Resetting to the latest refs/remotes/b
Unstaged changes after reset:
M	README
	M	README
Committed r6
	M	README
r6 = 78afc83d5f35dedd407025eaa7e9d25484b37789 (refs/remotes/b)
No changes between current HEAD and refs/remotes/b
Resetting to the latest refs/remotes/b

ok 1 - setup repository and import

expecting success: 
	git reset --hard a &&
	git svn log -r2 trunk | grep ^r2 &&
	git svn log -r4 trunk | grep ^r4 &&
	git svn log -r3 | grep ^r3
	
HEAD is now at da1b3e2 feedme
r2 | trast | 2010-12-31 04:03:23 +0000 (Fri, 31 Dec 2010) | 2 lines
r4 | trast | 2010-12-31 04:03:25 +0000 (Fri, 31 Dec 2010) | 2 lines
r3 | trast | 2010-12-31 04:03:24 +0000 (Fri, 31 Dec 2010) | 2 lines

ok 2 - run log

expecting success: 
	git reset --hard trunk &&
	git svn log -r3 a | grep ^r3
	
HEAD is now at 04f1c0f aye
r3 | trast | 2010-12-31 04:03:24 +0000 (Fri, 31 Dec 2010) | 2 lines

ok 3 - run log against a from trunk

expecting success: 
	git reset --hard trunk &&
	git svn log -r 1:4 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r1-r2-r4 -
	
HEAD is now at 04f1c0f aye

ok 4 - test ascending revision range

expecting success: 
	git reset --hard trunk &&
	git svn log -r 4:1 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4-r2-r1 -
	
HEAD is now at 04f1c0f aye

ok 5 - test descending revision range

expecting success: 
	git reset --hard trunk &&
	git svn log -r 1:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r1-r2 -
	
HEAD is now at 04f1c0f aye

ok 6 - test ascending revision range with unreachable revision

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:1 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2-r1 -
	
HEAD is now at 04f1c0f aye
ok 7 - test descending revision range with unreachable revision
expecting success: 
	git reset --hard trunk &&
	git svn log -r 2:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2 -
	
HEAD is now at 04f1c0f aye
ok 8 - test ascending revision range with unreachable upper boundary revision and 1 commit
expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:2 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2 -
	
HEAD is now at 04f1c0f aye
ok 9 - test descending revision range with unreachable upper boundary revision and 1 commit
expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:4 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at 04f1c0f aye

ok 10 - test ascending revision range with unreachable lower boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 4:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at 04f1c0f aye

ok 11 - test descending revision range with unreachable lower boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 5:6 | test_cmp expected-separator -
	
HEAD is now at 04f1c0f aye

ok 12 - test ascending revision range with unreachable boundary revisions and no commits

expecting success: 
	git reset --hard trunk &&
	git svn log -r 6:5 | test_cmp expected-separator -
	
HEAD is now at 04f1c0f aye

ok 13 - test descending revision range with unreachable boundary revisions and no commits

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:5 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at 04f1c0f aye

ok 14 - test ascending revision range with unreachable boundary revisions and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 5:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at 04f1c0f aye

ok 15 - test descending revision range with unreachable boundary revisions and 1 commit

# passed all 15 test(s)
1..15

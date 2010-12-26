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
r1 = c84790b97b86045e0fbe0b859ed77dc4df914d12 (refs/remotes/tags/0.3)
	A	README
r1 = 9c35ef5f3b01dc3e7cd6a4c02f31ed2e6819ac25 (refs/remotes/b)
	A	README
r1 = 850f23a5c64b0c2e53ad02698f56bdf68d0dc147 (refs/remotes/trunk)
	A	README
r1 = b9cb9b05e009e8fec6dd01fe12f585fb37ff0ceb (refs/remotes/tags/0.2)
	A	README
r1 = e8278f446c72bf55050a0b27e4d2d249c967838f (refs/remotes/tags/0.1)
	A	README
r1 = 23a30ecfcb5bf86ddc76880de1bced156837b4d0 (refs/remotes/a)
HEAD is now at 850f23a test
[master 2997140] bye
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/trunk ...
	M	README
Committed r2
	M	README
r2 = 1057b2f0df11e7dac835961c62389686abd99050 (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk
HEAD is now at 23a30ec test
[master 528573d] feedme
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 FEEDME
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/branches/a ...
	A	FEEDME
Committed r3
	A	FEEDME
r3 = 0af424ea960ba5ede624eac04e69f91b05a40845 (refs/remotes/a)
No changes between current HEAD and refs/remotes/a
Resetting to the latest refs/remotes/a
HEAD is now at 1057b2f bye
[master 49c4b47] aye
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/trunk ...
	M	README
Committed r4
	M	README
r4 = 6bb3f06645c35c3abe4b682509721a4905a0d785 (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk
HEAD is now at 9c35ef5 test
[master 4f046b1] spy
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 6b85a55] try
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/branches/b ...
	M	README
Committed r5
	M	README
r5 = 4c6242fbb846d899dbf9de6c932eb9d0b92faf7d (refs/remotes/b)
No changes between current HEAD and refs/remotes/b
Resetting to the latest refs/remotes/b
Unstaged changes after reset:
M	README
	M	README
Committed r6
	M	README
r6 = 96feff5faa5b1feb12b979bbfc1c5be02005925c (refs/remotes/b)
No changes between current HEAD and refs/remotes/b
Resetting to the latest refs/remotes/b

ok 1 - setup repository and import

expecting success: 
	git reset --hard a &&
	git svn log -r2 trunk | grep ^r2 &&
	git svn log -r4 trunk | grep ^r4 &&
	git svn log -r3 | grep ^r3
	
HEAD is now at 0af424e feedme
r2 | trast | 2010-12-26 04:03:19 +0000 (Sun, 26 Dec 2010) | 2 lines
r4 | trast | 2010-12-26 04:03:21 +0000 (Sun, 26 Dec 2010) | 2 lines
r3 | trast | 2010-12-26 04:03:20 +0000 (Sun, 26 Dec 2010) | 2 lines

ok 2 - run log

expecting success: 
	git reset --hard trunk &&
	git svn log -r3 a | grep ^r3
	
HEAD is now at 6bb3f06 aye
r3 | trast | 2010-12-26 04:03:20 +0000 (Sun, 26 Dec 2010) | 2 lines

ok 3 - run log against a from trunk

expecting success: 
	git reset --hard trunk &&
	git svn log -r 1:4 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r1-r2-r4 -
	
HEAD is now at 6bb3f06 aye

ok 4 - test ascending revision range

expecting success: 
	git reset --hard trunk &&
	git svn log -r 4:1 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4-r2-r1 -
	
HEAD is now at 6bb3f06 aye

ok 5 - test descending revision range

expecting success: 
	git reset --hard trunk &&
	git svn log -r 1:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r1-r2 -
	
HEAD is now at 6bb3f06 aye
ok 6 - test ascending revision range with unreachable revision
expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:1 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2-r1 -
	
HEAD is now at 6bb3f06 aye

ok 7 - test descending revision range with unreachable revision

expecting success: 
	git reset --hard trunk &&
	git svn log -r 2:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2 -
	
HEAD is now at 6bb3f06 aye

ok 8 - test ascending revision range with unreachable upper boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:2 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2 -
	
HEAD is now at 6bb3f06 aye

ok 9 - test descending revision range with unreachable upper boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:4 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at 6bb3f06 aye

ok 10 - test ascending revision range with unreachable lower boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 4:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at 6bb3f06 aye

ok 11 - test descending revision range with unreachable lower boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 5:6 | test_cmp expected-separator -
	
HEAD is now at 6bb3f06 aye

ok 12 - test ascending revision range with unreachable boundary revisions and no commits

expecting success: 
	git reset --hard trunk &&
	git svn log -r 6:5 | test_cmp expected-separator -
	
HEAD is now at 6bb3f06 aye

ok 13 - test descending revision range with unreachable boundary revisions and no commits

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:5 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at 6bb3f06 aye

ok 14 - test ascending revision range with unreachable boundary revisions and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 5:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at 6bb3f06 aye

ok 15 - test descending revision range with unreachable boundary revisions and 1 commit

# passed all 15 test(s)
1..15

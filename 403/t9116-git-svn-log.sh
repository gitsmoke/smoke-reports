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
r1 = 78c9d889d01381f04f93b7e90d3a5d597e23bcc7 (refs/remotes/tags/0.3)
	A	README
r1 = 2d05ad18fec5832c63937fea796a9a4603274ae5 (refs/remotes/b)
	A	README
r1 = 01c9f0683409f25d82a702ec80877665f714a123 (refs/remotes/trunk)
	A	README
r1 = 65b636d18cadf6761c2f07dda8d9dae04fcee924 (refs/remotes/tags/0.2)
	A	README
r1 = b19a36d86fafba2ce17135f3ecc68912168320fb (refs/remotes/tags/0.1)
	A	README
r1 = 40d0a0deace6b26fade897e4b30a3b2c5a923a49 (refs/remotes/a)
HEAD is now at 01c9f06 test
[master b9db270] bye
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/trunk ...
	M	README
Committed r2
	M	README
r2 = a09c4d5819ff7e72df69be24e9aab7a85dc0394e (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk
HEAD is now at 40d0a0d test
[master fe63a6d] feedme
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 FEEDME
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/branches/a ...
	A	FEEDME
Committed r3
	A	FEEDME
r3 = 87a8dacbded01d1a0568979a067483aa2af04261 (refs/remotes/a)
No changes between current HEAD and refs/remotes/a
Resetting to the latest refs/remotes/a
HEAD is now at a09c4d5 bye
[master 7c64cc3] aye
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/trunk ...
	M	README
Committed r4
	M	README
r4 = ea6e809a6b04377ab21a2c93af8e15badb7d8b9a (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk
HEAD is now at 2d05ad1 test
[master 3f35ea4] spy
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master c5c5132] try
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/branches/b ...
	M	README
Committed r5
	M	README
r5 = 1ab455125d759b66940f2ac7f96317aad9d043ae (refs/remotes/b)
No changes between current HEAD and refs/remotes/b
Resetting to the latest refs/remotes/b
Unstaged changes after reset:
M	README
	M	README
Committed r6
	M	README
r6 = a4d24681d586ed944007d3ea54ebe054f9e96d74 (refs/remotes/b)
No changes between current HEAD and refs/remotes/b
Resetting to the latest refs/remotes/b

ok 1 - setup repository and import
expecting success: 
	git reset --hard a &&
	git svn log -r2 trunk | grep ^r2 &&
	git svn log -r4 trunk | grep ^r4 &&
	git svn log -r3 | grep ^r3
	
HEAD is now at 87a8dac feedme
r2 | trast | 2010-12-30 04:03:33 +0000 (Thu, 30 Dec 2010) | 2 lines
r4 | trast | 2010-12-30 04:03:35 +0000 (Thu, 30 Dec 2010) | 2 lines
r3 | trast | 2010-12-30 04:03:34 +0000 (Thu, 30 Dec 2010) | 2 lines

ok 2 - run log

expecting success: 
	git reset --hard trunk &&
	git svn log -r3 a | grep ^r3
	
HEAD is now at ea6e809 aye
r3 | trast | 2010-12-30 04:03:34 +0000 (Thu, 30 Dec 2010) | 2 lines

ok 3 - run log against a from trunk

expecting success: 
	git reset --hard trunk &&
	git svn log -r 1:4 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r1-r2-r4 -
	
HEAD is now at ea6e809 aye

ok 4 - test ascending revision range

expecting success: 
	git reset --hard trunk &&
	git svn log -r 4:1 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4-r2-r1 -
	
HEAD is now at ea6e809 aye

ok 5 - test descending revision range

expecting success: 
	git reset --hard trunk &&
	git svn log -r 1:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r1-r2 -
	
HEAD is now at ea6e809 aye
ok 6 - test ascending revision range with unreachable revision
expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:1 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2-r1 -
	
HEAD is now at ea6e809 aye
ok 7 - test descending revision range with unreachable revision
expecting success: 
	git reset --hard trunk &&
	git svn log -r 2:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2 -
	
HEAD is now at ea6e809 aye

ok 8 - test ascending revision range with unreachable upper boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:2 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2 -
	
HEAD is now at ea6e809 aye

ok 9 - test descending revision range with unreachable upper boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:4 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at ea6e809 aye

ok 10 - test ascending revision range with unreachable lower boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 4:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at ea6e809 aye

ok 11 - test descending revision range with unreachable lower boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 5:6 | test_cmp expected-separator -
	
HEAD is now at ea6e809 aye

ok 12 - test ascending revision range with unreachable boundary revisions and no commits

expecting success: 
	git reset --hard trunk &&
	git svn log -r 6:5 | test_cmp expected-separator -
	
HEAD is now at ea6e809 aye

ok 13 - test descending revision range with unreachable boundary revisions and no commits

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:5 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at ea6e809 aye

ok 14 - test ascending revision range with unreachable boundary revisions and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 5:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at ea6e809 aye

ok 15 - test descending revision range with unreachable boundary revisions and 1 commit

# passed all 15 test(s)
1..15

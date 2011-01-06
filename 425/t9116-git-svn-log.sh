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
r1 = 9c80e658384b8e7557360d6a7bd83b9f77e05a7a (refs/remotes/tags/0.3)
	A	README
r1 = ca1d1140c49ecdb2d20232bc8ba210071239eb1a (refs/remotes/b)
	A	README
r1 = 1a8b228768cbbafd81ff66e088ebafa020704e03 (refs/remotes/trunk)
	A	README
r1 = a193daf188c37bcb348e6e4461cca7d3e5a8d345 (refs/remotes/tags/0.2)
	A	README
r1 = d9376c301db3f61f6b37850be361a160ffae745d (refs/remotes/tags/0.1)
	A	README
r1 = 9c554751d1cdc683252f544051b7832e30252497 (refs/remotes/a)
HEAD is now at 1a8b228 test
[master 224f0a7] bye
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/trunk ...
	M	README
Committed r2
	M	README
r2 = 8ce19d1d1b59c32e8340fe50076fe885501fb309 (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk
HEAD is now at 9c55475 test
[master 2b9ce4a] feedme
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 FEEDME
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/branches/a ...
	A	FEEDME
Committed r3
	A	FEEDME
r3 = d11009b63c2526933d10822cbc19bbafb2650faa (refs/remotes/a)
No changes between current HEAD and refs/remotes/a
Resetting to the latest refs/remotes/a
HEAD is now at 8ce19d1 bye
[master a3a38ad] aye
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/trunk ...
	M	README
Committed r4
	M	README
r4 = 41e484833dbdd268013ef5ad25b51ea4fb9e4823 (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk
HEAD is now at ca1d114 test
[master 074a54b] spy
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 2615515] try
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/branches/b ...
	M	README
Committed r5
	M	README
r5 = 41b07b86672a22fe9d438ee2ce36d3e70341e2d9 (refs/remotes/b)
No changes between current HEAD and refs/remotes/b
Resetting to the latest refs/remotes/b
Unstaged changes after reset:
M	README
	M	README
Committed r6
	M	README
r6 = d3d51c27b9c3fe7581a8736d0ab4d587fc52fb9a (refs/remotes/b)
No changes between current HEAD and refs/remotes/b
Resetting to the latest refs/remotes/b

ok 1 - setup repository and import

expecting success: 
	git reset --hard a &&
	git svn log -r2 trunk | grep ^r2 &&
	git svn log -r4 trunk | grep ^r4 &&
	git svn log -r3 | grep ^r3
	
HEAD is now at d11009b feedme
r2 | trast | 2011-01-06 04:04:12 +0000 (Thu, 06 Jan 2011) | 2 lines
r4 | trast | 2011-01-06 04:04:14 +0000 (Thu, 06 Jan 2011) | 2 lines
r3 | trast | 2011-01-06 04:04:13 +0000 (Thu, 06 Jan 2011) | 2 lines
ok 2 - run log
expecting success: 
	git reset --hard trunk &&
	git svn log -r3 a | grep ^r3
	
HEAD is now at 41e4848 aye
r3 | trast | 2011-01-06 04:04:13 +0000 (Thu, 06 Jan 2011) | 2 lines
ok 3 - run log against a from trunk
expecting success: 
	git reset --hard trunk &&
	git svn log -r 1:4 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r1-r2-r4 -
	
HEAD is now at 41e4848 aye

ok 4 - test ascending revision range

expecting success: 
	git reset --hard trunk &&
	git svn log -r 4:1 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4-r2-r1 -
	
HEAD is now at 41e4848 aye

ok 5 - test descending revision range

expecting success: 
	git reset --hard trunk &&
	git svn log -r 1:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r1-r2 -
	
HEAD is now at 41e4848 aye

ok 6 - test ascending revision range with unreachable revision

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:1 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2-r1 -
	
HEAD is now at 41e4848 aye

ok 7 - test descending revision range with unreachable revision

expecting success: 
	git reset --hard trunk &&
	git svn log -r 2:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2 -
	
HEAD is now at 41e4848 aye

ok 8 - test ascending revision range with unreachable upper boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:2 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2 -
	
HEAD is now at 41e4848 aye

ok 9 - test descending revision range with unreachable upper boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:4 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at 41e4848 aye

ok 10 - test ascending revision range with unreachable lower boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 4:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at 41e4848 aye
ok 11 - test descending revision range with unreachable lower boundary revision and 1 commit
expecting success: 
	git reset --hard trunk &&
	git svn log -r 5:6 | test_cmp expected-separator -
	
HEAD is now at 41e4848 aye
ok 12 - test ascending revision range with unreachable boundary revisions and no commits
expecting success: 
	git reset --hard trunk &&
	git svn log -r 6:5 | test_cmp expected-separator -
	
HEAD is now at 41e4848 aye
ok 13 - test descending revision range with unreachable boundary revisions and no commits

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:5 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at 41e4848 aye

ok 14 - test ascending revision range with unreachable boundary revisions and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 5:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at 41e4848 aye

ok 15 - test descending revision range with unreachable boundary revisions and 1 commit

# passed all 15 test(s)
1..15

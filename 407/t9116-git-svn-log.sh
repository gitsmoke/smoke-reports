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
r1 = fed2467f820a9926ce288ac66c778e2b87227f63 (refs/remotes/tags/0.3)
	A	README
r1 = d9d91aeed9b72947d267bff2de02b7e9d63762f3 (refs/remotes/b)
	A	README
r1 = a17a167158757d4adad1be0d38d943fd8c1faa8f (refs/remotes/trunk)
	A	README
r1 = b93a39fcc26a1683efe6724de73153abbe958b0c (refs/remotes/tags/0.2)
	A	README
r1 = e240a980b1d33450ef86a35d5ca9cd5a6af18402 (refs/remotes/tags/0.1)
	A	README
r1 = 84685e38f1c0a947ec739ded5c48ab71d0746ca0 (refs/remotes/a)
HEAD is now at a17a167 test
[master 11fa1bc] bye
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/trunk ...
	M	README
Committed r2
	M	README
r2 = 996813c2fbfe1a1b93e45d2d7152b28f39da93ea (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk
HEAD is now at 84685e3 test
[master 1257e89] feedme
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 FEEDME
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/branches/a ...
	A	FEEDME
Committed r3
	A	FEEDME
r3 = c44e3ec55aaf46d7e2751ccf811671cee11ffb77 (refs/remotes/a)
No changes between current HEAD and refs/remotes/a
Resetting to the latest refs/remotes/a
HEAD is now at 996813c bye
[master e1e066e] aye
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/trunk ...
	M	README
Committed r4
	M	README
r4 = e69edd47a5eb69791ad8991399b6ebc00d6e1200 (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk
HEAD is now at d9d91ae test
[master de2aedf] spy
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 70c35a9] try
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9116-git-svn-log/svnrepo/branches/b ...
	M	README
Committed r5
	M	README
r5 = e65e79f438a6afc5316f11bca3548ccb5304cfe0 (refs/remotes/b)
No changes between current HEAD and refs/remotes/b
Resetting to the latest refs/remotes/b
Unstaged changes after reset:
M	README
	M	README
Committed r6
	M	README
r6 = d9a48477a538fcb8d83ba2edea2a035904cf685b (refs/remotes/b)
No changes between current HEAD and refs/remotes/b
Resetting to the latest refs/remotes/b

ok 1 - setup repository and import

expecting success: 
	git reset --hard a &&
	git svn log -r2 trunk | grep ^r2 &&
	git svn log -r4 trunk | grep ^r4 &&
	git svn log -r3 | grep ^r3
	
HEAD is now at c44e3ec feedme
r2 | trast | 2010-12-31 04:09:07 +0000 (Fri, 31 Dec 2010) | 2 lines
r4 | trast | 2010-12-31 04:09:09 +0000 (Fri, 31 Dec 2010) | 2 lines
r3 | trast | 2010-12-31 04:09:08 +0000 (Fri, 31 Dec 2010) | 2 lines
ok 2 - run log
expecting success: 
	git reset --hard trunk &&
	git svn log -r3 a | grep ^r3
	
HEAD is now at e69edd4 aye
r3 | trast | 2010-12-31 04:09:08 +0000 (Fri, 31 Dec 2010) | 2 lines

ok 3 - run log against a from trunk

expecting success: 
	git reset --hard trunk &&
	git svn log -r 1:4 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r1-r2-r4 -
	
HEAD is now at e69edd4 aye

ok 4 - test ascending revision range

expecting success: 
	git reset --hard trunk &&
	git svn log -r 4:1 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4-r2-r1 -
	
HEAD is now at e69edd4 aye

ok 5 - test descending revision range

expecting success: 
	git reset --hard trunk &&
	git svn log -r 1:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r1-r2 -
	
HEAD is now at e69edd4 aye

ok 6 - test ascending revision range with unreachable revision

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:1 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2-r1 -
	
HEAD is now at e69edd4 aye

ok 7 - test descending revision range with unreachable revision

expecting success: 
	git reset --hard trunk &&
	git svn log -r 2:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2 -
	
HEAD is now at e69edd4 aye

ok 8 - test ascending revision range with unreachable upper boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:2 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r2 -
	
HEAD is now at e69edd4 aye

ok 9 - test descending revision range with unreachable upper boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:4 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at e69edd4 aye

ok 10 - test ascending revision range with unreachable lower boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 4:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at e69edd4 aye

ok 11 - test descending revision range with unreachable lower boundary revision and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 5:6 | test_cmp expected-separator -
	
HEAD is now at e69edd4 aye

ok 12 - test ascending revision range with unreachable boundary revisions and no commits

expecting success: 
	git reset --hard trunk &&
	git svn log -r 6:5 | test_cmp expected-separator -
	
HEAD is now at e69edd4 aye

ok 13 - test descending revision range with unreachable boundary revisions and no commits

expecting success: 
	git reset --hard trunk &&
	git svn log -r 3:5 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at e69edd4 aye

ok 14 - test ascending revision range with unreachable boundary revisions and 1 commit

expecting success: 
	git reset --hard trunk &&
	git svn log -r 5:3 | grep '^r[0-9]' | cut -d'|' -f1 | test_cmp expected-range-r4 -
	
HEAD is now at e69edd4 aye

ok 15 - test descending revision range with unreachable boundary revisions and 1 commit

# passed all 15 test(s)
1..15

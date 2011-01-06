Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9114-git-svn-dcommit-merge/.git/
expecting success: 
	svn_cmd co "$svnrepo" mysvnwork &&
	mkdir -p mysvnwork/trunk &&
	(
		cd mysvnwork &&
		big_text_block >>trunk/README &&
		svn_cmd add trunk &&
		svn_cmd ci -m "first commit" trunk
	)
	
Checked out revision 0.
A         trunk
A         trunk/README
Adding         trunk
Adding         trunk/README
Transmitting file data .
Committed revision 1.

ok 1 - setup svn repository

expecting success: 
	git svn init "$svnrepo" -t tags -T trunk -b branches &&
	git svn fetch &&
	git checkout --track -b svn remotes/trunk &&
	git checkout -b merge &&
	echo new file > new_file &&
	git add new_file &&
	git commit -a -m "New file" &&
	echo hello >> README &&
	git commit -a -m "hello" &&
	echo add some stuff >> new_file &&
	git commit -a -m "add some stuff" &&
	git checkout svn &&
	mv -f README tmp &&
	echo friend > README &&
	cat tmp >> README &&
	git commit -a -m "friend" &&
	git pull . merge
	
	A	README
r1 = 7334a16a6e4c4f8de99d18a073ad68d31cfa7723 (refs/remotes/trunk)
Branch svn set up to track local ref refs/remotes/trunk.
[merge 299e87b] New file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 new_file
[merge aa32fb5] hello
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[merge f8df843] add some stuff
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[svn 6d62bb7] friend
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Merging:
6d62bb7 friend
virtual f8df843bacdfbbb6b81d4e2e250ed4e8eb997da8
found 1 common ancestor(s):
7334a16 first commit
Auto-merging README
Merge made by recursive.
 README   |    1 +
 new_file |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 new_file

ok 2 - setup git mirror and merge

expecting success: 
	test x`git rev-parse --verify refs/heads/svn^2` = 	     x`git rev-parse --verify refs/heads/merge` &&
	git cat-file commit refs/heads/svn^ | grep '^friend$'
	
friend

ok 3 - verify pre-merge ancestry

expecting success: 
	git svn dcommit
	
Committing to file:///Users/trast/git-smoke/t/trash directory.t9114-git-svn-dcommit-merge/svnrepo/trunk ...
	M	README
Committed r2
	M	README
r2 = f604f3523e3425677cc6538f8e74a9b3501036e8 (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk
Unstaged changes after reset:
M	README
	M	README
	A	new_file
Committed r3
	A	new_file
	M	README
r3 = 4bb182edcd175d15fe5d72a0963e37fe84b80433 (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk

ok 4 - git svn dcommit merges

expecting success: 
	test x`git rev-parse --verify refs/heads/svn` = 	     x`git rev-parse --verify refs/remotes/trunk ` &&
	test x`git rev-parse --verify refs/heads/svn^2` = 	     x`git rev-parse --verify refs/heads/merge` &&
	git cat-file commit refs/heads/svn^ | grep '^friend$'
	
friend

ok 5 - verify post-merge ancestry

expecting success: 
	git rev-list --pretty=raw -1 refs/heads/svn | 	  grep "    Merge branch 'merge' into svn"
	
    Merge branch 'merge' into svn

ok 6 - verify merge commit message

# passed all 6 test(s)
1..6

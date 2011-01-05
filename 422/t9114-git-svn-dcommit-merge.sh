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
r1 = 599f69c0211390c0acc16ea432a52521a5aa9333 (refs/remotes/trunk)
Branch svn set up to track local ref refs/remotes/trunk.
[merge ab76e45] New file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 new_file
[merge 9ff9472] hello
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[merge 754123b] add some stuff
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[svn e1b0392] friend
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Merging:
e1b0392 friend
virtual 754123b4213a9c8600093a15756e28dc4c863a2d
found 1 common ancestor(s):
599f69c first commit
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
r2 = 6a5f07990d54d8a03dcd61c3694f3b0e50314916 (refs/remotes/trunk)
No changes between current HEAD and refs/remotes/trunk
Resetting to the latest refs/remotes/trunk
Unstaged changes after reset:
M	README
	M	README
	A	new_file
Committed r3
	A	new_file
	M	README
r3 = dfa8d6e743533ac863b95cbce1d175b8ef770e9b (refs/remotes/trunk)
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

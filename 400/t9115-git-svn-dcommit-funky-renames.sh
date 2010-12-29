Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9115-git-svn-dcommit-funky-renames/.git/
expecting success: 
	svnadmin load -q "$rawsvnrepo" < "$TEST_DIRECTORY"/t9115/funky-names.dump &&
	start_httpd gtk+
	

ok 1 - load repository with strange names

expecting success: 
	git svn init "$svnrepo" &&
	git svn fetch &&
	git reset --hard git-svn
	
	A	 leading space file
	A	#{cool_name}
	A	file name with spaces
r1 = abbc0b7d61c0f1b5f8cbac94cbb04a7283ea1510 (refs/remotes/git-svn)
creating empty directory:  leading space
creating empty directory: #{bad_directory_name}
creating empty directory: dir name with spaces
creating empty directory: regular_dir_name
HEAD is now at abbc0b7 what will those wacky people think of next?

ok 2 - init and fetch repository

expecting success: 
	mkdir -p "#{bad_directory_name}" &&
	echo hi > "#{bad_directory_name}/ foo" &&
	git update-index --add "#{bad_directory_name}/ foo" &&
	git commit -m "new file in ugly parent" &&
	git svn dcommit
	
[master 72d20e4] new file in ugly parent
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 #{bad_directory_name}/ foo
Committing to file:///Users/trast/git-smoke/t/trash directory.t9115-git-svn-dcommit-funky-renames/svnrepo ...
	A	#{bad_directory_name}/ foo
Committed r2
	A	#{bad_directory_name}/ foo
r2 = 33f86bce1ae3eb068285333caec59dea576232d0 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 3 - create file in existing ugly and empty dir
expecting success: 
	git mv "#{bad_directory_name}/ foo" "file name with feces" &&
	git commit -m "rename ugly file" &&
	git svn dcommit
	
[master 71d4e85] rename ugly file
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename #{bad_directory_name}/ foo => file name with feces (100%)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9115-git-svn-dcommit-funky-renames/svnrepo ...
	R	#{bad_directory_name}/ foo => file name with feces
Committed r3
	A	file name with feces
	D	#{bad_directory_name}/ foo
r3 = 11d10d113cd0b1c930b6fe00fc1d09d81778bd51 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 4 - rename ugly file

expecting success: 
	echo :x > pretty &&
	git update-index --add pretty &&
	git commit -m "pretty :x" &&
	git svn dcommit &&
	mkdir -p regular_dir_name &&
	git mv pretty regular_dir_name/pretty &&
	git commit -m "moved pretty file" &&
	git svn dcommit
	
[master 0ceb2bb] pretty :x
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 pretty
Committing to file:///Users/trast/git-smoke/t/trash directory.t9115-git-svn-dcommit-funky-renames/svnrepo ...
	A	pretty
Committed r4
	A	pretty
r4 = 4601a2f90832bde41c9ac4c6a4290cc7fb6491bb (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
[master 0f390cd] moved pretty file
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename pretty => regular_dir_name/pretty (100%)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9115-git-svn-dcommit-funky-renames/svnrepo ...
	R	pretty => regular_dir_name/pretty
Committed r5
	D	pretty
	A	regular_dir_name/pretty
r5 = c776163e6364ec0d2b0e75547a8cfea188ba511b (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 5 - rename pretty file

expecting success: 
	git mv regular_dir_name/pretty "#{bad_directory_name}/ booboo" &&
	git commit -m booboo &&
	git svn dcommit
	
[master 9bff048] booboo
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename regular_dir_name/pretty => #{bad_directory_name}/ booboo (100%)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9115-git-svn-dcommit-funky-renames/svnrepo ...
	R	regular_dir_name/pretty => #{bad_directory_name}/ booboo
Committed r6
	D	regular_dir_name/pretty
	A	#{bad_directory_name}/ booboo
r6 = f2a7a12d7e525183c6eacdf3a9106e56d5f3f5aa (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 6 - rename pretty file into ugly one

expecting success: 
	echo .. > +_+ &&
	git update-index --add +_+ &&
	git commit -m plus &&
	mkdir gtk+ &&
	git mv +_+ gtk+/_+_ &&
	git commit -m plus_dir &&
	git svn dcommit
	
[master dfdb58b] plus
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 +_+
[master 92f8771] plus_dir
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename +_+ => gtk+/_+_ (100%)
Committing to file:///Users/trast/git-smoke/t/trash directory.t9115-git-svn-dcommit-funky-renames/svnrepo ...
	A	+_+
Committed r7
	A	+_+
r7 = 000a7bb909ec239928874cee16bb1661cf794831 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
Unstaged changes after reset:
M	+_+
	R	+_+ => gtk+/_+_
Committed r8
	D	+_+
	A	gtk+/_+_
r8 = 3ee44e2ae7eda78d6ae0e7afe46a4337cbd10c08 (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 7 - add a file with plus signs

expecting success: 
	git svn clone "$svnrepo" test-rebase &&
	(
		cd test-rebase &&
		echo test-rebase >test-rebase &&
		git add test-rebase &&
		git commit -m test-rebase
	)
	
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9115-git-svn-dcommit-funky-renames/test-rebase/.git/
	A	 leading space file
	A	#{cool_name}
	A	file name with spaces
r1 = abbc0b7d61c0f1b5f8cbac94cbb04a7283ea1510 (refs/remotes/git-svn)
	A	#{bad_directory_name}/ foo
r2 = 33f86bce1ae3eb068285333caec59dea576232d0 (refs/remotes/git-svn)
	A	file name with feces
	D	#{bad_directory_name}/ foo
r3 = 11d10d113cd0b1c930b6fe00fc1d09d81778bd51 (refs/remotes/git-svn)
	A	pretty
r4 = 4601a2f90832bde41c9ac4c6a4290cc7fb6491bb (refs/remotes/git-svn)
	D	pretty
	A	regular_dir_name/pretty
r5 = c776163e6364ec0d2b0e75547a8cfea188ba511b (refs/remotes/git-svn)
	D	regular_dir_name/pretty
	A	#{bad_directory_name}/ booboo
r6 = f2a7a12d7e525183c6eacdf3a9106e56d5f3f5aa (refs/remotes/git-svn)
	A	+_+
r7 = 000a7bb909ec239928874cee16bb1661cf794831 (refs/remotes/git-svn)
	D	+_+
	A	gtk+/_+_
r8 = 3ee44e2ae7eda78d6ae0e7afe46a4337cbd10c08 (refs/remotes/git-svn)
creating empty directory:  leading space
creating empty directory: dir name with spaces
creating empty directory: regular_dir_name
[master adeccbd] test-rebase
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 test-rebase

ok 8 - clone the repository to test rebase

expecting success: 
		echo test-rebase-main > test-rebase-main &&
		git add test-rebase-main &&
		git commit -m test-rebase-main &&
		git svn dcommit
	
[master ef414ed] test-rebase-main
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 test-rebase-main
Committing to file:///Users/trast/git-smoke/t/trash directory.t9115-git-svn-dcommit-funky-renames/svnrepo ...
	A	test-rebase-main
Committed r9
	A	test-rebase-main
r9 = 0619496ac5a2a653d4bcefae60d2ddedfeee406b (refs/remotes/git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn

ok 9 - make a commit to test rebase

expecting success: 
	cd test-rebase &&
		git svn rebase &&
		test -e test-rebase-main &&
		test -e test-rebase
	
	A	test-rebase-main
r9 = 0619496ac5a2a653d4bcefae60d2ddedfeee406b (refs/remotes/git-svn)
First, rewinding head to replay your work on top of it...
Applying: test-rebase

ok 10 - git svn rebase works inside a fresh-cloned repository

# passed all 10 test(s)
1..10

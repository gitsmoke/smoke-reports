Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5800-remote-helpers/.git/
expecting success: 
	git init --bare server/.git &&
	git clone server public &&
	(cd public &&
	 echo content >file &&
	 git add file &&
	 git commit -m one &&
	 git push origin master)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5800-remote-helpers/server/.git/
Cloning into public...
done.
[master (root-commit) eb920b3] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup repository

expecting success: 
	git clone "testgit::${PWD}/server" localclone &&
	test_cmp public/file localclone/file

Cloning into localclone...
ok 2 - cloning from local repo
expecting success: 
	git clone "testgit::file://${PWD}/server" clone &&
	test_cmp public/file clone/file
Cloning into clone...

ok 3 - cloning from remote repo

expecting success: 
	(cd public &&
	 echo content >>file &&
	 git commit -a -m two &&
	 git push)

[master 517abba] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 4 - create new commit on remote

expecting success: 
	(cd localclone && git pull) &&
	test_cmp public/file localclone/file
Updating eb920b3..517abba
Fast-forward
 file |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 5 - pulling from local repo

expecting success: 
	(cd clone && git pull) &&
	test_cmp public/file clone/file
Updating eb920b3..517abba
Fast-forward
 file |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 6 - pulling from remote remote
expecting success: 
	(cd localclone &&
	echo content >>file &&
	git commit -a -m three &&
	git push) &&
	HEAD=$(git --git-dir=localclone/.git rev-parse --verify HEAD) &&
	test $HEAD = $(git --git-dir=server/.git rev-parse --verify HEAD)
[master 6a7df81] three
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 7 - pushing to local repo

expecting success: 
	(cd clone &&
	 git pull)
Updating 517abba..6a7df81
Fast-forward
 file |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 8 - synch with changes from localclone

expecting success: 
	(cd clone &&
	echo content >>file &&
	git commit -a -m four &&
	git push) &&
	HEAD=$(git --git-dir=clone/.git rev-parse --verify HEAD) &&
	test $HEAD = $(git --git-dir=server/.git rev-parse --verify HEAD)
[master 357aba1] four
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
ok 9 - pushing remote local repo

# passed all 9 test(s)
1..9

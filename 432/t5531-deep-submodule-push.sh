Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5531-deep-submodule-push/.git/
expecting success: 
	mkdir pub.git &&
	GIT_DIR=pub.git git init --bare &&
	GIT_DIR=pub.git git config receive.fsckobjects true &&
	mkdir work &&
	(
		cd work &&
		git init &&
		mkdir -p gar/bage &&
		(
			cd gar/bage &&
			git init &&
			>junk &&
			git add junk &&
			git commit -m "Initial junk"
		) &&
		git add gar/bage &&
		git commit -m "Initial superproject"
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5531-deep-submodule-push/pub.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5531-deep-submodule-push/work/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5531-deep-submodule-push/work/gar/bage/.git/
[master (root-commit) bffe866] Initial junk
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 junk
[master (root-commit) 752aba0] Initial superproject
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 160000 gar/bage

ok 1 - setup

expecting success: 
	(
		cd work &&
		git push ../pub.git master
	)

ok 2 - push

# passed all 2 test(s)
1..2

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/.git/
expecting success: 

	mk_repo_pair &&
	(
		cd master &&
		echo one >foo && git add foo && git commit -m one &&
		git push --mirror up
	) &&
	master_master=$(cd master && git show-ref -s --verify refs/heads/master) &&
	mirror_master=$(cd mirror && git show-ref -s --verify refs/heads/master) &&
	test "$master_master" = "$mirror_master"
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/mirror/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/master/.git/
[master (root-commit) 8701fc2] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
ok 1 - push mirror creates new branches

expecting success: 

	mk_repo_pair &&
	(
		cd master &&
		echo one >foo && git add foo && git commit -m one &&
		git push --mirror up &&
		echo two >foo && git add foo && git commit -m two &&
		git push --mirror up
	) &&
	master_master=$(cd master && git show-ref -s --verify refs/heads/master) &&
	mirror_master=$(cd mirror && git show-ref -s --verify refs/heads/master) &&
	test "$master_master" = "$mirror_master"
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/mirror/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/master/.git/
[master (root-commit) 8701fc2] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master 7b75db8] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 2 - push mirror updates existing branches

expecting success: 

	mk_repo_pair &&
	(
		cd master &&
		echo one >foo && git add foo && git commit -m one &&
		git push --mirror up &&
		echo two >foo && git add foo && git commit -m two &&
		git push --mirror up &&
		git reset --hard HEAD^
		git push --mirror up
	) &&
	master_master=$(cd master && git show-ref -s --verify refs/heads/master) &&
	mirror_master=$(cd mirror && git show-ref -s --verify refs/heads/master) &&
	test "$master_master" = "$mirror_master"
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/mirror/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/master/.git/
[master (root-commit) 8701fc2] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master 7b75db8] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
HEAD is now at 8701fc2 one
ok 3 - push mirror force updates existing branches

expecting success: 

	mk_repo_pair &&
	(
		cd master &&
		echo one >foo && git add foo && git commit -m one &&
		git branch remove master &&
		git push --mirror up &&
		git branch -D remove
		git push --mirror up
	) &&
	(
		cd mirror &&
		invert git show-ref -s --verify refs/heads/remove
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/mirror/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/master/.git/
[master (root-commit) 6fe08ac] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
Deleted branch remove (was 6fe08ac).

ok 4 - push mirror removes branches

expecting success: 

	mk_repo_pair &&
	(
		cd master &&
		echo one >foo && git add foo && git commit -m one &&
		git branch remove master &&
		git push --mirror up &&
		git branch -D remove &&
		git branch add master &&
		echo two >foo && git add foo && git commit -m two &&
		git push --mirror up
	) &&
	master_master=$(cd master && git show-ref -s --verify refs/heads/master) &&
	master_add=$(cd master && git show-ref -s --verify refs/heads/add) &&
	mirror_master=$(cd mirror && git show-ref -s --verify refs/heads/master) &&
	mirror_add=$(cd mirror && git show-ref -s --verify refs/heads/add) &&
	test "$master_master" = "$mirror_master" &&
	test "$master_add" = "$mirror_add" &&
	(
		cd mirror &&
		invert git show-ref -s --verify refs/heads/remove
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/mirror/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/master/.git/
[master (root-commit) 6fe08ac] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
Deleted branch remove (was 6fe08ac).
[master 5067fb1] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 5 - push mirror adds, updates and removes branches together

expecting success: 

	mk_repo_pair &&
	(
		cd master &&
		echo one >foo && git add foo && git commit -m one &&
		git tag -f tmaster master &&
		git push --mirror up
	) &&
	master_master=$(cd master && git show-ref -s --verify refs/tags/tmaster) &&
	mirror_master=$(cd mirror && git show-ref -s --verify refs/tags/tmaster) &&
	test "$master_master" = "$mirror_master"
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/mirror/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/master/.git/
[master (root-commit) 6fe08ac] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
Updated tag 'tmaster' (was 0000000)
ok 6 - push mirror creates new tags
expecting success: 

	mk_repo_pair &&
	(
		cd master &&
		echo one >foo && git add foo && git commit -m one &&
		git tag -f tmaster master &&
		git push --mirror up &&
		echo two >foo && git add foo && git commit -m two &&
		git tag -f tmaster master &&
		git push --mirror up
	) &&
	master_master=$(cd master && git show-ref -s --verify refs/tags/tmaster) &&
	mirror_master=$(cd mirror && git show-ref -s --verify refs/tags/tmaster) &&
	test "$master_master" = "$mirror_master"
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/mirror/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/master/.git/
[master (root-commit) 699f09b] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
Updated tag 'tmaster' (was 0000000)
[master d333bc9] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Updated tag 'tmaster' (was 699f09b)
ok 7 - push mirror updates existing tags
expecting success: 

	mk_repo_pair &&
	(
		cd master &&
		echo one >foo && git add foo && git commit -m one &&
		git tag -f tmaster master &&
		git push --mirror up &&
		echo two >foo && git add foo && git commit -m two &&
		git tag -f tmaster master &&
		git push --mirror up &&
		git reset --hard HEAD^
		git tag -f tmaster master &&
		git push --mirror up
	) &&
	master_master=$(cd master && git show-ref -s --verify refs/tags/tmaster) &&
	mirror_master=$(cd mirror && git show-ref -s --verify refs/tags/tmaster) &&
	test "$master_master" = "$mirror_master"
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/mirror/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/master/.git/
[master (root-commit) 699f09b] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
Updated tag 'tmaster' (was 0000000)
[master d333bc9] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Updated tag 'tmaster' (was 699f09b)
HEAD is now at 699f09b one
Updated tag 'tmaster' (was d333bc9)

ok 8 - push mirror force updates existing tags

expecting success: 

	mk_repo_pair &&
	(
		cd master &&
		echo one >foo && git add foo && git commit -m one &&
		git tag -f tremove master &&
		git push --mirror up &&
		git tag -d tremove
		git push --mirror up
	) &&
	(
		cd mirror &&
		invert git show-ref -s --verify refs/tags/tremove
	)


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/mirror/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/master/.git/
[master (root-commit) 699f09b] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
Updated tag 'tremove' (was 0000000)
Deleted tag 'tremove' (was 699f09b)

ok 9 - push mirror removes tags

expecting success: 

	mk_repo_pair &&
	(
		cd master &&
		echo one >foo && git add foo && git commit -m one &&
		git tag -f tmaster master &&
		git tag -f tremove master &&
		git push --mirror up &&
		git tag -d tremove &&
		git tag tadd master &&
		echo two >foo && git add foo && git commit -m two &&
		git tag -f tmaster master &&
		git push --mirror up
	) &&
	master_master=$(cd master && git show-ref -s --verify refs/tags/tmaster) &&
	master_add=$(cd master && git show-ref -s --verify refs/tags/tadd) &&
	mirror_master=$(cd mirror && git show-ref -s --verify refs/tags/tmaster) &&
	mirror_add=$(cd mirror && git show-ref -s --verify refs/tags/tadd) &&
	test "$master_master" = "$mirror_master" &&
	test "$master_add" = "$mirror_add" &&
	(
		cd mirror &&
		invert git show-ref -s --verify refs/tags/tremove
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/mirror/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/master/.git/
[master (root-commit) 699f09b] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
Updated tag 'tmaster' (was 0000000)
Updated tag 'tremove' (was 0000000)
Deleted tag 'tremove' (was 699f09b)
[master d333bc9] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Updated tag 'tmaster' (was 699f09b)

ok 10 - push mirror adds, updates and removes tags together

expecting success: 

	mk_repo_pair --mirror &&
	(
		cd master &&
		echo one >foo && git add foo && git commit -m one &&
		git branch keep master &&
		git branch remove master &&
		git push up &&
		git branch -D remove
		git push up
	) &&
	(
		cd mirror &&
		git show-ref -s --verify refs/heads/keep &&
		invert git show-ref -s --verify refs/heads/remove
	)


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/mirror/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/master/.git/
[master (root-commit) 8c01937] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
Branch keep set up to track remote branch master from up.
Branch remove set up to track remote branch master from up.
Deleted branch remove (was 8c01937).
8c01937070dda529f463239aecb8aba80fc22427

ok 11 - remote.foo.mirror adds and removes branches

expecting success: 

	mk_repo_pair &&
	(
		cd master &&
		echo one >foo && git add foo && git commit -m one &&
		git config --add remote.up.mirror no &&
		git branch keep master &&
		git push --mirror up &&
		git branch -D keep &&
		git push up
	) &&
	(
		cd mirror &&
		git show-ref -s --verify refs/heads/keep
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/mirror/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5517-push-mirror/master/.git/
[master (root-commit) 8c01937] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
Deleted branch keep (was 8c01937).
8c01937070dda529f463239aecb8aba80fc22427

ok 12 - remote.foo.mirror=no has no effect

# passed all 12 test(s)
1..12

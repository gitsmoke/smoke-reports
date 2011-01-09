Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7505-prepare-commit-msg-hook/.git/
expecting success: 

	echo "foo" > file &&
	git add file &&
	git commit -m "first"
[master (root-commit) d06dca8] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - with no hook
expecting success: 

	echo "more" >> file &&
	git add file &&
	git commit -m "more" &&
	test "`git log -1 --pretty=format:%s`" = "message (no editor)"
[master 3728870] message (no editor)
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 2 - with hook (-m)
expecting success: 

	echo "more" >> file &&
	git add file &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit -e -m "more more" &&
	test "`git log -1 --pretty=format:%s`" = message
[master 664f84a] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 3 - with hook (-m editor)

expecting success: 

	echo "more" >> file &&
	git add file &&
	git commit -t "$(git rev-parse --git-dir)/template" &&
	test "`git log -1 --pretty=format:%s`" = template


[master c4c763c] template
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 4 - with hook (-t)

expecting success: 

	echo "more" >> file &&
	git add file &&
	(echo more | git commit -F -) &&
	test "`git log -1 --pretty=format:%s`" = "message (no editor)"


[master 9961ff0] message (no editor)
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 5 - with hook (-F)

expecting success: 

	echo "more" >> file &&
	git add file &&
	(echo more more | GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit -e -F -) &&
	test "`git log -1 --pretty=format:%s`" = message


[master 9f5e570] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 6 - with hook (-F editor)

expecting success: 

	head=`git rev-parse HEAD` &&
	echo "more" >> file &&
	git add file &&
	git commit -C $head &&
	test "`git log -1 --pretty=format:%s`" = "$head (no editor)"


[master d9dc3dd] 9f5e5700572e032e31d9c2a61bf1267d84af5c8c (no editor)
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 7 - with hook (-C)

expecting success: 

	echo "more more" >> file &&
	git add file &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit &&
	test "`git log -1 --pretty=format:%s`" = default


[master 8cf0108] default
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 8 - with hook (editor)

expecting success: 

	head=`git rev-parse HEAD` &&
	echo "more" >> file &&
	git add file &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --amend &&
	test "`git log -1 --pretty=format:%s`" = "$head"
[master 165191f] 8cf0108fd46e4efbd46e57ed21f3e3658a0c1bcb
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)

ok 9 - with hook (--amend)
expecting success: 

	head=`git rev-parse HEAD` &&
	echo "more" >> file &&
	git add file &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit -c $head &&
	test "`git log -1 --pretty=format:%s`" = "$head"
[master d584c3f] 165191f4398ab23fed67ae9f82e6a299bbc45acf
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 10 - with hook (-c)
expecting success: 

	head=`git rev-parse HEAD` &&
	echo "more" >> file &&
	git add file &&
	! GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit -c $head

ok 11 - with failing hook

expecting success: 

	head=`git rev-parse HEAD` &&
	echo "more" >> file &&
	git add file &&
	! GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --no-verify -c $head

ok 12 - with failing hook (--no-verify)

# passed all 12 test(s)
1..12

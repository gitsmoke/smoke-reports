Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7505-prepare-commit-msg-hook/.git/
expecting success: 

	echo "foo" > file &&
	git add file &&
	git commit -m "first"
[master (root-commit) a73e835] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - with no hook
expecting success: 

	echo "more" >> file &&
	git add file &&
	git commit -m "more" &&
	test "`git log -1 --pretty=format:%s`" = "message (no editor)"
[master 770d859] message (no editor)
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 2 - with hook (-m)
expecting success: 

	echo "more" >> file &&
	git add file &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit -e -m "more more" &&
	test "`git log -1 --pretty=format:%s`" = message
[master 819b5ca] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 3 - with hook (-m editor)
expecting success: 

	echo "more" >> file &&
	git add file &&
	git commit -t "$(git rev-parse --git-dir)/template" &&
	test "`git log -1 --pretty=format:%s`" = template
[master ca6444c] template
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 4 - with hook (-t)
expecting success: 

	echo "more" >> file &&
	git add file &&
	(echo more | git commit -F -) &&
	test "`git log -1 --pretty=format:%s`" = "message (no editor)"
[master 64bd6eb] message (no editor)
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 5 - with hook (-F)
expecting success: 

	echo "more" >> file &&
	git add file &&
	(echo more more | GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit -e -F -) &&
	test "`git log -1 --pretty=format:%s`" = message
[master 8a16503] message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 6 - with hook (-F editor)
expecting success: 

	head=`git rev-parse HEAD` &&
	echo "more" >> file &&
	git add file &&
	git commit -C $head &&
	test "`git log -1 --pretty=format:%s`" = "$head (no editor)"
[master 60c6fd1] 8a16503265f44362da5a837338f411b7ae408472 (no editor)
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 7 - with hook (-C)
expecting success: 

	echo "more more" >> file &&
	git add file &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit &&
	test "`git log -1 --pretty=format:%s`" = default
[master 0141111] default
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 8 - with hook (editor)
expecting success: 

	head=`git rev-parse HEAD` &&
	echo "more" >> file &&
	git add file &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --amend &&
	test "`git log -1 --pretty=format:%s`" = "$head"
[master c7d2cfa] 014111188d1a4a519fd440433bc85fa8ef26c6a8
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)

ok 9 - with hook (--amend)

expecting success: 

	head=`git rev-parse HEAD` &&
	echo "more" >> file &&
	git add file &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit -c $head &&
	test "`git log -1 --pretty=format:%s`" = "$head"
[master abbfa37] c7d2cfa373f630589441a884332d6a2f69bee7d3
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

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7504-commit-msg-hook/.git/
expecting success: 

	echo "foo" > file &&
	git add file &&
	git commit -m "first"


[master (root-commit) 970a448] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - with no hook

expecting success: 

	echo "more foo" >> file &&
	git add file &&
	echo "more foo" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit


[master bb9c8a8] more foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 2 - with no hook (editor)

expecting success: 

	echo "bar" > file &&
	git add file &&
	git commit --no-verify -m "bar"


[master 4db4ee2] bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 2 deletions(-)

ok 3 - --no-verify with no hook

expecting success: 

	echo "more bar" > file &&
	git add file &&
	echo "more bar" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --no-verify


[master 1c9b807] more bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 4 - --no-verify with no hook (editor)

expecting success: 

	echo "more" >> file &&
	git add file &&
	git commit -m "more"


[master c406f7b] more
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 5 - with succeeding hook

expecting success: 

	echo "more more" >> file &&
	git add file &&
	echo "more more" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit


[master f49793e] more more
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 6 - with succeeding hook (editor)

expecting success: 

	echo "even more" >> file &&
	git add file &&
	git commit --no-verify -m "even more"


[master 38a1483] even more
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 7 - --no-verify with succeeding hook

expecting success: 

	echo "even more more" >> file &&
	git add file &&
	echo "even more more" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --no-verify


[master 6b7c53d] even more more
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 8 - --no-verify with succeeding hook (editor)

expecting success: 

	echo "another" >> file &&
	git add file &&
	test_must_fail git commit -m "another"



ok 9 - with failing hook

expecting success: 

	echo "more another" >> file &&
	git add file &&
	echo "more another" > FAKE_MSG &&
	! (GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit)

ok 10 - with failing hook (editor)

expecting success: 

	echo "stuff" >> file &&
	git add file &&
	git commit --no-verify -m "stuff"
[master 9e5c24a] stuff
 Author: A U Thor <author@example.com>
 1 files changed, 3 insertions(+), 0 deletions(-)

ok 11 - --no-verify with failing hook

expecting success: 

	echo "more stuff" >> file &&
	git add file &&
	echo "more stuff" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --no-verify
[master e13fcf2] more stuff
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 12 - --no-verify with failing hook (editor)
expecting success: 

	echo "content" >> file &&
	git add file &&
	git commit -m "content"
[master ed35c23] content
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 13 - with non-executable hook
expecting success: 

	echo "content again" >> file &&
	git add file &&
	echo "content again" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit -m "content again"
[master e57ad16] content again
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 14 - with non-executable hook (editor)

expecting success: 

	echo "more content" >> file &&
	git add file &&
	git commit --no-verify -m "more content"
[master aceee7c] more content
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 15 - --no-verify with non-executable hook
expecting success: 

	echo "even more content" >> file &&
	git add file &&
	echo "even more content" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --no-verify
[master bf85ef0] even more content
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
ok 16 - --no-verify with non-executable hook (editor)
expecting success: 

	echo "additional" >> file &&
	git add file &&
	git commit -m "additional" &&
	commit_msg_is "new message"
[master 66ef96a] new message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 17 - hook edits commit message

expecting success: 

	echo "additional content" >> file &&
	git add file &&
	echo "additional content" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit &&
	commit_msg_is "new message"
[master b6a7e61] new message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 18 - hook edits commit message (editor)

expecting success: 

	echo "plus" >> file &&
	git add file &&
	git commit --no-verify -m "plus" &&
	commit_msg_is "plus"
[master 73cbd8c] plus
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 19 - hook doesn't edit commit message
expecting success: 

	echo "more plus" >> file &&
	git add file &&
	echo "more plus" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --no-verify &&
	commit_msg_is "more plus"
[master ec72bb1] more plus
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 20 - hook doesn't edit commit message (editor)

# passed all 20 test(s)
1..20

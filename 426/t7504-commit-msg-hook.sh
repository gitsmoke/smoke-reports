Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7504-commit-msg-hook/.git/
expecting success: 

	echo "foo" > file &&
	git add file &&
	git commit -m "first"
[master (root-commit) 16545e4] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - with no hook
expecting success: 

	echo "more foo" >> file &&
	git add file &&
	echo "more foo" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit
[master f5fdefa] more foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 2 - with no hook (editor)

expecting success: 

	echo "bar" > file &&
	git add file &&
	git commit --no-verify -m "bar"


[master a22426a] bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 2 deletions(-)

ok 3 - --no-verify with no hook

expecting success: 

	echo "more bar" > file &&
	git add file &&
	echo "more bar" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --no-verify


[master 7e75fc6] more bar
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 4 - --no-verify with no hook (editor)

expecting success: 

	echo "more" >> file &&
	git add file &&
	git commit -m "more"


[master 73b2441] more
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 5 - with succeeding hook

expecting success: 

	echo "more more" >> file &&
	git add file &&
	echo "more more" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit


[master d8f2225] more more
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 6 - with succeeding hook (editor)

expecting success: 

	echo "even more" >> file &&
	git add file &&
	git commit --no-verify -m "even more"


[master 7e4378a] even more
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 7 - --no-verify with succeeding hook

expecting success: 

	echo "even more more" >> file &&
	git add file &&
	echo "even more more" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --no-verify


[master fb3a130] even more more
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


[master 1754818] stuff
 Author: A U Thor <author@example.com>
 1 files changed, 3 insertions(+), 0 deletions(-)

ok 11 - --no-verify with failing hook

expecting success: 

	echo "more stuff" >> file &&
	git add file &&
	echo "more stuff" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --no-verify


[master 07896b2] more stuff
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 12 - --no-verify with failing hook (editor)

expecting success: 

	echo "content" >> file &&
	git add file &&
	git commit -m "content"
[master 5d9d0ed] content
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 13 - with non-executable hook

expecting success: 

	echo "content again" >> file &&
	git add file &&
	echo "content again" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit -m "content again"
[master 5e2fb7e] content again
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 14 - with non-executable hook (editor)
expecting success: 

	echo "more content" >> file &&
	git add file &&
	git commit --no-verify -m "more content"
[master d162f1c] more content
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 15 - --no-verify with non-executable hook
expecting success: 

	echo "even more content" >> file &&
	git add file &&
	echo "even more content" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --no-verify
[master 05898bd] even more content
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
ok 16 - --no-verify with non-executable hook (editor)
expecting success: 

	echo "additional" >> file &&
	git add file &&
	git commit -m "additional" &&
	commit_msg_is "new message"
[master 15fa1b5] new message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 17 - hook edits commit message
expecting success: 

	echo "additional content" >> file &&
	git add file &&
	echo "additional content" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit &&
	commit_msg_is "new message"
[master 4b9d39b] new message
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 18 - hook edits commit message (editor)
expecting success: 

	echo "plus" >> file &&
	git add file &&
	git commit --no-verify -m "plus" &&
	commit_msg_is "plus"
[master dad43da] plus
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 19 - hook doesn't edit commit message
expecting success: 

	echo "more plus" >> file &&
	git add file &&
	echo "more plus" > FAKE_MSG &&
	GIT_EDITOR="\"\$FAKE_EDITOR\"" git commit --no-verify &&
	commit_msg_is "more plus"
[master c02d706] more plus
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 20 - hook doesn't edit commit message (editor)
# passed all 20 test(s)
1..20

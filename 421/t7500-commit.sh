Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7500-commit/.git/
expecting success: 
	echo content > foo &&
	git add foo &&
	git commit -m "initial commit"
[master (root-commit) a993ba4] initial commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo

ok 1 - a basic commit in an empty tree should succeed
expecting success: 
	echo changes >> foo &&
	git add foo &&
	test_must_fail git commit --template "$PWD"/notexist
ok 2 - nonexistent template file should return error
expecting success: 
	git config commit.template "$PWD"/notexist &&
	test_must_fail git commit &&
	git config --unset commit.template

ok 3 - nonexistent template file in config should return error

expecting success: 
	echo "template line" > "$TEMPLATE" &&
	test_must_fail git commit --template "$TEMPLATE"


ok 4 - unedited template should not commit

expecting success: 
	echo "# comment in template" >> "$TEMPLATE" &&
	test_must_fail git commit --template "$TEMPLATE"


ok 5 - unedited template with comments should not commit

expecting success: 
	(
		test_set_editor "$TEST_DIRECTORY"/t7500/add-signed-off &&
		test_must_fail git commit --template "$TEMPLATE"
	)


ok 6 - a Signed-off-by line by itself should not commit

expecting success: 
	(
		test_set_editor "$TEST_DIRECTORY"/t7500/add-comments &&
		test_must_fail git commit --template "$TEMPLATE"
	)


ok 7 - adding comments to a template should not commit

expecting success: 
	(
		test_set_editor "$TEST_DIRECTORY"/t7500/add-content &&
		git commit --template "$TEMPLATE"
	) &&
	commit_msg_is "template linecommit message"

[master 5be1109] template line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 8 - adding real content to a template should commit

expecting success: 
	echo "short template" > "$TEMPLATE" &&
	echo "new content" >> foo &&
	git add foo &&
	(
		test_set_editor "$TEST_DIRECTORY"/t7500/add-content &&
		git commit -t "$TEMPLATE"
	) &&
	commit_msg_is "short templatecommit message"

[master 3cace69] short template
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 9 - -t option should be short for --template

expecting success: 
	echo "new template" > "$TEMPLATE" &&
	git config commit.template "$TEMPLATE" &&
	echo "more content" >> foo &&
	git add foo &&
	(
		test_set_editor "$TEST_DIRECTORY"/t7500/add-content &&
		git commit
	) &&
	git config --unset commit.template &&
	commit_msg_is "new templatecommit message"

[master 5b7e4c4] new template
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 10 - config-specified template should commit

expecting success: 
	echo "still more content" >> foo &&
	git add foo &&
	GIT_EDITOR="$TEST_DIRECTORY"/t7500/add-content git commit --template "$TEMPLATE" \
		-m "command line msg" &&
	commit_msg_is "command line msg"
[master 11e374b] command line msg
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 11 - explicit commit message should override template

expecting success: 
	echo "content galore" >> foo &&
	git add foo &&
	echo "standard input msg" |
	(
		test_set_editor "$TEST_DIRECTORY"/t7500/add-content &&
		git commit --template "$TEMPLATE" --file -
	) &&
	commit_msg_is "standard input msg"

[master 414ab08] standard input msg
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 12 - commit message from file should override template

expecting success: 

	cp .git/index saved-index &&
	(
		echo some new content >file &&
	        GIT_INDEX_FILE=.git/another_index &&
		export GIT_INDEX_FILE &&
		git add file &&
		git commit -m "commit using another index" &&
		git diff-index --exit-code HEAD &&
		git diff-files --exit-code
	) &&
	cmp .git/index saved-index >/dev/null


[master 8ec53d5] commit using another index
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 6 deletions(-)
 create mode 100644 file
 delete mode 100644 foo
ok 13 - using alternate GIT_INDEX_FILE (1)
expecting success: 

	cp .git/index saved-index &&
	(
		rm -f .git/no-such-index &&
		GIT_INDEX_FILE=.git/no-such-index &&
		export GIT_INDEX_FILE &&
		git commit -m "commit using nonexistent index" &&
		test -z "$(git ls-files)" &&
		test -z "$(git ls-tree HEAD)"

	) &&
	cmp .git/index saved-index >/dev/null
[master 5244a8b] commit using nonexistent index
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 file

ok 14 - using alternate GIT_INDEX_FILE (2)
expecting success: 
	echo "yet another content *narf*" >> foo &&
	echo "zort" | git commit -s -F - foo &&
	git cat-file commit HEAD | sed "1,/^\$/d" > output &&
	test_cmp expect output
[master e94f5a7] zort
 Author: A U Thor <author@example.com>
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 foo

ok 15 - --signoff

expecting success: 
	mkdir subdir &&
	echo "Log in top directory" >log &&
	echo "Log in sub directory" >subdir/log &&
	(
		cd subdir &&
		git commit --allow-empty -F log
	) &&
	commit_msg_is "Log in sub directory"
[master f9bd341] Log in sub directory
 Author: A U Thor <author@example.com>

ok 16 - commit message from file (1)
expecting success: 
	rm -f log &&
	echo "Log in sub directory" >subdir/log &&
	(
		cd subdir &&
		git commit --allow-empty -F log
	) &&
	commit_msg_is "Log in sub directory"
[master 9be2ea8] Log in sub directory
 Author: A U Thor <author@example.com>

ok 17 - commit message from file (2)
expecting success: 
	(
		cd subdir &&
		echo "Log with foo word" | git commit --allow-empty -F -
	) &&
	commit_msg_is "Log with foo word"
[master 4e7ccb9] Log with foo word
 Author: A U Thor <author@example.com>

ok 18 - commit message from stdin
expecting success: 
	(
		cd subdir &&
		echo "-F log" > f.log &&
		echo "-t template" > t.template &&
		git commit --allow-empty -F f.log -t t.template
	) &&
	commit_msg_is "-F log"
[master fcfc1a3] -F log
 Author: A U Thor <author@example.com>

ok 19 - commit -F overrides -t
expecting success: 
	echo "more content" >>foo &&
	git add foo &&
	>empty &&
	git commit --allow-empty-message <empty &&
	commit_msg_is ""
[master ec06b3b] 
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 20 - Commit without message is allowed with --allow-empty-message
expecting success: 
	echo "more content" >>foo &&
	git add foo &&
	>empty &&
	test_must_fail git commit <empty

ok 21 - Commit without message is no-no without --allow-empty-message

expecting success: 
	echo "even more content" >>foo &&
	git add foo &&
	git commit --allow-empty-message -m"hello there" &&
	commit_msg_is "hello there"

[master 25de6f1] hello there
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)

ok 22 - Commit a message with --allow-empty-message

expecting success: 
	commit_for_rebase_autosquash_setup &&
	git commit --fixup HEAD~1 &&
	commit_msg_is "fixup! target message subject line"

[master fe19afb] target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master dc6d9e3] intermediate commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master b396e50] fixup! target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 23 - commit --fixup provides correct one-line commit message

expecting success: 
	commit_for_rebase_autosquash_setup &&
	echo "log message from file" >msgfile &&
	git commit --squash HEAD~1 -F msgfile  &&
	commit_msg_is "squash! target message subject linelog message from file"

[master fdcdafb] target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 0420292] intermediate commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 8a127fa] squash! target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 24 - commit --squash works with -F

expecting success: 
	commit_for_rebase_autosquash_setup &&
	git commit --squash HEAD~1 -m "foo bar
baz" &&
	commit_msg_is "squash! target message subject linefoo bar
baz"
[master 4f0e7f0] target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 1a5e23d] intermediate commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 0fb3106] squash! target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 25 - commit --squash works with -m
expecting success: 
	commit_for_rebase_autosquash_setup &&
	git commit --squash HEAD~1 -C HEAD &&
	commit_msg_is "squash! target message subject lineintermediate commit"
[master 7a87a89] target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master f57f0d0] intermediate commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 145be61] squash! target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 26 - commit --squash works with -C

expecting success: 
	commit_for_rebase_autosquash_setup &&
	test_set_editor "$TEST_DIRECTORY"/t7500/edit-content &&
	git commit --squash HEAD~1 -c HEAD &&
	commit_msg_is "squash! target message subject lineedited commit"

[master 4971293] target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 7a3db2e] intermediate commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 91b85c8] squash! target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 27 - commit --squash works with -c

expecting success: 
	commit_for_rebase_autosquash_setup &&
	git commit --squash HEAD -C HEAD &&
	commit_msg_is "squash! intermediate commit"

[master 10197c4] target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master ea072c3] intermediate commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master e3c6b96] squash! intermediate commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 28 - commit --squash works with -C for same commit
expecting success: 
	commit_for_rebase_autosquash_setup &&
	test_set_editor "$TEST_DIRECTORY"/t7500/edit-content &&
	git commit --squash HEAD -c HEAD &&
	commit_msg_is "squash! edited commit"
[master 98608e2] target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master df8c27c] intermediate commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master e71809c] squash! edited commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 29 - commit --squash works with -c for same commit
expecting success: 
	commit_for_rebase_autosquash_setup &&
	test_set_editor "$TEST_DIRECTORY"/t7500/add-content &&
	git commit --squash HEAD~1 &&
	commit_msg_is "squash! target message subject linecommit message"
[master 9e0cdbc] target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 1c97e6b] intermediate commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master b8b308b] squash! target message subject line
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 30 - commit --squash works with editor
expecting success: 
	echo changes >>foo &&
	echo "message" >log &&
	git add foo &&
	test_must_fail git commit --fixup HEAD~1 --squash HEAD~2 &&
	test_must_fail git commit --fixup HEAD~1 -C HEAD~2 &&
	test_must_fail git commit --fixup HEAD~1 -c HEAD~2 &&
	test_must_fail git commit --fixup HEAD~1 -m "cmdline message" &&
	test_must_fail git commit --fixup HEAD~1 -F log
ok 31 - invalid message options when using --fixup

# passed all 31 test(s)
1..31

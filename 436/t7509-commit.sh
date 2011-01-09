Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7509-commit/.git/
expecting success: 
	echo "Initial" >foo &&
	git add foo &&
	test_tick &&
	git commit -m "Initial Commit" --author Frigate\ \<flying@over.world\> &&
	git tag Initial &&
	echo "Test 1" >>foo &&
	test_tick &&
	git commit -a -C Initial &&
	author_header Initial >expect &&
	author_header HEAD >actual &&
	test_cmp expect actual &&

	message_body Initial >expect &&
	message_body HEAD >actual &&
	test_cmp expect actual
[master (root-commit) 6c1fd11] Initial Commit
 Author: Frigate <flying@over.world>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master 19b40bf] Initial Commit
 Author: Frigate <flying@over.world>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - -C option copies authorship and message
expecting success: 
	echo "Test 2" >>foo &&
	test_tick &&
	git commit -a -C Initial --reset-author &&
	echo "author $GIT_AUTHOR_NAME <$GIT_AUTHOR_EMAIL> $GIT_AUTHOR_DATE" >expect &&
	author_header HEAD >actual &&
	test_cmp expect actual &&

	message_body Initial >expect &&
	message_body HEAD >actual &&
	test_cmp expect actual
[master 0381fd2] Initial Commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 2 - -C option copies only the message with --reset-author
expecting success: 
	echo "Test 3" >>foo &&
	test_tick &&
	EDITOR=: VISUAL=: git commit -a -c Initial &&
	author_header Initial >expect &&
	author_header HEAD >actual &&
	test_cmp expect actual
[master fef56eb] Initial Commit
 Author: Frigate <flying@over.world>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 3 - -c option copies authorship and message
expecting success: 
	echo "Test 4" >>foo &&
	test_tick &&
	EDITOR=: VISUAL=: git commit -a -c Initial --reset-author &&
	echo "author $GIT_AUTHOR_NAME <$GIT_AUTHOR_EMAIL> $GIT_AUTHOR_DATE" >expect &&
	author_header HEAD >actual &&
	test_cmp expect actual &&

	message_body Initial >expect &&
	message_body HEAD >actual &&
	test_cmp expect actual
[master d241f1c] Initial Commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 4 - -c option copies only the message with --reset-author
expecting success: 
	git checkout Initial &&
	echo "Test 5" >>foo &&
	test_tick &&
	git commit -a --amend -m "amend test" &&
	author_header Initial >expect &&
	author_header HEAD >actual &&

	echo "amend test" >expect &&
	message_body HEAD >actual &&
	test_cmp expect actual
[detached HEAD 7318ebc] amend test
 Author: Frigate <flying@over.world>
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 foo

ok 5 - --amend option copies authorship

expecting success: 
	git cat-file commit Initial >tmp &&
	sed "s/author [^<]* </author  </" tmp >empty-author &&
	no_reflog &&
	sha=$(git hash-object -t commit -w empty-author) &&
	test_when_finished "remove_object $sha" &&
	git checkout $sha &&
	test_when_finished "git checkout Initial" &&
	echo "Empty author test" >>foo &&
	test_tick &&
	test_must_fail git commit -a -m "empty author" --amend 2>err &&
	grep "empty ident" err
fatal: empty ident  <flying@over.world> not allowed
M	foo
ok 6 - --amend option with empty author
expecting success: 
	git cat-file commit Initial >tmp &&
	sed "s/author [^<]* </author </" tmp >malformed &&
	no_reflog &&
	sha=$(git hash-object -t commit -w malformed) &&
	test_when_finished "remove_object $sha" &&
	git checkout $sha &&
	test_when_finished "git checkout Initial" &&
	echo "Missing author test" >>foo &&
	test_tick &&
	test_must_fail git commit -a -m "malformed author" --amend 2>err &&
	grep "empty ident" err
M	foo
fatal: empty ident  <flying@over.world> not allowed
M	foo
ok 7 - --amend option with missing author
expecting success: 
	git checkout Initial &&
	echo "Test 6" >>foo &&
	test_tick &&
	git commit -a --reset-author -m "Changed again" --amend &&
	echo "author $GIT_AUTHOR_NAME <$GIT_AUTHOR_EMAIL> $GIT_AUTHOR_DATE" >expect &&
	author_header HEAD >actual &&
	test_cmp expect actual &&

	echo "Changed again" >expect &&
	message_body HEAD >actual &&
	test_cmp expect actual
M	foo
[detached HEAD 16b5be6] Changed again
 Author: A U Thor <author@example.com>
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 foo

ok 8 - --reset-author makes the commit ours even with --amend option
expecting success: 
	git checkout Initial &&
	echo "Test 7" >>foo &&
	test_tick &&
	test_must_fail git commit -a --reset-author --author="Xyzzy <frotz@nitfol.xz>"
ok 9 - --reset-author and --author are mutually exclusive

expecting success: 
	git checkout Initial &&
	echo "Test 7" >>foo &&
	test_tick &&
	test_must_fail git commit -a --reset-author -m done
M	foo
ok 10 - --reset-author should be rejected without -c/-C/--amend

# passed all 10 test(s)
1..10

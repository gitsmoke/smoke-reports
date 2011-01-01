Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2203-add-intent/.git/
expecting success: 
	echo hello >file &&
	echo hello >elif &&
	git add -N file &&
	git add elif

ok 1 - intent to add

expecting success: 
	git ls-files -s file >actual &&
	empty=$(git hash-object --stdin </dev/null) &&
	echo "100644 $empty 0	file" >expect &&
	test_cmp expect actual

ok 2 - check result of "add -N"

expecting success: 
	git add -u &&
	git ls-files -s file >actual &&
	git ls-files -s elif | sed -e "s/elif/file/" >expect &&
	test_cmp expect actual

ok 3 - intent to add is just an ordinary empty blob

expecting success: 
	git add -N file elif &&
	empty=$(git hash-object --stdin </dev/null) &&
	git ls-files -s >actual &&
	! grep "$empty" actual

ok 4 - intent to add does not clobber existing paths

expecting success: 
	test_tick &&
	git commit -a -m initial &&
	git reset --hard &&

	echo xyzzy >rezrov &&
	echo frotz >nitfol &&
	git add rezrov &&
	git add -N nitfol &&
	test_must_fail git commit
[master (root-commit) 98bc6e7] initial
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 elif
 create mode 100644 file
HEAD is now at 98bc6e7 initial
ok 5 - cannot commit with i-t-a entry

expecting success: 
	git reset --hard &&
	echo xyzzy >rezrov &&
	echo frotz >nitfol &&
	git add rezrov &&
	git add -N nitfol &&
	git commit -m partial rezrov
HEAD is now at 98bc6e7 initial
[master b175f6d] partial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 rezrov

ok 6 - can commit with an unrelated i-t-a entry in index

expecting success: 
	git reset --hard &&
	: >nitfol &&
	git add -N nitfol &&
	git commit -a -m all
HEAD is now at b175f6d partial
[master e1a7031] all
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 nitfol

ok 7 - can "commit -a" with an i-t-a entry

# passed all 7 test(s)
1..7

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2019-checkout-amiguous-ref/.git/
expecting success: 
	test_commit branch file &&
	git branch ambiguity &&
	git branch vagueness &&
	test_commit tag file &&
	git tag ambiguity &&
	git tag vagueness HEAD:file &&
	test_commit other file

[master (root-commit) c291a6e] branch
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master a40f7cf] tag
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 3b61e26] other
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup ambiguous refs

expecting success: 
	git checkout ambiguity >stdout 2>stderr


ok 2 - checkout ambiguous ref succeeds

expecting success: 
	grep "warning.*ambiguous" stderr

warning: refname 'ambiguity' is ambiguous.

ok 3 - checkout produces ambiguity warning

expecting success: 
	echo branch >expect &&
	test_cmp expect file


ok 4 - checkout chooses branch over tag

expecting success: 
	grep "Switched to branch" stderr &&
	! grep "^HEAD is now at" stderr

Switched to branch 'ambiguity'

ok 5 - checkout reports switch to detached HEAD

expecting success: 
	git checkout vagueness >stdout 2>stderr &&
	test_set_prereq VAGUENESS_SUCCESS


ok 6 - checkout vague ref succeeds

expecting success: 
	grep "warning.*ambiguous" stderr

warning: refname 'vagueness' is ambiguous.

ok 7 - checkout produces ambiguity warning

expecting success: 
	echo branch >expect &&
	test_cmp expect file


ok 8 - checkout chooses branch over tag

expecting success: 
	grep "Switched to branch" stderr &&
	! grep "^HEAD is now at" stderr

Switched to branch 'vagueness'

ok 9 - checkout reports switch to detached HEAD

# passed all 9 test(s)
1..9

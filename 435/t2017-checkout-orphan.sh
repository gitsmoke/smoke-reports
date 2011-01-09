Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2017-checkout-orphan/.git/
expecting success: 
	echo "Initial" >"$TEST_FILE" &&
	git add "$TEST_FILE" &&
	git commit -m "First Commit" &&
	test_tick &&
	echo "State 1" >>"$TEST_FILE" &&
	git add "$TEST_FILE" &&
	test_tick &&
	git commit -m "Second Commit"

[master (root-commit) 18eaffb] First Commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
[master 9d8234e] Second Commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - Setup

expecting success: 
	git checkout --orphan alpha &&
	test_must_fail git rev-parse --verify HEAD &&
	test "refs/heads/alpha" = "$(git symbolic-ref HEAD)" &&
	test_tick &&
	git commit -m "Third Commit" &&
	test_must_fail git rev-parse --verify HEAD^ &&
	git diff-tree --quiet master alpha

[alpha (root-commit) 6f20c32] Third Commit
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 foo

ok 2 - --orphan creates a new orphan branch from HEAD

expecting success: 
	git checkout master &&
	git checkout --orphan beta master^ &&
	test_must_fail git rev-parse --verify HEAD &&
	test "refs/heads/beta" = "$(git symbolic-ref HEAD)" &&
	test_tick &&
	git commit -m "Fourth Commit" &&
	test_must_fail git rev-parse --verify HEAD^ &&
	git diff-tree --quiet master^ beta

[beta (root-commit) 530edda] Fourth Commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo

ok 3 - --orphan creates a new orphan branch from <start_point>

expecting success: 
	git checkout master &&
	test_must_fail git checkout --orphan new -b newer &&
	test refs/heads/master = "$(git symbolic-ref HEAD)"

ok 4 - --orphan must be rejected with -b

expecting success: 
	git checkout master &&
	test_must_fail git checkout --orphan new -t master &&
	test refs/heads/master = "$(git symbolic-ref HEAD)"


ok 5 - --orphan must be rejected with -t

expecting success: 
	git checkout master &&
	git config branch.autosetupmerge always &&
	git checkout --orphan gamma &&
	test -z "$(git config branch.gamma.merge)" &&
	test refs/heads/gamma = "$(git symbolic-ref HEAD)" &&
	test_must_fail git rev-parse --verify HEAD^


ok 6 - --orphan ignores branch.autosetupmerge

expecting success: 
	git checkout master &&
	git config --unset core.logAllRefUpdates &&
	git checkout --orphan delta &&
	test_must_fail git rev-parse --verify delta@{0} &&
	git commit -m Delta &&
	git rev-parse --verify delta@{0}

[delta (root-commit) 9beee35] Delta
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 foo
9beee35744aee191f8186ef0a6ab78f710cdd57c

ok 7 - --orphan makes reflog by default

expecting success: 
	git checkout master &&
	git config core.logAllRefUpdates false &&
	git checkout --orphan epsilon &&
	test_must_fail git rev-parse --verify epsilon@{0} &&
	git commit -m Epsilon &&
	test_must_fail git rev-parse --verify epsilon@{0}

[epsilon (root-commit) c5e7701] Epsilon
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 foo

ok 8 - --orphan does not make reflog when core.logAllRefUpdates = false

expecting success: 
	git checkout master &&
	git checkout -l --orphan zeta &&
	test_must_fail git rev-parse --verify zeta@{0} &&
	git commit -m Zeta &&
	git rev-parse --verify zeta@{0}

[zeta (root-commit) 1b23595] Zeta
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 foo
1b235958474dccc5c8f228713c620d22e7d1825d

ok 9 - --orphan with -l makes reflog when core.logAllRefUpdates = false

expecting success: 
	git checkout master &&
	git checkout -l --orphan eta &&
	test_must_fail git rev-parse --verify eta@{0} &&
	git checkout master &&
	test_must_fail git rev-parse --verify eta@{0}


ok 10 - giving up --orphan not committed when -l and core.logAllRefUpdates = false deletes reflog

expecting success: 
	git checkout master &&
	test_must_fail git checkout --orphan master &&
	test refs/heads/master = "$(git symbolic-ref HEAD)"


ok 11 - --orphan is rejected with an existing name

expecting success: 
	git checkout master &&
	git reset --hard &&
	echo local >>"$TEST_FILE" &&
	cat "$TEST_FILE" >"$TEST_FILE.saved" &&
	test_must_fail git checkout --orphan new master^ &&
	test refs/heads/master = "$(git symbolic-ref HEAD)" &&
	test_cmp "$TEST_FILE" "$TEST_FILE.saved" &&
	git diff-index --quiet --cached HEAD &&
	git reset --hard

HEAD is now at 9d8234e Second Commit
Aborting
HEAD is now at 9d8234e Second Commit

ok 12 - --orphan refuses to switch if a merge is needed

# passed all 12 test(s)
1..12

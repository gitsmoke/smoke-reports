Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2013-checkout-submodule/.git/
expecting success: 
	mkdir submodule &&
	(cd submodule &&
	 git init &&
	 test_commit first) &&
	git add submodule &&
	test_tick &&
	git commit -m superproject &&
	(cd submodule &&
	 test_commit second) &&
	git add submodule &&
	test_tick &&
	git commit -m updated.superproject
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2013-checkout-submodule/submodule/.git/
[master (root-commit) 50e526b] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 first.t
[master (root-commit) 1844aa5] superproject
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 160000 submodule
[master d662100] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 second.t
[master 14e674f] updated.superproject
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup
expecting success: 
	git update-index --refresh &&
	git diff-files --quiet &&
	git diff-index --quiet --cached HEAD &&
	test_must_fail git reset HEAD^ submodule &&
	test_must_fail git diff-files --quiet &&
	git reset submodule &&
	git diff-files --quiet
Unstaged changes after reset:
M	submodule

ok 2 - "reset <submodule>" updates the index

expecting success: 
	git update-index --refresh &&
	git diff-files --quiet &&
	git diff-index --quiet --cached HEAD &&
	git checkout HEAD^ submodule &&
	test_must_fail git diff-files --quiet &&
	git checkout HEAD submodule &&
	git diff-files --quiet


ok 3 - "checkout <submodule>" updates the index only

expecting success: 
	git config diff.ignoreSubmodules dirty &&
	echo x> submodule/untracked &&
	git checkout HEAD >actual 2>&1 &&
	! test -s actual


ok 4 - "checkout <submodule>" honors diff.ignoreSubmodules

expecting success: 
	git config diff.ignoreSubmodules none &&
	git config -f .gitmodules submodule.submodule.path submodule &&
	git config -f .gitmodules submodule.submodule.ignore untracked &&
	git checkout HEAD >actual 2>&1 &&
	! test -s actual


ok 5 - "checkout <submodule>" honors submodule.*.ignore from .gitmodules

expecting success: 
	git config -f .gitmodules submodule.submodule.ignore none &&
	git config submodule.submodule.path submodule &&
	git config submodule.submodule.ignore all &&
	git checkout HEAD >actual 2>&1 &&
	! test -s actual


ok 6 - "checkout <submodule>" honors submodule.*.ignore from .git/config

# passed all 6 test(s)
1..6

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5704-bundle/.git/
expecting success: 

	: > file &&
	git add file &&
	test_tick &&
	git commit -m initial &&
	test_tick &&
	git tag -m tag tag &&
	: > file2 &&
	git add file2 &&
	: > file3 &&
	test_tick &&
	git commit -m second &&
	git add file3 &&
	test_tick &&
	git commit -m third
[master (root-commit) 1bd44cb] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[master c97f59f] second
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file2
[master 4886063] third
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file3

ok 1 - setup

expecting success: 

	git bundle create bundle --all --since=7.Apr.2005.15:16:00.-0700 &&
	git ls-remote bundle > output &&
	! grep tag output



ok 2 - tags can be excluded by rev-list options

expecting success: 

	mkdir adir &&
	test_must_fail git bundle create adir --all



ok 3 - die if bundle file cannot be created

checking known breakage: 

	echo master | git bundle create stdin-bundle.bdl --stdin &&
	git ls-remote stdin-bundle.bdl >output &&
	grep master output



not ok 4 - bundle --stdin # TODO known breakage

checking known breakage: 

	echo master | git bundle create hybrid-bundle.bdl --stdin tag &&
	git ls-remote hybrid-bundle.bdl >output &&
	grep master output
not ok 5 - bundle --stdin <rev-list options> # TODO known breakage

# still have 2 known breakage(s)
# passed all remaining 3 test(s)
1..5

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3050-subprojects-fetch/.git/
expecting success: 
	test_tick &&
	mkdir -p sub && (
		cd sub &&
		git init &&
		>subfile &&
		git add subfile &&
		git commit -m "subproject commit #1"
	) &&
	>mainfile &&
	git add sub mainfile &&
	test_tick &&
	git commit -m "superproject commit #1"

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3050-subprojects-fetch/sub/.git/
[master (root-commit) 4c0c877] subproject commit #1
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 subfile
[master (root-commit) 1226c2e] superproject commit #1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 mainfile
 create mode 160000 sub

ok 1 - setup

expecting success: 
	git clone "file://$(pwd)/.git" cloned &&
	(git rev-parse HEAD; git ls-files -s) >expected &&
	(
		cd cloned &&
		(git rev-parse HEAD; git ls-files -s) >../actual
	) &&
	test_cmp expected actual
Cloning into cloned...

ok 2 - clone

expecting success: 
	echo more >mainfile &&
	git update-index --force-remove sub &&
	mv sub/.git sub/.git-disabled &&
	git add sub/subfile mainfile &&
	mv sub/.git-disabled sub/.git &&
	test_tick &&
	git commit -m "superproject commit #2"
[master 1548ecd] superproject commit #2
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 delete mode 160000 sub
 create mode 100644 sub/subfile

ok 3 - advance

expecting success: 
	(git rev-parse HEAD; git ls-files -s) >expected &&
	(
		cd cloned &&
		git pull &&
		(git rev-parse HEAD; git ls-files -s) >../actual
	) &&
	test_cmp expected actual
Updating 1226c2e..1548ecd
Fast-forward
 mainfile    |    1 +
 sub         |    1 -
 2 files changed, 1 insertions(+), 1 deletions(-)
 delete mode 160000 sub
 create mode 100644 sub/subfile

ok 4 - fetch

# passed all 4 test(s)
1..4

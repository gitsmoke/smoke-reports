Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4037-diff-r-t-dirs/.git/
expecting success: 
	mkdir dc dr dt &&
	>dc/1 &&
	>dr/2 &&
	>dt/3 &&
	>fc &&
	>fr &&
	>ft &&
	git add . &&
	test_tick &&
	git commit -m initial &&

	rm -fr dt dr ft fr &&
	mkdir da ft &&
	for p in dc/1 da/4 dt ft/5 fc
	do
		echo hello >$p || exit
	done &&
	git add -u &&
	git add . &&
	test_tick &&
	git commit -m second
[master (root-commit) 26fc746] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 dc/1
 create mode 100644 dr/2
 create mode 100644 dt/3
 create mode 100644 fc
 create mode 100644 fr
 create mode 100644 ft
[master 25e238e] second
 Author: A U Thor <author@example.com>
 5 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 da/4
 delete mode 100644 dr/2
 create mode 100644 dt
 delete mode 100644 dt/3
 delete mode 100644 fr
 delete mode 100644 ft
 create mode 100644 ft/5

ok 1 - setup
expecting success: 
	git diff-tree -r -t --name-status HEAD^ HEAD >actual &&
	test_cmp expect actual

ok 2 - verify
# passed all 2 test(s)
1..2

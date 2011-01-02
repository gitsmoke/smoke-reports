Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3202-show-branch-octopus/.git/
expecting success: 

	> file &&
	git add file &&
	test_tick &&
	git commit -m initial &&

	for i in $numbers
	do
		git checkout -b branch$i master &&
		> file$i &&
		git add file$i &&
		test_tick &&
		git commit -m branch$i || break
	done
[master (root-commit) 1bd44cb] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[branch1 eabeb5d] branch1
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file1
[branch2 b4fb685] branch2
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file2
[branch3 8334722] branch3
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file3
[branch4 142d8e4] branch4
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file4
[branch5 c5402b6] branch5
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file5
[branch6 d33aeab] branch6
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file6
[branch7 cb80438] branch7
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file7
[branch8 c922302] branch8
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file8
[branch9 fabe124] branch9
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file9
[branch10 4d9b8be] branch10
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file10

ok 1 - setup
expecting success: 

	git show-branch $(for i in $numbers; do echo branch$i; done) > out &&
	test_cmp expect out

ok 2 - show-branch with more than 8 branches

expecting success: 
	for i in $numbers; do
		git config --add showbranch.default branch$i
	done &&
	git show-branch >out &&
	test_cmp expect out

ok 3 - show-branch with showbranch.default

# passed all 3 test(s)
1..3

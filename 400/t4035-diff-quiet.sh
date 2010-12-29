Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4035-diff-quiet/.git/
expecting success: 
	echo 1 >a &&
	git add . &&
	git commit -m first &&
	echo 2 >b &&
	git add . &&
	git commit -a -m second
[master (root-commit) f78487f] first
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a
[master d8876d3] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 b

ok 1 - setup

expecting success: 
	git diff-tree --quiet HEAD^ HEAD >cnt
	test $? = 1 && test $(wc -l <cnt) = 0

ok 2 - git diff-tree HEAD^ HEAD

expecting success: 
	git diff-tree --quiet HEAD^ HEAD -- a >cnt
	test $? = 0 && test $(wc -l <cnt) = 0

ok 3 - git diff-tree HEAD^ HEAD -- a

expecting success: 
	git diff-tree --quiet HEAD^ HEAD -- b >cnt
	test $? = 1 && test $(wc -l <cnt) = 0

ok 4 - git diff-tree HEAD^ HEAD -- b

expecting success: 
	echo $(git rev-parse HEAD) | git diff-tree --quiet --stdin >cnt
	test $? = 1 && test $(wc -l <cnt) = 1

ok 5 - echo HEAD | git diff-tree --stdin

expecting success: 
	git diff-tree --quiet HEAD HEAD >cnt
	test $? = 0 && test $(wc -l <cnt) = 0

ok 6 - git diff-tree HEAD HEAD

expecting success: 
	git diff-files --quiet >cnt
	test $? = 0 && test $(wc -l <cnt) = 0

ok 7 - git diff-files

expecting success: 
	git diff-index --quiet --cached HEAD >cnt
	test $? = 0 && test $(wc -l <cnt) = 0

ok 8 - git diff-index --cached HEAD

expecting success: 
	git diff-index --quiet --cached HEAD^ >cnt
	test $? = 1 && test $(wc -l <cnt) = 0

ok 9 - git diff-index --cached HEAD^

expecting success: 
	echo text >>b &&
	echo 3 >c &&
	git add . && {
		git diff-index --quiet --cached HEAD^ >cnt
		test $? = 1 && test $(wc -l <cnt) = 0
	}

ok 10 - git diff-index --cached HEAD^

expecting success: 
	git commit -m "text in b" && {
		git diff-tree --quiet -Stext HEAD^ HEAD -- b >cnt
		test $? = 1 && test $(wc -l <cnt) = 0
	}
[master 95954a1] text in b
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 c
 create mode 100644 cnt

ok 11 - git diff-tree -Stext HEAD^ HEAD -- b

expecting success: 
	git diff-tree --quiet -Snot-found HEAD^ HEAD -- b >cnt
	test $? = 0 && test $(wc -l <cnt) = 0

ok 12 - git diff-tree -Snot-found HEAD^ HEAD -- b

expecting success: 
	echo 3 >>c && {
		git diff-files --quiet >cnt
		test $? = 1 && test $(wc -l <cnt) = 0
	}

ok 13 - git diff-files

expecting success: 
	git update-index c && {
		git diff-index --quiet --cached HEAD >cnt
		test $? = 1 && test $(wc -l <cnt) = 0
	}

ok 14 - git diff-index --cached HEAD

# passed all 14 test(s)
1..14

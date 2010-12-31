Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7104-reset/.git/
expecting success: 

	mkdir before later &&
	>before/1 &&
	>before/2 &&
	>hello &&
	>later/3 &&
	git add before hello later &&
	git commit -m world &&

	H=$(git rev-parse :hello) &&
	git rm --cached hello &&
	echo "100644 $H 2	hello" | git update-index --index-info &&

	rm -f hello &&
	mkdir -p hello &&
	>hello/world &&
	test "$(git ls-files -o)" = hello/world
[master (root-commit) 3cb5353] world
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 before/1
 create mode 100644 before/2
 create mode 100644 hello
 create mode 100644 later/3
rm 'hello'

ok 1 - setup

expecting success: 

	git reset --hard &&
	git ls-files --error-unmatch before/1 before/2 hello later/3 &&
	test -f hello
HEAD is now at 3cb5353 world
before/1
before/2
hello
later/3

ok 2 - reset --hard should restore unmerged ones

expecting success: 

	T=$(git write-tree) &&
	rm -f .git/index &&
	git add before hello later &&
	U=$(git write-tree) &&
	test "$T" = "$U"

ok 3 - reset --hard did not corrupt index nor cached-tree

# passed all 3 test(s)
1..3

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6004-rev-list-path-optim/.git/
expecting success: 
echo Hello > a &&
git add a &&
git commit -m "Initial commit" a &&
initial=$(git rev-parse --verify HEAD)
[master (root-commit) d708bac] Initial commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 a

ok 1 - setup
expecting success: 
    commit=$(echo "Unchanged tree" | git commit-tree "HEAD^{tree}" -p HEAD) &&
    test $(git rev-list $commit | wc -l) = 2 &&
    test $(git rev-list $commit -- . | wc -l) = 1

ok 2 - path-optimization

expecting success: 
	git checkout -b side &&
	echo Irrelevant >c &&
	git add c &&
	git commit -m "Side makes an irrelevant commit" &&
	echo "More Irrelevancy" >c &&
	git add c &&
	git commit -m "Side makes another irrelevant commit" &&
	echo Bye >a &&
	git add a &&
	git commit -m "Side touches a" &&
	side=$(git rev-parse --verify HEAD) &&
	echo "Yet more Irrelevancy" >c &&
	git add c &&
	git commit -m "Side makes yet another irrelevant commit" &&
	git checkout master &&
	echo Another >b &&
	git add b &&
	git commit -m "Master touches b" &&
	git merge side &&
	echo Touched >b &&
	git add b &&
	git commit -m "Master touches b again"
[side 5fead69] Side makes an irrelevant commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 c
[side 46ec5ec] Side makes another irrelevant commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side 6d80868] Side touches a
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[side 910add2] Side makes yet another irrelevant commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 19c9c0f] Master touches b
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 b
Merging:
19c9c0f Master touches b
virtual side
found 1 common ancestor(s):
d708bac Initial commit
Merge made by recursive.
 a |    2 +-
 c |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)
 create mode 100644 c
[master 45ada09] Master touches b again
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 3 - further setup
expecting success: 
	( echo "$side"; echo "$initial" ) >expected &&
	git rev-list HEAD -- a >actual &&
	test_cmp expected actual

ok 4 - path optimization 2

# passed all 4 test(s)
1..4

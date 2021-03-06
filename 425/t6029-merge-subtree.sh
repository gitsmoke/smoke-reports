Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6029-merge-subtree/.git/
expecting success: 

	s="1 2 3 4 5 6 7 8" &&
	for i in $s; do echo $i; done >hello &&
	git add hello &&
	git commit -m initial &&
	git checkout -b side &&
	echo >>hello world &&
	git add hello &&
	git commit -m second &&
	git checkout master &&
	for i in mundo $s; do echo $i; done >hello &&
	git add hello &&
	git commit -m master
[master (root-commit) bcff66c] initial
 Author: A U Thor <author@example.com>
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 hello
[side 7a6b98b] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master be5c525] master
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 

	git merge -s subtree side &&
	for i in mundo $s world; do echo $i; done >expect &&
	test_cmp expect hello
Merging:
be5c525 master
virtual side
found 1 common ancestor(s):
bcff66c initial
Auto-merging hello
Merge made by subtree.
 hello |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 2 - subtree available and works like recursive

expecting success: 
	mkdir git-gui &&
	cd git-gui &&
	git init &&
	echo git-gui > git-gui.sh &&
	o1=$(git hash-object git-gui.sh) &&
	git add git-gui.sh &&
	git commit -m "initial git-gui" &&
	cd .. &&
	mkdir git &&
	cd git &&
	git init &&
	echo git >git.c &&
	o2=$(git hash-object git.c) &&
	git add git.c &&
	git commit -m "initial git"

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6029-merge-subtree/git-gui/.git/
[master (root-commit) 5f754c5] initial git-gui
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 git-gui.sh
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6029-merge-subtree/git/.git/
[master (root-commit) b849cfd] initial git
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 git.c

ok 3 - setup

expecting success: 
	git remote add -f gui ../git-gui &&
	git merge -s ours --no-commit gui/master &&
	git read-tree --prefix=git-gui/ -u gui/master &&
	git commit -m "Merge git-gui as our subdirectory" &&
	git checkout -b work &&
	git ls-files -s >actual &&
	(
		echo "100644 $o1 0	git-gui/git-gui.sh"
		echo "100644 $o2 0	git.c"
	) >expected &&
	test_cmp expected actual

Updating gui
[master aba93dd] Merge git-gui as our subdirectory
 Author: A U Thor <author@example.com>
ok 4 - initial merge

expecting success: 
	cd ../git-gui &&
	echo git-gui2 > git-gui.sh &&
	o3=$(git hash-object git-gui.sh) &&
	git add git-gui.sh &&
	git checkout -b master2 &&
	git commit -m "update git-gui" &&
	cd ../git &&
	git pull -s subtree gui master2 &&
	git ls-files -s >actual &&
	(
		echo "100644 $o3 0	git-gui/git-gui.sh"
		echo "100644 $o2 0	git.c"
	) >expected &&
	test_cmp expected actual
M	git-gui.sh
[master2 40d71dc] update git-gui
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merging:
aba93dd Merge git-gui as our subdirectory
virtual 40d71dc2b5d373d56b2bce235a8efe65d0c7e684
found 1 common ancestor(s):
5f754c5 initial git-gui
Merge made by subtree.
 git-gui/git-gui.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 5 - merge update

expecting success: 
	cd ../git &&
	git reset --hard master &&
	git checkout -b master2 &&
	git merge -s ours --no-commit gui/master &&
	git read-tree --prefix=git-gui2/ -u gui/master &&
	git commit -m "Merge git-gui2 as our subdirectory" &&
	git checkout -b work2 &&
	git ls-files -s >actual &&
	(
		echo "100644 $o1 0	git-gui/git-gui.sh"
		echo "100644 $o1 0	git-gui2/git-gui.sh"
		echo "100644 $o2 0	git.c"
	) >expected &&
	test_cmp expected actual

HEAD is now at aba93dd Merge git-gui as our subdirectory
Already up-to-date.
[master2 9598cc0] Merge git-gui2 as our subdirectory
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 git-gui2/git-gui.sh

ok 6 - initial ambiguous subtree

expecting success: 
	cd ../git &&
	git reset --hard master2 &&
	git pull -Xsubtree=git-gui gui master2 &&
	git ls-files -s >actual &&
	(
		echo "100644 $o3 0	git-gui/git-gui.sh"
		echo "100644 $o1 0	git-gui2/git-gui.sh"
		echo "100644 $o2 0	git.c"
	) >expected &&
	test_cmp expected actual

HEAD is now at 9598cc0 Merge git-gui2 as our subdirectory
Merging:
9598cc0 Merge git-gui2 as our subdirectory
virtual 40d71dc2b5d373d56b2bce235a8efe65d0c7e684
found 1 common ancestor(s):
5f754c5 initial git-gui
Merge made by recursive.
 git-gui/git-gui.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
ok 7 - merge using explicit

expecting success: 
	cd ../git &&
	git reset --hard master2 &&
	git pull -Xsubtree=git-gui2 gui master2 &&
	git ls-files -s >actual &&
	(
		echo "100644 $o1 0	git-gui/git-gui.sh"
		echo "100644 $o3 0	git-gui2/git-gui.sh"
		echo "100644 $o2 0	git.c"
	) >expected &&
	test_cmp expected actual
HEAD is now at 9598cc0 Merge git-gui2 as our subdirectory
Merging:
9598cc0 Merge git-gui2 as our subdirectory
virtual 40d71dc2b5d373d56b2bce235a8efe65d0c7e684
found 1 common ancestor(s):
5f754c5 initial git-gui
Merge made by recursive.
 git-gui2/git-gui.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 8 - merge2 using explicit

# passed all 8 test(s)
1..8

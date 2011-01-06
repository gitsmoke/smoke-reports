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
[master (root-commit) 00b870c] initial
 Author: A U Thor <author@example.com>
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 hello
[side c6c248f] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master cd6bf2b] master
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 

	git merge -s subtree side &&
	for i in mundo $s world; do echo $i; done >expect &&
	test_cmp expect hello
Merging:
cd6bf2b master
virtual side
found 1 common ancestor(s):
00b870c initial
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
[master (root-commit) 326dc33] initial git-gui
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 git-gui.sh
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6029-merge-subtree/git/.git/
[master (root-commit) 3651754] initial git
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
[master af713e3] Merge git-gui as our subdirectory
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
[master2 b929369] update git-gui
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merging:
af713e3 Merge git-gui as our subdirectory
virtual b92936950345d673a301b62996443e86b457dc4a
found 1 common ancestor(s):
326dc33 initial git-gui
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

HEAD is now at af713e3 Merge git-gui as our subdirectory
Already up-to-date.
[master2 c50280f] Merge git-gui2 as our subdirectory
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
HEAD is now at c50280f Merge git-gui2 as our subdirectory
Merging:
c50280f Merge git-gui2 as our subdirectory
virtual b92936950345d673a301b62996443e86b457dc4a
found 1 common ancestor(s):
326dc33 initial git-gui
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

HEAD is now at c50280f Merge git-gui2 as our subdirectory
Merging:
c50280f Merge git-gui2 as our subdirectory
virtual b92936950345d673a301b62996443e86b457dc4a
found 1 common ancestor(s):
326dc33 initial git-gui
Merge made by recursive.
 git-gui2/git-gui.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 8 - merge2 using explicit

# passed all 8 test(s)
1..8

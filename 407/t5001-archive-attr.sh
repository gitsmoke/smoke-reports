Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5001-archive-attr/.git/
expecting success: 
	echo ignored >ignored &&
	echo ignored export-ignore >>.git/info/attributes &&
	git add ignored &&

	echo ignored by tree >ignored-by-tree &&
	echo ignored-by-tree export-ignore >.gitattributes &&
	git add ignored-by-tree .gitattributes &&

	echo ignored by worktree >ignored-by-worktree &&
	echo ignored-by-worktree export-ignore >.gitattributes &&
	git add ignored-by-worktree &&

	printf "A\$Format:%s\$O" "$SUBSTFORMAT" >nosubstfile &&
	printf "A\$Format:%s\$O" "$SUBSTFORMAT" >substfile1 &&
	printf "A not substituted O" >substfile2 &&
	echo "substfile?" export-subst >>.git/info/attributes &&
	git add nosubstfile substfile1 substfile2 &&

	git commit -m. &&

	git clone --bare . bare &&
	cp .git/info/attributes bare/info/attributes
[master (root-commit) 9b25064] .
 Author: A U Thor <author@example.com>
 7 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 .gitattributes
 create mode 100644 ignored
 create mode 100644 ignored-by-tree
 create mode 100644 ignored-by-worktree
 create mode 100644 nosubstfile
 create mode 100644 substfile1
 create mode 100644 substfile2
Cloning into bare repository bare
done.

ok 1 - setup

expecting success: 
	git archive HEAD >archive.tar &&
	(mkdir archive && cd archive && "$TAR" xf -) <archive.tar


ok 2 - git archive

expecting success: test ! -e archive/ignored

ok 3 -  archive/ignored does not exist

expecting success: test ! -e archive/ignored-by-tree

ok 4 -  archive/ignored-by-tree does not exist

expecting success: test -e archive/ignored-by-worktree

ok 5 -  archive/ignored-by-worktree exists

expecting success: 
	git archive --worktree-attributes HEAD >worktree.tar &&
	(mkdir worktree && cd worktree && "$TAR" xf -) <worktree.tar


ok 6 - git archive with worktree attributes

expecting success: test ! -e worktree/ignored

ok 7 -  worktree/ignored does not exist

expecting success: test -e worktree/ignored-by-tree

ok 8 -  worktree/ignored-by-tree exists

expecting success: test ! -e worktree/ignored-by-worktree

ok 9 -  worktree/ignored-by-worktree does not exist

expecting success: 
	(cd bare && git archive HEAD) >bare-archive.tar &&
	test_cmp archive.tar bare-archive.tar


ok 10 - git archive vs. bare

expecting success: 
	(cd bare && git archive --worktree-attributes HEAD) >bare-worktree.tar &&
	(mkdir bare-worktree && cd bare-worktree && "$TAR" xf -) <bare-worktree.tar


ok 11 - git archive with worktree attributes, bare

expecting success: test ! -e bare-worktree/ignored

ok 12 -  bare-worktree/ignored does not exist

expecting success: test -e bare-worktree/ignored-by-tree

ok 13 -  bare-worktree/ignored-by-tree exists

expecting success: test -e bare-worktree/ignored-by-worktree

ok 14 -  bare-worktree/ignored-by-worktree exists

expecting success: 
	git log "--pretty=format:A${SUBSTFORMAT}O" HEAD >substfile1.expected &&
	test_cmp nosubstfile archive/nosubstfile &&
	test_cmp substfile1.expected archive/substfile1 &&
	test_cmp substfile2 archive/substfile2


ok 15 - export-subst

expecting success: 
	git tar-tree HEAD >tar-tree.tar &&
	test_cmp worktree.tar tar-tree.tar


ok 16 - git tar-tree vs. git archive with worktree attributes

expecting success: 
	(cd bare && git tar-tree HEAD) >bare-tar-tree.tar &&
	test_cmp bare-worktree.tar bare-tar-tree.tar


ok 17 - git tar-tree vs. git archive with worktree attrs, bare

# passed all 17 test(s)
1..17

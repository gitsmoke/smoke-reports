Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7001-mv/.git/
expecting success: mkdir path0 path1 &&
     cp "$TEST_DIRECTORY"/../COPYING path0/COPYING &&
     git add path0/COPYING &&
     git commit -m add -a
[master (root-commit) e678f7a] add
 Author: A U Thor <author@example.com>
 1 files changed, 360 insertions(+), 0 deletions(-)
 create mode 100644 path0/COPYING
ok 1 - prepare reference tree

expecting success: cd path0 && git mv COPYING ../path1/COPYING

ok 2 - moving the file out of subdirectory
expecting success: cd .. && git commit -m move-out -a
[master 3709323] move-out
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename {path0 => path1}/COPYING (100%)

ok 3 - commiting the change
expecting success: git diff-tree -r -M --name-status  HEAD^ HEAD | \
    grep "^R100..*path0/COPYING..*path1/COPYING"
R100	path0/COPYING	path1/COPYING

ok 4 - checking the commit

expecting success: cd path0 && git mv ../path1/COPYING COPYING

ok 5 - moving the file back into subdirectory

expecting success: cd .. && git commit -m move-in -a
[master 4ab0026] move-in
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename {path1 => path0}/COPYING (100%)

ok 6 - commiting the change

expecting success: git diff-tree -r -M --name-status  HEAD^ HEAD | \
    grep "^R100..*path1/COPYING..*path0/COPYING"
R100	path1/COPYING	path0/COPYING

ok 7 - checking the commit

expecting success: git mv -k idontexist path0

ok 8 - checking -k on non-existing file

expecting success: touch untracked1 &&
     git mv -k untracked1 path0 &&
     test -f untracked1 &&
     test ! -f path0/untracked1

ok 9 - checking -k on untracked file

expecting success: touch untracked2 &&
     git mv -k untracked1 untracked2 path0 &&
     test -f untracked1 &&
     test -f untracked2 &&
     test ! -f path0/untracked1 &&
     test ! -f path0/untracked2

ok 10 - checking -k on multiple untracked files

expecting success: touch path0/untracked1 &&
     test_must_fail git mv -f untracked1 path0 &&
     test ! -f .git/index.lock &&
     test -f untracked1 &&
     test -f path0/untracked1

ok 11 - checking -f on untracked file with existing target
expecting success: cp "$TEST_DIRECTORY"/../README path0/README &&
     git add path0/README &&
     git commit -m add2 -a
[master 3e0e0fe] add2
 Author: A U Thor <author@example.com>
 1 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 path0/README

ok 12 - adding another file

expecting success: git mv path0 path2

ok 13 - moving whole subdirectory

expecting success: git commit -m dir-move -a
[master de131e4] dir-move
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {path0 => path2}/COPYING (100%)
 rename {path0 => path2}/README (100%)

ok 14 - commiting the change

expecting success: git diff-tree -r -M --name-status  HEAD^ HEAD | \
     grep "^R100..*path0/COPYING..*path2/COPYING" &&
     git diff-tree -r -M --name-status  HEAD^ HEAD | \
     grep "^R100..*path0/README..*path2/README"
R100	path0/COPYING	path2/COPYING
R100	path0/README	path2/README
ok 15 - checking the commit
expecting success: git mv path2/COPYING path2/COPYING-renamed
ok 16 - succeed when source is a prefix of destination

expecting success: git mv path2 path1

ok 17 - moving whole subdirectory into subdirectory

expecting success: git commit -m dir-move -a
[master 70b0734] dir-move
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename path2/COPYING => path1/path2/COPYING-renamed (100%)
 rename {path2 => path1/path2}/README (100%)

ok 18 - commiting the change

expecting success: git diff-tree -r -M --name-status  HEAD^ HEAD | \
     grep "^R100..*path2/COPYING..*path1/path2/COPYING" &&
     git diff-tree -r -M --name-status  HEAD^ HEAD | \
     grep "^R100..*path2/README..*path1/path2/README"
R100	path2/COPYING	path1/path2/COPYING-renamed
R100	path2/README	path1/path2/README

ok 19 - checking the commit

expecting success: mkdir path0 && mkdir path0/path2 && test_must_fail git mv path2 path0

ok 20 - do not move directory over existing directory

expecting success: git mv path1/path2/ .

ok 21 - move into "."

expecting success: 
	rm -fr .git papers partA &&
	git init &&
	mkdir -p papers/unsorted papers/all-papers partA &&
	echo a > papers/unsorted/Thesis.pdf &&
	echo b > partA/outline.txt &&
	echo c > papers/unsorted/_another &&
	git add papers partA &&
	T1=`git write-tree` &&

	git mv papers/unsorted/Thesis.pdf papers/all-papers/moo-blah.pdf &&

	T=`git write-tree` &&
	git ls-tree -r $T | grep partA/outline.txt || {
		git ls-tree -r $T
		(exit 1)
	}
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7001-mv/.git/
100644 blob 61780798228d17af2d34fce4cfbdf35556832472	partA/outline.txt

ok 22 - Michael Cassar's test case
expecting success: 
	rm -fr .git &&
	git init &&
	mkdir ab &&
	date >ab.c &&
	date >ab/d &&
	git add ab.c ab &&
	git commit -m initial &&
	git mv ab a
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7001-mv/.git/
[master (root-commit) f5cd360] initial
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 ab.c
 create mode 100644 ab/d

ok 23 - Sergey Vlasov's test case

expecting success: (

	rm -fr mine &&
	mkdir mine &&
	cd mine &&
	test_create_repo one &&
	cd one &&
	mkdir sub &&
	>sub/file &&
	git add sub/file &&

	git mv sub "$(pwd)/in" &&
	! test -d sub &&
	test -d in &&
	git ls-files --error-unmatch in/file


)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7001-mv/mine/one/.git/
in/file

ok 24 - absolute pathname

expecting success: (

	rm -fr mine &&
	mkdir mine &&
	cd mine &&
	out=$(pwd) &&
	test_create_repo one &&
	cd one &&
	mkdir sub &&
	>sub/file &&
	git add sub/file &&

	test_must_fail git mv sub "$out/out" &&
	test -d sub &&
	! test -d ../in &&
	git ls-files --error-unmatch sub/file

)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7001-mv/mine/one/.git/
sub/file

ok 25 - absolute pathname outside should fail

expecting success: 
	rm -fr .git && git init &&
	mkdir dir other &&
	>dir/a.txt &&
	>dir/b.txt &&
	git add dir/?.txt &&
	git mv dir/a.txt dir/b.txt other &&
	git ls-files >actual &&
	{ echo other/a.txt; echo other/b.txt; } >expect &&
	test_cmp expect actual

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7001-mv/.git/

ok 26 - git mv to move multiple sources into a directory

expecting success: 

	rm -fr .git &&
	git init &&
	echo 1 >dirty &&
	git add dirty &&
	entry="$(git ls-files --stage dirty | cut -f 1)" &&
	git mv dirty dirty2 &&
	[ "$entry" = "$(git ls-files --stage dirty2 | cut -f 1)" ] &&
	echo 2 >dirty2 &&
	git mv dirty2 dirty &&
	[ "$entry" = "$(git ls-files --stage dirty | cut -f 1)" ]


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7001-mv/.git/

ok 27 - git mv should not change sha1 of moved cache entry

expecting success: 

	rm -fr .git &&
	git init &&
	echo 1 >moved &&
	ln -s moved symlink &&
	git add moved symlink &&
	test_must_fail git mv moved symlink &&
	git mv -f moved symlink &&
	! test -e moved &&
	test -f symlink &&
	test "$(cat symlink)" = 1 &&
	git update-index --refresh &&
	git diff-files --quiet


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7001-mv/.git/

ok 28 - git mv should overwrite symlink to a file

expecting success: 

	rm -fr .git &&
	git init &&
	echo 1 >moved &&
	ln -s moved symlink &&
	git add moved symlink &&
	test_must_fail git mv symlink moved &&
	git mv -f symlink moved &&
	! test -e symlink &&
	test -h moved &&
	git update-index --refresh &&
	git diff-files --quiet
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7001-mv/.git/
ok 29 - git mv should overwrite file with a symlink
# passed all 29 test(s)
1..29

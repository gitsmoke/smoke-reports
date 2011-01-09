Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9350-fast-export/.git/
expecting success: 

	echo break it > file0 &&
	git add file0 &&
	test_tick &&
	echo Wohlauf > file &&
	git add file &&
	test_tick &&
	git commit -m initial &&
	echo die Luft > file &&
	echo geht frisch > file2 &&
	git add file file2 &&
	test_tick &&
	git commit -m second &&
	echo und > file2 &&
	test_tick &&
	git commit -m third file2 &&
	test_tick &&
	git tag rein &&
	git checkout -b wer HEAD^ &&
	echo lange > file2 &&
	test_tick &&
	git commit -m sitzt file2 &&
	test_tick &&
	git tag -a -m valentin muss &&
	git merge -s ours master


[master (root-commit) 283ea05] initial
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file
 create mode 100644 file0
[master 300cb83] second
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 1 deletions(-)
 create mode 100644 file2
[master 80f15f4] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[wer 708f3c9] sitzt
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merge made by ours.

ok 1 - setup

expecting success: 

	MASTER=$(git rev-parse --verify master) &&
	REIN=$(git rev-parse --verify rein) &&
	WER=$(git rev-parse --verify wer) &&
	MUSS=$(git rev-parse --verify muss) &&
	mkdir new &&
	git --git-dir=new/.git init &&
	git fast-export --all |
	(cd new &&
	 git fast-import &&
	 test $MASTER = $(git rev-parse --verify refs/heads/master) &&
	 test $REIN = $(git rev-parse --verify refs/tags/rein) &&
	 test $WER = $(git rev-parse --verify refs/heads/wer) &&
	 test $MUSS = $(git rev-parse --verify refs/tags/muss))


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9350-fast-export/new/.git/

ok 2 - fast-export | fast-import

expecting success: 

	git fast-export master~2..master |
		sed "s/master/partial/" |
		(cd new &&
		 git fast-import &&
		 test $MASTER != $(git rev-parse --verify refs/heads/partial) &&
		 git diff --exit-code master partial &&
		 git diff --exit-code master^ partial^ &&
		 test_must_fail git rev-parse partial~2)


partial~2

ok 3 - fast-export master~2..master

expecting success: 

	git config i18n.commitencoding ISO8859-1 &&
	# use author and committer name in ISO-8859-1 to match it.
	. "$TEST_DIRECTORY"/t3901-8859-1.txt &&
	test_tick &&
	echo rosten >file &&
	git commit -s -m den file &&
	git fast-export wer^..wer |
		sed "s/wer/i18n/" |
		(cd new &&
		 git fast-import &&
		 git cat-file commit i18n | grep "√Å√©√≠ √≥√∫")


[wer 4b98d28] den
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Signed-off-by: √Å√©√≠ √≥√∫ <committer@example.com>

ok 4 - iso-8859-1

expecting success: 

	git checkout -b marks master &&
	git fast-export --export-marks=tmp-marks HEAD &&
	test -s tmp-marks &&
	test $(wc -l < tmp-marks) -eq 3 &&
	test $(
		git fast-export --import-marks=tmp-marks\
		--export-marks=tmp-marks HEAD |
		grep ^commit |
		wc -l) \
	-eq 0 &&
	echo change > file &&
	git commit -m "last commit" file &&
	test $(
		git fast-export --import-marks=tmp-marks \
		--export-marks=tmp-marks HEAD |
		grep ^commit\  |
		wc -l) \
	-eq 1 &&
	test $(wc -l < tmp-marks) -eq 4


blob
mark :1
data 8
Wohlauf

blob
mark :2
data 9
break it

reset refs/heads/marks
commit refs/heads/marks
mark :3
author A U Thor <author@example.com> 1112912053 -0700
committer C O Mitter <committer@example.com> 1112912053 -0700
data 8
initial
M 100644 :2 file0
M 100644 :1 file

blob
mark :4
data 9
die Luft

blob
mark :5
data 12
geht frisch

commit refs/heads/marks
mark :6
author A U Thor <author@example.com> 1112912113 -0700
committer C O Mitter <committer@example.com> 1112912113 -0700
data 7
second
from :3
M 100644 :5 file2
M 100644 :4 file

blob
mark :7
data 4
und

commit refs/heads/marks
mark :8
author A U Thor <author@example.com> 1112912173 -0700
committer C O Mitter <committer@example.com> 1112912173 -0700
data 6
third
from :6
M 100644 :7 file2

[marks 980bbeb] last commit
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 5 - import/export-marks

expecting success: 

	cat signed-tag-import | git fast-import



ok 6 - set up faked signed tag

expecting success: 

	test_must_fail git fast-export --signed-tags=abort sign-your-name


blob
mark :1
data 8
Wohlauf

blob
mark :2
data 9
break it

reset refs/tags/sign-your-name
commit refs/tags/sign-your-name
mark :3
author A U Thor <author@example.com> 1112912053 -0700
committer C O Mitter <committer@example.com> 1112912053 -0700
data 8
initial
M 100644 :2 file0
M 100644 :1 file

blob
mark :4
data 9
die Luft

blob
mark :5
data 12
geht frisch

commit refs/tags/sign-your-name
mark :6
author A U Thor <author@example.com> 1112912113 -0700
committer C O Mitter <committer@example.com> 1112912113 -0700
data 7
second
from :3
M 100644 :5 file2
M 100644 :4 file

blob
mark :7
data 4
und

commit refs/tags/sign-your-name
mark :8
author A U Thor <author@example.com> 1112912173 -0700
committer C O Mitter <committer@example.com> 1112912173 -0700
data 6
third
from :6
M 100644 :7 file2

blob
mark :9
data 7
change

commit refs/tags/sign-your-name
mark :10
author ¡ÈÌ Û˙ <author@example.com> 1112912413 -0700
committer ¡ÈÌ Û˙ <committer@example.com> 1112912413 -0700
data 12
last commit
from :8
M 100644 :9 file


ok 7 - signed-tags=abort

expecting success: 

	git fast-export --signed-tags=verbatim sign-your-name > output &&
	grep PGP output


-----BEGIN PGP SIGNATURE-----
-----END PGP SIGNATURE-----

ok 8 - signed-tags=verbatim

expecting success: 

	git fast-export --signed-tags=strip sign-your-name > output &&
	! grep PGP output



ok 9 - signed-tags=strip

expecting success: 

	git checkout -f master &&
	mkdir sub &&
	(
		cd sub &&
		git init  &&
		echo test file > file &&
		git add file &&
		git commit -m sub_initial
	) &&
	git submodule add "`pwd`/sub" sub &&
	git commit -m initial &&
	test_tick &&
	(
		cd sub &&
		echo more data >> file &&
		git add file &&
		git commit -m sub_second
	) &&
	git add sub &&
	git commit -m second


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9350-fast-export/sub/.git/
[master (root-commit) 14e5724] sub_initial
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
Adding existing repo at 'sub' to the index
[master b0694e9] initial
 Author: ¡ÈÌ Û˙ <author@example.com>
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 .gitmodules
 create mode 160000 sub
[master f9f645c] sub_second
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 16b5d79] second
 Author: ¡ÈÌ Û˙ <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 10 - setup submodule

expecting success: 

	SUBENT1=$(git ls-tree master^ sub) &&
	SUBENT2=$(git ls-tree master sub) &&
	rm -rf new &&
	mkdir new &&
	git --git-dir=new/.git init &&
	git fast-export --signed-tags=strip --all |
	(cd new &&
	 git fast-import &&
	 test "$SUBENT1" = "$(git ls-tree refs/heads/master^ sub)" &&
	 test "$SUBENT2" = "$(git ls-tree refs/heads/master sub)" &&
	 git checkout master &&
	 git submodule init &&
	 git submodule update &&
	 cmp sub/file ../sub/file)


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9350-fast-export/new/.git/
Submodule 'sub' (/Users/trast/git-smoke/t/trash directory.t9350-fast-export/sub) registered for path 'sub'
Cloning into sub...
done.
Submodule path 'sub': checked out 'f9f645c02fe9edff6ecee2c48d1ed3ad0c9e82e6'

ok 11 - submodule fast-export | fast-import

expecting success: 

	git config --unset i18n.commitencoding &&
	git checkout -b copy rein &&
	git mv file file3 &&
	git commit -m move1 &&
	test_tick &&
	cp file2 file4 &&
	git add file4 &&
	git mv file2 file5 &&
	git commit -m copy1 &&
	test_tick &&
	cp file3 file6 &&
	git add file6 &&
	git commit -m copy2 &&
	test_tick &&
	echo more text >> file6 &&
	echo even more text >> file6 &&
	git add file6 &&
	git commit -m modify &&
	test_tick &&
	cp file6 file7 &&
	echo test >> file7 &&
	git add file7 &&
	git commit -m copy_modify
[copy 16740da] move1
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename file => file3 (100%)
[copy 0d83758] copy1
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 0 deletions(-)
 copy file2 => file4 (100%)
 rename file2 => file5 (100%)
[copy 44ca68a] copy2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file6
[copy 22ab272] modify
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
[copy ed9d1ab] copy_modify
 Author: A U Thor <author@example.com>
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 file7

ok 12 - setup copies

expecting success: 

	ENTRY=$(git rev-parse --verify copy) &&
	rm -rf new &&
	mkdir new &&
	git --git-dir=new/.git init &&
	git fast-export -C -C --signed-tags=strip --all > output &&
	grep "^C \"file6\" \"file7\"\$" output &&
	cat output |
	(cd new &&
	 git fast-import &&
	 test $ENTRY = $(git rev-parse --verify refs/heads/copy))


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9350-fast-export/new/.git/
C "file6" "file7"

ok 13 - fast-export -C -C | fast-import

expecting success: 

	git tag -m msg last &&
	git fast-export -C -C --signed-tags=strip --all > output &&
	test $(grep -c "^tag " output) = 3



ok 14 - fast-export | fast-import when master is tagged

expecting success: 

	TAG=$(git hash-object -t tag -w tag-content) &&
	git update-ref refs/tags/sonnenschein $TAG &&
	git fast-export -C -C --signed-tags=strip --all > output &&
	test $(grep -c "^tag " output) = 4 &&
	! grep "Unspecified Tagger" output &&
	git fast-export -C -C --signed-tags=strip --all \
		--fake-missing-tagger > output &&
	test $(grep -c "^tag " output) = 4 &&
	grep "Unspecified Tagger" output


tagger Unspecified Tagger <unspecified-tagger> 0 +0000

ok 15 - cope with tagger-less tags

expecting success: 
	mkdir limit-by-paths &&
	(
		cd limit-by-paths &&
		git init &&
		echo hi > there &&
		git add there &&
		git commit -m "First file" &&
		echo foo > bar &&
		git add bar &&
		git commit -m "Second file" &&
		git tag -a -m msg mytag &&
		echo morefoo >> bar &&
		git add bar &&
		git commit -m "Change to second file"
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9350-fast-export/limit-by-paths/.git/
[master (root-commit) c4bb517] First file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 there
[master 5b2b7c2] Second file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 bar
[master 49ac088] Change to second file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 16 - setup for limiting exports by PATH

expecting success: 
(
	cd limit-by-paths &&
	git fast-export --tag-of-filtered-object=drop mytag -- there > output &&
	test_cmp output expected
)


ok 17 - dropping tag of filtered out object

expecting success: 
(
	cd limit-by-paths &&
	git fast-export --tag-of-filtered-object=rewrite mytag -- there > output &&
	test_cmp output expected
)


ok 18 - rewriting tag of filtered out object

checking known breakage: 
	(
		cd limit-by-paths &&
		git fast-export master~2..master~1 > output &&
		test_cmp output expected
	)

--- output	2011-01-09 04:04:59.000000000 +0000
+++ expected	2011-01-09 04:04:59.000000000 +0000
@@ -8,7 +8,8 @@
 data 3
 hi
 
-commit master~1
+reset refs/heads/master
+commit refs/heads/master
 mark :3
 author A U Thor <author@example.com> 1112912713 -0700
 committer C O Mitter <committer@example.com> 1112912713 -0700

not ok 19 - no exact-ref revisions included # TODO known breakage

expecting success: 
	git checkout -b simple marks~2 &&
	git fast-export --export-marks=marks simple -- file > /dev/null &&
	echo more content >> file &&
	test_tick &&
	git commit -mnext file &&
	git fast-export --import-marks=marks simple -- file file0 | grep file0

[simple ed6c25d] next
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
M 100644 :6 file0

ok 20 - path limiting with import-marks does not lose unmodified files

expecting success: 
	git checkout -f simple &&
	test $(git fast-export --full-tree simple | grep -c file0) -eq 3


ok 21 - full-tree re-shows unmodified files

expecting success: 
	git checkout -f master &&
	HEAD_TREE=`git show -s --pretty=raw HEAD | grep tree | sed "s/tree //"` &&
	git tag    tree_tag        -m "tagging a tree" $HEAD_TREE &&
	git tag -a tree_tag-obj    -m "tagging a tree" $HEAD_TREE &&
	git tag    tag-obj_tag     -m "tagging a tag" tree_tag-obj &&
	git tag -a tag-obj_tag-obj -m "tagging a tag" tree_tag-obj


ok 22 - set-up a few more tags for tag export tests

expecting success: 
	mkdir result &&
	(cd result && git init) &&
	git fast-export tree_tag > fe-stream &&
	(cd result && git fast-import < ../fe-stream)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9350-fast-export/result/.git/

ok 23 - tree_tag

expecting success: git fast-export tree_tag-obj

ok 24 - tree_tag-obj

expecting success: git fast-export tag-obj_tag

ok 25 - tag-obj_tag

expecting success: git fast-export tag-obj_tag-obj

ok 26 - tag-obj_tag-obj

expecting success: 
	git init dirtosymlink &&
	git init result &&
	(
		cd dirtosymlink &&
		mkdir foo &&
		mkdir bar &&
		echo hello > foo/world &&
		echo hello > bar/world &&
		git add foo/world bar/world &&
		git commit -q -mone &&
		git rm -r foo &&
		ln -s bar foo &&
		git add foo &&
		git commit -q -mtwo
	) &&
	(
		cd dirtosymlink &&
		git fast-export master -- foo |
		(cd ../result && git fast-import --quiet)
	) &&
	(cd result && git show master:foo)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9350-fast-export/dirtosymlink/.git/
Reinitialized existing Git repository in /Users/trast/git-smoke/t/trash directory.t9350-fast-export/result/.git/
rm 'foo/world'
bar
ok 27 - directory becomes symlink

# still have 1 known breakage(s)
# passed all remaining 26 test(s)
1..27

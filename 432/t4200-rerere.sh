Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4200-rerere/.git/
expecting success: 
	cat >a1 <<-\EOF &&
	Some title
	==========
	Whether 'tis nobler in the mind to suffer
	The slings and arrows of outrageous fortune,
	Or to take arms against a sea of troubles,
	And by opposing end them? To die: to sleep;
	No more; and by a sleep to say we end
	The heart-ache and the thousand natural shocks
	That flesh is heir to, 'tis a consummation
	Devoutly to be wish'd.
	EOF

	git add a1 &&
	test_tick &&
	git commit -q -a -m initial &&

	cat >>a1 <<-\EOF &&
	Some title
	==========
	To die, to sleep;
	To sleep: perchance to dream: ay, there's the rub;
	For in that sleep of death what dreams may come
	When we have shuffled off this mortal coil,
	Must give us pause: there's the respect
	That makes calamity of so long life;
	EOF

	git checkout -b first &&
	test_tick &&
	git commit -q -a -m first &&

	git checkout -b second master &&
	git show first:a1 |
	sed -e "s/To die, t/To die! T/" -e "s/Some title/Some Title/" >a1 &&
	echo "* END *" >>a1 &&
	test_tick &&
	git commit -q -a -m second
M	a1

ok 1 - setup

expecting success: 
	rm -rf .git/rr-cache &&
	git config rerere.enabled false &&
	test_must_fail git merge first &&
	! test -d .git/rr-cache

Merging:
fcd23fa second
virtual first
found 1 common ancestor(s):
70749e0 initial
Auto-merging a1
CONFLICT (content): Merge conflict in a1
Automatic merge failed; fix conflicts and then commit the result.

ok 2 - nothing recorded without rerere

expecting success: 
	git reset --hard &&
	mkdir .git/rr-cache &&
	test_might_fail git config --unset rerere.enabled &&
	test_must_fail git merge first &&

	sha1=$(perl -pe "s/	.*//" .git/MERGE_RR) &&
	rr=.git/rr-cache/$sha1 &&
	grep "^=======\$" $rr/preimage &&
	! test -f $rr/postimage &&
	! test -f $rr/thisimage

HEAD is now at fcd23fa second
Merging:
fcd23fa second
virtual first
found 1 common ancestor(s):
70749e0 initial
Auto-merging a1
CONFLICT (content): Merge conflict in a1
Automatic merge failed; fix conflicts and then commit the result.
=======
=======

ok 3 - activate rerere, old style (conflicting merge)

expecting success: 
	rm -rf .git/rr-cache &&
	git config rerere.enabled true &&
	git reset --hard &&
	test_must_fail git merge first &&

	sha1=$(perl -pe "s/	.*//" .git/MERGE_RR) &&
	rr=.git/rr-cache/$sha1 &&
	grep ^=======$ $rr/preimage
HEAD is now at fcd23fa second
Merging:
fcd23fa second
virtual first
found 1 common ancestor(s):
70749e0 initial
Auto-merging a1
CONFLICT (content): Merge conflict in a1
Automatic merge failed; fix conflicts and then commit the result.
=======
=======

ok 4 - rerere.enabled works, too

expecting success: 
	rm -rf .git/rr-cache &&
	git config rerere.enabled true &&
	git reset --hard &&
	test_must_fail git merge first &&
	sha1=$(perl -pe "s/	.*//" .git/MERGE_RR) &&
	rr=.git/rr-cache/$sha1

HEAD is now at fcd23fa second
Merging:
fcd23fa second
virtual first
found 1 common ancestor(s):
70749e0 initial
Auto-merging a1
CONFLICT (content): Merge conflict in a1
Automatic merge failed; fix conflicts and then commit the result.

ok 5 - set up rr-cache

expecting success: 
	# no postimage or thisimage yet
	! test -f $rr/postimage &&
	! test -f $rr/thisimage &&

	# preimage has right number of lines
	cnt=$(sed -ne "/^<<<<<<</,/^>>>>>>>/p" $rr/preimage | wc -l) &&
	echo $cnt &&
	test $cnt = 13

13

ok 6 - rr-cache looks sane

expecting success: 
	git show first:a1 >a1 &&
	cat >expect <<-\EOF &&
	--- a/a1
	+++ b/a1
	@@ -1,4 +1,4 @@
	-Some Title
	+Some title
	 ==========
	 Whether 'tis nobler in the mind to suffer
	 The slings and arrows of outrageous fortune,
	@@ -8,21 +8,11 @@
	 The heart-ache and the thousand natural shocks
	 That flesh is heir to, 'tis a consummation
	 Devoutly to be wish'd.
	-<<<<<<<
	-Some Title
	-==========
	-To die! To sleep;
	-=======
	 Some title
	 ==========
	 To die, to sleep;
	->>>>>>>
	 To sleep: perchance to dream: ay, there's the rub;
	 For in that sleep of death what dreams may come
	 When we have shuffled off this mortal coil,
	 Must give us pause: there's the respect
	 That makes calamity of so long life;
	-<<<<<<<
	-=======
	-* END *
	->>>>>>>
	EOF
	git rerere diff >out &&
	test_cmp expect out


ok 7 - rerere diff

expecting success: 
	echo a1 >expect &&
	git rerere status >out &&
	test_cmp expect out


ok 8 - rerere status

expecting success: 
	git show first:a1 | sed "s/To die: t/To die! T/" >expect &&

	git commit -q -a -m "prefer first over second" &&
	test -f $rr/postimage &&

	oldmtimepost=$(test-chmtime -v -60 $rr/postimage | cut -f 1) &&

	git checkout -b third master &&
	git show second^:a1 | sed "s/To die: t/To die! T/" >a1 &&
	git commit -q -a -m third &&

	test_must_fail git pull . first &&
	# rerere kicked in
	! grep "^=======\$" a1 &&
	test_cmp expect a1
Merging:
40cb797 third
virtual 424b91b4b0ded80dcd3aa2541396dda350332a2c
found 1 common ancestor(s):
70749e0 initial
Auto-merging a1
CONFLICT (content): Merge conflict in a1
Automatic merge failed; fix conflicts and then commit the result.

ok 9 - first postimage wins

expecting success: 
	newmtimepost=$(test-chmtime -v +0 $rr/postimage | cut -f 1) &&
	test $oldmtimepost -lt $newmtimepost

ok 10 - rerere updates postimage timestamp

expecting success: 
	rm $rr/postimage &&
	echo "$sha1	a1" | perl -pe "y/
/ /" >.git/MERGE_RR &&
	git rerere clear &&
	! test -d $rr

ok 11 - rerere clear

expecting success: 
	mkdir -p $rr &&
	echo Hello >$rr/preimage &&
	echo World >$rr/postimage &&

	sha2=4000000000000000000000000000000000000000 &&
	rr2=.git/rr-cache/$sha2 &&
	mkdir $rr2 &&
	echo Hello >$rr2/preimage &&

	almost_15_days_ago=$((60-15*86400)) &&
	just_over_15_days_ago=$((-1-15*86400)) &&
	almost_60_days_ago=$((60-60*86400)) &&
	just_over_60_days_ago=$((-1-60*86400)) &&

	test-chmtime =$just_over_60_days_ago $rr/preimage &&
	test-chmtime =$almost_60_days_ago $rr/postimage &&
	test-chmtime =$almost_15_days_ago $rr2/preimage

ok 12 - set up for garbage collection tests

expecting success: 
	git rerere gc &&
	test -f $rr/preimage &&
	test -f $rr2/preimage

ok 13 - gc preserves young or recently used records

expecting success: 
	test-chmtime =$just_over_60_days_ago $rr/postimage &&
	test-chmtime =$just_over_15_days_ago $rr2/preimage &&
	git rerere gc &&
	! test -f $rr/preimage &&
	! test -f $rr2/preimage

ok 14 - old records rest in peace

expecting success: 
	git reset --hard &&

	git checkout -b fourth &&
	echo Hallo >file2 &&
	git add file2 &&
	test_tick &&
	git commit -m version1 &&

	git checkout third &&
	echo Bello >file2 &&
	git add file2 &&
	test_tick &&
	git commit -m version2 &&

	test_must_fail git merge fourth &&
	echo Cello >file2 &&
	git add file2 &&
	git commit -m resolution
HEAD is now at 40cb797 third
[fourth 26401ec] version1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
[third 1f50303] version2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file2
Merging:
1f50303 version2
virtual fourth
found 1 common ancestor(s):
40cb797 third
Auto-merging file2
CONFLICT (add/add): Merge conflict in file2
Automatic merge failed; fix conflicts and then commit the result.
[third e9acb28] resolution
 Author: A U Thor <author@example.com>

ok 15 - setup: file2 added differently in two branches

expecting success: 
	echo Cello >expected &&

	git reset --hard HEAD~2 &&
	git checkout -b fifth &&

	echo Hallo >file3 &&
	git add file3 &&
	test_tick &&
	git commit -m version1 &&

	git checkout third &&
	echo Bello >file3 &&
	git add file3 &&
	test_tick &&
	git commit -m version2 &&
	git tag version2 &&

	test_must_fail git merge fifth &&
	test_cmp expected file3 &&
	test_must_fail git update-index --refresh

HEAD is now at 40cb797 third
[fifth 9b6b3c4] version1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file3
[third 7eec302] version2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file3
Merging:
7eec302 version2
virtual fifth
found 1 common ancestor(s):
40cb797 third
Auto-merging file3
CONFLICT (add/add): Merge conflict in file3
Automatic merge failed; fix conflicts and then commit the result.
file3: needs merge

ok 16 - resolution was recorded properly

expecting success: 
	git config rerere.autoupdate true &&
	git reset --hard &&
	git checkout version2 &&
	test_must_fail git merge fifth &&
	git update-index --refresh
HEAD is now at 7eec302 version2
Merging:
7eec302 version2
virtual fifth
found 1 common ancestor(s):
40cb797 third
Auto-merging file3
CONFLICT (add/add): Merge conflict in file3
Automatic merge failed; fix conflicts and then commit the result.
ok 17 - rerere.autoupdate
expecting success: 
	test_might_fail git config --unset rerere.autoupdate &&
	git reset --hard &&
	git checkout version2 &&
	test_must_fail git merge --rerere-autoupdate fifth &&
	git update-index --refresh
HEAD is now at 7eec302 version2
Merging:
7eec302 version2
virtual fifth
found 1 common ancestor(s):
40cb797 third
Auto-merging file3
CONFLICT (add/add): Merge conflict in file3
Automatic merge failed; fix conflicts and then commit the result.

ok 18 - merge --rerere-autoupdate

expecting success: 
	headblob=$(git rev-parse version2:file3) &&
	mergeblob=$(git rev-parse fifth:file3) &&
	cat >expected <<-EOF &&
	100644 $headblob 2	file3
	100644 $mergeblob 3	file3
	EOF

	git config rerere.autoupdate true &&
	git reset --hard &&
	git checkout version2 &&
	test_must_fail git merge --no-rerere-autoupdate fifth &&
	git ls-files -u >actual &&
	test_cmp expected actual
HEAD is now at 7eec302 version2
Merging:
7eec302 version2
virtual fifth
found 1 common ancestor(s):
40cb797 third
Auto-merging file3
CONFLICT (add/add): Merge conflict in file3
Automatic merge failed; fix conflicts and then commit the result.

ok 19 - merge --no-rerere-autoupdate

expecting success: 
	headblob=$(git rev-parse version2:file3) &&
	mergeblob=$(git rev-parse fifth:file3) &&
	cat >expected.unresolved <<-EOF &&
	100644 $headblob 2	file3
	100644 $mergeblob 3	file3
	EOF

	test_might_fail git config --unset rerere.autoupdate &&
	git reset --hard &&
	git checkout version2 &&
	fifth=$(git rev-parse fifth) &&
	echo "$fifth		branch fifth of ." |
	git fmt-merge-msg >msg &&
	ancestor=$(git merge-base version2 fifth) &&
	test_must_fail git merge-recursive "$ancestor" -- HEAD fifth &&

	git ls-files --stage >failedmerge &&
	cp file3 file3.conflict &&

	git ls-files -u >actual &&
	test_cmp expected.unresolved actual
HEAD is now at 7eec302 version2
Merging HEAD with fifth
Merging:
7eec302 version2
9b6b3c4 version1
found 1 common ancestor(s):
40cb797 third
Auto-merging file3
CONFLICT (add/add): Merge conflict in file3

ok 20 - set up an unresolved merge

expecting success: 
	test_might_fail git config --unset rerere.autoupdate &&
	git rm -fr --cached . &&
	git update-index --index-info <failedmerge &&
	cp file3.conflict file3 &&
	test_must_fail git update-index --refresh -q &&

	git rerere &&
	git ls-files -u >actual &&
	test_cmp expected.unresolved actual

file3: needs merge
rm 'a1'
rm 'file3'
rm 'file3'
file3: needs merge

ok 21 - explicit rerere

expecting success: 
	git config rerere.autoupdate true &&
	git rm -fr --cached . &&
	git update-index --index-info <failedmerge &&
	cp file3.conflict file3 &&
	test_must_fail git update-index --refresh -q &&

	git rerere &&
	git update-index --refresh

file3: needs merge
rm 'a1'
rm 'file3'
rm 'file3'
file3: needs merge

ok 22 - explicit rerere with autoupdate

expecting success: 
	git config rerere.autoupdate false &&
	git rm -fr --cached . &&
	git update-index --index-info <failedmerge &&
	cp file3.conflict file3 &&
	git rerere &&
	git ls-files -u >actual1 &&

	git rm -fr --cached . &&
	git update-index --index-info <failedmerge &&
	cp file3.conflict file3 &&
	git rerere --rerere-autoupdate &&
	git update-index --refresh &&

	git rm -fr --cached . &&
	git update-index --index-info <failedmerge &&
	cp file3.conflict file3 &&
	git rerere --rerere-autoupdate --no-rerere-autoupdate &&
	git ls-files -u >actual2 &&

	git rm -fr --cached . &&
	git update-index --index-info <failedmerge &&
	cp file3.conflict file3 &&
	git rerere --rerere-autoupdate --no-rerere-autoupdate --rerere-autoupdate &&
	git update-index --refresh &&

	test_cmp expected.unresolved actual1 &&
	test_cmp expected.unresolved actual2

rm 'a1'
rm 'file3'
file3: needs merge
rm 'a1'
rm 'file3'
rm 'file3'
rm 'a1'
rm 'file3'
file3: needs merge
rm 'a1'
rm 'file3'
rm 'file3'

ok 23 - explicit rerere --rerere-autoupdate overrides

expecting success: 
	git rm -fr --cached . &&
	git update-index --index-info <failedmerge &&
	cp file3.conflict file3 &&
	test_must_fail git rerere --no-no-rerere-autoupdate 2>err &&
	grep [Uu]sage err &&
	test_must_fail git update-index --refresh

rm 'a1'
rm 'file3'
usage: git rerere [clear | status | remaining | diff | gc]
file3: needs merge

ok 24 - rerere --no-no-rerere-autoupdate

expecting success: 
	test_must_fail git rerere -h >help &&
	grep [Uu]sage help

usage: git rerere [clear | status | remaining | diff | gc]

ok 25 - rerere -h

# passed all 25 test(s)
1..25

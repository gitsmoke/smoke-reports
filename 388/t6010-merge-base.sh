Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6010-merge-base/.git/
expecting success: 
	T=$(git write-tree) &&

	M=1130000000 &&
	Z=+0000 &&

	GIT_COMMITTER_EMAIL=git@comm.iter.xz &&
	GIT_COMMITTER_NAME="C O Mmiter" &&
	GIT_AUTHOR_NAME="A U Thor" &&
	GIT_AUTHOR_EMAIL=git@au.thor.xz &&
	export GIT_COMMITTER_EMAIL GIT_COMMITTER_NAME GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL &&

	doit() {
		OFFSET=$1 &&
		NAME=$2 &&
		shift 2 &&

		PARENTS= &&
		for P
		do
			PARENTS="${PARENTS}-p $P "
		done &&

		GIT_COMMITTER_DATE="$(($M + $OFFSET)) $Z" &&
		GIT_AUTHOR_DATE=$GIT_COMMITTER_DATE &&
		export GIT_COMMITTER_DATE GIT_AUTHOR_DATE &&

		commit=$(echo $NAME | git commit-tree $T $PARENTS) &&

		echo $commit >.git/refs/tags/$NAME &&
		echo $commit
	}

ok 1 - setup

expecting success: 
	# E---D---C---B---A
	# \"-_         \   \
	#  \  `---------G   \
	#   \                \
	#    F----------------H
	E=$(doit 5 E) &&
	D=$(doit 4 D $E) &&
	F=$(doit 6 F $E) &&
	C=$(doit 3 C $D) &&
	B=$(doit 2 B $C) &&
	A=$(doit 1 A $B) &&
	G=$(doit 7 G $B $E) &&
	H=$(doit 8 H $A $F)

ok 2 - set up G and H

expecting success: 
	git name-rev $B >expected &&

	MB=$(git merge-base G H) &&
	git name-rev "$MB" >actual.single &&

	MB=$(git merge-base --all G H) &&
	git name-rev "$MB" >actual.all &&

	MB=$(git show-branch --merge-base G H) &&
	git name-rev "$MB" >actual.sb &&

	test_cmp expected actual.single &&
	test_cmp expected actual.all &&
	test_cmp expected actual.sb

ok 3 - merge-base G H

expecting success: 
	git name-rev "$H" >expected1 &&
	git name-rev "$H" "$G" >expected2 &&

	parents=$(git merge-base --independent H) &&
	git name-rev $parents >actual1.mb &&
	parents=$(git merge-base --independent A H G) &&
	git name-rev $parents >actual2.mb &&

	parents=$(git show-branch --independent H) &&
	git name-rev $parents >actual1.sb &&
	parents=$(git show-branch --independent A H G) &&
	git name-rev $parents >actual2.sb &&

	test_cmp expected1 actual1.mb &&
	test_cmp expected2 actual2.mb &&
	test_cmp expected1 actual1.sb &&
	test_cmp expected2 actual2.sb

ok 4 - merge-base/show-branch --independent

expecting success: 
	# This test is to demonstrate that relying on timestamps in a distributed
	# SCM to provide a _consistent_ partial ordering of commits leads to
	# insanity.
	#
	#               Relative
	# Structure     timestamps
	#
	#   PL  PR        +4  +4
	#  /  \/  \      /  \/  \
	# L2  C2  R2    +3  -1  +3
	# |   |   |     |   |   |
	# L1  C1  R1    +2  -2  +2
	# |   |   |     |   |   |
	# L0  C0  R0    +1  -3  +1
	#   \ |  /        \ |  /
	#     S             0
	#
	# The left and right chains of commits can be of any length and complexity as
	# long as all of the timestamps are greater than that of S.

	S=$(doit  0 S) &&

	C0=$(doit -3 C0 $S) &&
	C1=$(doit -2 C1 $C0) &&
	C2=$(doit -1 C2 $C1) &&

	L0=$(doit  1 L0 $S) &&
	L1=$(doit  2 L1 $L0) &&
	L2=$(doit  3 L2 $L1) &&

	R0=$(doit  1 R0 $S) &&
	R1=$(doit  2 R1 $R0) &&
	R2=$(doit  3 R2 $R1) &&

	PL=$(doit  4 PL $L2 $C2) &&
	PR=$(doit  4 PR $C2 $R2) &&

	git name-rev $C2 >expected &&

	MB=$(git merge-base PL PR) &&
	git name-rev "$MB" >actual.single &&

	MB=$(git merge-base --all PL PR) &&
	git name-rev "$MB" >actual.all &&

	test_cmp expected actual.single &&
	test_cmp expected actual.all

ok 5 - unsynchronized clocks

expecting success: 
	IB=$(doit 0 IB) &&
	I1=$(doit -10 I1 $IB) &&
	I2=$(doit  -9 I2 $I1) &&
	I3=$(doit  -8 I3 $I2) &&
	I4=$(doit  -7 I4 $I3) &&
	I5=$(doit  -6 I5 $I4) &&
	I6=$(doit  -5 I6 $I5) &&
	I7=$(doit  -4 I7 $I6) &&
	I8=$(doit  -3 I8 $I7) &&
	IH=$(doit  -2 IH $I8) &&

	echo $IH >expected &&
	git merge-base --independent IB IH >actual &&
	test_cmp expected actual

ok 6 - --independent with unsynchronized clocks

expecting success: 
	# Another set to demonstrate base between one commit and a merge
	# in the documentation.
	#
	# * C (MMC) * B (MMB) * A  (MMA)
	# * o       * o       * o
	# * o       * o       * o
	# * o       * o       * o
	# * o       | _______/
	# |         |/
	# |         * 1 (MM1)
	# | _______/
	# |/
	# * root (MMR)

	test_commit MMR &&
	test_commit MM1 &&
	test_commit MM-o &&
	test_commit MM-p &&
	test_commit MM-q &&
	test_commit MMA &&
	git checkout MM1 &&
	test_commit MM-r &&
	test_commit MM-s &&
	test_commit MM-t &&
	test_commit MMB &&
	git checkout MMR &&
	test_commit MM-u &&
	test_commit MM-v &&
	test_commit MM-w &&
	test_commit MM-x &&
	test_commit MMC
[master (root-commit) 0075405] MMR
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MMR.t
[master 91243c1] MM1
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MM1.t
[master 4d5fde5] MM-o
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MM-o.t
[master ca22c18] MM-p
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MM-p.t
[master 2659ed6] MM-q
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MM-q.t
[master fdb9a8f] MMA
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MMA.t
[detached HEAD c35e31c] MM-r
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MM-r.t
[detached HEAD 44e361c] MM-s
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MM-s.t
[detached HEAD a5daa7f] MM-t
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MM-t.t
[detached HEAD bca1425] MMB
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MMB.t
[detached HEAD 174b4d1] MM-u
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MM-u.t
[detached HEAD c171a6c] MM-v
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MM-v.t
[detached HEAD c25d00b] MM-w
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MM-w.t
[detached HEAD 610cc22] MM-x
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MM-x.t
[detached HEAD 03ab457] MMC
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 MMC.t

ok 7 - merge-base for octopus-step (setup)

expecting success: 
	git rev-parse --verify MM1 >expected &&
	git rev-parse --verify MMR >expected.sb &&

	git merge-base --all MMA MMB MMC >actual &&
	git merge-base --all --octopus MMA MMB MMC >actual.common &&
	git show-branch --merge-base MMA MMB MMC >actual.sb &&

	test_cmp expected actual &&
	test_cmp expected.sb actual.common &&
	test_cmp expected.sb actual.sb

ok 8 - merge-base A B C

expecting success: 
	git reset --hard MMR &&
	test_commit CC1 &&
	git reset --hard E &&
	test_commit CC2 &&
	test_tick &&
	git merge -s ours CC1 &&
	test_commit CC-o &&
	test_commit CCB &&
	git reset --hard CC1 &&
	git merge -s ours CC2 &&
	test_commit CCA &&

	git rev-parse CC1 CC2 >expected &&
	git merge-base --all CCB CCA^^ CCA^^2 >actual &&

	sort expected >expected.sorted &&
	sort actual >actual.sorted &&
	test_cmp expected.sorted actual.sorted

HEAD is now at 0075405 MMR
[detached HEAD 4141141] CC1
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 CC1.t
HEAD is now at e34970a E
[detached HEAD d33e00c] CC2
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 CC2.t
Merge made by ours.
[detached HEAD 515ddca] CC-o
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 CC-o.t
[detached HEAD 59b7d69] CCB
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 CCB.t
HEAD is now at 4141141 CC1
Merge made by ours.
[detached HEAD 8cb418b] CCA
 Author: A U Thor <git@au.thor.xz>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 CCA.t

ok 9 - criss-cross merge-base for octopus-step

# passed all 9 test(s)
1..9

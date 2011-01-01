Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1410-reflog/.git/
expecting success: 
	mkdir -p A/B &&
	echo rat >C &&
	echo ox >A/D &&
	echo tiger >A/B/E &&
	git add . &&

	test_tick && git commit -m rabbit &&
	H=`git rev-parse --verify HEAD` &&
	A=`git rev-parse --verify HEAD:A` &&
	B=`git rev-parse --verify HEAD:A/B` &&
	C=`git rev-parse --verify HEAD:C` &&
	D=`git rev-parse --verify HEAD:A/D` &&
	E=`git rev-parse --verify HEAD:A/B/E` &&
	check_fsck &&

	test_chmod +x C &&
	git add C &&
	test_tick && git commit -m dragon &&
	L=`git rev-parse --verify HEAD` &&
	check_fsck &&

	rm -f C A/B/E &&
	echo snake >F &&
	echo horse >A/G &&
	git add F A/G &&
	test_tick && git commit -a -m sheep &&
	F=`git rev-parse --verify HEAD:F` &&
	G=`git rev-parse --verify HEAD:A/G` &&
	I=`git rev-parse --verify HEAD:A` &&
	J=`git rev-parse --verify HEAD` &&
	check_fsck &&

	rm -f A/G &&
	test_tick && git commit -a -m monkey &&
	K=`git rev-parse --verify HEAD` &&
	check_fsck &&

	check_have A B C D E F G H I J K L &&

	git prune &&

	check_have A B C D E F G H I J K L &&

	check_fsck &&

	loglen=$(wc -l <.git/logs/refs/heads/master) &&
	test $loglen = 4
[master (root-commit) 07fcc4f] rabbit
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 A/B/E
 create mode 100644 A/D
 create mode 100644 C
[master 7d1a0b8] dragon
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 C
[master 15ab5f0] sheep
 Author: A U Thor <author@example.com>
 4 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 100644 A/B/E
 create mode 100644 A/G
 delete mode 100755 C
 create mode 100644 F
[master 3ac530f] monkey
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 A/G
tree
tree
blob
blob
blob
blob
blob
commit
tree
commit
commit
commit
tree
tree
blob
blob
blob
blob
blob
commit
tree
commit
commit
commit

ok 1 - setup

expecting success: 
	test_tick && git reset --hard HEAD~2 &&
	test -f C &&
	test -f A/B/E &&
	! test -f F &&
	! test -f A/G &&

	check_have A B C D E F G H I J K L &&

	git prune &&

	check_have A B C D E F G H I J K L &&

	loglen=$(wc -l <.git/logs/refs/heads/master) &&
	test $loglen = 5
HEAD is now at 7d1a0b8 dragon
tree
tree
blob
blob
blob
blob
blob
commit
tree
commit
commit
commit
tree
tree
blob
blob
blob
blob
blob
commit
tree
commit
commit
commit

ok 2 - rewind

expecting success: 

	corrupt $F &&
	check_fsck "missing blob $F"
missing blob 9ae84adb2704cbd49549e52169b4043871e13432

ok 3 - corrupt and check
expecting success: 

	git reflog expire --dry-run \
		--expire=$(($test_tick - 10000)) \
		--expire-unreachable=$(($test_tick - 10000)) \
		--stale-fix \
		--all &&

	loglen=$(wc -l <.git/logs/refs/heads/master) &&
	test $loglen = 5 &&

	check_fsck "missing blob $F"
would prune commit: sheep
would prune commit: monkey
would prune HEAD~2: updating HEAD
would prune commit: sheep
would prune commit: monkey
would prune HEAD~2: updating HEAD
missing blob 9ae84adb2704cbd49549e52169b4043871e13432

ok 4 - reflog expire --dry-run should not touch reflog

expecting success: 

	git reflog expire --verbose \
		--expire=$(($test_tick - 10000)) \
		--expire-unreachable=$(($test_tick - 10000)) \
		--stale-fix \
		--all &&

	loglen=$(wc -l <.git/logs/refs/heads/master) &&
	test $loglen = 2 &&

	check_fsck "dangling commit $K"
Marking reachable objects...
keep commit (initial): rabbit
keep commit: dragon
prune commit: sheep
prune commit: monkey
prune HEAD~2: updating HEAD
keep commit (initial): rabbit
keep commit: dragon
prune commit: sheep
prune commit: monkey
prune HEAD~2: updating HEAD
dangling commit 3ac530f2f6c3a45206a6b2d455baf89d1c8f672d

ok 5 - reflog expire

expecting success: 

	git prune &&
	check_fsck &&

	check_have A B C D E H L &&
	check_dont_have F G I J K
tree
tree
blob
blob
blob
commit
commit
ok 6 - prune and fsck

expecting success: 

	recover $F &&
	check_fsck "dangling blob $F"
dangling blob 9ae84adb2704cbd49549e52169b4043871e13432

ok 7 - recover and check
expecting success: 
	echo 1 > C &&
	test_tick &&
	git commit -m rat C &&

	echo 2 > C &&
	test_tick &&
	git commit -m ox C &&

	echo 3 > C &&
	test_tick &&
	git commit -m tiger C &&

	HEAD_entry_count=$(git reflog | wc -l) &&
	master_entry_count=$(git reflog show master | wc -l) &&

	test $HEAD_entry_count = 5 &&
	test $master_entry_count = 5 &&


	git reflog delete master@{1} &&
	git reflog show master > output &&
	test $(($master_entry_count - 1)) = $(wc -l < output) &&
	test $HEAD_entry_count = $(git reflog | wc -l) &&
	! grep ox < output &&

	master_entry_count=$(wc -l < output) &&

	git reflog delete HEAD@{1} &&
	test $(($HEAD_entry_count -1)) = $(git reflog | wc -l) &&
	test $master_entry_count = $(git reflog show master | wc -l) &&

	HEAD_entry_count=$(git reflog | wc -l) &&

	git reflog delete master@{07.04.2005.15:15:00.-0700} &&
	git reflog show master > output &&
	test $(($master_entry_count - 1)) = $(wc -l < output) &&
	! grep dragon < output
[master b60a214] rat
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 9908ef9] ox
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master b93561f] tiger
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 8 - delete

expecting success: 

	test_tick && git reset --hard HEAD~2 &&
	loglen=$(wc -l <.git/logs/refs/heads/master) &&
	test $loglen = 4
HEAD is now at b60a214 rat
ok 9 - rewind2
expecting success: 

	git reflog expire --verbose \
		--expire=never \
		--expire-unreachable=never \
		--all &&
	loglen=$(wc -l <.git/logs/refs/heads/master) &&
	test $loglen = 4
keep commit (initial): rabbit
keep commit: dragon
keep commit: rat
keep commit: tiger
keep HEAD~2: updating HEAD
keep commit (initial): rabbit
keep commit: rat
keep commit: tiger
keep HEAD~2: updating HEAD

ok 10 - --expire=never

expecting success: 

	git config gc.reflogexpire never &&
	git config gc.reflogexpireunreachable never &&
	git reflog expire --verbose --all &&
	loglen=$(wc -l <.git/logs/refs/heads/master) &&
	test $loglen = 4
keep commit (initial): rabbit
keep commit: dragon
keep commit: rat
keep commit: tiger
keep HEAD~2: updating HEAD
keep commit (initial): rabbit
keep commit: rat
keep commit: tiger
keep HEAD~2: updating HEAD

ok 11 - gc.reflogexpire=never

expecting success: 

	git config gc.reflogexpire false &&
	git config gc.reflogexpireunreachable false &&
	git reflog expire --verbose --all &&
	loglen=$(wc -l <.git/logs/refs/heads/master) &&
	test $loglen = 4 &&

	git config --unset gc.reflogexpire &&
	git config --unset gc.reflogexpireunreachable
keep commit (initial): rabbit
keep commit: dragon
keep commit: rat
keep commit: tiger
keep HEAD~2: updating HEAD
keep commit (initial): rabbit
keep commit: rat
keep commit: tiger
keep HEAD~2: updating HEAD

ok 12 - gc.reflogexpire=false

# passed all 12 test(s)
1..12

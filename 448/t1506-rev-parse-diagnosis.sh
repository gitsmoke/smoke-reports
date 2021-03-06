Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1506-rev-parse-diagnosis/.git/
expecting success: 
	echo one > file.txt &&
	mkdir subdir &&
	echo two > subdir/file.txt &&
	echo three > subdir/file2.txt &&
	git add . &&
	git commit -m init &&
	echo four > index-only.txt &&
	git add index-only.txt &&
	echo five > disk-only.txt
[master (root-commit) 0243987] init
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 file.txt
 create mode 100644 subdir/file.txt
 create mode 100644 subdir/file2.txt

ok 1 - set up basic repo
expecting success: 
	HASH_file=$(git rev-parse HEAD:file.txt) &&
	git rev-parse HEAD:subdir/file.txt &&
	git rev-parse :index-only.txt &&
	(cd subdir &&
	 git rev-parse HEAD:subdir/file2.txt &&
	 test $HASH_file = $(git rev-parse HEAD:file.txt) &&
	 test $HASH_file = $(git rev-parse :file.txt) &&
	 test $HASH_file = $(git rev-parse :0:file.txt) )
f719efd430d52bcfc8566a43b2eb655688d38871
8510665149157c2bc901848c3e0b746954e9cbd9
2bdf67abb163a4ffb2d7f3f0880c9fe5068ce782

ok 2 - correct file objects

expecting success: 
	git rev-parse :file.txt >expected &&
	git rev-parse :./file.txt >result &&
	test_cmp expected result &&
	git rev-parse :0:./file.txt >result &&
	test_cmp expected result

ok 3 - correct relative file objects (0)

expecting success: 
	git rev-parse HEAD:file.txt >expected &&
	git rev-parse HEAD:./file.txt >result &&
	test_cmp expected result


ok 4 - correct relative file objects (1)

expecting success: 
	(
		cd subdir &&
		git rev-parse HEAD:../file.txt >result &&
		test_cmp ../expected result
	)


ok 5 - correct relative file objects (2)

expecting success: 
	(
		cd subdir &&
		git rev-parse HEAD:../subdir/../file.txt >result &&
		test_cmp ../expected result
	)


ok 6 - correct relative file objects (3)

expecting success: 
	git rev-parse HEAD:subdir/file.txt >expected &&
	(
		cd subdir &&
		git rev-parse HEAD:./file.txt >result &&
		test_cmp ../expected result
	)

ok 7 - correct relative file objects (4)

expecting success: 
	git rev-parse :subdir/file.txt >expected &&
	(
		cd subdir &&
		git rev-parse :./file.txt >result &&
		test_cmp ../expected result &&
		git rev-parse :0:./file.txt >result &&
		test_cmp ../expected result
	)

ok 8 - correct relative file objects (5)

expecting success: 
	git rev-parse :file.txt >expected &&
	(
		cd subdir &&
		git rev-parse :../file.txt >result &&
		test_cmp ../expected result &&
		git rev-parse :0:../file.txt >result &&
		test_cmp ../expected result
	)

ok 9 - correct relative file objects (6)

expecting success: 
	test_must_fail git rev-parse foobar:file.txt 2>error &&
	grep "Invalid object name 'foobar'." error &&
	test_must_fail git rev-parse foobar 2> error &&
	grep "unknown revision or path not in the working tree." error

foobar:file.txt
fatal: Invalid object name 'foobar'.
foobar
fatal: ambiguous argument 'foobar': unknown revision or path not in the working tree.

ok 10 - incorrect revision id

expecting success: 
	test_must_fail git rev-parse HEAD:nothing.txt 2> error &&
	grep "fatal: Path 'nothing.txt' does not exist in 'HEAD'" error &&
	test_must_fail git rev-parse HEAD:index-only.txt 2> error &&
	grep "fatal: Path 'index-only.txt' exists on disk, but not in 'HEAD'." error &&
	(cd subdir &&
	 test_must_fail git rev-parse HEAD:file2.txt 2> error &&
	 grep "Did you mean 'HEAD:subdir/file2.txt'?" error )

HEAD:nothing.txt
fatal: Path 'nothing.txt' does not exist in 'HEAD'
HEAD:index-only.txt
fatal: Path 'index-only.txt' exists on disk, but not in 'HEAD'.
HEAD:file2.txt
Did you mean 'HEAD:subdir/file2.txt'?
ok 11 - incorrect file in sha1:path
expecting success: 
	test_must_fail git rev-parse :nothing.txt 2> error &&
	grep "fatal: Path 'nothing.txt' does not exist (neither on disk nor in the index)." error &&
	test_must_fail git rev-parse :1:nothing.txt 2> error &&
	grep "Path 'nothing.txt' does not exist (neither on disk nor in the index)." error &&
	test_must_fail git rev-parse :1:file.txt 2> error &&
	grep "Did you mean ':0:file.txt'?" error &&
	(cd subdir &&
	 test_must_fail git rev-parse :1:file.txt 2> error &&
	 grep "Did you mean ':0:file.txt'?" error &&
	 test_must_fail git rev-parse :file2.txt 2> error &&
	 grep "Did you mean ':0:subdir/file2.txt'?" error &&
	 test_must_fail git rev-parse :2:file2.txt 2> error &&
	 grep "Did you mean ':0:subdir/file2.txt'?" error) &&
	test_must_fail git rev-parse :disk-only.txt 2> error &&
	grep "fatal: Path 'disk-only.txt' exists on disk, but not in the index." error
:nothing.txt
fatal: Path 'nothing.txt' does not exist (neither on disk nor in the index).
:1:nothing.txt
fatal: Path 'nothing.txt' does not exist (neither on disk nor in the index).
:1:file.txt
Did you mean ':0:file.txt'?
:1:file.txt
Did you mean ':0:file.txt'?
:file2.txt
Did you mean ':0:subdir/file2.txt'?
:2:file2.txt
Did you mean ':0:subdir/file2.txt'?
:disk-only.txt
fatal: Path 'disk-only.txt' exists on disk, but not in the index.

ok 12 - incorrect file in :path and :N:path

expecting success: 
	test_must_fail git rev-parse master@{99999} >output 2>error &&
	test -z "$(cat output)" &&
	grep "fatal: Log for [^ ]* only has [0-9][0-9]* entries." error  &&
	test_must_fail git rev-parse --verify master@{99999} >output 2>error &&
	test -z "$(cat output)" &&
	grep "fatal: Log for [^ ]* only has [0-9][0-9]* entries." error
fatal: Log for 'master' only has 1 entries.
fatal: Log for 'master' only has 1 entries.

ok 13 - invalid @{n} reference

expecting success: 
	(
		cd subdir &&
		test_must_fail git rev-parse HEAD:./nonexistent.txt 2>error &&
		grep subdir/nonexistent.txt error
	)
HEAD:./nonexistent.txt
fatal: Path 'subdir/nonexistent.txt' does not exist in 'HEAD'

ok 14 - relative path not found

expecting success: 
	test_must_fail git rev-parse HEAD:../file.txt >output 2>error &&
	test -z "$(cat output)" &&
	grep "outside repository" error
fatal: '../file.txt' is outside repository

ok 15 - relative path outside worktree

expecting success: 
	test_must_fail git --git-dir=.git --work-tree=subdir rev-parse HEAD:./file.txt >output 2>error &&
	test -z "$(cat output)" &&
	grep "relative path syntax can.t be used outside working tree." error

fatal: relative path syntax can't be used outside working tree.

ok 16 - relative path when cwd is outside worktree

expecting success: 
	test_must_fail test-match-trees HEAD:./file.txt HEAD:./file.txt 2>error &&
	grep "BUG: startup_info struct is not initialized." error

fatal: BUG: startup_info struct is not initialized.

ok 17 - relative path when startup_info is NULL

# passed all 17 test(s)
1..17

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5530-upload-pack-error/.git/
expecting success: 

	echo file >file &&
	git add file &&
	git rev-parse :file &&
	git commit -a -m original &&
	test_tick &&
	echo changed >file &&
	git commit -a -m changed &&
	corrupt_repo HEAD:file


f73f3093ff865c514c6c51f867e35f693487d0d3
[master (root-commit) 1a73c37] original
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master d54deda] changed
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup and corrupt repository

expecting success: 
	test_must_fail git fsck

missing blob 5ea2ed416fbd4a4cbe227b75fe255dd7fa6bd4d6

ok 2 - fsck fails

expecting success: 

	printf "0032want %s
00000009done
0000" \
		$(git rev-parse HEAD) >input &&
	test_must_fail git upload-pack . <input >/dev/null 2>output.err &&
	grep "unable to read" output.err &&
	grep "pack-objects died" output.err

Binary file output.err matches
Binary file output.err matches

ok 3 - upload-pack fails due to error in pack-objects packing

expecting success: 

	git hash-object -w file &&
	corrupt_repo HEAD^^{tree}
5ea2ed416fbd4a4cbe227b75fe255dd7fa6bd4d6
ok 4 - corrupt repo differently
expecting success: 
	test_must_fail git fsck
broken link from  commit 1a73c376ed5bb10d1f593e4e7133b3174107e64a
              to    tree bec63e37d08c454ad3a60cde90b70f3f7d077852
dangling blob f73f3093ff865c514c6c51f867e35f693487d0d3
missing tree bec63e37d08c454ad3a60cde90b70f3f7d077852

ok 5 - fsck fails

expecting success: 

	printf "0032want %s
0034shallow %s00000009done
0000" \
		$(git rev-parse HEAD) $(git rev-parse HEAD^) >input &&
	test_must_fail git upload-pack . <input >/dev/null 2>output.err &&
	# pack-objects survived
	grep "Total.*, reused" output.err &&
	# but there was an error, which must have been in rev-list
	grep "bad tree object" output.err

Binary file output.err matches
Binary file output.err matches

ok 6 - upload-pack fails due to error in rev-list

expecting success: 

	printf "0045want %s multi_ack_detailed
00000009done
0000" \
		"deadbeefdeadbeefdeadbeefdeadbeefdeadbeef" >input &&
	test_must_fail git upload-pack . <input >output 2>output.err &&
	grep -q "not our ref" output.err &&
	! grep -q multi_ack_detailed output.err


ok 7 - upload-pack error message when bad ref requested

expecting success: 

	printf "0032want %s
00000009done
0000" \
		$(git rev-parse HEAD) >input &&
	test_must_fail git upload-pack . <input >/dev/null 2>output.err &&
	grep "bad tree object" output.err &&
	grep "pack-objects died" output.err
Binary file output.err matches
Binary file output.err matches

ok 8 - upload-pack fails due to error in pack-objects enumeration

expecting success: 

	mkdir foo &&
	cd foo &&
	git init


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5530-upload-pack-error/foo/.git/

ok 9 - create empty repository

expecting success: 

	test_must_fail git fetch .. master



ok 10 - fetch fails

# passed all 10 test(s)
1..10

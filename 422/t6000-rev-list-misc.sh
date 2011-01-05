Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6000-rev-list-misc/.git/
expecting success: 
	echo content1 >wanted_file &&
	echo content2 >unwanted_file &&
	git add wanted_file unwanted_file &&
	git commit -m one

[master (root-commit) 2a3b56f] one
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 unwanted_file
 create mode 100644 wanted_file

ok 1 - setup

expecting success: 
	git rev-list --objects HEAD -- wanted_file >output &&
	grep wanted_file output &&
	! grep unwanted_file output

ac3e272b72bbf89def8657766b855d0656630ed4 wanted_file

ok 2 - rev-list --objects heeds pathspecs

expecting success: 
	mkdir foo &&
	>foo/file &&
	git add foo/file &&
	git commit -m two &&

	git rev-list --objects HEAD -- foo >output &&
	grep foo/file output &&

	git rev-list --objects HEAD -- foo/file >output &&
	grep foo/file output &&
	! grep unwanted_file output
[master f0e0ac8] two
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 foo/file
e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 foo/file
e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 foo/file

ok 3 - rev-list --objects with pathspecs and deeper paths

expecting success: 
	git checkout --orphan junio-testcase &&
	git rm -rf . &&

	mkdir two &&
	echo frotz >one &&
	cp one two/three &&
	git add one two/three &&
	test_tick &&
	git commit -m that &&

	ONE=$(git rev-parse HEAD:one)
	git rev-list --objects HEAD two >output &&
	grep "$ONE two/three" output &&
	! grep one output

rm 'foo/file'
rm 'unwanted_file'
rm 'wanted_file'
[junio-testcase (root-commit) f0a247c] that
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 one
 create mode 100644 two/three
8e4020bb5a8d8c873b25de15933e75cc0fc275df two/three

ok 4 - rev-list --objects with pathspecs and copied files

# passed all 4 test(s)
1..4

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4111-apply-subdir/.git/
expecting success: 
	cat >patch <<-\EOF &&
	diff file.orig file
	--- a/file.orig
	+++ b/file
	@@ -1 +1,2 @@
	 1
	+2
	EOF
	patch="$(pwd)/patch" &&

	echo 1 >preimage &&
	printf "%s
" 1 2 >postimage &&
	echo 3 >other &&

	test_tick &&
	git commit --allow-empty -m basis
[master (root-commit) 2fa880c] basis
 Author: A U Thor <author@example.com>

ok 1 - setup

expecting success: 
	reset_subdir() {
		git reset &&
		mkdir -p sub/dir/b &&
		mkdir -p objects &&
		cp "$1" file &&
		cp "$1" objects/file &&
		cp "$1" sub/dir/file &&
		cp "$1" sub/dir/b/file &&
		git add file sub/dir/file sub/dir/b/file objects/file &&
		cp "$2" file &&
		cp "$2" sub/dir/file &&
		cp "$2" sub/dir/b/file &&
		cp "$2" objects/file &&
		test_might_fail git update-index --refresh -q
	}


ok 2 - setup: subdir

expecting success: 
	cp postimage expected &&
	reset_subdir other preimage &&
	(
		cd sub/dir &&
		git apply "$patch"
	) &&
	test_cmp expected sub/dir/file
file: needs update
objects/file: needs update
sub/dir/b/file: needs update
sub/dir/file: needs update

ok 3 - apply from subdir of toplevel

expecting success: 
	cp postimage expected &&
	cp other expected.working &&
	reset_subdir preimage other &&
	(
		cd sub/dir &&
		git apply --cached "$patch"
	) &&
	git show :sub/dir/file >actual &&
	test_cmp expected actual &&
	test_cmp expected.working sub/dir/file
file: needs update
objects/file: needs update
sub/dir/b/file: needs update
sub/dir/file: needs update

ok 4 - apply --cached from subdir of toplevel
expecting success: 
	cp postimage expected &&
	reset_subdir preimage other &&
	(
		cd sub/dir &&
		test_must_fail git apply --index "$patch"
	) &&
	reset_subdir other preimage &&
	(
		cd sub/dir &&
		test_must_fail git apply --index "$patch"
	) &&
	reset_subdir preimage preimage &&
	(
		cd sub/dir &&
		git apply --index "$patch"
	) &&
	git show :sub/dir/file >actual &&
	test_cmp expected actual &&
	test_cmp expected sub/dir/file
file: needs update
objects/file: needs update
sub/dir/b/file: needs update
sub/dir/file: needs update
file: needs update
objects/file: needs update
sub/dir/b/file: needs update
sub/dir/file: needs update
ok 5 - apply --index from subdir of toplevel
expecting success: 
	cp postimage expected &&
	cp preimage .git/file &&
	cp preimage .git/objects/file &&
	(
		cd .git &&
		git apply "$patch"
	) &&
	test_cmp expected .git/file

ok 6 - apply from .git dir

expecting success: 
	cp postimage expected &&
	cp preimage .git/file &&
	cp preimage .git/objects/file &&
	(
		cd .git/objects &&
		git apply "$patch"
	) &&
	test_cmp expected .git/objects/file


ok 7 - apply from subdir of .git dir

expecting success: 
	cp postimage expected &&
	cp other expected.working &&
	cp other .git/file &&
	reset_subdir preimage other &&
	(
		cd .git &&
		git apply --cached "$patch"
	) &&
	git show :file >actual &&
	test_cmp expected actual &&
	test_cmp expected.working file &&
	test_cmp expected.working .git/file
file: needs update
objects/file: needs update
sub/dir/b/file: needs update
sub/dir/file: needs update

ok 8 - apply --cached from .git dir
expecting success: 
	cp postimage expected &&
	cp preimage expected.subdir &&
	cp other .git/file &&
	cp other .git/objects/file &&
	reset_subdir preimage other &&
	(
		cd .git/objects &&
		git apply --cached "$patch"
	) &&
	git show :file >actual &&
	git show :objects/file >actual.subdir &&
	test_cmp expected actual &&
	test_cmp expected.subdir actual.subdir
file: needs update
objects/file: needs update
sub/dir/b/file: needs update
sub/dir/file: needs update

ok 9 - apply --cached from subdir of .git dir

# passed all 9 test(s)
1..9

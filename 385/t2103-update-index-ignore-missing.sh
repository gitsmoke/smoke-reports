Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2103-update-index-ignore-missing/.git/
expecting success: 
	>one &&
	>two &&
	>three &&

	# need --add when adding
	test_must_fail git update-index one &&
	test -z "$(git ls-files)" &&
	git update-index --add one &&
	test zone = "z$(git ls-files)" &&

	# update-index is atomic
	echo 1 >one &&
	test_must_fail git update-index one two &&
	echo "M	one" >expect &&
	git diff-files --name-status >actual &&
	test_cmp expect actual &&

	git update-index --add one two three &&
	for i in one three two; do echo $i; done >expect &&
	git ls-files >actual &&
	test_cmp expect actual &&

	test_tick &&
	(
		test_create_repo xyzzy &&
		cd xyzzy &&
		>file &&
		git add file
		git commit -m "sub initial"
	) &&
	git add xyzzy &&

	test_tick &&
	git commit -m initial &&
	git tag initial
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2103-update-index-ignore-missing/xyzzy/.git/
[master (root-commit) a40d181] sub initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[master (root-commit) ce14d7f] initial
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 one
 create mode 100644 three
 create mode 100644 two
 create mode 160000 xyzzy

ok 1 - basics

expecting success: 
	git reset --hard initial &&
	echo 2 >one &&
	test_must_fail git update-index --refresh &&
	echo 1 >one &&
	git update-index --refresh &&
	rm -f two &&
	test_must_fail git update-index --refresh &&
	git update-index --ignore-missing --refresh
HEAD is now at ce14d7f initial
one: needs update
two: needs update
ok 2 - --ignore-missing --refresh
expecting success: 
	git reset --hard initial &&
	info=$(git ls-files -s one | sed -e "s/ 0	/ 1	/") &&
	git rm --cached one &&
	echo "$info" | git update-index --index-info &&
	test_must_fail git update-index --refresh &&
	git update-index --unmerged --refresh &&
	echo 2 >two &&
	test_must_fail git update-index --unmerged --refresh >actual &&
	grep two actual &&
	! grep one actual &&
	! grep three actual
HEAD is now at ce14d7f initial
rm 'one'
one: needs merge
two: needs update
ok 3 - --unmerged --refresh
expecting success: 
	git reset --hard initial &&
	rm -f two &&
	test_must_fail git update-index --ignore-submodules --refresh
HEAD is now at ce14d7f initial
two: needs update
ok 4 - --ignore-submodules --refresh (1)
expecting success: 
	git reset --hard initial &&
	test_tick &&
	(
		cd xyzzy &&
		git commit -m "sub second" --allow-empty
	) &&
	test_must_fail git update-index --refresh &&
	test_must_fail git update-index --ignore-missing --refresh &&
	git update-index --ignore-submodules --refresh
HEAD is now at ce14d7f initial
[master 66f0d66] sub second
 Author: A U Thor <author@example.com>
xyzzy: needs update
xyzzy: needs update
ok 5 - --ignore-submodules --refresh (2)

# passed all 5 test(s)
1..5

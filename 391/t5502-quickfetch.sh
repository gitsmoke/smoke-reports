Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5502-quickfetch/.git/
expecting success: 

	test_tick &&
	echo ichi >file &&
	git add file &&
	git commit -m initial &&

	cnt=$( (
		git count-objects | sed -e "s/ *objects,.*//"
	) ) &&
	test $cnt -eq 3
[master (root-commit) f3b89bf] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup
expecting success: 

	(
		mkdir cloned &&
		cd cloned &&
		git init-db &&
		git remote add -f origin ..
	) &&
	cnt=$( (
		cd cloned &&
		git count-objects | sed -e "s/ *objects,.*//"
	) ) &&
	test $cnt -eq 3
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5502-quickfetch/cloned/.git/
Updating origin

ok 2 - clone without alternate

expecting success: 

	test_tick &&
	echo ni >file &&
	git commit -a -m second &&

	cnt=$( (
		git count-objects | sed -e "s/ *objects,.*//"
	) ) &&
	test $cnt -eq 6
[master 12e0958] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 3 - further commits in the original
expecting success: 

	git rev-list --objects HEAD |
	git pack-objects --stdout |
	(
		cd cloned &&
		git unpack-objects
	) &&

	cnt=$( (
		cd cloned &&
		git count-objects | sed -e "s/ *objects,.*//"
	) ) &&
	test $cnt -eq 6 &&

	blob=$(git rev-parse HEAD:file | sed -e "s|..|&/|") &&
	test -f "cloned/.git/objects/$blob" &&
	rm -f "cloned/.git/objects/$blob" &&

	cnt=$( (
		cd cloned &&
		git count-objects | sed -e "s/ *objects,.*//"
	) ) &&
	test $cnt -eq 5

ok 4 - copy commit and tree but not blob by hand

expecting success: 

	(
		cd cloned &&
		git fetch
	) &&

	cnt=$( (
		cd cloned &&
		git count-objects | sed -e "s/ *objects,.*//"
	) ) &&
	test $cnt -eq 6
ok 5 - quickfetch should not leave a corrupted repository
expecting success: 

	(
		mkdir quickclone &&
		cd quickclone &&
		git init-db &&
		(cd ../.git/objects && pwd) >.git/objects/info/alternates &&
		git remote add origin .. &&
		git fetch -k -k
	) &&
	obj_cnt=$( (
		cd quickclone &&
		git count-objects | sed -e "s/ *objects,.*//"
	) ) &&
	pck_cnt=$( (
		cd quickclone &&
		git count-objects -v | sed -n -e "/packs:/{
				s/packs://
				p
				q
			}"
	) ) &&
	origin_master=$( (
		cd quickclone &&
		git rev-parse origin/master
	) ) &&
	echo "loose objects: $obj_cnt, packfiles: $pck_cnt" &&
	test $obj_cnt -eq 0 &&
	test $pck_cnt -eq 0 &&
	test z$origin_master = z$(git rev-parse master)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5502-quickfetch/quickclone/.git/
loose objects: 0, packfiles:  0
ok 6 - quickfetch should not copy from alternate
expecting success: 

	git gc &&
	head=$(git rev-parse HEAD) &&
	branchprefix="$head refs/heads/branch" &&
	for i in 0 1 2 3 4 5 6 7 8 9; do
		for j in 0 1 2 3 4 5 6 7 8 9; do
			for k in 0 1 2 3 4 5 6 7 8 9; do
				echo "$branchprefix$i$j$k" >> .git/packed-refs
			done
		done
	done &&
	(
		cd cloned &&
		git fetch &&
		git fetch
	)
ok 7 - quickfetch should handle ~1000 refs (on Windows)

# passed all 7 test(s)
1..7

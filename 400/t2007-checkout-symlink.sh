Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2007-checkout-symlink/.git/
expecting success: 

	mkdir frotz &&
	echo hello >frotz/filfre &&
	git add frotz/filfre &&
	test_tick &&
	git commit -m "master has file frotz/filfre" &&

	git branch side &&

	echo goodbye >nitfol &&
	git add nitfol &&
	test_tick &&
	git commit -m "master adds file nitfol" &&

	git checkout side &&

	git rm --cached frotz/filfre &&
	mv frotz xyzzy &&
	ln -s xyzzy frotz &&
	git add xyzzy/filfre frotz &&
	test_tick &&
	git commit -m "side moves frotz/ to xyzzy/ and adds frotz->xyzzy/"
[master (root-commit) f92d3a8] master has file frotz/filfre
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 frotz/filfre
[master ed594a0] master adds file nitfol
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 nitfol
rm 'frotz/filfre'
[side 1502bd7] side moves frotz/ to xyzzy/ and adds frotz->xyzzy/
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 frotz
 rename {frotz => xyzzy}/filfre (100%)

ok 1 - setup
expecting success: 

	git checkout master
ok 2 - switch from symlink to dir

expecting success: 
	rm -fr frotz xyzzy nitfol &&
	git checkout -f master

ok 3 - Remove temporary directories & switch to master

expecting success: 

	git checkout side



ok 4 - switch from dir to symlink

# passed all 4 test(s)
1..4

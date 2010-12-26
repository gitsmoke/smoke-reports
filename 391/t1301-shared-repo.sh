Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1301-shared-repo/.git/
expecting success: 
	mkdir sub && (
		cd sub && git init --shared=0400
	)
	ret="$?"
	rm -rf sub
	test $ret != "0"

ok 1 - shared = 0400 (faulty permission u-w)

expecting success: 
		mkdir sub && (
			cd sub &&
			umask $u &&
			git init --shared=1 &&
			test 1 = "$(git config core.sharedrepository)"
		) &&
		actual=$(ls -l sub/.git/HEAD)
		case "$actual" in
		-rw-rw-r--*)
			: happy
			;;
		*)
			echo Oops, .git/HEAD is not 0664 but $actual
			false
			;;
		esac
	
Initialized empty shared Git repository in /Users/trast/git-smoke/t/trash directory.t1301-shared-repo/sub/.git/
ok 2 - shared=1 does not clear bits preset by umask 002
expecting success: 
		mkdir sub && (
			cd sub &&
			umask $u &&
			git init --shared=1 &&
			test 1 = "$(git config core.sharedrepository)"
		) &&
		actual=$(ls -l sub/.git/HEAD)
		case "$actual" in
		-rw-rw-r--*)
			: happy
			;;
		*)
			echo Oops, .git/HEAD is not 0664 but $actual
			false
			;;
		esac
	
Initialized empty shared Git repository in /Users/trast/git-smoke/t/trash directory.t1301-shared-repo/sub/.git/
ok 3 - shared=1 does not clear bits preset by umask 022
expecting success: 
	mkdir sub &&
	cd sub &&
	git init --shared=all &&
	test 2 = $(git config core.sharedrepository)
Initialized empty shared Git repository in /Users/trast/git-smoke/t/trash directory.t1301-shared-repo/sub/.git/
ok 4 - shared=all
expecting success: 
	: > a1 &&
	git add a1 &&
	test_tick &&
	git commit -m a1 &&
	umask 0277 &&
	git update-server-info &&
	actual="$(ls -l .git/info/refs)" &&
	case "$actual" in
	-r--r--r--*)
		: happy
		;;
	*)
		echo Oops, .git/info/refs is not 0444
		false
		;;
	esac
[master (root-commit) a2bd363] a1
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a1

ok 5 - update-server-info honors core.sharedRepository

expecting success: 

		rm -f .git/info/refs &&
		git update-server-info &&
		actual="$(modebits .git/info/refs)" &&
		test "x$actual" = "x-$y" || {
			ls -lt .git/info
			false
		}
	

ok 6 - shared = 660 (r--r-----) ro

expecting success: 

		rm -f .git/info/refs &&
		git update-server-info &&
		actual="$(modebits .git/info/refs)" &&
		test "x$actual" = "x-$x" || {
			ls -lt .git/info
			false
		}

	

ok 7 - shared = 660 (rw-rw----) rw
expecting success: 

		rm -f .git/info/refs &&
		git update-server-info &&
		actual="$(modebits .git/info/refs)" &&
		test "x$actual" = "x-$y" || {
			ls -lt .git/info
			false
		}
	

ok 8 - shared = 640 (r--r-----) ro

expecting success: 

		rm -f .git/info/refs &&
		git update-server-info &&
		actual="$(modebits .git/info/refs)" &&
		test "x$actual" = "x-$x" || {
			ls -lt .git/info
			false
		}

	

ok 9 - shared = 640 (rw-r-----) rw
expecting success: 

		rm -f .git/info/refs &&
		git update-server-info &&
		actual="$(modebits .git/info/refs)" &&
		test "x$actual" = "x-$y" || {
			ls -lt .git/info
			false
		}
	

ok 10 - shared = 600 (r--------) ro

expecting success: 

		rm -f .git/info/refs &&
		git update-server-info &&
		actual="$(modebits .git/info/refs)" &&
		test "x$actual" = "x-$x" || {
			ls -lt .git/info
			false
		}

	

ok 11 - shared = 600 (rw-------) rw
expecting success: 

		rm -f .git/info/refs &&
		git update-server-info &&
		actual="$(modebits .git/info/refs)" &&
		test "x$actual" = "x-$y" || {
			ls -lt .git/info
			false
		}
	

ok 12 - shared = 666 (r--r--r--) ro

expecting success: 

		rm -f .git/info/refs &&
		git update-server-info &&
		actual="$(modebits .git/info/refs)" &&
		test "x$actual" = "x-$x" || {
			ls -lt .git/info
			false
		}

	

ok 13 - shared = 666 (rw-rw-rw-) rw
expecting success: 

		rm -f .git/info/refs &&
		git update-server-info &&
		actual="$(modebits .git/info/refs)" &&
		test "x$actual" = "x-$y" || {
			ls -lt .git/info
			false
		}
	

ok 14 - shared = 664 (r--r--r--) ro

expecting success: 

		rm -f .git/info/refs &&
		git update-server-info &&
		actual="$(modebits .git/info/refs)" &&
		test "x$actual" = "x-$x" || {
			ls -lt .git/info
			false
		}

	

ok 15 - shared = 664 (rw-rw-r--) rw

expecting success: 
	git config core.sharedRepository group &&
	git reflog expire --all &&
	actual="$(ls -l .git/logs/refs/heads/master)" &&
	case "$actual" in
	-rw-rw-*)
		: happy
		;;
	*)
		echo Ooops, .git/logs/refs/heads/master is not 0662 [$actual]
		false
		;;
	esac

ok 16 - git reflog expire honors core.sharedRepository

expecting success: 
	mkdir -p templates/hooks &&
	echo update-server-info >templates/hooks/post-update &&
	chmod +x templates/hooks/post-update &&
	echo : >random-file &&
	mkdir new &&
	(
		cd new &&
		umask 002 &&
		git init --shared=0660 --template=../templates &&
		>frotz &&
		git add frotz &&
		git commit -a -m initial &&
		git repack
	) &&
	# List repository files meant to be protected; note that
	# COMMIT_EDITMSG does not matter---0mode is not about a
	# repository with a work tree.
	find new/.git -type f -name COMMIT_EDITMSG -prune -o -print |
	xargs ls -ld >actual &&

	# Everything must be unaccessible to others
	test -z "$(sed -e "/^.......---/d" actual)" &&

	# All directories must have either 2770 or 770
	test -z "$(sed -n -e "/^drwxrw[sx]---/d" -e "/^d/p" actual)" &&

	# post-update hook must be 0770
	test -z "$(sed -n -e "/post-update/{
		/^-rwxrwx---/d
		p
	}" actual)" &&

	# All files inside objects must be accessible by us
	test -z "$(sed -n -e "/objects\//{
		/^d/d
		/^-r.-r.----/d
		p
	}" actual)"
Initialized empty shared Git repository in /Users/trast/git-smoke/t/trash directory.t1301-shared-repo/sub/new/.git/
[master (root-commit) e4c5dc6] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 frotz

ok 17 - forced modes

# passed all 17 test(s)
1..17

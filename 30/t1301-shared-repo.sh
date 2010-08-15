ok 1 - shared = 0400 (faulty permission u-w)
ok 2 - shared=1 does not clear bits preset by umask 002
ok 3 - shared=1 does not clear bits preset by umask 022
ok 4 - shared=all
not ok - 5 update-server-info honors core.sharedRepository
#	
#		: > a1 &&
#		git add a1 &&
#		test_tick &&
#		git commit -m a1 &&
#		umask 0277 &&
#		git update-server-info &&
#		actual="$(ls -l .git/info/refs)" &&
#		case "$actual" in
#		-r--r--r--*)
#			: happy
#			;;
#		*)
#			echo Oops, .git/info/refs is not 0444
#			false
#			;;
#		esac
#	
not ok - 6 shared = 0660 (r--r-----) ro
#	
#	
#			rm -f .git/info/refs &&
#			git update-server-info &&
#			actual="$(modebits .git/info/refs)" &&
#			test "x$actual" = "x-$y" || {
#				ls -lt .git/info
#				false
#			}
#		
ok 7 - shared = 0660 (rw-rw----) rw
not ok - 8 shared = 0640 (r--r-----) ro
#	
#	
#			rm -f .git/info/refs &&
#			git update-server-info &&
#			actual="$(modebits .git/info/refs)" &&
#			test "x$actual" = "x-$y" || {
#				ls -lt .git/info
#				false
#			}
#		
ok 9 - shared = 0640 (rw-r-----) rw
not ok - 10 shared = 0600 (r--------) ro
#	
#	
#			rm -f .git/info/refs &&
#			git update-server-info &&
#			actual="$(modebits .git/info/refs)" &&
#			test "x$actual" = "x-$y" || {
#				ls -lt .git/info
#				false
#			}
#		
ok 11 - shared = 0600 (rw-------) rw
not ok - 12 shared = 0666 (r--r--r--) ro
#	
#	
#			rm -f .git/info/refs &&
#			git update-server-info &&
#			actual="$(modebits .git/info/refs)" &&
#			test "x$actual" = "x-$y" || {
#				ls -lt .git/info
#				false
#			}
#		
ok 13 - shared = 0666 (rw-rw-rw-) rw
not ok - 14 shared = 0664 (r--r--r--) ro
#	
#	
#			rm -f .git/info/refs &&
#			git update-server-info &&
#			actual="$(modebits .git/info/refs)" &&
#			test "x$actual" = "x-$y" || {
#				ls -lt .git/info
#				false
#			}
#		
ok 15 - shared = 0664 (rw-rw-r--) rw
ok 16 - git reflog expire honors core.sharedRepository
not ok - 17 forced modes
#	
#		mkdir -p templates/hooks &&
#		echo update-server-info >templates/hooks/post-update &&
#		chmod +x templates/hooks/post-update &&
#		echo : >random-file &&
#		mkdir new &&
#		(
#			cd new &&
#			umask 002 &&
#			git init --shared=0660 --template=../templates &&
#			>frotz &&
#			git add frotz &&
#			git commit -a -m initial &&
#			git repack
#		) &&
#		# List repository files meant to be protected; note that
#		# COMMIT_EDITMSG does not matter---0mode is not about a
#		# repository with a work tree.
#		find new/.git -type f -name COMMIT_EDITMSG -prune -o -print |
#		xargs ls -ld >actual &&
#	
#		# Everything must be unaccessible to others
#		test -z "$(sed -e "/^.......---/d" actual)" &&
#	
#		# All directories must have either 2770 or 770
#		test -z "$(sed -n -e "/^drwxrw[sx]---/d" -e "/^d/p" actual)" &&
#	
#		# post-update hook must be 0770
#		test -z "$(sed -n -e "/post-update/{
#			/^-rwxrwx---/d
#			p
#		}" actual)" &&
#	
#		# All files inside objects must be accessible by us
#		test -z "$(sed -n -e "/objects\//{
#			/^d/d
#			/^-r.-r.----/d
#			p
#		}" actual)"
#	
# failed 7 among 17 test(s)
1..17

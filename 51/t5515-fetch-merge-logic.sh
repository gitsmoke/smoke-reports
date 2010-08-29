ok 1 - setup
not ok - 2 br-config-explicit
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 3 br-config-explicit config-explicit
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 4 br-config-explicit-merge
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 5 br-config-explicit-merge config-explicit
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 6 br-config-explicit-octopus
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 7 br-config-explicit-octopus config-explicit
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 8 br-config-glob
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 9 br-config-glob config-glob
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 10 br-config-glob-merge
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 11 br-config-glob-merge config-glob
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 12 br-config-glob-octopus
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 13 br-config-glob-octopus config-glob
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 14 br-remote-explicit
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 15 br-remote-explicit remote-explicit
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 16 br-remote-explicit-merge
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 17 br-remote-explicit-merge remote-explicit
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 18 br-remote-explicit-octopus
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 19 br-remote-explicit-octopus remote-explicit
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 20 br-remote-glob
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 21 br-remote-glob remote-glob
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 22 br-remote-glob-merge
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 23 br-remote-glob-merge remote-glob
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 24 br-remote-glob-octopus
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 25 br-remote-glob-octopus remote-glob
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 26 br-branches-default
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 27 br-branches-default branches-default
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 28 br-branches-default-merge
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 29 br-branches-default-merge branches-default
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 30 br-branches-default-octopus
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 31 br-branches-default-octopus branches-default
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 32 br-branches-one
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 33 br-branches-one branches-one
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 34 br-branches-one-merge
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 35 br-branches-one-merge branches-one
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 36 br-branches-one-octopus
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 37 br-branches-one-octopus branches-one
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 38 master
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 39 master config-explicit
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 40 master config-glob
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 41 master remote-explicit
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 42 master remote-glob
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 43 master branches-default
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 44 master branches-one
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 45 br-unconfig
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 46 br-unconfig config-explicit
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 47 br-unconfig config-glob
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 48 br-unconfig remote-explicit
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 49 br-unconfig remote-glob
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 50 br-unconfig branches-default
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 51 br-unconfig branches-one
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 52 master ../.git
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 53 master ../.git one
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 54 master ../.git one two
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 55 master --tags ../.git
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 56 master ../.git tag tag-one tag tag-three
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 57 master ../.git tag tag-one-tree tag tag-three-file
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 58 master ../.git one tag tag-one tag tag-three-file
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 59 br-unconfig ../.git
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 60 br-unconfig ../.git one
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 61 br-unconfig ../.git one two
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 62 br-unconfig --tags ../.git
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 63 br-unconfig ../.git tag tag-one tag tag-three
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 64 br-unconfig ../.git tag tag-one-tree tag tag-three-file
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
not ok - 65 br-unconfig ../.git one tag tag-one tag tag-three-file
#	
#			{
#				echo "# $cmd"
#				set x $cmd; shift
#				git symbolic-ref HEAD refs/heads/$1 ; shift
#				rm -f .git/FETCH_HEAD
#				git for-each-ref \
#					refs/heads refs/remotes/rem refs/tags |
#				while read val type refname
#				do
#					git update-ref -d "$refname" "$val"
#				done
#				git fetch "$@" >/dev/null
#				cat .git/FETCH_HEAD
#			} >"$actual_f" &&
#			git show-ref >"$actual_r" &&
#			if test -f "$expect_f"
#			then
#				test_cmp "$expect_f" "$actual_f" &&
#				rm -f "$actual_f"
#			else
#				# this is to help developing new tests.
#				cp "$actual_f" "$expect_f"
#				false
#			fi &&
#			if test -f "$expect_r"
#			then
#				test_cmp "$expect_r" "$actual_r" &&
#				rm -f "$actual_r"
#			else
#				# this is to help developing new tests.
#				cp "$actual_r" "$expect_r"
#				false
#			fi
#		
# failed 64 among 65 test(s)
1..65

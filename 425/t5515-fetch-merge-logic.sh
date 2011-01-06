Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5515-fetch-merge-logic/.git/
expecting success: 
	GIT_AUTHOR_DATE="2006-06-26 00:00:00 +0000" &&
	GIT_COMMITTER_DATE="2006-06-26 00:00:00 +0000" &&
	export GIT_AUTHOR_DATE GIT_COMMITTER_DATE &&

	echo >file original &&
	git add file &&
	git commit -a -m One &&
	git tag tag-one &&
	git tag tag-one-tree HEAD^{tree} &&
	git branch one &&

	echo two >> file &&
	git commit -a -m Two &&
	git tag -a -m "Tag Two" tag-two &&
	git branch two &&

	echo three >> file &&
	git commit -a -m Three &&
	git tag -a -m "Tag Three" tag-three &&
	git tag -a -m "Tag Three file" tag-three-file HEAD^{tree}:file &&
	git branch three &&

	echo master >> file &&
	git commit -a -m Master &&
	git tag -a -m "Tag Master" tag-master &&

	git checkout three &&

	git clone . cloned &&
	cd cloned &&
	git config remote.origin.url ../.git/ &&

	git config remote.config-explicit.url ../.git/ &&
	git config remote.config-explicit.fetch refs/heads/master:remotes/rem/master &&
	git config --add remote.config-explicit.fetch refs/heads/one:remotes/rem/one &&
	git config --add remote.config-explicit.fetch two:remotes/rem/two &&
	git config --add remote.config-explicit.fetch refs/heads/three:remotes/rem/three &&
	remotes="config-explicit" &&

	git config remote.config-glob.url ../.git/ &&
	git config remote.config-glob.fetch refs/heads/*:refs/remotes/rem/* &&
	remotes="$remotes config-glob" &&

	mkdir -p .git/remotes &&
	{
		echo "URL: ../.git/"
		echo "Pull: refs/heads/master:remotes/rem/master"
		echo "Pull: refs/heads/one:remotes/rem/one"
		echo "Pull: two:remotes/rem/two"
		echo "Pull: refs/heads/three:remotes/rem/three"
	} >.git/remotes/remote-explicit &&
	remotes="$remotes remote-explicit" &&

	{
		echo "URL: ../.git/"
		echo "Pull: refs/heads/*:refs/remotes/rem/*"
	} >.git/remotes/remote-glob &&
	remotes="$remotes remote-glob" &&

	mkdir -p .git/branches &&
	echo "../.git" > .git/branches/branches-default &&
	remotes="$remotes branches-default" &&

	echo "../.git#one" > .git/branches/branches-one &&
	remotes="$remotes branches-one" &&

	for remote in $remotes ; do
		git config branch.br-$remote.remote $remote &&
		git config branch.br-$remote-merge.remote $remote &&
		git config branch.br-$remote-merge.merge refs/heads/three &&
		git config branch.br-$remote-octopus.remote $remote &&
		git config branch.br-$remote-octopus.merge refs/heads/one &&
		git config --add branch.br-$remote-octopus.merge two
	done
[master (root-commit) 8e32a6d] One
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 6134ee8] Two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 0567da4] Three
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 754b754] Master
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Cloning into cloned...
done.
ok 1 - setup
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 2 - br-config-explicit

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 3 - br-config-explicit config-explicit
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 4 - br-config-explicit-merge

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 5 - br-config-explicit-merge config-explicit

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 6 - br-config-explicit-octopus

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 7 - br-config-explicit-octopus config-explicit

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 8 - br-config-glob
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 9 - br-config-glob config-glob
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 10 - br-config-glob-merge

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 11 - br-config-glob-merge config-glob

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 12 - br-config-glob-octopus
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 13 - br-config-glob-octopus config-glob

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 14 - br-remote-explicit

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 15 - br-remote-explicit remote-explicit
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 16 - br-remote-explicit-merge

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 17 - br-remote-explicit-merge remote-explicit

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 18 - br-remote-explicit-octopus

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 19 - br-remote-explicit-octopus remote-explicit

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 20 - br-remote-glob

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 21 - br-remote-glob remote-glob

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 22 - br-remote-glob-merge
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 23 - br-remote-glob-merge remote-glob
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 24 - br-remote-glob-octopus

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 25 - br-remote-glob-octopus remote-glob

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 26 - br-branches-default

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 27 - br-branches-default branches-default
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 28 - br-branches-default-merge
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 29 - br-branches-default-merge branches-default

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 30 - br-branches-default-octopus

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 31 - br-branches-default-octopus branches-default
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 32 - br-branches-one
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 33 - br-branches-one branches-one
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 34 - br-branches-one-merge

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 35 - br-branches-one-merge branches-one

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 36 - br-branches-one-octopus
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 37 - br-branches-one-octopus branches-one

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 38 - master

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 39 - master config-explicit

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 40 - master config-glob
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 41 - master remote-explicit

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 42 - master remote-glob
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 43 - master branches-default
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 44 - master branches-one
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 45 - br-unconfig
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 46 - br-unconfig config-explicit

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 47 - br-unconfig config-glob
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 48 - br-unconfig remote-explicit
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 49 - br-unconfig remote-glob
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 50 - br-unconfig branches-default

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 51 - br-unconfig branches-one
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 52 - master ../.git
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 53 - master ../.git one

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 54 - master ../.git one two
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 55 - master --tags ../.git

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 56 - master ../.git tag tag-one tag tag-three

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 57 - master ../.git tag tag-one-tree tag tag-three-file

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 58 - master ../.git one tag tag-one tag tag-three-file

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 59 - br-unconfig ../.git
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 60 - br-unconfig ../.git one
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 61 - br-unconfig ../.git one two
expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 62 - br-unconfig --tags ../.git

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 63 - br-unconfig ../.git tag tag-one tag tag-three

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	

ok 64 - br-unconfig ../.git tag tag-one-tree tag tag-three-file

expecting success: 
		{
			echo "# $cmd"
			set x $cmd; shift
			git symbolic-ref HEAD refs/heads/$1 ; shift
			rm -f .git/FETCH_HEAD
			git for-each-ref \
				refs/heads refs/remotes/rem refs/tags |
			while read val type refname
			do
				git update-ref -d "$refname" "$val"
			done
			git fetch "$@" >/dev/null
			cat .git/FETCH_HEAD
		} >"$actual_f" &&
		git show-ref >"$actual_r" &&
		if test -f "$expect_f"
		then
			test_cmp "$expect_f" "$actual_f" &&
			rm -f "$actual_f"
		else
			# this is to help developing new tests.
			cp "$actual_f" "$expect_f"
			false
		fi &&
		if test -f "$expect_r"
		then
			test_cmp "$expect_r" "$actual_r" &&
			rm -f "$actual_r"
		else
			# this is to help developing new tests.
			cp "$actual_r" "$expect_r"
			false
		fi
	
ok 65 - br-unconfig ../.git one tag tag-one tag tag-three-file

# passed all 65 test(s)
1..65

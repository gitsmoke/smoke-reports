Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4013-diff-various/.git/
expecting success: 

	GIT_AUTHOR_DATE="2006-06-26 00:00:00 +0000" &&
	GIT_COMMITTER_DATE="2006-06-26 00:00:00 +0000" &&
	export GIT_AUTHOR_DATE GIT_COMMITTER_DATE &&

	mkdir dir &&
	mkdir dir2 &&
	for i in 1 2 3; do echo $i; done >file0 &&
	for i in A B; do echo $i; done >dir/sub &&
	cat file0 >file2 &&
	git add file0 file2 dir/sub &&
	git commit -m Initial &&

	git branch initial &&
	git branch side &&

	GIT_AUTHOR_DATE="2006-06-26 00:01:00 +0000" &&
	GIT_COMMITTER_DATE="2006-06-26 00:01:00 +0000" &&
	export GIT_AUTHOR_DATE GIT_COMMITTER_DATE &&

	for i in 4 5 6; do echo $i; done >>file0 &&
	for i in C D; do echo $i; done >>dir/sub &&
	rm -f file2 &&
	git update-index --remove file0 file2 dir/sub &&
	git commit -m "Second${LF}${LF}This is the second commit." &&

	GIT_AUTHOR_DATE="2006-06-26 00:02:00 +0000" &&
	GIT_COMMITTER_DATE="2006-06-26 00:02:00 +0000" &&
	export GIT_AUTHOR_DATE GIT_COMMITTER_DATE &&

	for i in A B C; do echo $i; done >file1 &&
	git add file1 &&
	for i in E F; do echo $i; done >>dir/sub &&
	git update-index dir/sub &&
	git commit -m Third &&

	GIT_AUTHOR_DATE="2006-06-26 00:03:00 +0000" &&
	GIT_COMMITTER_DATE="2006-06-26 00:03:00 +0000" &&
	export GIT_AUTHOR_DATE GIT_COMMITTER_DATE &&

	git checkout side &&
	for i in A B C; do echo $i; done >>file0 &&
	for i in 1 2; do echo $i; done >>dir/sub &&
	cat dir/sub >file3 &&
	git add file3 &&
	git update-index file0 dir/sub &&
	git commit -m Side &&

	GIT_AUTHOR_DATE="2006-06-26 00:04:00 +0000" &&
	GIT_COMMITTER_DATE="2006-06-26 00:04:00 +0000" &&
	export GIT_AUTHOR_DATE GIT_COMMITTER_DATE &&

	git checkout master &&
	git pull -s ours . side &&

	GIT_AUTHOR_DATE="2006-06-26 00:05:00 +0000" &&
	GIT_COMMITTER_DATE="2006-06-26 00:05:00 +0000" &&
	export GIT_AUTHOR_DATE GIT_COMMITTER_DATE &&

	for i in A B C; do echo $i; done >>file0 &&
	for i in 1 2; do echo $i; done >>dir/sub &&
	git update-index file0 dir/sub &&

	mkdir dir3 &&
	cp dir/sub dir3/sub &&
	test-chmtime +1 dir3/sub &&

	git config log.showroot false &&
	git commit --amend &&
	git show-branch
[master (root-commit) 444ac55] Initial
 Author: A U Thor <author@example.com>
 3 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 dir/sub
 create mode 100644 file0
 create mode 100644 file2
[master 1bde4ae] Second
 Author: A U Thor <author@example.com>
 3 files changed, 5 insertions(+), 3 deletions(-)
 delete mode 100644 file2
[master 9a6d494] Third
 Author: A U Thor <author@example.com>
 2 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 file1
[side c7a2ab9] Side
 Author: A U Thor <author@example.com>
 3 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 file3
Merge made by ours.
[master 59d314a] Merge branch 'side'
 Author: A U Thor <author@example.com>
! [initial] Initial
 * [master] Merge branch 'side'
  ! [side] Side
---
 -  [master] Merge branch 'side'
 *+ [side] Side
 *  [master^] Third
 *  [master~2] Second
+*+ [initial] Initial

ok 1 - setup

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 2 - git diff-tree initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 3 - git diff-tree -r initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 4 - git diff-tree -r --abbrev initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 5 - git diff-tree -r --abbrev=4 initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 6 - git diff-tree --root initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	
ok 7 - git diff-tree --root --abbrev initial
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 8 - git diff-tree --root -r initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 9 - git diff-tree --root -r --abbrev initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 10 - git diff-tree --root -r --abbrev=4 initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 11 - git diff-tree -p initial
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 12 - git diff-tree --root -p initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 13 - git diff-tree --patch-with-stat initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 14 - git diff-tree --root --patch-with-stat initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 15 - git diff-tree --patch-with-raw initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 16 - git diff-tree --root --patch-with-raw initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 17 - git diff-tree --pretty initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 18 - git diff-tree --pretty --root initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 19 - git diff-tree --pretty -p initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 20 - git diff-tree --pretty --stat initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 21 - git diff-tree --pretty --summary initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 22 - git diff-tree --pretty --stat --summary initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 23 - git diff-tree --pretty --root -p initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 24 - git diff-tree --pretty --root --stat initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 25 - git diff-tree --pretty --root --summary initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 26 - git diff-tree --pretty --root --summary -r initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 27 - git diff-tree --pretty --root --stat --summary initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 28 - git diff-tree --pretty --patch-with-stat initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 29 - git diff-tree --pretty --root --patch-with-stat initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 30 - git diff-tree --pretty --patch-with-raw initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 31 - git diff-tree --pretty --root --patch-with-raw initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 32 - git diff-tree --pretty=oneline initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 33 - git diff-tree --pretty=oneline --root initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 34 - git diff-tree --pretty=oneline -p initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 35 - git diff-tree --pretty=oneline --root -p initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 36 - git diff-tree --pretty=oneline --patch-with-stat initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 37 - git diff-tree --pretty=oneline --root --patch-with-stat initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 38 - git diff-tree --pretty=oneline --patch-with-raw initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 39 - git diff-tree --pretty=oneline --root --patch-with-raw initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 40 - git diff-tree --pretty side
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 41 - git diff-tree --pretty -p side
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 42 - git diff-tree --pretty --patch-with-stat side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 43 - git diff-tree master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 44 - git diff-tree -p master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 45 - git diff-tree -p -m master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 46 - git diff-tree -c master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 47 - git diff-tree -c --abbrev master
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 48 - git diff-tree --cc master
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 49 - git diff-tree -c --stat master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 50 - git diff-tree --cc --stat master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 51 - git diff-tree -c --stat --summary master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 52 - git diff-tree --cc --stat --summary master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 53 - git diff-tree -c --stat --summary side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 54 - git diff-tree --cc --stat --summary side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 55 - git diff-tree --cc --patch-with-stat master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 56 - git diff-tree --cc --patch-with-stat --summary master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 57 - git diff-tree --cc --patch-with-stat --summary side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 58 - git log master
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 59 - git log -p master
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 60 - git log --root master
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 61 - git log --root -p master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 62 - git log --patch-with-stat master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 63 - git log --root --patch-with-stat master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 64 - git log --root --patch-with-stat --summary master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 65 - git log --root -c --patch-with-stat --summary master
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 66 - git log --root --cc --patch-with-stat --summary master
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 67 - git log -p --first-parent master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 68 - git log -m -p --first-parent master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 69 - git log -m -p master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 70 - git log -SF master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 71 - git log -S F master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 72 - git log -SF -p master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 73 - git log -GF master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 74 - git log -GF -p master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 75 - git log -GF -p --pickaxe-all master
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 76 - git log --decorate --all

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 77 - git log --decorate=full --all

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 78 - git rev-list --parents HEAD

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 79 - git rev-list --children HEAD

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 80 - git whatchanged master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 81 - git whatchanged -p master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 82 - git whatchanged --root master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 83 - git whatchanged --root -p master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 84 - git whatchanged --patch-with-stat master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 85 - git whatchanged --root --patch-with-stat master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 86 - git whatchanged --root --patch-with-stat --summary master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 87 - git whatchanged --root -c --patch-with-stat --summary master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 88 - git whatchanged --root --cc --patch-with-stat --summary master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 89 - git whatchanged -SF master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 90 - git whatchanged -SF -p master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 91 - git log --patch-with-stat master -- dir/

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 92 - git whatchanged --patch-with-stat master -- dir/

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 93 - git log --patch-with-stat --summary master -- dir/

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 94 - git whatchanged --patch-with-stat --summary master -- dir/

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 95 - git show initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 96 - git show --root initial

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 97 - git show side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 98 - git show master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 99 - git show -c master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 100 - git show -m master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 101 - git show --first-parent master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 102 - git show --stat side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 103 - git show --stat --summary side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 104 - git show --patch-with-stat side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 105 - git show --patch-with-raw side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 106 - git show --patch-with-stat --summary side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 107 - git format-patch --stdout initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 108 - git format-patch --stdout initial..master^

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 109 - git format-patch --stdout initial..master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 110 - git format-patch --stdout --no-numbered initial..master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 111 - git format-patch --stdout --numbered initial..master
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 112 - git format-patch --attach --stdout initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 113 - git format-patch --attach --stdout --suffix=.diff initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 114 - git format-patch --attach --stdout initial..master^

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 115 - git format-patch --attach --stdout initial..master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 116 - git format-patch --inline --stdout initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 117 - git format-patch --inline --stdout initial..master^

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 118 - git format-patch --inline --stdout --numbered-files initial..master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 119 - git format-patch --inline --stdout initial..master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 120 - git format-patch --inline --stdout --subject-prefix=TESTCASE initial..master

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 121 - git config format.subjectprefix DIFFERENT_PREFIX

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 122 - git format-patch --inline --stdout initial..master^^
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 123 - git format-patch --stdout --cover-letter -n initial..master^
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 124 - git diff --abbrev initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 125 - git diff -r initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 126 - git diff --stat initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 127 - git diff -r --stat initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 128 - git diff initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 129 - git diff --patch-with-stat initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 130 - git diff --patch-with-raw initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 131 - git diff --patch-with-stat -r initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 132 - git diff --patch-with-raw -r initial..side

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 133 - git diff --name-status dir2 dir
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 134 - git diff --no-index --name-status dir2 dir
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 135 - git diff --no-index --name-status -- dir2 dir
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 136 - git diff --no-index dir dir3

expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 137 - git diff master master^ side
expecting success: 
		{
			echo "\$ git $cmd"
			git $cmd |
			sed -e "s/^\(-*\)$V\(-*\)\$/\1g-i-t--v-e-r-s-i-o-n\2/" \
			    -e "s/^\(.*mixed; boundary=\"-*\)$V\(-*\)\"\$/\1g-i-t--v-e-r-s-i-o-n\2\"/"
			echo "\$"
		} >"$actual" &&
		if test -f "$expect"
		then
			test_cmp "$expect" "$actual" &&
			rm -f "$actual"
		else
			# this is to help developing new tests.
			cp "$actual" "$expect"
			false
		fi
	

ok 138 - git diff --dirstat master~1 master~2

expecting success: 
	test_must_fail git log -S


ok 139 - log -S requires an argument

# passed all 139 test(s)
1..139

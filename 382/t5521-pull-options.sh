Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5521-pull-options/.git/
expecting success: 
	mkdir parent &&
	(cd parent && git init &&
	 echo one >file && git add file &&
	 git commit -m one)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5521-pull-options/parent/.git/
[master (root-commit) f4f8a1c] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup

expecting success: 
	mkdir clonedq &&
	(cd clonedq && git init &&
	git pull -q "../parent" >out 2>err &&
	test ! -s err &&
	test ! -s out)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5521-pull-options/clonedq/.git/

ok 2 - git pull -q

expecting success: 
	mkdir cloned &&
	(cd cloned && git init &&
	git pull "../parent" >out 2>err &&
	test -s err &&
	test ! -s out)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5521-pull-options/cloned/.git/

ok 3 - git pull

expecting success: 
	mkdir clonedv &&
	(cd clonedv && git init &&
	git pull -v "../parent" >out 2>err &&
	test -s err &&
	test ! -s out)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5521-pull-options/clonedv/.git/

ok 4 - git pull -v

expecting success: 
	mkdir clonedvq &&
	(cd clonedvq && git init &&
	git pull -v -q "../parent" >out 2>err &&
	test ! -s out &&
	test ! -s err)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5521-pull-options/clonedvq/.git/

ok 5 - git pull -v -q

expecting success: 
	mkdir clonedqv &&
	(cd clonedqv && git init &&
	git pull -q -v "../parent" >out 2>err &&
	test ! -s out &&
	test -s err)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5521-pull-options/clonedqv/.git/

ok 6 - git pull -q -v

expecting success: 
	mkdir clonedoldstyle &&
	(cd clonedoldstyle && git init &&
	cat >>.git/config <<-\EOF &&
	[remote "one"]
		url = ../parent
		fetch = refs/heads/master:refs/heads/mirror
	[remote "two"]
		url = ../parent
		fetch = refs/heads/master:refs/heads/origin
	[branch "master"]
		remote = two
		merge = refs/heads/master
	EOF
	git pull two &&
	test_commit A &&
	git branch -f origin &&
	git pull --all --force
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5521-pull-options/clonedoldstyle/.git/
[master f2a7281] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A.t
Fetching one
Fetching two
Already up-to-date.

ok 7 - git pull --force
expecting success: 
	mkdir clonedmulti &&
	(cd clonedmulti && git init &&
	cat >>.git/config <<-\EOF &&
	[remote "one"]
		url = ../parent
		fetch = refs/heads/*:refs/remotes/one/*
	[remote "two"]
		url = ../parent
		fetch = refs/heads/*:refs/remotes/two/*
	[branch "master"]
		remote = one
		merge = refs/heads/master
	EOF
	git pull --all
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5521-pull-options/clonedmulti/.git/
Fetching one
Fetching two

ok 8 - git pull --all

# passed all 8 test(s)
1..8

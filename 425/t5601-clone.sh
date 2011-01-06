Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5601-clone/.git/
expecting success: 

	rm -fr .git &&
	test_create_repo src &&
	(
		cd src
		>file
		git add file
		git commit -m initial
	)


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5601-clone/src/.git/
[master (root-commit) 7fa49a5] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup

expecting success: 

	rm -fr dst &&
	test_must_fail git clone -n src dst junk



ok 2 - clone with excess parameters (1)

expecting success: 

	rm -fr dst &&
	test_must_fail git clone -n "file://$(pwd)/src" dst junk

ok 3 - clone with excess parameters (2)

expecting success: 
	rm -fr dst &&
	git clone -n "file://$(pwd)/src" dst >output &&
	test $(grep Clon output | wc -l) = 1
ok 4 - output from clone

expecting success: 

	rm -fr dst &&
	git clone -n "file://$(pwd)/src" dst &&
	! test -f dst/file &&
	! (echo dst/.git/objects/pack/pack-* | grep "\.keep")
Cloning into dst...

ok 5 - clone does not keep pack

expecting success: 

	rm -fr dst &&
	git clone src dst &&
	test -f dst/file


Cloning into dst...
done.

ok 6 - clone checks out files

expecting success: 

	GIT_WORK_TREE=worktree git clone src bare &&
	test -f bare/config &&
	test -f worktree/file


Cloning into bare...
done.

ok 7 - clone respects GIT_WORK_TREE

expecting success: 

	git clone src long/path/to/dst &&
	test -f long/path/to/dst/file


Cloning into long/path/to/dst...
done.

ok 8 - clone creates intermediate directories

expecting success: 

	git clone --bare src long/path/to/bare/dst &&
	test -f long/path/to/bare/dst/config


Cloning into bare repository long/path/to/bare/dst...
done.

ok 9 - clone creates intermediate directories for bare repo

expecting success: 

	git clone --mirror src mirror &&
	test -f mirror/HEAD &&
	test ! -f mirror/file &&
	FETCH="$(cd mirror && git config remote.origin.fetch)" &&
	test "+refs/*:refs/*" = "$FETCH" &&
	MIRROR="$(cd mirror && git config --bool remote.origin.mirror)" &&
	test "$MIRROR" = true


Cloning into bare repository mirror...
done.

ok 10 - clone --mirror

expecting success: 

	git clone --bare src &&
	test -d src.git
Cloning into bare repository src.git...
done.

ok 11 - clone --bare names the local repository <name>.git

expecting success: 

	(cd src &&
	 git tag some-tag HEAD) &&
	git clone --mirror src mirror2 &&
	(cd mirror2 &&
	 git show-ref 2> clone.err > clone.out) &&
	test_must_fail grep Duplicate mirror2/clone.err &&
	grep some-tag mirror2/clone.out


Cloning into bare repository mirror2...
done.
7fa49a5c605c8bdc81802e1f963137151decb624 refs/tags/some-tag

ok 12 - clone --mirror does not repeat tags

expecting success: 

	git clone src target-1/ &&
	T=$( cd target-1 && git rev-parse HEAD ) &&
	S=$( cd src && git rev-parse HEAD ) &&
	test "$T" = "$S"


Cloning into target-1...
done.

ok 13 - clone to destination with trailing /

expecting success: 

	git clone src target-2/// &&
	T=$( cd target-2 && git rev-parse HEAD ) &&
	S=$( cd src && git rev-parse HEAD ) &&
	test "$T" = "$S"


Cloning into target-2...
done.

ok 14 - clone to destination with extra trailing /

expecting success: 
	mkdir target-3 &&
	git clone src target-3 &&
	T=$( cd target-3 && git rev-parse HEAD ) &&
	S=$( cd src && git rev-parse HEAD ) &&
	test "$T" = "$S"

Cloning into target-3...
done.

ok 15 - clone to an existing empty directory

expecting success: 
	mkdir target-4 &&
	>target-4/Fakefile &&
	test_must_fail git clone src target-4


ok 16 - clone to an existing non-empty directory

expecting success: 
	>target-5 &&
	test_must_fail git clone src target-5


ok 17 - clone to an existing path

expecting success: 
	mkdir src-0 &&
	(
		cd src-0 && git init
	) &&
	git clone "file://$(pwd)/src-0" target-6 2>err-6 &&
	! grep "fatal:" err-6 &&
	(
		cd src-0 && test_commit A
	) &&
	git clone "file://$(pwd)/src-0" target-7 2>err-7 &&
	! grep "fatal:" err-7 &&
	# There is no reason to insist they are bit-for-bit
	# identical, but this test should suffice for now.
	test_cmp target-6/.git/config target-7/.git/config

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5601-clone/src-0/.git/
Cloning into target-6...
[master (root-commit) 0ddfaf1] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A.t
Cloning into target-7...
ok 18 - clone a void
expecting success: 
	(
		test_config="$HOME/.gitconfig" &&
		unset GIT_CONFIG_NOGLOBAL &&
		git config -f "$test_config" branch.autosetuprebase remote &&
		rm -fr dst &&
		git clone src dst &&
		cd dst &&
		actual="z$(git config branch.master.rebase)" &&
		test ztrue = $actual
	)
Cloning into dst...
done.

ok 19 - clone respects global branch.autosetuprebase

expecting success: 
	git init x+y &&
	git clone "file://$PWD/x+y" xy-url-1 &&
	git clone "file://$PWD/x%2By" xy-url-2

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5601-clone/x+y/.git/
Cloning into xy-url-1...
Cloning into xy-url-2...

ok 20 - respect url-encoding of file://

expecting success: 
	rm -rf x+y &&
	git init "x y" &&
	test_must_fail git clone "file://$PWD/x+y" xy-no-plus

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5601-clone/x y/.git/
Cloning into xy-no-plus...
ok 21 - do not query-string-decode + in URLs
expecting success: 
	git init x+y &&
	test_must_fail git clone x%2By xy-regular &&
	git clone x+y xy-regular
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5601-clone/x+y/.git/
Cloning into xy-regular...
Cloning into xy-regular...
done.

ok 22 - do not respect url-encoding of non-url path

# passed all 22 test(s)
1..22

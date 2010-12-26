Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7300-clean/.git/
expecting success: 

	mkdir -p src &&
	touch src/part1.c Makefile &&
	echo build >.gitignore &&
	echo \*.o >>.gitignore &&
	git add . &&
	git commit -m setup &&
	touch src/part2.c README &&
	git add .
[master (root-commit) 3fa33fa] setup
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 .gitignore
 create mode 100644 Makefile
 create mode 100644 src/part1.c

ok 1 - setup

expecting success: 
	git update-index --skip-worktree .gitignore &&
	rm .gitignore &&
	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	git clean &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test ! -f a.out &&
	test ! -f src/part3.c &&
	test -f docs/manual.txt &&
	test -f obj.o &&
	test -f build/lib.so &&
	git update-index --no-skip-worktree .gitignore &&
	git checkout .gitignore
Removing a.out
Not removing docs/
Removing src/part3.c

ok 2 - git clean with skip-worktree .gitignore

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	git clean &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test ! -f a.out &&
	test ! -f src/part3.c &&
	test -f docs/manual.txt &&
	test -f obj.o &&
	test -f build/lib.so


Removing a.out
Not removing docs/
Removing src/part3.c
ok 3 - git clean

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	git clean src/ &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test -f a.out &&
	test ! -f src/part3.c &&
	test -f docs/manual.txt &&
	test -f obj.o &&
	test -f build/lib.so


Removing src/part3.c

ok 4 - git clean src/

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	git clean src/ src/ &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test -f a.out &&
	test ! -f src/part3.c &&
	test -f docs/manual.txt &&
	test -f obj.o &&
	test -f build/lib.so


Removing src/part3.c

ok 5 - git clean src/ src/

expecting success: 

	mkdir -p build docs src/test &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so src/test/1.c &&
	(cd src/ && git clean) &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test -f a.out &&
	test ! -f src/part3.c &&
	test -f src/test/1.c &&
	test -f docs/manual.txt &&
	test -f obj.o &&
	test -f build/lib.so


Removing part3.c
Not removing test/

ok 6 - git clean with prefix

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	would_clean=$(
		cd docs &&
		git clean -n ../src |
		sed -n -e "s|^Would remove ||p"
	) &&
	test "$would_clean" = ../src/part3.c || {
		echo "OOps <$would_clean>"
		false
	}


ok 7 - git clean with relative prefix

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	would_clean=$(
		cd docs &&
		git clean -n "$(pwd)/../src" |
		sed -n -e "s|^Would remove ||p"
	) &&
	test "$would_clean" = ../src/part3.c || {
		echo "OOps <$would_clean>"
		false
	}


ok 8 - git clean with absolute path

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	(
		cd docs &&
		test_must_fail git clean -n ../..
	)


ok 9 - git clean with out of work tree relative path

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	dd=$(cd .. && pwd) &&
	(
		cd docs &&
		test_must_fail git clean -n $dd
	)


ok 10 - git clean with out of work tree absolute path

expecting success: 

	mkdir -p build docs src/feature &&
	touch a.out src/part3.c src/feature/file.c docs/manual.txt obj.o build/lib.so &&
	(cd src/ && git clean -d feature/) &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test -f a.out &&
	test -f src/part3.c &&
	test ! -f src/feature/file.c &&
	test -f docs/manual.txt &&
	test -f obj.o &&
	test -f build/lib.so


Removing feature/file.c

ok 11 - git clean -d with prefix and path

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	ln -s docs/manual.txt src/part4.c &&
	git clean &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test ! -f a.out &&
	test ! -f src/part3.c &&
	test ! -f src/part4.c &&
	test -f docs/manual.txt &&
	test -f obj.o &&
	test -f build/lib.so


Removing a.out
Not removing docs/
Not removing src/feature/
Removing src/part3.c
Removing src/part4.c
Not removing src/test/

ok 12 - git clean symbolic link

expecting success: 

	touch a.clean b.clean other.c &&
	git clean "*.clean" &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test ! -f a.clean &&
	test ! -f b.clean &&
	test -f other.c


Removing a.clean
Removing b.clean
Not removing docs/
Not removing src/feature/
Not removing src/test/

ok 13 - git clean with wildcard

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	git clean -n &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test -f a.out &&
	test -f src/part3.c &&
	test -f docs/manual.txt &&
	test -f obj.o &&
	test -f build/lib.so


Would remove a.out
Would not remove docs/
Would remove other.c
Would not remove src/feature/
Would remove src/part3.c
Would not remove src/test/

ok 14 - git clean -n

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	git clean -d &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test ! -f a.out &&
	test ! -f src/part3.c &&
	test ! -d docs &&
	test -f obj.o &&
	test -f build/lib.so


Removing a.out
Removing docs/
Removing other.c
Removing src/feature/
Removing src/part3.c
Removing src/test/

ok 15 - git clean -d

expecting success: 

	mkdir -p build docs examples &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so examples/1.c &&
	git clean -d src/ examples/ &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test -f a.out &&
	test ! -f src/part3.c &&
	test ! -f examples/1.c &&
	test -f docs/manual.txt &&
	test -f obj.o &&
	test -f build/lib.so


Removing examples/
Removing src/part3.c

ok 16 - git clean -d src/ examples/

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	git clean -x &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test ! -f a.out &&
	test ! -f src/part3.c &&
	test -f docs/manual.txt &&
	test ! -f obj.o &&
	test -f build/lib.so


Removing a.out
Not removing build/
Not removing docs/
Removing obj.o
Removing src/part3.c

ok 17 - git clean -x

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	git clean -d -x &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test ! -f a.out &&
	test ! -f src/part3.c &&
	test ! -d docs &&
	test ! -f obj.o &&
	test ! -d build


Removing a.out
Removing build/
Removing docs/
Removing obj.o
Removing src/part3.c

ok 18 - git clean -d -x

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	git clean -X &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test -f a.out &&
	test -f src/part3.c &&
	test -f docs/manual.txt &&
	test ! -f obj.o &&
	test -f build/lib.so


Not removing build/
Removing obj.o

ok 19 - git clean -X

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	git clean -d -X &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test -f a.out &&
	test -f src/part3.c &&
	test -f docs/manual.txt &&
	test ! -f obj.o &&
	test ! -d build


Removing build/
Removing obj.o

ok 20 - git clean -d -X

expecting success: 

	git config --unset clean.requireForce &&
	test_must_fail git clean



ok 21 - clean.requireForce defaults to true

expecting success: 

	git config clean.requireForce true &&
	test_must_fail git clean



ok 22 - clean.requireForce

expecting success: 

	mkdir -p build docs &&
	touch a.out src/part3.c docs/manual.txt obj.o build/lib.so &&
	git clean -n &&
	test -f Makefile &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test -f a.out &&
	test -f src/part3.c &&
	test -f docs/manual.txt &&
	test -f obj.o &&
	test -f build/lib.so


Would remove a.out
Would not remove docs/
Would remove src/part3.c

ok 23 - clean.requireForce and -n

expecting success: 

	git clean -f &&
	test -f README &&
	test -f src/part1.c &&
	test -f src/part2.c &&
	test ! -f a.out &&
	test ! -f src/part3.c &&
	test -f docs/manual.txt &&
	test -f obj.o &&
	test -f build/lib.so


Removing a.out
Not removing docs/
Removing src/part3.c

ok 24 - clean.requireForce and -f

expecting success: 

	echo excludes >excludes &&
	echo included >included &&
	git config core.excludesfile excludes &&
	output=$(git clean -n excludes included 2>&1) &&
	expr "$output" : ".*included" >/dev/null &&
	! expr "$output" : ".*excludes" >/dev/null



ok 25 - core.excludesfile

expecting success: 

	mkdir foo &&
	touch foo/bar &&
	(exec <foo/bar &&
	 chmod 0 foo &&
	 test_must_fail git clean -f -d &&
	 chmod 755 foo)

Removing docs/
Removing foo/
Removing included

ok 26 - removal failure

expecting success: 
	rm -fr foo bar &&
	mkdir foo bar &&
	(
		cd foo &&
		git init &&
		>hello.world
		git add . &&
		git commit -a -m nested
	) &&
	(
		cd bar &&
		>goodbye.people
	) &&
	git clean -f -d &&
	test -f foo/.git/index &&
	test -f foo/hello.world &&
	! test -d bar

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7300-clean/foo/.git/
[master (root-commit) 51fef0c] nested
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 hello.world
Removing bar/
Removing foo/

ok 27 - nested git work tree

expecting success: 
	rm -fr foo bar &&
	mkdir foo bar &&
	(
		cd foo &&
		git init &&
		>hello.world
		git add . &&
		git commit -a -m nested
	) &&
	(
		cd bar &&
		>goodbye.people
	) &&
	git clean -f -f -d &&
	! test -d foo &&
	! test -d bar

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7300-clean/foo/.git/
[master (root-commit) 51fef0c] nested
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 hello.world
Removing bar/
Removing foo/

ok 28 - force removal of nested git work tree

expecting success: 
	rm -fr repo &&
	mkdir repo &&
	(
		cd repo &&
		git init &&
		touch known 1 2 3 &&
		git add known &&
		git clean -f -e 1 -e 2 &&
		test -e 1 &&
		test -e 2 &&
		! (test -e 3) &&
		test -e known
	)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7300-clean/repo/.git/
Removing 3

ok 29 - git clean -e

# passed all 29 test(s)
1..29

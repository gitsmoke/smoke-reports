Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6001-rev-list-graft/.git/
expecting success: 
	mkdir subdir &&
	echo >fileA fileA &&
	echo >subdir/fileB fileB &&
	git add fileA subdir/fileB &&
	git commit -a -m "Initial in one history." &&
	A0=`git rev-parse --verify HEAD` &&

	echo >fileA fileA modified &&
	git commit -a -m "Second in one history." &&
	A1=`git rev-parse --verify HEAD` &&

	echo >subdir/fileB fileB modified &&
	git commit -a -m "Third in one history." &&
	A2=`git rev-parse --verify HEAD` &&

	rm -f .git/refs/heads/master .git/index &&

	echo >fileA fileA again &&
	echo >subdir/fileB fileB again &&
	git add fileA subdir/fileB &&
	git commit -a -m "Initial in alternate history." &&
	B0=`git rev-parse --verify HEAD` &&

	echo >fileA fileA modified in alternate history &&
	git commit -a -m "Second in alternate history." &&
	B1=`git rev-parse --verify HEAD` &&

	echo >subdir/fileB fileB modified in alternate history &&
	git commit -a -m "Third in alternate history." &&
	B2=`git rev-parse --verify HEAD` &&
	: done

[master (root-commit) ba4974d] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 963cf33] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 019a149] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 83a5fb1] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master b2a40c9] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 53677fe] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 53677fe1709b6c7ebca6d545e3d456f2502f51f6 -- 53677fe1709b6c7ebca6d545e3d456f2502f51f6 b2a40c9586f4745825cf3239d1f13522ee112c3e 83a5fb1bbe42c586f249dc75cc63e6d6745855bf
	

ok 2 - without grafts

expecting success: 
		echo '83a5fb1bbe42c586f249dc75cc63e6d6745855bf 019a1495703203c07675c45b09d09534fdb4b01a' >.git/info/grafts &&
		check basic 53677fe1709b6c7ebca6d545e3d456f2502f51f6 -- 53677fe1709b6c7ebca6d545e3d456f2502f51f6 b2a40c9586f4745825cf3239d1f13522ee112c3e 83a5fb1bbe42c586f249dc75cc63e6d6745855bf 019a1495703203c07675c45b09d09534fdb4b01a 963cf330af194ce9328c3134fc65f644836c5185 ba4974de063b5ad27be33f743aae5a9dce4a722c
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 53677fe1709b6c7ebca6d545e3d456f2502f51f6 subdir -- 53677fe1709b6c7ebca6d545e3d456f2502f51f6 83a5fb1bbe42c586f249dc75cc63e6d6745855bf
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '83a5fb1bbe42c586f249dc75cc63e6d6745855bf 019a1495703203c07675c45b09d09534fdb4b01a' >.git/info/grafts &&
		check basic 53677fe1709b6c7ebca6d545e3d456f2502f51f6 subdir -- 53677fe1709b6c7ebca6d545e3d456f2502f51f6 83a5fb1bbe42c586f249dc75cc63e6d6745855bf 019a1495703203c07675c45b09d09534fdb4b01a ba4974de063b5ad27be33f743aae5a9dce4a722c
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 53677fe1709b6c7ebca6d545e3d456f2502f51f6 -- 53677fe1709b6c7ebca6d545e3d456f2502f51f6 b2a40c9586f4745825cf3239d1f13522ee112c3e 83a5fb1bbe42c586f249dc75cc63e6d6745855bf
	

ok 6 - without grafts

expecting success: 
		echo '83a5fb1bbe42c586f249dc75cc63e6d6745855bf 019a1495703203c07675c45b09d09534fdb4b01a' >.git/info/grafts &&
		check parents 53677fe1709b6c7ebca6d545e3d456f2502f51f6 -- 53677fe1709b6c7ebca6d545e3d456f2502f51f6 b2a40c9586f4745825cf3239d1f13522ee112c3e 83a5fb1bbe42c586f249dc75cc63e6d6745855bf 019a1495703203c07675c45b09d09534fdb4b01a 963cf330af194ce9328c3134fc65f644836c5185 ba4974de063b5ad27be33f743aae5a9dce4a722c
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 53677fe1709b6c7ebca6d545e3d456f2502f51f6 subdir -- 53677fe1709b6c7ebca6d545e3d456f2502f51f6 83a5fb1bbe42c586f249dc75cc63e6d6745855bf
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '83a5fb1bbe42c586f249dc75cc63e6d6745855bf 019a1495703203c07675c45b09d09534fdb4b01a' >.git/info/grafts &&
		check parents 53677fe1709b6c7ebca6d545e3d456f2502f51f6 subdir -- 53677fe1709b6c7ebca6d545e3d456f2502f51f6 83a5fb1bbe42c586f249dc75cc63e6d6745855bf 019a1495703203c07675c45b09d09534fdb4b01a ba4974de063b5ad27be33f743aae5a9dce4a722c
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 53677fe1709b6c7ebca6d545e3d456f2502f51f6 -- 53677fe1709b6c7ebca6d545e3d456f2502f51f6 b2a40c9586f4745825cf3239d1f13522ee112c3e 83a5fb1bbe42c586f249dc75cc63e6d6745855bf
	

ok 10 - without grafts

expecting success: 
		echo '83a5fb1bbe42c586f249dc75cc63e6d6745855bf 019a1495703203c07675c45b09d09534fdb4b01a' >.git/info/grafts &&
		check parents-raw 53677fe1709b6c7ebca6d545e3d456f2502f51f6 -- 53677fe1709b6c7ebca6d545e3d456f2502f51f6 b2a40c9586f4745825cf3239d1f13522ee112c3e 83a5fb1bbe42c586f249dc75cc63e6d6745855bf 019a1495703203c07675c45b09d09534fdb4b01a 963cf330af194ce9328c3134fc65f644836c5185 ba4974de063b5ad27be33f743aae5a9dce4a722c
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 53677fe1709b6c7ebca6d545e3d456f2502f51f6 subdir -- 53677fe1709b6c7ebca6d545e3d456f2502f51f6 83a5fb1bbe42c586f249dc75cc63e6d6745855bf
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '83a5fb1bbe42c586f249dc75cc63e6d6745855bf 019a1495703203c07675c45b09d09534fdb4b01a' >.git/info/grafts &&
		check parents-raw 53677fe1709b6c7ebca6d545e3d456f2502f51f6 subdir -- 53677fe1709b6c7ebca6d545e3d456f2502f51f6 83a5fb1bbe42c586f249dc75cc63e6d6745855bf 019a1495703203c07675c45b09d09534fdb4b01a ba4974de063b5ad27be33f743aae5a9dce4a722c
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13

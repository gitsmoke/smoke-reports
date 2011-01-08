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

[master (root-commit) 1cc5ff7] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master e9805dc] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master ed24651] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) cd75a47] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 6d6205c] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 09bee63] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 09bee63da094879d72db6fafc9bd890da6ccbf95 -- 09bee63da094879d72db6fafc9bd890da6ccbf95 6d6205cd109bcc4bcb4abec9a4249f0b47cdf6b0 cd75a4748b2a84e3a68293b312aff728fc6e9c50
	

ok 2 - without grafts

expecting success: 
		echo 'cd75a4748b2a84e3a68293b312aff728fc6e9c50 ed24651ef86e4b3fee7834bc60ccd50959382871' >.git/info/grafts &&
		check basic 09bee63da094879d72db6fafc9bd890da6ccbf95 -- 09bee63da094879d72db6fafc9bd890da6ccbf95 6d6205cd109bcc4bcb4abec9a4249f0b47cdf6b0 cd75a4748b2a84e3a68293b312aff728fc6e9c50 ed24651ef86e4b3fee7834bc60ccd50959382871 e9805dc29cc11b103028dc27568821178fe0399c 1cc5ff72e9b23e1bab5ed68fd212e998303e5363
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 09bee63da094879d72db6fafc9bd890da6ccbf95 subdir -- 09bee63da094879d72db6fafc9bd890da6ccbf95 cd75a4748b2a84e3a68293b312aff728fc6e9c50
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo 'cd75a4748b2a84e3a68293b312aff728fc6e9c50 ed24651ef86e4b3fee7834bc60ccd50959382871' >.git/info/grafts &&
		check basic 09bee63da094879d72db6fafc9bd890da6ccbf95 subdir -- 09bee63da094879d72db6fafc9bd890da6ccbf95 cd75a4748b2a84e3a68293b312aff728fc6e9c50 ed24651ef86e4b3fee7834bc60ccd50959382871 1cc5ff72e9b23e1bab5ed68fd212e998303e5363
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 09bee63da094879d72db6fafc9bd890da6ccbf95 -- 09bee63da094879d72db6fafc9bd890da6ccbf95 6d6205cd109bcc4bcb4abec9a4249f0b47cdf6b0 cd75a4748b2a84e3a68293b312aff728fc6e9c50
	

ok 6 - without grafts

expecting success: 
		echo 'cd75a4748b2a84e3a68293b312aff728fc6e9c50 ed24651ef86e4b3fee7834bc60ccd50959382871' >.git/info/grafts &&
		check parents 09bee63da094879d72db6fafc9bd890da6ccbf95 -- 09bee63da094879d72db6fafc9bd890da6ccbf95 6d6205cd109bcc4bcb4abec9a4249f0b47cdf6b0 cd75a4748b2a84e3a68293b312aff728fc6e9c50 ed24651ef86e4b3fee7834bc60ccd50959382871 e9805dc29cc11b103028dc27568821178fe0399c 1cc5ff72e9b23e1bab5ed68fd212e998303e5363
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 09bee63da094879d72db6fafc9bd890da6ccbf95 subdir -- 09bee63da094879d72db6fafc9bd890da6ccbf95 cd75a4748b2a84e3a68293b312aff728fc6e9c50
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo 'cd75a4748b2a84e3a68293b312aff728fc6e9c50 ed24651ef86e4b3fee7834bc60ccd50959382871' >.git/info/grafts &&
		check parents 09bee63da094879d72db6fafc9bd890da6ccbf95 subdir -- 09bee63da094879d72db6fafc9bd890da6ccbf95 cd75a4748b2a84e3a68293b312aff728fc6e9c50 ed24651ef86e4b3fee7834bc60ccd50959382871 1cc5ff72e9b23e1bab5ed68fd212e998303e5363
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 09bee63da094879d72db6fafc9bd890da6ccbf95 -- 09bee63da094879d72db6fafc9bd890da6ccbf95 6d6205cd109bcc4bcb4abec9a4249f0b47cdf6b0 cd75a4748b2a84e3a68293b312aff728fc6e9c50
	

ok 10 - without grafts

expecting success: 
		echo 'cd75a4748b2a84e3a68293b312aff728fc6e9c50 ed24651ef86e4b3fee7834bc60ccd50959382871' >.git/info/grafts &&
		check parents-raw 09bee63da094879d72db6fafc9bd890da6ccbf95 -- 09bee63da094879d72db6fafc9bd890da6ccbf95 6d6205cd109bcc4bcb4abec9a4249f0b47cdf6b0 cd75a4748b2a84e3a68293b312aff728fc6e9c50 ed24651ef86e4b3fee7834bc60ccd50959382871 e9805dc29cc11b103028dc27568821178fe0399c 1cc5ff72e9b23e1bab5ed68fd212e998303e5363
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 09bee63da094879d72db6fafc9bd890da6ccbf95 subdir -- 09bee63da094879d72db6fafc9bd890da6ccbf95 cd75a4748b2a84e3a68293b312aff728fc6e9c50
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo 'cd75a4748b2a84e3a68293b312aff728fc6e9c50 ed24651ef86e4b3fee7834bc60ccd50959382871' >.git/info/grafts &&
		check parents-raw 09bee63da094879d72db6fafc9bd890da6ccbf95 subdir -- 09bee63da094879d72db6fafc9bd890da6ccbf95 cd75a4748b2a84e3a68293b312aff728fc6e9c50 ed24651ef86e4b3fee7834bc60ccd50959382871 1cc5ff72e9b23e1bab5ed68fd212e998303e5363
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13

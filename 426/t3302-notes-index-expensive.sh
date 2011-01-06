Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3302-notes-index-expensive/.git/
expecting success: 
		mkdir $count &&
		cd $count
	

ok 1 - setup / mkdir

expecting success: create_repo 10
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3302-notes-index-expensive/10/.git/

ok 2 - setup 10

expecting success: test_notes 10

ok 3 - notes work
expecting success: time_notes 100
no-notes
notes
ok 4 - notes timing with /usr/bin/time
expecting success: cd ..

ok 5 - teardown / cd ..
skipping test: setup / mkdir 
		mkdir $count &&
		cd $count
	
ok 6 # skip setup / mkdir (missing EXPENSIVE)

skipping test: setup 100 create_repo 100
ok 7 # skip setup 100 (missing EXPENSIVE)

skipping test: notes work test_notes 100
ok 8 # skip notes work (missing EXPENSIVE)
skipping test: notes timing with /usr/bin/time time_notes 100
ok 9 # skip notes timing with /usr/bin/time (missing EXPENSIVE of USR_BIN_TIME,EXPENSIVE)

skipping test: teardown / cd .. cd ..
ok 10 # skip teardown / cd .. (missing EXPENSIVE)

skipping test: setup / mkdir 
		mkdir $count &&
		cd $count
	
ok 11 # skip setup / mkdir (missing EXPENSIVE)

skipping test: setup 1000 create_repo 1000
ok 12 # skip setup 1000 (missing EXPENSIVE)

skipping test: notes work test_notes 1000
ok 13 # skip notes work (missing EXPENSIVE)

skipping test: notes timing with /usr/bin/time time_notes 100
ok 14 # skip notes timing with /usr/bin/time (missing EXPENSIVE of USR_BIN_TIME,EXPENSIVE)

skipping test: teardown / cd .. cd ..
ok 15 # skip teardown / cd .. (missing EXPENSIVE)
skipping test: setup / mkdir 
		mkdir $count &&
		cd $count
	
ok 16 # skip setup / mkdir (missing EXPENSIVE)

skipping test: setup 10000 create_repo 10000
ok 17 # skip setup 10000 (missing EXPENSIVE)

skipping test: notes work test_notes 10000
ok 18 # skip notes work (missing EXPENSIVE)

skipping test: notes timing with /usr/bin/time time_notes 100
ok 19 # skip notes timing with /usr/bin/time (missing EXPENSIVE of USR_BIN_TIME,EXPENSIVE)

skipping test: teardown / cd .. cd ..
ok 20 # skip teardown / cd .. (missing EXPENSIVE)

# passed all 20 test(s)
1..20

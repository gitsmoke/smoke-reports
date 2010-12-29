Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6016-rev-list-graph-simplify-history/.git/
expecting success: 
	# 3 commits on branch A
	test_commit A1 foo.txt &&
	test_commit A2 bar.txt &&
	test_commit A3 bar.txt &&
	git branch -m master A &&

	# 2 commits on branch B, started from A1
	git checkout -b B A1 &&
	test_commit B1 foo.txt &&
	test_commit B2 abc.txt &&

	# 2 commits on branch C, started from A2
	git checkout -b C A2 &&
	test_commit C1 xyz.txt &&
	test_commit C2 xyz.txt &&

	# Octopus merge B and C into branch A
	git checkout A &&
	git merge B C &&
	git tag A4 &&

	test_commit A5 bar.txt &&

	# More commits on C, then merge C into A
	git checkout C &&
	test_commit C3 foo.txt &&
	test_commit C4 bar.txt &&
	git checkout A &&
	git merge -s ours C &&
	git tag A6 &&

	test_commit A7 bar.txt &&

	# Store commit names in variables for later use
	A1=$(git rev-parse --verify A1) &&
	A2=$(git rev-parse --verify A2) &&
	A3=$(git rev-parse --verify A3) &&
	A4=$(git rev-parse --verify A4) &&
	A5=$(git rev-parse --verify A5) &&
	A6=$(git rev-parse --verify A6) &&
	A7=$(git rev-parse --verify A7) &&
	B1=$(git rev-parse --verify B1) &&
	B2=$(git rev-parse --verify B2) &&
	C1=$(git rev-parse --verify C1) &&
	C2=$(git rev-parse --verify C2) &&
	C3=$(git rev-parse --verify C3) &&
	C4=$(git rev-parse --verify C4)
	
[master (root-commit) 9b00348] A1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo.txt
[master 02e4832] A2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 bar.txt
[master 993a1f0] A3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[B 4accf7e] B1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[B e76ada1] B2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 abc.txt
[C 0c196cf] C1
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 xyz.txt
[C ea5d98c] C2
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Trying simple merge with B
Trying simple merge with C
Merge made by octopus.
 abc.txt |    1 +
 foo.txt |    2 +-
 xyz.txt |    1 +
 3 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 abc.txt
 create mode 100644 xyz.txt
[A 443d0d2] A5
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[C f01c181] C3
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[C 406947e] C4
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
Merge made by ours.
[A 806c60f] A7
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - set up rev-list --graph test
expecting success: 
	rm -f expected &&
	echo "* $A7" >> expected &&
	echo "*   $A6" >> expected &&
	echo "|\  " >> expected &&
	echo "| * $C4" >> expected &&
	echo "| * $C3" >> expected &&
	echo "* | $A5" >> expected &&
	echo "| |     " >> expected &&
	echo "|  \    " >> expected &&
	echo "*-. \   $A4" >> expected &&
	echo "|\ \ \  " >> expected &&
	echo "| | |/  " >> expected &&
	echo "| | * $C2" >> expected &&
	echo "| | * $C1" >> expected &&
	echo "| * | $B2" >> expected &&
	echo "| * | $B1" >> expected &&
	echo "* | | $A3" >> expected &&
	echo "| |/  " >> expected &&
	echo "|/|   " >> expected &&
	echo "* | $A2" >> expected &&
	echo "|/  " >> expected &&
	echo "* $A1" >> expected &&
	git rev-list --graph --all > actual &&
	test_cmp expected actual
	

ok 2 - --graph --all

expecting success: 
	rm -f expected &&
	git tag -d A4 &&
	echo "* $A7" >> expected &&
	echo "*   $A6" >> expected &&
	echo "|\  " >> expected &&
	echo "| * $C4" >> expected &&
	echo "| * $C3" >> expected &&
	echo "* | $A5" >> expected &&
	echo "| |     " >> expected &&
	echo "|  \    " >> expected &&
	echo "*-. \   $A4" >> expected &&
	echo "|\ \ \  " >> expected &&
	echo "| | |/  " >> expected &&
	echo "| | * $C2" >> expected &&
	echo "| | * $C1" >> expected &&
	echo "| * | $B2" >> expected &&
	echo "| * | $B1" >> expected &&
	echo "* | | $A3" >> expected &&
	echo "| |/  " >> expected &&
	echo "|/|   " >> expected &&
	echo "* | $A2" >> expected &&
	echo "|/  " >> expected &&
	echo "* $A1" >> expected &&
	git rev-list --graph --all --simplify-by-decoration > actual &&
	test_cmp expected actual
	
Deleted tag 'A4' (was e614451)

ok 3 - --graph --simplify-by-decoration

expecting success: 
	git tag -d B2 &&
	git tag -d B1 &&
	git branch -d B

Deleted tag 'B2' (was e76ada1)
Deleted tag 'B1' (was 4accf7e)
Deleted branch B (was e76ada1).

ok 4 - setup: get rid of decorations on B

expecting success: 
	rm -f expected &&
	echo "* $A7" >> expected &&
	echo "*   $A6" >> expected &&
	echo "|\  " >> expected &&
	echo "| * $C4" >> expected &&
	echo "| * $C3" >> expected &&
	echo "* | $A5" >> expected &&
	echo "* |   $A4" >> expected &&
	echo "|\ \  " >> expected &&
	echo "| |/  " >> expected &&
	echo "| * $C2" >> expected &&
	echo "| * $C1" >> expected &&
	echo "* | $A3" >> expected &&
	echo "|/  " >> expected &&
	echo "* $A2" >> expected &&
	echo "* $A1" >> expected &&
	git rev-list --graph --simplify-by-decoration --all > actual &&
	test_cmp expected actual
	

ok 5 - --graph --simplify-by-decoration prune branch B

expecting success: 
	rm -f expected &&
	echo "* $A7" >> expected &&
	echo "*   $A6" >> expected &&
	echo "|\  " >> expected &&
	echo "| * $C4" >> expected &&
	echo "* | $A5" >> expected &&
	echo "* |   $A4" >> expected &&
	echo "|\ \  " >> expected &&
	echo "| |/  " >> expected &&
	echo "* | $A3" >> expected &&
	echo "|/  " >> expected &&
	echo "* $A2" >> expected &&
	git rev-list --graph --full-history --all -- bar.txt > actual &&
	test_cmp expected actual
	

ok 6 - --graph --full-history -- bar.txt

expecting success: 
	rm -f expected &&
	echo "* $A7" >> expected &&
	echo "*   $A6" >> expected &&
	echo "|\  " >> expected &&
	echo "| * $C4" >> expected &&
	echo "* | $A5" >> expected &&
	echo "* | $A3" >> expected &&
	echo "|/  " >> expected &&
	echo "* $A2" >> expected &&
	git rev-list --graph --full-history --simplify-merges --all \
		-- bar.txt > actual &&
	test_cmp expected actual
	

ok 7 - --graph --full-history --simplify-merges -- bar.txt

expecting success: 
	rm -f expected &&
	echo "* $A7" >> expected &&
	echo "* $A5" >> expected &&
	echo "* $A3" >> expected &&
	echo "| * $C4" >> expected &&
	echo "|/  " >> expected &&
	echo "* $A2" >> expected &&
	git rev-list --graph --all -- bar.txt > actual &&
	test_cmp expected actual
	

ok 8 - --graph -- bar.txt

expecting success: 
	rm -f expected &&
	echo "* $A7" >> expected &&
	echo "* $A6" >> expected &&
	echo "* $A5" >> expected &&
	echo "* $A4" >> expected &&
	echo "* $A3" >> expected &&
	echo "| * $C4" >> expected &&
	echo "| * $C3" >> expected &&
	echo "| * $C2" >> expected &&
	echo "| * $C1" >> expected &&
	echo "|/  " >> expected &&
	echo "* $A2" >> expected &&
	echo "* $A1" >> expected &&
	git rev-list --graph --sparse --all -- bar.txt > actual &&
	test_cmp expected actual
	

ok 9 - --graph --sparse -- bar.txt
expecting success: 
	rm -f expected &&
	echo "* $A7" >> expected &&
	echo "* $A6" >> expected &&
	echo "* $A5" >> expected &&
	echo "*   $A4" >> expected &&
	echo "|\  " >> expected &&
	echo "| * $B2" >> expected &&
	echo "| * $B1" >> expected &&
	echo "* $A3" >> expected &&
	git rev-list --graph --all ^C4 > actual &&
	test_cmp expected actual
	

ok 10 - --graph ^C4

expecting success: 
	rm -f expected &&
	echo "* $A7" >> expected &&
	echo "*   $A6" >> expected &&
	echo "|\  " >> expected &&
	echo "| * $C4" >> expected &&
	echo "* $A5" >> expected &&
	echo "*   $A4" >> expected &&
	echo "|\  " >> expected &&
	echo "| * $B2" >> expected &&
	echo "| * $B1" >> expected &&
	echo "* $A3" >> expected &&
	git rev-list --graph --all ^C3 > actual &&
	test_cmp expected actual
	

ok 11 - --graph ^C3

expecting success: 
	rm -f expected &&
	echo "* $A7" >> expected &&
	echo "*   $A6" >> expected &&
	echo "|\  " >> expected &&
	echo "| * $C4" >> expected &&
	echo "* | $A5" >> expected &&
	echo "| |     " >> expected &&
	echo "|  \    " >> expected &&
	echo "*-. \   $A4" >> expected &&
	echo "|\ \ \  " >> expected &&
	echo "| * | | $B2" >> expected &&
	echo "| * | | $B1" >> expected &&
	echo "* | | | $A3" >> expected &&
	echo "o | | | $A2" >> expected &&
	echo "|/ / /  " >> expected &&
	echo "o | | $A1" >> expected &&
	echo " / /  " >> expected &&
	echo "| o $C3" >> expected &&
	echo "|/  " >> expected &&
	echo "o $C2" >> expected &&
	git rev-list --graph --boundary --all ^C3 > actual &&
	test_cmp expected actual
	

ok 12 - --graph --boundary ^C3

# passed all 12 test(s)
1..12

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4105-apply-fuzz/.git/
expecting success: 

	for i in 1 2 3 4 5 6 7 8 9 10 11 12
	do
		echo $i
	done >file &&
	git update-index --add file &&
	for i in 1 2 3 4 5 6 7 a b c d e 8 9 10 11 12
	do
		echo $i
	done >file &&
	cat file >expect &&
	git diff >O0.diff &&

	sed -e "s/@@ -5,6 +5,11 @@/@@ -2,6 +2,11 @@/" >O1.diff O0.diff &&
	sed -e "s/@@ -5,6 +5,11 @@/@@ -7,6 +7,11 @@/" >O2.diff O0.diff &&
	sed -e "s/@@ -5,6 +5,11 @@/@@ -19,6 +19,11 @@/" >O3.diff O0.diff &&

	sed -e "s/^ 5/ S/" >F0.diff O0.diff &&
	sed -e "s/^ 5/ S/" >F1.diff O1.diff &&
	sed -e "s/^ 5/ S/" >F2.diff O2.diff &&
	sed -e "s/^ 5/ S/" >F3.diff O3.diff

ok 1 - setup

expecting success: 
		git checkout-index -f -q -u file &&
		git apply O0.diff &&
		test_cmp expect file
	

ok 2 - unmodified patch

expecting success: 
		git checkout-index -f -q -u file &&
		git apply O1.diff &&
		test_cmp expect file
	

ok 3 - minus offset

expecting success: 
		git checkout-index -f -q -u file &&
		git apply O2.diff &&
		test_cmp expect file
	

ok 4 - plus offset

expecting success: 
		git checkout-index -f -q -u file &&
		git apply O3.diff &&
		test_cmp expect file
	

ok 5 - big offset

expecting success: 
		git checkout-index -f -q -u file &&
		git apply -C2 F0.diff &&
		test_cmp expect file
	

ok 6 - fuzz with no offset

expecting success: 
		git checkout-index -f -q -u file &&
		git apply -C2 F1.diff &&
		test_cmp expect file
	

ok 7 - fuzz with minus offset

expecting success: 
		git checkout-index -f -q -u file &&
		git apply -C2 F2.diff &&
		test_cmp expect file
	
ok 8 - fuzz with plus offset
expecting success: 
		git checkout-index -f -q -u file &&
		git apply -C2 F3.diff &&
		test_cmp expect file
	
ok 9 - fuzz with big offset

# passed all 9 test(s)
1..9

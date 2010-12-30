Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0080-vcs-svn/.git/
expecting success: 
	cat <<-\EOF >expected &&
	0
	1
	EOF

	test-obj-pool <<-\EOF >actual &&
	alloc one 16
	set one 13
	test one 13
	reset one
	EOF
	test_cmp expected actual


ok 1 - obj pool: store data

expecting success: 
	echo "$uint32_max" >expected &&
	echo null one | test-obj-pool >actual &&
	test_cmp expected actual

ok 2 - obj pool: NULL is offset ~0

expecting success: 
	cat <<-EOF >expected &&
	0
	0
	$uint32_max
	$uint32_max
	16
	20
	$uint32_max
	EOF

	test-obj-pool <<-\EOF >actual &&
	alloc one 16
	alloc two 16
	offset one 20
	offset two 20
	alloc one 5
	offset one 20
	free one 1
	offset one 20
	reset one
	reset two
	EOF
	test_cmp expected actual

ok 3 - obj pool: out-of-bounds access

expecting success: 
	cat <<-\EOF >expected &&
	0
	0
	10
	20
	20
	20
	EOF

	test-obj-pool <<-\EOF >actual &&
	alloc one 10
	committed one
	alloc one 10
	commit one
	committed one
	alloc one 10
	free one 20
	committed one
	reset one
	EOF
	test_cmp expected actual


ok 4 - obj pool: high-water mark
expecting success: 
	echo HELLO >expected1 &&
	printf "%s
" "" HELLO >expected2 &&
	echo >expected3 &&
	printf "%s
" "" Q | q_to_nul >expected4 &&
	printf "%s
" foo "" >expected5 &&
	printf "%s
" "" foo >expected6 &&

	test-line-buffer <<-\EOF >actual1 &&
	5
	HELLO
	EOF

	test-line-buffer <<-\EOF >actual2 &&
	0

	5
	HELLO
	EOF

	q_to_nul <<-\EOF |
	1
	Q
	EOF
	test-line-buffer >actual3 &&

	q_to_nul <<-\EOF |
	0

	1
	Q
	EOF
	test-line-buffer >actual4 &&

	test-line-buffer <<-\EOF >actual5 &&
	5
	foo
	EOF

	test-line-buffer <<-\EOF >actual6 &&
	0

	5
	foo
	EOF

	test_cmp expected1 actual1 &&
	test_cmp expected2 actual2 &&
	test_cmp expected3 actual3 &&
	test_cmp expected4 actual4 &&
	test_cmp expected5 actual5 &&
	test_cmp expected6 actual6

ok 5 - line buffer

expecting success: 
	echo a does not equal b >expected.differ &&
	echo a equals a >expected.match &&
	echo equals equals equals >expected.matchmore &&

	test-string-pool "a,--b" >actual.differ &&
	test-string-pool "a,a" >actual.match &&
	test-string-pool "equals-equals" >actual.matchmore &&
	test_must_fail test-string-pool a,a,a &&
	test_must_fail test-string-pool a &&

	test_cmp expected.differ actual.differ &&
	test_cmp expected.match actual.match &&
	test_cmp expected.matchmore actual.matchmore
ok 6 - string pool

expecting success: 
	cat <<-\EOF >unsorted &&
	68
	12
	13
	13
	68
	13
	13
	21
	10
	11
	12
	13
	13
	EOF
	sort unsorted >expected &&

	test-treap <unsorted >actual &&
	test_cmp expected actual

ok 7 - treap sort

# passed all 7 test(s)
1..7

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7401-submodule-summary/.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7401-submodule-summary/sm1/.git/
expecting success: 
	git add sm1 &&
	git submodule summary >actual &&
	cat >expected <<-EOF &&
* sm1 0000000...a2c4dab (2):
  > Add foo2

EOF
	test_cmp expected actual

ok 1 - added submodule
expecting success: 
	git submodule summary >actual &&
	cat >expected <<-EOF &&
* sm1 a2c4dab...4c8d358 (1):
  > Add foo3

EOF
	test_cmp expected actual

ok 2 - modified submodule(forward)

expecting success: 
	git submodule summary --files >actual &&
	cat >expected <<-EOF &&
* sm1 a2c4dab...4c8d358 (1):
  > Add foo3

EOF
	test_cmp expected actual

ok 3 - modified submodule(forward), --files
expecting success: 
    git submodule summary >actual &&
    cat >expected <<-EOF &&
* sm1 4c8d358...db425b6 (2):
  < Add foo3
  < Add foo2

EOF
	test_cmp expected actual

ok 4 - modified submodule(backward)
expecting success: 
    git submodule summary >actual &&
    cat >expected <<-EOF &&
* sm1 4c8d358...41fbea9 (4):
  > Add foo5
  > Add foo4
  < Add foo3
  < Add foo2

EOF
	test_cmp expected actual

ok 5 - modified submodule(backward and forward)

expecting success: 
    git submodule summary -n 3 >actual &&
    cat >expected <<-EOF &&
* sm1 4c8d358...41fbea9 (4):
  > Add foo5
  > Add foo4
  < Add foo3

EOF
    test_cmp expected actual

ok 6 - --summary-limit

expecting success: 
    git submodule summary --cached >actual &&
    cat >expected <<-EOF &&
* sm1 41fbea9(submodule)->9da5fb8(blob) (3):
  < Add foo5

EOF
	test_cmp actual expected

ok 7 - typechanged submodule(submodule->blob), --cached

expecting success: 
    git submodule summary --files >actual &&
    cat >expected <<-EOF &&
* sm1 9da5fb8(blob)->41fbea9(submodule) (3):
  > Add foo5

EOF
    test_cmp actual expected

ok 8 - typechanged submodule(submodule->blob), --files
expecting success: 
    git submodule summary >actual &&
    cat >expected <<-EOF &&
* sm1 41fbea9(submodule)->9da5fb8(blob):

EOF
    test_cmp actual expected

ok 9 - typechanged submodule(submodule->blob)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7401-submodule-summary/sm1/.git/
expecting success: 
    git submodule summary >actual &&
    cat >expected <<-EOF &&
* sm1 41fbea9...6858906:
  Warn: sm1 doesn't contain commit 41fbea99b81568012be3e9bcc31431971c1e5bc5

EOF
    test_cmp actual expected

ok 10 - nonexistent commit

expecting success: 
    git submodule summary >actual &&
    cat >expected <<-EOF &&
* sm1 9da5fb8(blob)->6858906(submodule) (2):
  > Add foo7

EOF
    test_cmp expected actual


ok 11 - typechanged submodule(blob->submodule)

expecting success: 
    git submodule summary >actual &&
    cat >expected <<-EOF &&
* sm1 6858906...0000000:

EOF
    test_cmp expected actual


ok 12 - deleted submodule

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7401-submodule-summary/sm2/.git/
expecting success: 
    git submodule summary >actual &&
    cat >expected <<-EOF &&
* sm1 6858906...0000000:

* sm2 0000000...fa9eeaf (2):
  > Add foo9

EOF
    test_cmp expected actual
ok 13 - multiple submodules

expecting success: 
    git submodule summary sm2 >actual &&
    cat >expected <<-EOF &&
* sm2 0000000...fa9eeaf (2):
  > Add foo9

EOF
    test_cmp expected actual

ok 14 - path filter

expecting success: 
    git submodule summary HEAD^ >actual &&
    cat >expected <<-EOF &&
* sm1 6858906...0000000:

* sm2 0000000...fa9eeaf (2):
  > Add foo9

EOF
    test_cmp expected actual

ok 15 - given commit

expecting success: 
    git submodule summary --for-status HEAD^ >actual &&
    test_cmp actual - <<EOF
# Submodule changes to be committed:
#
# * sm1 6858906...0000000:
#
# * sm2 0000000...fa9eeaf (2):
#   > Add foo9
#
EOF
ok 16 - --for-status

expecting success: 
    test_must_fail git submodule summary --files --cached
ok 17 - fail when using --files together with --cached
expecting success: 
    git init xyzzy &&
    cd xyzzy &&
    git submodule summary >output 2>&1 &&
    test_cmp output /dev/null
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7401-submodule-summary/xyzzy/.git/
ok 18 - should not fail in an empty repo

# passed all 18 test(s)
1..18

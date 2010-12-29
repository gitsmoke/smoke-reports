Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3300-funny-names/.git/
expecting success: 
echo 'just space
no-funny' >expected


ok 1 - setup expect

expecting success: git update-index --add "$p0" "$p2" &&
	git ls-files >current &&
	test_cmp expected current

ok 2 - git ls-files no-funny

expecting success: 
t0=`git write-tree` &&
echo "$t0" >t0 &&

cat > expected <<\EOF
just space
no-funny
"tabs	,\" (dq) and spaces"
EOF

ok 3 - setup expect

expecting success: git update-index --add "$p1" &&
	git ls-files >current &&
	test_cmp expected current

ok 4 - git ls-files with-funny

expecting success: 
echo 'just space
no-funny
tabs	," (dq) and spaces' >expected


ok 5 - setup expect

expecting success: git ls-files -z | perl -pe y/\000/\012/ >current &&
	test_cmp expected current

ok 6 - git ls-files -z with-funny

expecting success: 
t1=`git write-tree` &&
echo "$t1" >t1 &&

cat > expected <<\EOF
just space
no-funny
"tabs	,\" (dq) and spaces"
EOF

ok 7 - setup expect

expecting success: git ls-tree -r $t1 | sed -e "s/^[^	]*	//" >current &&
	 test_cmp expected current

ok 8 - git ls-tree with funny

expecting success: 
cat > expected <<\EOF
A	"tabs	,\" (dq) and spaces"
EOF


ok 9 - setup expect

expecting success: git diff-index --name-status $t0 >current &&
	test_cmp expected current

ok 10 - git diff-index with-funny

expecting success: git diff-tree --name-status $t0 $t1 >current &&
	test_cmp expected current

ok 11 - git diff-tree with-funny

expecting success: 
echo 'A
tabs	," (dq) and spaces' >expected


ok 12 - setup expect

expecting success: git diff-index -z --name-status $t0 | perl -pe y/\000/\012/ >current &&
	test_cmp expected current

ok 13 - git diff-index -z with-funny

expecting success: git diff-tree -z --name-status $t0 $t1 | perl -pe y/\000/\012/ >current &&
	test_cmp expected current

ok 14 - git diff-tree -z with-funny

expecting success: 
cat > expected <<\EOF
CNUM	no-funny	"tabs	,\" (dq) and spaces"
EOF

ok 15 - setup expect

expecting success: git diff-tree -C --find-copies-harder --name-status \
		$t0 $t1 | sed -e s/^C[0-9]*/CNUM/ >current &&
	test_cmp expected current

ok 16 - git diff-tree -C with-funny

expecting success: 
cat > expected <<\EOF
RNUM	no-funny	"tabs	,\" (dq) and spaces"
EOF


ok 17 - setup expect

expecting success: git update-index --force-remove "$p0" &&
	git diff-index -M --name-status \
		$t0 | sed -e s/^R[0-9]*/RNUM/ >current &&
	test_cmp expected current

ok 18 - git diff-tree delete with-funny

expecting success: 
cat > expected <<\EOF
diff --git a/no-funny "b/tabs	,\" (dq) and spaces"
similarity index NUM%
rename from no-funny
rename to "tabs	,\" (dq) and spaces"
EOF


ok 19 - setup expect

expecting success: git diff-index -M -p $t0 |
	 sed -e "s/index [0-9]*%/index NUM%/" >current &&
	 test_cmp expected current

ok 20 - git diff-tree delete with-funny

expecting success: 
chmod +x "$p1" &&
cat > expected <<\EOF
diff --git a/no-funny "b/tabs	,\" (dq) and spaces"
old mode 100644
new mode 100755
similarity index NUM%
rename from no-funny
rename to "tabs	,\" (dq) and spaces"
EOF


ok 21 - setup expect

expecting success: git diff-index -M -p $t0 |
	 sed -e "s/index [0-9]*%/index NUM%/" >current &&
	 test_cmp expected current

ok 22 - git diff-tree delete with-funny

expecting success: 
cat >expected <<\EOF
 "tabs	,\" (dq) and spaces"
 1 files changed, 0 insertions(+), 0 deletions(-)
EOF

ok 23 - setup expect

expecting success: git diff-index -M -p $t0 |
	 git apply --stat | sed -e "s/|.*//" -e "s/ *\$//" >current &&
	 test_cmp expected current

ok 24 - git diff-tree rename with-funny applied

expecting success: 
cat > expected <<\EOF
 no-funny
 "tabs	,\" (dq) and spaces"
 2 files changed, 3 insertions(+), 3 deletions(-)
EOF


ok 25 - setup expect

expecting success: git diff-index -p $t0 |
	 git apply --stat | sed -e "s/|.*//" -e "s/ *\$//" >current &&
	 test_cmp expected current

ok 26 - git diff-tree delete with-funny applied

expecting success: git diff-index -p $t0 |
	 sed -ne "/^[-+@]/p" |
	 git apply --stat | sed -e "s/|.*//" -e "s/ *\$//" >current &&
	 test_cmp expected current

ok 27 - git apply non-git diff

# passed all 27 test(s)
1..27

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4004-diff-rename-symlink/.git/
expecting success: echo xyzzy | tr -d \012 >yomin &&
     ln -s xyzzy frotz &&
    git update-index --add frotz yomin &&
    tree=$(git write-tree) &&
    echo $tree
e8a7292168115b2c189b56bd500aa179ca8d69ba

ok 1 - prepare reference tree

expecting success: mv frotz rezrov &&
     rm -f yomin &&
     ln -s xyzzy nitfol &&
     ln -s xzzzy bozbar &&
    git update-index --add --remove frotz rezrov nitfol bozbar yomin

ok 2 - prepare work tree

expecting success: 
    GIT_DIFF_OPTS=--unified=0 git diff-index -M -p e8a7292168115b2c189b56bd500aa179ca8d69ba >current &&
    cat >expected <<\EOF
diff --git a/bozbar b/bozbar
new file mode 120000
--- /dev/null
+++ b/bozbar
@@ -0,0 +1 @@
+xzzzy
\ No newline at end of file
diff --git a/frotz b/nitfol
similarity index 100%
copy from frotz
copy to nitfol
diff --git a/frotz b/rezrov
similarity index 100%
rename from frotz
rename to rezrov
diff --git a/yomin b/yomin
deleted file mode 100644
--- a/yomin
+++ /dev/null
@@ -1 +0,0 @@
-xyzzy
\ No newline at end of file
EOF


ok 3 - setup diff output

expecting success: compare_diff_patch current expected

ok 4 - validate diff output

# passed all 4 test(s)
1..4

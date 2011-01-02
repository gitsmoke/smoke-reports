Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9400-git-cvsserver-server/.git/
expecting success: 
  echo >empty &&
  git add empty &&
  git commit -q -m "First Commit" &&
  mkdir secondroot &&
  ( cd secondroot &&
  git init &&
  touch secondrootfile &&
  git add secondrootfile &&
  git commit -m "second root") &&
  git pull secondroot master &&
  git clone -q --bare "$WORKDIR/.git" "$SERVERDIR" >/dev/null 2>&1 &&
  GIT_DIR="$SERVERDIR" git config --bool gitcvs.enabled true &&
  GIT_DIR="$SERVERDIR" git config gitcvs.logfile "$SERVERDIR/gitcvs.log" &&
  GIT_DIR="$SERVERDIR" git config gitcvs.authdb "$SERVERDIR/auth.db" &&
  echo cvsuser:cvGVEarMLnhlA > "$SERVERDIR/auth.db"

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9400-git-cvsserver-server/secondroot/.git/
[master (root-commit) 9b7414d] second root
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 secondrootfile
Merging:
16705ff First Commit
virtual 9b7414d0de4b91a446173d97e16d8374115e5e87
found 0 common ancestor(s):
Merge made by recursive.
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 secondrootfile

ok 1 - setup

expecting success: GIT_CONFIG="$git_config" cvs -Q co -d cvswork master &&
   test "$(echo $(grep -v ^D cvswork/CVS/Entries|cut -d/ -f2,3,5 | head -n 1))" = "empty/1.1/" &&
   test "$(echo $(grep -v ^D cvswork/CVS/Entries|cut -d/ -f2,3,5 | sed -ne \$p))" = "secondrootfile/1.1/"
U cvswork/empty
U cvswork/secondrootfile

ok 2 - basic checkout

expecting success: cat request-anonymous | git-cvsserver pserver >log 2>&1 &&
   sed -ne \$p log | grep "^I LOVE YOU\$"
I LOVE YOU

ok 3 - pserver authentication

expecting success: if cat request-git | git-cvsserver pserver >log 2>&1
   then
       false
   else
       true
   fi &&
   sed -ne \$p log | grep "^I HATE YOU\$"
I HATE YOU

ok 4 - pserver authentication failure (non-anonymous user)

expecting success: cat login-git-ok | git-cvsserver pserver >log 2>&1 &&
   sed -ne \$p log | grep "^I LOVE YOU\$"
I LOVE YOU

ok 5 - pserver authentication success (non-anonymous user with password)

expecting success: cat login-anonymous | git-cvsserver pserver >log 2>&1 &&
   sed -ne \$p log | grep "^I LOVE YOU\$"
I LOVE YOU

ok 6 - pserver authentication (login)

expecting success: if cat login-git | git-cvsserver pserver >log 2>&1
   then
       false
   else
       true
   fi &&
   sed -ne \$p log | grep "^I HATE YOU\$"
I HATE YOU

ok 7 - pserver authentication failure (login/non-anonymous user)

expecting success: if cat request-relative | git-cvsserver pserver >log 2>&1
   then
       echo unexpected success
       false
   else
       true
   fi &&
   tail log | grep "^error 1 Root must be an absolute pathname$"
error 1 Root must be an absolute pathname

ok 8 - req_Root failure (relative pathname)

expecting success: cat request-conflict | git-cvsserver pserver >log 2>&1 &&
   tail log | grep "^error 1 Conflicting roots specified$"
error 1 Conflicting roots specified

ok 9 - req_Root failure (conflicting roots)

expecting success: cat request-anonymous | git-cvsserver --strict-paths pserver "$SERVERDIR" >log 2>&1 &&
   sed -ne \$p log | grep "^I LOVE YOU\$"
I LOVE YOU

ok 10 - req_Root (strict paths)

expecting success: 
    ! cat request-anonymous |
    git-cvsserver --strict-paths pserver "$WORKDIR" >log 2>&1


ok 11 - req_Root failure (strict-paths)

expecting success: cat request-anonymous | git-cvsserver pserver "$WORKDIR/" >log 2>&1 &&
   sed -ne \$p log | grep "^I LOVE YOU\$"
I LOVE YOU

ok 12 - req_Root (w/o strict-paths)

expecting success: 
    ! cat request-anonymous |
    git-cvsserver pserver "$WORKDIR/gitcvs" >log 2>&1


ok 13 - req_Root failure (w/o strict-paths)

expecting success: cat request-base | git-cvsserver --strict-paths --base-path "$WORKDIR/" pserver "$SERVERDIR" >log 2>&1 &&
   sed -ne \$p log | grep "^I LOVE YOU\$"
I LOVE YOU

ok 14 - req_Root (base-path)

expecting success: 
    ! cat request-anonymous |
    git-cvsserver --strict-paths --base-path "$WORKDIR" pserver "$SERVERDIR" >log 2>&1


ok 15 - req_Root failure (base-path)

expecting success: cat request-anonymous | git-cvsserver --export-all pserver "$WORKDIR" >log 2>&1 &&
   sed -ne \$p log | grep "^I LOVE YOU\$"
I LOVE YOU

ok 16 - req_Root (export-all)

expecting success: ! (cat request-anonymous | git-cvsserver --export-all pserver >log 2>&1 || false)

ok 17 - req_Root failure (export-all w/o whitelist)

expecting success: cat request-base | git-cvsserver --export-all --strict-paths --base-path "$WORKDIR/" pserver "$SERVERDIR" >log 2>&1 &&
   sed -ne \$p log | grep "^I LOVE YOU\$"
I LOVE YOU

ok 18 - req_Root (everything together)

expecting success: GIT_DIR="$SERVERDIR" git config --bool gitcvs.enabled false &&
   if GIT_CONFIG="$git_config" cvs -Q co -d cvswork2 master >cvs.log 2>&1
   then
     echo unexpected cvs success
     false
   else
     true
   fi &&
   grep "GITCVS emulation disabled" cvs.log &&
   test ! -d cvswork2
GITCVS emulation disabled

ok 19 - gitcvs.enabled = false

expecting success: GIT_DIR="$SERVERDIR" git config --bool gitcvs.ext.enabled true &&
   GIT_DIR="$SERVERDIR" git config --bool gitcvs.enabled false &&
   GIT_CONFIG="$git_config" cvs -Q co -d cvswork2 master >cvs.log 2>&1 &&
   test_cmp cvswork cvswork2
Common subdirectories: cvswork/CVS and cvswork2/CVS

ok 20 - gitcvs.ext.enabled = true

expecting success: GIT_DIR="$SERVERDIR" git config --bool gitcvs.ext.enabled false &&
   GIT_DIR="$SERVERDIR" git config --bool gitcvs.enabled true &&
   if GIT_CONFIG="$git_config" cvs -Q co -d cvswork2 master >cvs.log 2>&1
   then
     echo unexpected cvs success
     false
   else
     true
   fi &&
   grep "GITCVS emulation disabled" cvs.log &&
   test ! -d cvswork2
GITCVS emulation disabled

ok 21 - gitcvs.ext.enabled = false

expecting success: GIT_DIR="$SERVERDIR" git config --bool gitcvs.ext.enabled true &&
   GIT_DIR="$SERVERDIR" git config gitcvs.dbname %Ggitcvs.%a.%m.sqlite &&
   GIT_CONFIG="$git_config" cvs -Q co -d cvswork2 master >cvs.log 2>&1 &&
   test_cmp cvswork cvswork2 &&
   test -f "$SERVERDIR/gitcvs.ext.master.sqlite" &&
   cmp "$SERVERDIR/gitcvs.master.sqlite" "$SERVERDIR/gitcvs.ext.master.sqlite"
Common subdirectories: cvswork/CVS and cvswork2/CVS

ok 22 - gitcvs.dbname

expecting success: GIT_DIR="$SERVERDIR" git config --bool gitcvs.ext.enabled true &&
   GIT_DIR="$SERVERDIR" git config gitcvs.ext.dbname %Ggitcvs1.%a.%m.sqlite &&
   GIT_DIR="$SERVERDIR" git config gitcvs.dbname %Ggitcvs2.%a.%m.sqlite &&
   GIT_CONFIG="$git_config" cvs -Q co -d cvswork2 master >cvs.log 2>&1 &&
   test_cmp cvswork cvswork2 &&
   test -f "$SERVERDIR/gitcvs1.ext.master.sqlite" &&
   test ! -f "$SERVERDIR/gitcvs2.ext.master.sqlite" &&
   cmp "$SERVERDIR/gitcvs.master.sqlite" "$SERVERDIR/gitcvs1.ext.master.sqlite"
Common subdirectories: cvswork/CVS and cvswork2/CVS

ok 23 - gitcvs.ext.dbname
expecting success: echo testfile1 >testfile1 &&
   git add testfile1 &&
   git commit -q -m "Add testfile1" &&
   git push gitcvs.git >/dev/null &&
   cd cvswork &&
   GIT_CONFIG="$git_config" cvs -Q update &&
   test "$(echo $(grep testfile1 CVS/Entries|cut -d/ -f2,3,5))" = "testfile1/1.1/" &&
   test_cmp testfile1 ../testfile1
U testfile1

ok 24 - cvs update (create new file)

expecting success: echo line 2 >>testfile1 &&
   git add testfile1 &&
   git commit -q -m "Append to testfile1" &&
   git push gitcvs.git >/dev/null &&
   cd cvswork &&
   GIT_CONFIG="$git_config" cvs -Q update &&
   test "$(echo $(grep testfile1 CVS/Entries|cut -d/ -f2,3,5))" = "testfile1/1.2/" &&
   test_cmp testfile1 ../testfile1
U testfile1
ok 25 - cvs update (update existing file)

checking known breakage: 
   mkdir test &&
   echo >test/empty &&
   git add test &&
   git commit -q -m "Single Subdirectory" &&
   git push gitcvs.git >/dev/null &&
   cd cvswork &&
   GIT_CONFIG="$git_config" cvs -Q update &&
   test ! -d test
U test/empty

not ok 26 - cvs update w/o -d doesn't create subdir (TODO) # TODO known breakage

expecting success: (for dir in A A/B A/B/C A/D E; do
      mkdir $dir &&
      echo "test file in $dir" >"$dir/file_in_$(echo $dir|sed -e "s#/# #g")"  &&
      git add $dir;
   done) &&
   git commit -q -m "deep sub directory structure" &&
   git push gitcvs.git >/dev/null &&
   cd cvswork &&
   GIT_CONFIG="$git_config" cvs -Q update -d &&
   (for dir in A A/B A/B/C A/D E; do
      filename="file_in_$(echo $dir|sed -e "s#/# #g")" &&
      if test "$(echo $(grep -v ^D $dir/CVS/Entries|cut -d/ -f2,3,5))" = "$filename/1.1/" &&
	test_cmp "$dir/$filename" "../$dir/$filename"; then
        :
      else
        echo >failure
      fi
    done) &&
   test ! -f failure
U A/B/C/file_in_A B C
U A/B/file_in_A B
U A/D/file_in_A D
U A/file_in_A
U E/file_in_E

ok 27 - cvs update (subdirectories)

expecting success: git rm testfile1 &&
   git commit -q -m "Remove testfile1" &&
   git push gitcvs.git >/dev/null &&
   cd cvswork &&
   GIT_CONFIG="$git_config" cvs -Q update &&
   test -z "$(grep testfile1 CVS/Entries)" &&
   test ! -f testfile1
rm 'testfile1'

ok 28 - cvs update (delete file)

expecting success: echo readded testfile >testfile1 &&
   git add testfile1 &&
   git commit -q -m "Re-Add testfile1" &&
   git push gitcvs.git >/dev/null &&
   cd cvswork &&
   GIT_CONFIG="$git_config" cvs -Q update &&
   test "$(echo $(grep testfile1 CVS/Entries|cut -d/ -f2,3,5))" = "testfile1/1.4/" &&
   test_cmp testfile1 ../testfile1
U testfile1

ok 29 - cvs update (re-add deleted file)

expecting success: echo Line 0 >expected &&
   for i in 1 2 3 4 5 6 7
   do
     echo Line $i >>merge
     echo Line $i >>expected
   done &&
   echo Line 8 >>expected &&
   git add merge &&
   git commit -q -m "Merge test (pre-merge)" &&
   git push gitcvs.git >/dev/null &&
   cd cvswork &&
   GIT_CONFIG="$git_config" cvs -Q update &&
   test "$(echo $(grep merge CVS/Entries|cut -d/ -f2,3,5))" = "merge/1.1/" &&
   test_cmp merge ../merge &&
   ( echo Line 0; cat merge ) >merge.tmp &&
   mv merge.tmp merge &&
   cd "$WORKDIR" &&
   echo Line 8 >>merge &&
   git add merge &&
   git commit -q -m "Merge test (merge)" &&
   git push gitcvs.git >/dev/null &&
   cd cvswork &&
   sleep 1 && touch merge &&
   GIT_CONFIG="$git_config" cvs -Q update &&
   test_cmp merge ../expected
U merge
Merging differences between 1.1 and 1.2 into merge
M merge

ok 30 - cvs update (merge)
expecting success: ( echo LINE 0; cat merge ) >merge.tmp &&
   mv merge.tmp merge &&
   git add merge &&
   git commit -q -m "Merge test (conflict)" &&
   git push gitcvs.git >/dev/null &&
   cd cvswork &&
   GIT_CONFIG="$git_config" cvs -Q update &&
   test_cmp merge ../expected.C
Merging differences between 1.2 and 1.3 into merge
C merge

ok 31 - cvs update (conflict merge)

expecting success: cd cvswork &&
   GIT_CONFIG="$git_config" cvs -Q update -C &&
   test_cmp merge ../merge
U A/B/C/file_in_A B C
U A/B/file_in_A B
U A/D/file_in_A D
U A/file_in_A
U E/file_in_E
U empty
U merge
U secondrootfile
U test/empty
U testfile1

ok 32 - cvs update (-C)

expecting success: echo Line 9 >>merge &&
    cp merge cvswork/merge &&
    git add merge &&
    git commit -q -m "Merge test (no-op)" &&
    git push gitcvs.git >/dev/null &&
    cd cvswork &&
    sleep 1 && touch merge &&
    GIT_CONFIG="$git_config" cvs -Q update &&
    test_cmp merge ../merge
Merging differences between 1.3 and 1.4 into merge
M merge

ok 33 - cvs update (merge no-op)
expecting success: 
    touch really-empty &&
    echo Line 1 > no-lf &&
    printf "Line 2" >> no-lf &&
    git add really-empty no-lf &&
    git commit -q -m "Update -p test" &&
    git push gitcvs.git >/dev/null &&
    cd cvswork &&
    GIT_CONFIG="$git_config" cvs update &&
    rm -f failures &&
    for i in merge no-lf empty really-empty; do
        GIT_CONFIG="$git_config" cvs update -p "$i" >$i.out
	test_cmp $i.out ../$i >>failures 2>&1
    done &&
    test -z "$(cat failures)"
M merge
U no-lf
U really-empty
ok 34 - cvs update (-p)

expecting success: 
    GIT_DIR="$SERVERDIR" git pack-refs --all &&
    GIT_CONFIG="$git_config" cvs -n up -d 2> out &&
    grep "cvs update: New directory \`master'" < out
cvs update: New directory `master'

ok 35 - cvs update (module list supports packed refs)
expecting success: 
    mkdir status.dir &&
    echo Line > status.dir/status.file &&
    echo Line > status.file &&
    git add status.dir status.file &&
    git commit -q -m "Status test" &&
    git push gitcvs.git >/dev/null &&
    cd cvswork &&
    GIT_CONFIG="$git_config" cvs update &&
    GIT_CONFIG="$git_config" cvs status | grep "^File: status.file" >../out &&
    test $(wc -l <../out) = 2
M merge
U status.dir/status.file
U status.file
ok 36 - cvs status
expecting success: 
    cd cvswork &&
    GIT_CONFIG="$git_config" cvs status -l | grep "^File: status.file" >../out &&
    test $(wc -l <../out) = 1

ok 37 - cvs status (nonrecursive)

expecting success: 
    cd cvswork &&
    GIT_CONFIG="$git_config" cvs status | grep ^File: >../out &&
    ! grep / <../out

ok 38 - cvs status (no subdirs in header)

expecting success: 
    GIT_CONFIG="$git_config" cvs co -c > out &&
    grep "^master[	 ]\+master$" < out &&
    ! grep -v "^master[	 ]\+master$" < out
master	master

ok 39 - cvs co -c (shows module database)

expecting success: 
    cd cvswork &&
    GIT_CONFIG="$git_config" cvs annotate merge >../out &&
    sed -e "s/ .*//" ../out >../actual &&
    for i in 3 1 1 1 1 1 1 1 2 4; do echo 1.$i; done >../expect &&
    test_cmp ../expect ../actual


ok 40 - cvs annotate

# still have 1 known breakage(s)
# passed all remaining 39 test(s)
1..40

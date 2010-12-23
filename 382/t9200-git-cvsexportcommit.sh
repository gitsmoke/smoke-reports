Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/.git/
expecting success: mkdir A B C D E F &&
     echo hello1 >A/newfile1.txt &&
     echo hello2 >B/newfile2.txt &&
     cp "$TEST_DIRECTORY"/test9200a.png C/newfile3.png &&
     cp "$TEST_DIRECTORY"/test9200a.png D/newfile4.png &&
     git add A/newfile1.txt &&
     git add B/newfile2.txt &&
     git add C/newfile3.png &&
     git add D/newfile4.png &&
     git commit -a -m "Test: New file" &&
     id=$(git rev-list --max-count=1 HEAD) &&
     (cd "$CVSWORK" &&
     git cvsexportcommit -c $id &&
     check_entries A "newfile1.txt/1.1/" &&
     check_entries B "newfile2.txt/1.1/" &&
     check_entries C "newfile3.png/1.1/-kb" &&
     check_entries D "newfile4.png/1.1/-kb" &&
     test_cmp A/newfile1.txt ../A/newfile1.txt &&
     test_cmp B/newfile2.txt ../B/newfile2.txt &&
     test_cmp C/newfile3.png ../C/newfile3.png &&
     test_cmp D/newfile4.png ../D/newfile4.png
     )
[master 2f10079] Test: New file
 Author: A U Thor <author@example.com>
 4 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 A/newfile1.txt
 create mode 100644 B/newfile2.txt
 create mode 100644 C/newfile3.png
 create mode 100644 D/newfile4.png
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Directory /Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/D added to the repository
Directory /Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/C added to the repository
Directory /Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/B added to the repository
Directory /Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/A added to the repository
Commit to CVS
Patch title (first comment line): Test: New file
Autocommit
  cvs commit -F .msg 'A/newfile1.txt' 'B/newfile2.txt' 'C/newfile3.png' 'D/newfile4.png'
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/A/newfile1.txt,v  <--  A/newfile1.txt
initial revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/B/newfile2.txt,v  <--  B/newfile2.txt
initial revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/C/newfile3.png,v  <--  C/newfile3.png
initial revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/D/newfile4.png,v  <--  D/newfile4.png
initial revision: 1.1
Committed successfully to CVS

ok 1 - New file

expecting success: echo Hello1 >>A/newfile1.txt &&
     rm -f B/newfile2.txt &&
     rm -f C/newfile3.png &&
     echo Hello5  >E/newfile5.txt &&
     cp "$TEST_DIRECTORY"/test9200b.png D/newfile4.png &&
     cp "$TEST_DIRECTORY"/test9200a.png F/newfile6.png &&
     git add E/newfile5.txt &&
     git add F/newfile6.png &&
     git commit -a -m "Test: Remove, add and update" &&
     id=$(git rev-list --max-count=1 HEAD) &&
     (cd "$CVSWORK" &&
     git cvsexportcommit -c $id &&
     check_entries A "newfile1.txt/1.2/" &&
     check_entries B "" &&
     check_entries C "" &&
     check_entries D "newfile4.png/1.2/-kb" &&
     check_entries E "newfile5.txt/1.1/" &&
     check_entries F "newfile6.png/1.1/-kb" &&
     test_cmp A/newfile1.txt ../A/newfile1.txt &&
     test_cmp D/newfile4.png ../D/newfile4.png &&
     test_cmp E/newfile5.txt ../E/newfile5.txt &&
     test_cmp F/newfile6.png ../F/newfile6.png
     )
[master c0f0460] Test: Remove, add and update
 Author: A U Thor <author@example.com>
 5 files changed, 5 insertions(+), 26 deletions(-)
 delete mode 100644 B/newfile2.txt
 rewrite D/newfile4.png (99%)
 create mode 100644 E/newfile5.txt
 rename C/newfile3.png => F/newfile6.png (100%)
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Directory /Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/F added to the repository
Directory /Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/E added to the repository
Commit to CVS
Patch title (first comment line): Test: Remove, add and update
Autocommit
  cvs commit -F .msg 'A/newfile1.txt' 'B/newfile2.txt' 'C/newfile3.png' 'D/newfile4.png' 'E/newfile5.txt' 'F/newfile6.png'
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/A/newfile1.txt,v  <--  A/newfile1.txt
new revision: 1.2; previous revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/B/newfile2.txt,v  <--  B/newfile2.txt
new revision: delete; previous revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/C/newfile3.png,v  <--  C/newfile3.png
new revision: delete; previous revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/D/newfile4.png,v  <--  D/newfile4.png
new revision: 1.2; previous revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/E/newfile5.txt,v  <--  E/newfile5.txt
initial revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/F/newfile6.png,v  <--  F/newfile6.png
initial revision: 1.1
Committed successfully to CVS

ok 2 - Remove two files, add two and update two

expecting success: cat F/newfile6.png >>D/newfile4.png &&
     git commit -a -m "generatiion 1" &&
     cat F/newfile6.png >>D/newfile4.png &&
     git commit -a -m "generation 2" &&
     id=$(git rev-list --max-count=1 HEAD) &&
     (cd "$CVSWORK" &&
     test_must_fail git cvsexportcommit -c $id
     )
[master 875739d] generatiion 1
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
[master 062e558] generation 2
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
Checking if patch will apply
Applying

ok 3 - Fail to change binary more than one generation old

expecting success: git reset --hard HEAD^^ &&
     rm -f D/newfile4.png &&
     git commit -a -m "test: remove only a binary file" &&
     id=$(git rev-list --max-count=1 HEAD) &&
     (cd "$CVSWORK" &&
     git cvsexportcommit -c $id &&
     check_entries A "newfile1.txt/1.2/" &&
     check_entries B "" &&
     check_entries C "" &&
     check_entries D "" &&
     check_entries E "newfile5.txt/1.1/" &&
     check_entries F "newfile6.png/1.1/-kb" &&
     test_cmp A/newfile1.txt ../A/newfile1.txt &&
     test_cmp E/newfile5.txt ../E/newfile5.txt &&
     test_cmp F/newfile6.png ../F/newfile6.png
     )
HEAD is now at c0f0460 Test: Remove, add and update
[master ac62a25] test: remove only a binary file
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 D/newfile4.png
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Commit to CVS
Patch title (first comment line): test: remove only a binary file
Autocommit
  cvs commit -F .msg 'D/newfile4.png'
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/D/newfile4.png,v  <--  D/newfile4.png
new revision: delete; previous revision: 1.2
Committed successfully to CVS

ok 4 - Remove only binary files

expecting success: rm -f A/newfile1.txt &&
     git commit -a -m "test: remove only a binary file" &&
     id=$(git rev-list --max-count=1 HEAD) &&
     (cd "$CVSWORK" &&
     git cvsexportcommit -c $id &&
     check_entries A "" &&
     check_entries B "" &&
     check_entries C "" &&
     check_entries D "" &&
     check_entries E "newfile5.txt/1.1/" &&
     check_entries F "newfile6.png/1.1/-kb" &&
     test_cmp E/newfile5.txt ../E/newfile5.txt &&
     test_cmp F/newfile6.png ../F/newfile6.png
     )
[master 312b57a] test: remove only a binary file
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 2 deletions(-)
 delete mode 100644 A/newfile1.txt
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Commit to CVS
Patch title (first comment line): test: remove only a binary file
Autocommit
  cvs commit -F .msg 'A/newfile1.txt'
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/A/newfile1.txt,v  <--  A/newfile1.txt
new revision: delete; previous revision: 1.2
Committed successfully to CVS

ok 5 - Remove only a text file

expecting success: mkdir "G g" &&
      echo ok then >"G g/with spaces.txt" &&
      git add "G g/with spaces.txt" && \
      cp "$TEST_DIRECTORY"/test9200a.png "G g/with spaces.png" && \
      git add "G g/with spaces.png" &&
      git commit -a -m "With spaces" &&
      id=$(git rev-list --max-count=1 HEAD) &&
      (cd "$CVSWORK" &&
      git cvsexportcommit -c $id &&
      check_entries "G g" "with spaces.png/1.1/-kb|with spaces.txt/1.1/"
      )
[master af7dd9e] With spaces
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 G g/with spaces.png
 create mode 100644 G g/with spaces.txt
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Directory /Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/G g added to the repository
Commit to CVS
Patch title (first comment line): With spaces
Autocommit
  cvs commit -F .msg G g/with spaces.png G g/with spaces.txt
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/G g/with spaces.png,v  <--  G g/with spaces.png
initial revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/G g/with spaces.txt,v  <--  G g/with spaces.txt
initial revision: 1.1
Committed successfully to CVS

ok 6 - New file with spaces in file name
expecting success: echo Ok then >>"G g/with spaces.txt" &&
      cat "$TEST_DIRECTORY"/test9200a.png >>"G g/with spaces.png" && \
      git add "G g/with spaces.png" &&
      git commit -a -m "Update with spaces" &&
      id=$(git rev-list --max-count=1 HEAD) &&
      (cd "$CVSWORK" &&
      git cvsexportcommit -c $id
      check_entries "G g" "with spaces.png/1.2/-kb|with spaces.txt/1.2/"
      )
[master 1d28d48] Update with spaces
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 0 deletions(-)
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Commit to CVS
Patch title (first comment line): Update with spaces
Autocommit
  cvs commit -F .msg G g/with spaces.png G g/with spaces.txt
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/G g/with spaces.png,v  <--  G g/with spaces.png
new revision: 1.2; previous revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/G g/with spaces.txt,v  <--  G g/with spaces.txt
new revision: 1.2; previous revision: 1.1
Committed successfully to CVS

ok 7 - Update file with spaces in file name
expecting success: date >>"E/newfile5.txt" &&
      git add "E/newfile5.txt" &&
      git commit -a -m "Update one" &&
      date >>"E/newfile5.txt" &&
      git add "E/newfile5.txt" &&
      git commit -a -m "Update two" &&
      id=$(git rev-list --max-count=1 HEAD) &&
      (cd "$CVSWORK" &&
      test_must_fail git cvsexportcommit -c $id
      )
[master 94268cb] Update one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master da53942] Update two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Checking if patch will apply
Applying
ok 8 - Mismatching patch should fail
expecting success: mkdir G &&
      echo executeon >G/on &&
      chmod +x G/on &&
      echo executeoff >G/off &&
      git add G/on &&
      git add G/off &&
      git commit -a -m "Execute test" &&
      (cd "$CVSWORK" &&
      git cvsexportcommit -c HEAD
      test -x G/on &&
      ! test -x G/off
      )
[master d0d11a9] Execute test
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 G/off
 create mode 100755 G/on
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Directory /Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/G added to the repository
Commit to CVS
Patch title (first comment line): Execute test
Autocommit
  cvs commit -F .msg 'G/off' 'G/on'
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/G/off,v  <--  G/off
initial revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/G/on,v  <--  G/on
initial revision: 1.1
Committed successfully to CVS

ok 9 - Retain execute bit

expecting success: 
      mkdir W &&
      echo foobar >W/file1.txt &&
      echo bazzle >W/file2.txt &&
      git add W/file1.txt &&
      git add W/file2.txt &&
      git commit -m "More updates" &&
      id=$(git rev-list --max-count=1 HEAD) &&
      (cd "$GIT_DIR" &&
      GIT_DIR=. git cvsexportcommit -w "$CVSWORK" -c $id &&
      check_entries "$CVSWORK/W" "file1.txt/1.1/|file2.txt/1.1/" &&
      test_cmp "$CVSWORK/W/file1.txt" ../W/file1.txt &&
      test_cmp "$CVSWORK/W/file2.txt" ../W/file2.txt
      )
[master 6721c02] More updates
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 W/file1.txt
 create mode 100644 W/file2.txt
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Directory /Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/W added to the repository
Commit to CVS
Patch title (first comment line): More updates
Autocommit
  cvs commit -F .msg 'W/file1.txt' 'W/file2.txt'
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/W/file1.txt,v  <--  W/file1.txt
initial revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/W/file2.txt,v  <--  W/file2.txt
initial revision: 1.1
Committed successfully to CVS

ok 10 - -w option should work with relative GIT_DIR

expecting success: 

	echo Notes > release-notes &&
	git add release-notes &&
	git commit -m "Add release notes" release-notes &&
	id=$(git rev-parse HEAD) &&
	git cvsexportcommit -w "$CVSWORK" -c $id &&

	echo new > DS &&
	echo new > E/DS &&
	echo modified > release-notes &&
	git add DS E/DS release-notes &&
	git commit -m "Add two files with the same basename" &&
	id=$(git rev-parse HEAD) &&
	git cvsexportcommit -w "$CVSWORK" -c $id &&
	check_entries "$CVSWORK/E" "DS/1.1/|newfile5.txt/1.1/" &&
	check_entries "$CVSWORK" "DS/1.1/|release-notes/1.2/" &&
	test_cmp "$CVSWORK/DS" DS &&
	test_cmp "$CVSWORK/E/DS" E/DS &&
	test_cmp "$CVSWORK/release-notes" release-notes


[master 2ce7410] Add release notes
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 release-notes
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Commit to CVS
Patch title (first comment line): Add release notes
Autocommit
  cvs commit -F .msg 'release-notes'
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/release-notes,v  <--  release-notes
initial revision: 1.1
Committed successfully to CVS
[master 1167b79] Add two files with the same basename
 Author: A U Thor <author@example.com>
 3 files changed, 3 insertions(+), 1 deletions(-)
 create mode 100644 DS
 create mode 100644 E/DS
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Commit to CVS
Patch title (first comment line): Add two files with the same basename
Autocommit
  cvs commit -F .msg 'DS' 'E/DS' 'release-notes'
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/DS,v  <--  DS
initial revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/release-notes,v  <--  release-notes
new revision: 1.2; previous revision: 1.1
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/E/DS,v  <--  E/DS
initial revision: 1.1
Committed successfully to CVS

ok 11 - check files before directories

expecting success: 

    (cd "$CVSWORK" &&
     echo >attic_gremlin &&
     cvs -Q add attic_gremlin &&
     cvs -Q ci -m "added attic_gremlin" &&
     rm attic_gremlin &&
     cvs -Q rm attic_gremlin &&
     cvs -Q ci -m "removed attic_gremlin") &&

    echo > attic_gremlin &&
    git add attic_gremlin &&
    git commit -m "Added attic_gremlin" &&
	git cvsexportcommit -w "$CVSWORK" -c HEAD &&
    (cd "$CVSWORK"; cvs -Q update -d) &&
    test -f "$CVSWORK/attic_gremlin"
[master acab4a5] Added attic_gremlin
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 attic_gremlin
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Commit to CVS
Patch title (first comment line): Added attic_gremlin
Autocommit
  cvs commit -F .msg 'attic_gremlin'
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/attic_gremlin,v  <--  attic_gremlin
new revision: 1.3; previous revision: 1.2
Committed successfully to CVS

ok 12 - re-commit a removed filename which remains in CVS attic

expecting success: 

	echo space > " space" &&
	git add " space" &&
	git commit -m "Add a file with a leading space" &&
	id=$(git rev-parse HEAD) &&
	git cvsexportcommit -w "$CVSWORK" -c $id &&
	check_entries "$CVSWORK" " space/1.1/|DS/1.1/|attic_gremlin/1.3/|release-notes/1.2/" &&
	test_cmp "$CVSWORK/ space" " space"


[master ad85ce8] Add a file with a leading space
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644  space
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Commit to CVS
Patch title (first comment line): Add a file with a leading space
Autocommit
  cvs commit -F .msg  space
/Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/cvsroot/ space,v  <--   space
initial revision: 1.1
Committed successfully to CVS
ok 13 - commit a file with leading spaces in the name

expecting success: 

	(mkdir shared &&
	 cd shared &&
	 unset GIT_DIR &&
	 cvs co . &&
	 git init &&
	 git add " space" &&
	 git commit -m "fake initial commit" &&
	 echo Hello >> " space" &&
	 git commit -m "Another change" " space" &&
	 git cvsexportcommit -W -p -u -c HEAD &&
	 grep Hello " space" &&
	 git diff-files)
U  space
U DS
U attic_gremlin
U release-notes
U CVSROOT/checkoutlist
U CVSROOT/commitinfo
U CVSROOT/config
U CVSROOT/cvswrappers
U CVSROOT/loginfo
U CVSROOT/modules
U CVSROOT/notify
U CVSROOT/postadmin
U CVSROOT/postproxy
U CVSROOT/posttag
U CVSROOT/postwatch
U CVSROOT/preproxy
U CVSROOT/rcsinfo
U CVSROOT/taginfo
U CVSROOT/verifymsg
U E/DS
U E/newfile5.txt
U F/newfile6.png
U G/off
U G/on
U G g/with spaces.png
U G g/with spaces.txt
U W/file1.txt
U W/file2.txt
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9200-git-cvsexportcommit/shared/.git/
[master (root-commit) 9320b53] fake initial commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644  space
[master 6371364] Another change
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
Checking if patch will apply
Applying
Patch applied successfully. Adding new files and directories to CVS
Commit to CVS
Patch title (first comment line): Another change
Autocommit
  cvs commit -F .msg  space
Committed successfully to CVS
Hello

ok 14 - use the same checkout for Git and CVS

# passed all 14 test(s)
1..14

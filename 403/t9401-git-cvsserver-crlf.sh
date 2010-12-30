Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9401-git-cvsserver-crlf/.git/
expecting success: 
    echo "Simple text file" >textfile.c &&
    echo "File with embedded NUL: Q <- there" | q_to_nul > binfile.bin &&
    mkdir subdir &&
    echo "Another text file" > subdir/file.h &&
    echo "Another binary: Q (this time CR)" | q_to_cr > subdir/withCr.bin &&
    echo "Mixed up NUL, but marked text: Q <- there" | q_to_nul > mixedUp.c &&
    echo "Unspecified" > subdir/unspecified.other &&
    echo "/*.bin -crlf" > .gitattributes &&
    echo "/*.c crlf" >> .gitattributes &&
    echo "subdir/*.bin -crlf" >> .gitattributes &&
    echo "subdir/*.c crlf" >> .gitattributes &&
    echo "subdir/file.h crlf" >> .gitattributes &&
    git add .gitattributes textfile.c binfile.bin mixedUp.c subdir/* &&
    git commit -q -m "First Commit" &&
    git clone -q --bare "$WORKDIR/.git" "$SERVERDIR" >/dev/null 2>&1 &&
    GIT_DIR="$SERVERDIR" git config --bool gitcvs.enabled true &&
    GIT_DIR="$SERVERDIR" git config gitcvs.logfile "$SERVERDIR/gitcvs.log"

ok 1 - setup

expecting success: 
    GIT_CONFIG="$git_config" cvs -Q co -d cvswork master >cvs.log 2>&1 &&
    test x"$(grep /-k cvswork/CVS/Entries cvswork/subdir/CVS/Entries)" = x""

ok 2 - cvs co (default crlf)
expecting success: 
    GIT_DIR="$SERVERDIR" git config --bool gitcvs.allbinary true &&
    GIT_CONFIG="$git_config" cvs -Q co -d cvswork master >cvs.log 2>&1 &&
    marked_as cvswork textfile.c -kb &&
    marked_as cvswork binfile.bin -kb &&
    marked_as cvswork .gitattributes -kb &&
    marked_as cvswork mixedUp.c -kb &&
    marked_as cvswork/subdir withCr.bin -kb &&
    marked_as cvswork/subdir file.h -kb &&
    marked_as cvswork/subdir unspecified.other -kb

ok 3 - cvs co (allbinary)
expecting success: 
    GIT_DIR="$SERVERDIR" git config --bool gitcvs.usecrlfattr true &&
    GIT_CONFIG="$git_config" cvs -Q co -d cvswork master >cvs.log 2>&1 &&
    marked_as cvswork textfile.c "" &&
    marked_as cvswork binfile.bin -kb &&
    marked_as cvswork .gitattributes -kb &&
    marked_as cvswork mixedUp.c "" &&
    marked_as cvswork/subdir withCr.bin -kb &&
    marked_as cvswork/subdir file.h "" &&
    marked_as cvswork/subdir unspecified.other -kb

ok 4 - cvs co (use attributes/allbinary)
expecting success: 
    GIT_DIR="$SERVERDIR" git config --bool gitcvs.allbinary false &&
    GIT_CONFIG="$git_config" cvs -Q co -d cvswork master >cvs.log 2>&1 &&
    marked_as cvswork textfile.c "" &&
    marked_as cvswork binfile.bin -kb &&
    marked_as cvswork .gitattributes "" &&
    marked_as cvswork mixedUp.c "" &&
    marked_as cvswork/subdir withCr.bin -kb &&
    marked_as cvswork/subdir file.h "" &&
    marked_as cvswork/subdir unspecified.other ""

ok 5 - cvs co (use attributes)

expecting success: 
    (cd cvswork &&
    (cd subdir &&
    echo "more text" > src.c &&
    GIT_CONFIG="$git_config" cvs -Q add src.c >cvs.log 2>&1 &&
    marked_as . src.c "" &&
    echo "psuedo-binary" > temp.bin
    ) &&
    GIT_CONFIG="$git_config" cvs -Q add subdir/temp.bin >cvs.log 2>&1 &&
    marked_as subdir temp.bin "-kb" &&
    cd subdir &&
    GIT_CONFIG="$git_config" cvs -Q ci -m "adding files" >cvs.log 2>&1 &&
    marked_as . temp.bin "-kb" &&
    marked_as . src.c ""
    )

ok 6 - adding files

expecting success: 
    git pull gitcvs.git &&
    echo hi > subdir/newfile.bin &&
    echo junk > subdir/file.h &&
    echo hi > subdir/newfile.c &&
    echo hello >> binfile.bin &&
    git add subdir/newfile.bin subdir/file.h subdir/newfile.c binfile.bin &&
    git commit -q -m "Add and change some files" &&
    git push gitcvs.git >/dev/null &&
    (cd cvswork &&
    GIT_CONFIG="$git_config" cvs -Q update
    ) &&
    marked_as cvswork textfile.c "" &&
    marked_as cvswork binfile.bin -kb &&
    marked_as cvswork .gitattributes "" &&
    marked_as cvswork mixedUp.c "" &&
    marked_as cvswork/subdir withCr.bin -kb &&
    marked_as cvswork/subdir file.h "" &&
    marked_as cvswork/subdir unspecified.other "" &&
    marked_as cvswork/subdir newfile.bin -kb &&
    marked_as cvswork/subdir newfile.c "" &&
    echo "File with embedded NUL: Q <- there" | q_to_nul > tmpExpect1 &&
    echo "hello" >> tmpExpect1 &&
    cmp cvswork/binfile.bin tmpExpect1

Updating 1990fcb..7a09a92
Fast-forward
 subdir/src.c    |    1 +
 subdir/temp.bin |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 subdir/src.c
 create mode 100644 subdir/temp.bin
U binfile.bin
U subdir/file.h
U subdir/newfile.bin
U subdir/newfile.c

ok 7 - updating

expecting success: 
    GIT_DIR="$SERVERDIR" git config gitcvs.allbinary guess &&
    GIT_CONFIG="$git_config" cvs -Q co -d cvswork master >cvs.log 2>&1 &&
    marked_as cvswork textfile.c "" &&
    marked_as cvswork binfile.bin -kb &&
    marked_as cvswork .gitattributes "" &&
    marked_as cvswork mixedUp.c "" &&
    marked_as cvswork/subdir withCr.bin -kb &&
    marked_as cvswork/subdir file.h "" &&
    marked_as cvswork/subdir unspecified.other "" &&
    marked_as cvswork/subdir newfile.bin -kb &&
    marked_as cvswork/subdir newfile.c ""

ok 8 - cvs co (use attributes/guess)

expecting success: 
    ( echo "line 1" &&
      echo "line 2" &&
      echo "line 3" &&
      echo "line 4 with NUL: Q <-" ) | q_to_nul > multiline.c &&
    git add multiline.c &&
    ( echo "line 1" &&
      echo "line 2" &&
      echo "line 3" &&
      echo "line 4" ) | q_to_nul > multilineTxt.c &&
    git add multilineTxt.c &&
    git commit -q -m "multiline files" &&
    git push gitcvs.git >/dev/null


ok 9 - setup multi-line files

expecting success: 
    GIT_DIR="$SERVERDIR" git config --bool gitcvs.usecrlfattr false &&
    GIT_CONFIG="$git_config" cvs -Q co -d cvswork master >cvs.log 2>&1 &&
    marked_as cvswork textfile.c "" &&
    marked_as cvswork binfile.bin -kb &&
    marked_as cvswork .gitattributes "" &&
    marked_as cvswork mixedUp.c -kb &&
    marked_as cvswork multiline.c -kb &&
    marked_as cvswork multilineTxt.c "" &&
    marked_as cvswork/subdir withCr.bin -kb &&
    marked_as cvswork/subdir file.h "" &&
    marked_as cvswork/subdir unspecified.other "" &&
    marked_as cvswork/subdir newfile.bin "" &&
    marked_as cvswork/subdir newfile.c ""
ok 10 - cvs co (guess)

expecting success: 
    GIT_CONFIG="$git_config" cvs -Q co -d cvswork2 master >cvs.log 2>&1 &&
    marked_as cvswork2 textfile.c "" &&
    marked_as cvswork2 binfile.bin -kb &&
    marked_as cvswork2 .gitattributes "" &&
    marked_as cvswork2 mixedUp.c -kb &&
    marked_as cvswork2 multiline.c -kb &&
    marked_as cvswork2 multilineTxt.c "" &&
    marked_as cvswork2/subdir withCr.bin -kb &&
    marked_as cvswork2/subdir file.h "" &&
    marked_as cvswork2/subdir unspecified.other "" &&
    marked_as cvswork2/subdir newfile.bin "" &&
    marked_as cvswork2/subdir newfile.c ""

ok 11 - cvs co another copy (guess)

expecting success: 
    (cd cvswork &&
    echo "simpleText" > simpleText.c &&
    GIT_CONFIG="$git_config" cvs -Q add simpleText.c
    ) &&
    marked_as cvswork simpleText.c ""

ok 12 - add text (guess)

expecting success: 
    (cd cvswork &&
    echo "simpleBin: NUL: Q <- there" | q_to_nul > simpleBin.bin &&
    GIT_CONFIG="$git_config" cvs -Q add simpleBin.bin
    ) &&
    marked_as cvswork simpleBin.bin -kb

ok 13 - add bin (guess)

expecting success: 
    (cd cvswork &&
    GIT_CONFIG="$git_config" cvs -Q rm -f subdir/file.h &&
    (cd subdir &&
    GIT_CONFIG="$git_config" cvs -Q rm -f withCr.bin
    )) &&
    marked_as cvswork/subdir withCr.bin -kb &&
    marked_as cvswork/subdir file.h ""
ok 14 - remove files (guess)

expecting success: 
    (cd cvswork &&
    GIT_CONFIG="$git_config" cvs -Q ci -m "add/rm files" >cvs.log 2>&1
    ) &&
    marked_as cvswork textfile.c "" &&
    marked_as cvswork binfile.bin -kb &&
    marked_as cvswork .gitattributes "" &&
    marked_as cvswork mixedUp.c -kb &&
    marked_as cvswork multiline.c -kb &&
    marked_as cvswork multilineTxt.c "" &&
    not_present cvswork/subdir withCr.bin &&
    not_present cvswork/subdir file.h &&
    marked_as cvswork/subdir unspecified.other "" &&
    marked_as cvswork/subdir newfile.bin "" &&
    marked_as cvswork/subdir newfile.c "" &&
    marked_as cvswork simpleBin.bin -kb &&
    marked_as cvswork simpleText.c ""

ok 15 - cvs ci (guess)

expecting success: 
    (cd cvswork2/subdir &&
    GIT_CONFIG="$git_config" cvs -Q update
    ) &&
    marked_as cvswork2 textfile.c "" &&
    marked_as cvswork2 binfile.bin -kb &&
    marked_as cvswork2 .gitattributes "" &&
    marked_as cvswork2 mixedUp.c -kb &&
    marked_as cvswork2 multiline.c -kb &&
    marked_as cvswork2 multilineTxt.c "" &&
    not_present cvswork2/subdir withCr.bin &&
    not_present cvswork2/subdir file.h &&
    marked_as cvswork2/subdir unspecified.other "" &&
    marked_as cvswork2/subdir newfile.bin "" &&
    marked_as cvswork2/subdir newfile.c "" &&
    not_present cvswork2 simpleBin.bin &&
    not_present cvswork2 simpleText.c


ok 16 - update subdir of other copy (guess)

expecting success: 
    git pull gitcvs.git master &&
    sed "s/3/replaced_3/" < multilineTxt.c > ml.temp &&
    mv ml.temp multilineTxt.c &&
    git add multilineTxt.c &&
    git commit -q -m "modify multiline file" >> "${WORKDIR}/marked.log" &&
    git push gitcvs.git >/dev/null &&
    (cd cvswork2 &&
    sed "s/1/replaced_1/" < multilineTxt.c > ml.temp &&
    mv ml.temp multilineTxt.c &&
    GIT_CONFIG="$git_config" cvs update > cvs.log 2>&1
    ) &&
    marked_as cvswork2 textfile.c "" &&
    marked_as cvswork2 binfile.bin -kb &&
    marked_as cvswork2 .gitattributes "" &&
    marked_as cvswork2 mixedUp.c -kb &&
    marked_as cvswork2 multiline.c -kb &&
    marked_as cvswork2 multilineTxt.c "" &&
    not_present cvswork2/subdir withCr.bin &&
    not_present cvswork2/subdir file.h &&
    marked_as cvswork2/subdir unspecified.other "" &&
    marked_as cvswork2/subdir newfile.bin "" &&
    marked_as cvswork2/subdir newfile.c "" &&
    marked_as cvswork2 simpleBin.bin -kb &&
    marked_as cvswork2 simpleText.c "" &&
    echo "line replaced_1" > tmpExpect2 &&
    echo "line 2" >> tmpExpect2 &&
    echo "line replaced_3" >> tmpExpect2 &&
    echo "line 4" | q_to_nul >> tmpExpect2 &&
    cmp cvswork2/multilineTxt.c tmpExpect2

Updating 3aaeadd..f500091
Fast-forward
 simpleBin.bin     |  Bin 0 -> 27 bytes
 simpleText.c      |    1 +
 subdir/file.h     |    1 -
 subdir/withCr.bin |    1 -
 4 files changed, 1 insertions(+), 2 deletions(-)
 create mode 100644 simpleBin.bin
 create mode 100644 simpleText.c
 delete mode 100644 subdir/file.h
 delete mode 100644 subdir/withCr.bin

ok 17 - update/merge full other copy (guess)

# passed all 17 test(s)
1..17

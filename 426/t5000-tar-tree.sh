Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5000-tar-tree/.git/
expecting success: mkdir a b c &&
     echo simple textfile >a/a &&
     mkdir a/bin &&
     cp /bin/sh a/bin &&
     printf "A\$Format:%s\$O" "$SUBSTFORMAT" >a/substfile1 &&
     printf "A not substituted O" >a/substfile2 &&
     if test_have_prereq SYMLINKS; then
	ln -s a a/l1
     else
	printf %s a > a/l1
     fi &&
     (p=long_path_to_a_file && cd a &&
      for depth in 1 2 3 4 5; do mkdir $p && cd $p; done &&
      echo text >file_with_long_path) &&
     (cd a && find .) | sort >a.lst

ok 1 - populate workdir

expecting success: echo ignore me >a/ignored &&
     echo ignored export-ignore >.git/info/attributes

ok 2 - add ignored file

expecting success: find a -type f | xargs git update-index --add &&
     find a -type l | xargs git update-index --add &&
     treeid=`git write-tree` &&
     echo $treeid >treeid &&
     git update-ref HEAD $(TZ=GMT GIT_COMMITTER_DATE="2005-05-27 22:00:00" \
     git commit-tree $treeid </dev/null)

ok 3 - add files to repository

expecting success: git clone --bare . bare.git &&
     cp .git/info/attributes bare.git/info/attributes
Cloning into bare repository bare.git
done.

ok 4 - create bare clone

expecting success: rm a/ignored

ok 5 - remove ignored file

expecting success: git archive HEAD >b.tar

ok 6 - git archive

expecting success: git tar-tree HEAD >b2.tar

ok 7 - git tar-tree

expecting success: test_cmp b.tar b2.tar

ok 8 - git archive vs. git tar-tree

expecting success: (cd bare.git && git archive HEAD) >b3.tar

ok 9 - git archive in a bare repo

expecting success: test_cmp b.tar b3.tar

ok 10 - git archive vs. the same in a bare repo

expecting success: git archive --output=b4.tar HEAD &&
    test_cmp b.tar b4.tar

ok 11 - git archive with --output

expecting success: git archive --remote=. HEAD >b5.tar &&
    test_cmp b.tar b5.tar

ok 12 - git archive --remote

expecting success: mkdir extract &&
     "$TAR" xf b.tar -C extract a/a &&
     test-chmtime -v +0 extract/a/a |cut -f 1 >b.mtime &&
     echo "1117231200" >expected.mtime &&
     test_cmp expected.mtime b.mtime

ok 13 - validate file modification time

expecting success: git get-tar-commit-id <b.tar >b.commitid &&
     test_cmp .git/$(git symbolic-ref HEAD) b.commitid

ok 14 - git get-tar-commit-id

expecting success: (cd b && "$TAR" xf -) <b.tar

ok 15 - extract tar archive

expecting success: (cd b/a && find .) | sort >b.lst &&
     test_cmp a.lst b.lst

ok 16 - validate filenames

expecting success: diff -r a b/a

ok 17 - validate file contents

expecting success: git tar-tree HEAD prefix >c.tar

ok 18 - git tar-tree with prefix

expecting success: (cd c && "$TAR" xf -) <c.tar

ok 19 - extract tar archive with prefix

expecting success: (cd c/prefix/a && find .) | sort >c.lst &&
     test_cmp a.lst c.lst

ok 20 - validate filenames with prefix

expecting success: diff -r a c/prefix/a

ok 21 - validate file contents with prefix

expecting success: cp .git/info/attributes .git/info/attributes.before &&
     echo "substfile?" export-subst >>.git/info/attributes &&
     git archive HEAD >f.tar &&
     git archive --prefix=prefix/ HEAD >g.tar &&
     mv .git/info/attributes.before .git/info/attributes

ok 22 - create archives with substfiles

expecting success: (mkdir f && cd f && "$TAR" xf -) <f.tar

ok 23 - extract substfiles

expecting success: git log --max-count=1 "--pretty=format:A${SUBSTFORMAT}O" HEAD \
      >f/a/substfile1.expected &&
      test_cmp f/a/substfile1.expected f/a/substfile1 &&
      test_cmp a/substfile2 f/a/substfile2


ok 24 - validate substfile contents

expecting success: (mkdir g && cd g && "$TAR" xf -) <g.tar

ok 25 - extract substfiles from archive with prefix

expecting success: git log --max-count=1 "--pretty=format:A${SUBSTFORMAT}O" HEAD \
      >g/prefix/a/substfile1.expected &&
      test_cmp g/prefix/a/substfile1.expected g/prefix/a/substfile1 &&
      test_cmp a/substfile2 g/prefix/a/substfile2


ok 26 - validate substfile contents from archive with prefix

expecting success: git archive --format=zip HEAD >d.zip

ok 27 - git archive --format=zip

expecting success: (cd bare.git && git archive --format=zip HEAD) >d1.zip
ok 28 - git archive --format=zip in a bare repo
expecting success: test_cmp d.zip d1.zip

ok 29 - git archive --format=zip vs. the same in a bare repo

expecting success: git archive --format=zip --output=d2.zip HEAD &&
    test_cmp d.zip d2.zip

ok 30 - git archive --format=zip with --output

expecting success: 
	git archive --output=d3.zip HEAD &&
	test_cmp d.zip d3.zip

ok 31 - git archive with --output, inferring format

expecting success: 
	git archive --format=tar --output=d4.zip HEAD &&
	test_cmp b.tar d4.zip

ok 32 - git archive with --output, override inferred format

expecting success: (mkdir d && cd d && $UNZIP ../d.zip)
Archive:  ../d.zip
738a5c8ab411350957756a38482f4913450b44ca
   creating: a/
 extracting: a/a                     
   creating: a/bin/
  inflating: a/bin/sh                
    linking: a/l1                    -> a 
   creating: a/long_path_to_a_file/
   creating: a/long_path_to_a_file/long_path_to_a_file/
   creating: a/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/
   creating: a/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/
   creating: a/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/
 extracting: a/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/file_with_long_path  
 extracting: a/substfile1            
 extracting: a/substfile2            
finishing deferred symbolic links:
  a/l1                   -> a

ok 33 - extract ZIP archive

expecting success: (cd d/a && find .) | sort >d.lst &&
     test_cmp a.lst d.lst

ok 34 - validate filenames

expecting success: diff -r a d/a

ok 35 - validate file contents

expecting success: git archive --format=zip --prefix=prefix/ HEAD >e.zip

ok 36 - git archive --format=zip with prefix

expecting success: (mkdir e && cd e && $UNZIP ../e.zip)
Archive:  ../e.zip
738a5c8ab411350957756a38482f4913450b44ca
   creating: prefix/
   creating: prefix/a/
 extracting: prefix/a/a              
   creating: prefix/a/bin/
  inflating: prefix/a/bin/sh         
    linking: prefix/a/l1             -> a 
   creating: prefix/a/long_path_to_a_file/
   creating: prefix/a/long_path_to_a_file/long_path_to_a_file/
   creating: prefix/a/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/
   creating: prefix/a/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/
   creating: prefix/a/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/
 extracting: prefix/a/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/long_path_to_a_file/file_with_long_path  
 extracting: prefix/a/substfile1     
 extracting: prefix/a/substfile2     
finishing deferred symbolic links:
  prefix/a/l1            -> a

ok 37 - extract ZIP archive with prefix

expecting success: (cd e/prefix/a && find .) | sort >e.lst &&
     test_cmp a.lst e.lst

ok 38 - validate filenames with prefix

expecting success: diff -r a e/prefix/a

ok 39 - validate file contents with prefix

expecting success: GIT_DIR=some/non-existing/directory git archive --list
tar
zip

ok 40 - git archive --list outside of a git repo

expecting success: 
	git archive --prefix=olde- >h.tar HEAD &&
	(
		mkdir h &&
		cd h &&
		"$TAR" xf - <../h.tar
	) &&
	test -d h/olde-a &&
	test -d h/olde-a/bin &&
	test -f h/olde-a/bin/sh


ok 41 - git-archive --prefix=olde-

# passed all 41 test(s)
1..41

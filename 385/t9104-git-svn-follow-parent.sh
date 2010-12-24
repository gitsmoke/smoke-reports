Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9104-git-svn-follow-parent/.git/
expecting success: 
	mkdir import &&
	(
		cd import &&
		mkdir -p trunk &&
		echo hello >trunk/readme &&
		svn_cmd import -m "initial" . "$svnrepo"
	) &&
	svn_cmd co "$svnrepo" wc &&
	(
		cd wc &&
		echo world >>trunk/readme &&
		poke trunk/readme &&
		svn_cmd commit -m "another commit" &&
		svn_cmd up &&
		svn_cmd mv trunk thunk &&
		echo goodbye >>thunk/readme &&
		poke thunk/readme &&
		svn_cmd commit -m "bye now"
	)
	
Adding         trunk
Adding         trunk/readme

Committed revision 1.
A    wc/trunk
A    wc/trunk/readme
Checked out revision 1.
Sending        trunk/readme
Transmitting file data .
Committed revision 2.
At revision 2.
A         thunk
D         trunk/readme
D         trunk
Adding         thunk
Sending        thunk/readme
Deleting       trunk
Transmitting file data .
Committed revision 3.

ok 1 - initialize repo
expecting success: 
	git svn init --minimize-url -i thunk "$svnrepo"/thunk &&
	git svn fetch -i thunk &&
	test "`git rev-parse --verify refs/remotes/thunk@2`" \
           = "`git rev-parse --verify refs/remotes/thunk~1`" &&
        test "`git cat-file blob refs/remotes/thunk:readme |\
                 sed -n -e "3p"`" = goodbye &&
	test -z "`git config --get svn-remote.svn.fetch \
	         "^trunk:refs/remotes/thunk@2$"`"
	
	A	readme
r1 = 1ed0665c47f514c819384f0812a13db2a080e177 (refs/remotes/thunk@2)
	M	readme
r2 = 670c54ebd202e18834824f8d289101c675f18423 (refs/remotes/thunk@2)
	M	readme
r3 = 65b9020509284d515edb4ab22bbd7e3cfca85e77 (refs/remotes/thunk)

ok 2 - init and fetch a moved directory

expecting success: 
        git config svn-remote.svn.url "$svnrepo" &&
        git config --add svn-remote.svn.fetch \
          trunk:refs/remotes/svn/trunk &&
        git config --add svn-remote.svn.fetch \
          thunk:refs/remotes/svn/thunk &&
        git svn fetch -i svn/thunk &&
	test "`git rev-parse --verify refs/remotes/svn/trunk`" \
           = "`git rev-parse --verify refs/remotes/svn/thunk~1`" &&
        test "`git cat-file blob refs/remotes/svn/thunk:readme |\
                 sed -n -e "3p"`" = goodbye
        
	A	readme
r1 = 1ed0665c47f514c819384f0812a13db2a080e177 (refs/remotes/svn/trunk)
	M	readme
r2 = 670c54ebd202e18834824f8d289101c675f18423 (refs/remotes/svn/trunk)
	M	readme
r3 = 65b9020509284d515edb4ab22bbd7e3cfca85e77 (refs/remotes/svn/thunk)

ok 3 - init and fetch from one svn-remote

expecting success: 
        (svn_cmd cp -m "resurrecting trunk as junk" \
               "$svnrepo"/trunk@2 "$svnrepo"/junk ||
         svn cp -m "resurrecting trunk as junk" \
               -r2 "$svnrepo"/trunk "$svnrepo"/junk) &&
        git config --add svn-remote.svn.fetch \
          junk:refs/remotes/svn/junk &&
        git svn fetch -i svn/thunk &&
        git svn fetch -i svn/junk &&
        test -z "`git diff svn/junk svn/trunk`" &&
        test "`git merge-base svn/junk svn/trunk`" \
           = "`git rev-parse svn/trunk`"
        

Committed revision 4.
r4 = 7afff31e609d39287affcb5e271915301e46ce39 (refs/remotes/svn/junk)
ok 4 - follow deleted parent
expecting success: 
        mkdir -p import/trunk/thunk/bump/thud &&
        echo hi > import/trunk/thunk/bump/thud/file &&
        svn import -m "import a larger parent" import "$svnrepo"/larger-parent &&
        svn cp -m "hi" "$svnrepo"/larger-parent "$svnrepo"/another-larger &&
        git svn init --minimize-url -i larger \
          "$svnrepo"/another-larger/trunk/thunk/bump/thud &&
        git svn fetch -i larger &&
        git rev-parse --verify refs/remotes/larger &&
        git rev-parse --verify \
           refs/remotes/larger-parent/trunk/thunk/bump/thud &&
        test "`git merge-base \
                 refs/remotes/larger-parent/trunk/thunk/bump/thud \
                 refs/remotes/larger`" = \
             "`git rev-parse refs/remotes/larger`"
        true
        
Adding         import/trunk
Adding         import/trunk/thunk
Adding         import/trunk/thunk/bump
Adding         import/trunk/thunk/bump/thud
Adding         import/trunk/thunk/bump/thud/file
Adding         import/trunk/readme

Committed revision 5.

Committed revision 6.
	A	file
r5 = 1ef978609f0bbe001cdc4252a6f8ef18388b96b5 (refs/remotes/larger@5)
r6 = 7992ef0be8d9dcb33b5e5468b27caf7341ce87cc (refs/remotes/larger)
7992ef0be8d9dcb33b5e5468b27caf7341ce87cc

ok 5 - follow larger parent

expecting success: 
	svn mkdir -m "follow higher-level parent" "$svnrepo"/blob &&
	svn co "$svnrepo"/blob blob &&
	(
		cd blob &&
		echo hi > hi &&
		svn add hi &&
		svn commit -m "hihi"
	) &&
	svn mkdir -m "new glob at top level" "$svnrepo"/glob &&
	svn mv -m "move blob down a level" "$svnrepo"/blob "$svnrepo"/glob/blob &&
	git svn init --minimize-url -i blob "$svnrepo"/glob/blob &&
        git svn fetch -i blob
        

Committed revision 7.
Checked out revision 7.
A         hi
Adding         hi
Transmitting file data .
Committed revision 8.

Committed revision 9.

Committed revision 10.
r7 = ec88fb65482d24c66748039783b6be0f7527ff21 (refs/remotes/blob@9)
	A	hi
r8 = cb44cd70076f18b1280a973426b9e5a26ede385e (refs/remotes/blob@9)
r10 = 22c4e146f4bb799a48270a7cfb7eae789fbb0fe9 (refs/remotes/blob)
ok 6 - follow higher-level parent

expecting success: 
	svn_cmd mv -m "bye!" "$svnrepo"/glob/blob/hi "$svnrepo"/glob/blob/bye &&
	svn_cmd rm -m "remove glob" "$svnrepo"/glob &&
	git svn init --minimize-url -i glob "$svnrepo"/glob &&
	git svn fetch -i glob &&
	test "`git cat-file blob refs/remotes/glob:blob/bye`" = hi &&
	test "`git ls-tree refs/remotes/glob | wc -l `" -eq 1
	

Committed revision 11.

Committed revision 12.
r9 = c1ef4f2e002766eacfbcfe8acabe9903c37ab6da (refs/remotes/glob)
	A	blob/hi
r10 = f1d0e1ee560ad889b40456a9a14d88459a828a47 (refs/remotes/glob)
	D	hi
	A	bye
r11 = 48176762abb10eb73ac7026d3fd32b7ae0f25c52 (refs/remotes/blob)
	D	blob/hi
	A	blob/bye
r11 = c6488113b2cb37f51a9f5fe724ed169dcd78b2b0 (refs/remotes/glob)

ok 7 - follow deleted directory

expecting success: 
	mkdir -p import/trunk/subversion/bindings/swig/perl/t &&
	for i in a b c ; do \
	  echo $i > import/trunk/subversion/bindings/swig/perl/$i.pm &&
	  echo _$i > import/trunk/subversion/bindings/swig/perl/t/$i.t; \
	done &&
	  echo "bad delete test" > \
	   import/trunk/subversion/bindings/swig/perl/t/larger-parent &&
	  echo "bad delete test 2" > \
	   import/trunk/subversion/bindings/swig/perl/another-larger &&
	(
		cd import &&
		svn import -m "r9270 test" . "$svnrepo"/r9270
	) &&
	svn_cmd co "$svnrepo"/r9270/trunk/subversion/bindings/swig/perl r9270 &&
	(
		cd r9270 &&
		svn mkdir native &&
		svn mv t native/t &&
		for i in a b c
		do
			svn mv $i.pm native/$i.pm
		done &&
		echo z >>native/t/c.t &&
		poke native/t/c.t &&
		svn commit -m "reorg test"
	) &&
	git svn init --minimize-url -i r9270-t \
	  "$svnrepo"/r9270/trunk/subversion/bindings/swig/perl/native/t &&
	git svn fetch -i r9270-t &&
	test `git rev-list r9270-t | wc -l` -eq 2 &&
	test "`git ls-tree --name-only r9270-t~1`" = \
	     "`git ls-tree --name-only r9270-t`"
	
Adding         trunk
Adding         trunk/subversion
Adding         trunk/subversion/bindings
Adding         trunk/subversion/bindings/swig
Adding         trunk/subversion/bindings/swig/perl
Adding         trunk/subversion/bindings/swig/perl/t
Adding         trunk/subversion/bindings/swig/perl/t/a.t
Adding         trunk/subversion/bindings/swig/perl/t/b.t
Adding         trunk/subversion/bindings/swig/perl/t/larger-parent
Adding         trunk/subversion/bindings/swig/perl/t/c.t
Adding         trunk/subversion/bindings/swig/perl/another-larger
Adding         trunk/subversion/bindings/swig/perl/a.pm
Adding         trunk/subversion/bindings/swig/perl/b.pm
Adding         trunk/subversion/bindings/swig/perl/c.pm
Adding         trunk/thunk
Adding         trunk/thunk/bump
Adding         trunk/thunk/bump/thud
Adding         trunk/thunk/bump/thud/file
Adding         trunk/readme

Committed revision 13.
A    r9270/t
A    r9270/t/a.t
A    r9270/t/b.t
A    r9270/t/larger-parent
A    r9270/t/c.t
A    r9270/another-larger
A    r9270/a.pm
A    r9270/b.pm
A    r9270/c.pm
Checked out revision 13.
A         native
A         native/t
D         t/a.t
D         t/b.t
D         t/larger-parent
D         t/c.t
D         t
A         native/a.pm
D         a.pm
A         native/b.pm
D         b.pm
A         native/c.pm
D         c.pm
Deleting       a.pm
Deleting       b.pm
Deleting       c.pm
Adding         native
Adding         native/a.pm
Adding         native/b.pm
Adding         native/c.pm
Adding         native/t
Sending        native/t/c.t
Deleting       t
Transmitting file data .
Committed revision 14.
	A	a.t
	A	b.t
	A	larger-parent
	A	c.t
r13 = bd7e8db85478489ae1d880834bc72481226baf43 (refs/remotes/r9270-t@13)
	M	c.t
r14 = d2c53fb6b18fde34f4bf2b57488a0f84330c8f89 (refs/remotes/r9270-t)

ok 8 - follow-parent avoids deleting relevant info

expecting success: 
	svn_cmd cp -m "wheee!" "$svnrepo"/r9270/trunk "$svnrepo"/r9270/drunk &&
	git svn init --minimize-url -i r9270-d \
	  "$svnrepo"/r9270/drunk/subversion/bindings/swig/perl/native/t &&
	git svn fetch -i r9270-d &&
	test `git rev-list r9270-d | wc -l` -eq 3 &&
	test "`git ls-tree --name-only r9270-t`" = \
	     "`git ls-tree --name-only r9270-d`" &&
	test "`git rev-parse r9270-t`" = \
	     "`git rev-parse r9270-d~1`"
	

Committed revision 15.
r15 = 95d1129093844f512f5c9dfb7400087e95cf25e3 (refs/remotes/r9270-d)

ok 9 - track initial change if it was only made to parent

expecting success: 
	(
		cd wc &&
		svn_cmd up &&
		svn_cmd mkdir stunk &&
		echo "trunk stunk" > stunk/readme &&
		svn_cmd add stunk/readme &&
		svn_cmd ci -m "trunk stunk" &&
		echo "stunk like junk" >> stunk/readme &&
		svn_cmd ci -m "really stunk" &&
		echo "stink stank stunk" >> stunk/readme &&
		svn_cmd ci -m "even the grinch agrees"
	) &&
	svn_cmd copy -m "stunk flunked" "$svnrepo"/stunk "$svnrepo"/flunk &&
	{ svn cp -m "early stunk flunked too" \
		"$svnrepo"/stunk@17 "$svnrepo"/flunked ||
	svn_cmd cp -m "early stunk flunked too" \
		-r17 "$svnrepo"/stunk "$svnrepo"/flunked; } &&
	git svn init --minimize-url -i stunk "$svnrepo"/stunk &&
	git svn fetch -i stunk &&
	git update-ref refs/remotes/flunk@18 refs/remotes/stunk~2 &&
	git update-ref -d refs/remotes/stunk &&
	git config --unset svn-remote.svn.fetch stunk &&
	mkdir -p "$GIT_DIR"/svn/refs/remotes/flunk@18 &&
	rev_map=$(cd "$GIT_DIR"/svn/refs/remotes/stunk && ls .rev_map*) &&
	dd if="$GIT_DIR"/svn/refs/remotes/stunk/$rev_map \
	   of="$GIT_DIR"/svn/refs/remotes/flunk@18/$rev_map bs=24 count=1 &&
	rm -rf "$GIT_DIR"/svn/refs/remotes/stunk &&
	git svn init --minimize-url -i flunk "$svnrepo"/flunk &&
	git svn fetch -i flunk &&
	git svn init --minimize-url -i stunk "$svnrepo"/stunk &&
	git svn fetch -i stunk &&
	git svn init --minimize-url -i flunked "$svnrepo"/flunked &&
	git svn fetch -i flunked &&
	test "`git rev-parse --verify refs/remotes/flunk@18`" \
	   = "`git rev-parse --verify refs/remotes/stunk`" &&
	test "`git rev-parse --verify refs/remotes/flunk~1`" \
	   = "`git rev-parse --verify refs/remotes/stunk`" &&
	test "`git rev-parse --verify refs/remotes/flunked~1`" \
	   = "`git rev-parse --verify refs/remotes/stunk~1`"
	
A    larger-parent
A    larger-parent/trunk
A    larger-parent/trunk/thunk
A    larger-parent/trunk/thunk/bump
A    larger-parent/trunk/thunk/bump/thud
A    larger-parent/trunk/thunk/bump/thud/file
A    larger-parent/trunk/readme
A    r9270
A    r9270/drunk
A    r9270/drunk/subversion
A    r9270/drunk/subversion/bindings
A    r9270/drunk/subversion/bindings/swig
A    r9270/drunk/subversion/bindings/swig/perl
A    r9270/drunk/subversion/bindings/swig/perl/native
A    r9270/drunk/subversion/bindings/swig/perl/native/t
A    r9270/drunk/subversion/bindings/swig/perl/native/t/a.t
A    r9270/drunk/subversion/bindings/swig/perl/native/t/b.t
A    r9270/drunk/subversion/bindings/swig/perl/native/t/larger-parent
A    r9270/drunk/subversion/bindings/swig/perl/native/t/c.t
A    r9270/drunk/subversion/bindings/swig/perl/native/a.pm
A    r9270/drunk/subversion/bindings/swig/perl/native/b.pm
A    r9270/drunk/subversion/bindings/swig/perl/native/c.pm
A    r9270/drunk/subversion/bindings/swig/perl/another-larger
A    r9270/drunk/thunk
A    r9270/drunk/thunk/bump
A    r9270/drunk/thunk/bump/thud
A    r9270/drunk/thunk/bump/thud/file
A    r9270/drunk/readme
A    r9270/trunk
A    r9270/trunk/subversion
A    r9270/trunk/subversion/bindings
A    r9270/trunk/subversion/bindings/swig
A    r9270/trunk/subversion/bindings/swig/perl
A    r9270/trunk/subversion/bindings/swig/perl/native
A    r9270/trunk/subversion/bindings/swig/perl/native/t
A    r9270/trunk/subversion/bindings/swig/perl/native/t/a.t
A    r9270/trunk/subversion/bindings/swig/perl/native/t/b.t
A    r9270/trunk/subversion/bindings/swig/perl/native/t/larger-parent
A    r9270/trunk/subversion/bindings/swig/perl/native/t/c.t
A    r9270/trunk/subversion/bindings/swig/perl/native/a.pm
A    r9270/trunk/subversion/bindings/swig/perl/native/b.pm
A    r9270/trunk/subversion/bindings/swig/perl/native/c.pm
A    r9270/trunk/subversion/bindings/swig/perl/another-larger
A    r9270/trunk/thunk
A    r9270/trunk/thunk/bump
A    r9270/trunk/thunk/bump/thud
A    r9270/trunk/thunk/bump/thud/file
A    r9270/trunk/readme
A    junk
A    junk/readme
A    another-larger
A    another-larger/trunk
A    another-larger/trunk/thunk
A    another-larger/trunk/thunk/bump
A    another-larger/trunk/thunk/bump/thud
A    another-larger/trunk/thunk/bump/thud/file
A    another-larger/trunk/readme
Updated to revision 15.
A         stunk
A         stunk/readme
Adding         stunk
Adding         stunk/readme
Transmitting file data .
Committed revision 16.
Sending        stunk/readme
Transmitting file data .
Committed revision 17.
Sending        stunk/readme
Transmitting file data .
Committed revision 18.

Committed revision 19.

Committed revision 20.
	A	readme
r16 = 20293899f00018fa0f0a8b77b6d402c9e2d50aff (refs/remotes/stunk)
	M	readme
r17 = 824328ae91a9cb5623874a0f0903c62b9a8e14cc (refs/remotes/stunk)
	M	readme
r18 = 024070bb9d123532035581530dc3bfe82eaa2c3f (refs/remotes/stunk)
	M	readme
r17 = 824328ae91a9cb5623874a0f0903c62b9a8e14cc (refs/remotes/flunk@18)
	M	readme
r18 = 024070bb9d123532035581530dc3bfe82eaa2c3f (refs/remotes/flunk@18)
r19 = 0f48e1bdd78025f4a94303e6fe20f37ca89c3e0a (refs/remotes/flunk)
	A	readme
r16 = 20293899f00018fa0f0a8b77b6d402c9e2d50aff (refs/remotes/stunk)
	M	readme
r17 = 824328ae91a9cb5623874a0f0903c62b9a8e14cc (refs/remotes/stunk)
	M	readme
r18 = 024070bb9d123532035581530dc3bfe82eaa2c3f (refs/remotes/stunk)
r20 = c359659af58c29d3c4c9f635e28896d021bb0e4b (refs/remotes/flunked)

ok 10 - follow-parent is atomic

expecting success: 
	svn_cmd cp -m "resurrect /glob" "$svnrepo"/r9270 "$svnrepo"/glob &&
	git svn multi-fetch &&
	test `git cat-file commit refs/remotes/glob | \
	       grep "^parent " | wc -l` -eq 2
	

Committed revision 21.
	A	trunk/subversion/bindings/swig/perl/t/a.t
	A	trunk/subversion/bindings/swig/perl/t/b.t
	A	trunk/subversion/bindings/swig/perl/t/larger-parent
	A	trunk/subversion/bindings/swig/perl/t/c.t
	A	trunk/subversion/bindings/swig/perl/another-larger
	A	trunk/subversion/bindings/swig/perl/a.pm
	A	trunk/subversion/bindings/swig/perl/b.pm
	A	trunk/subversion/bindings/swig/perl/c.pm
	A	trunk/thunk/bump/thud/file
	A	trunk/readme
r13 = 5c5dadfd7673b69c0f61ab0358ac1574d9990917 (refs/remotes/glob@20)
	D	trunk/subversion/bindings/swig/perl/t/a.t
	D	trunk/subversion/bindings/swig/perl/t/b.t
	D	trunk/subversion/bindings/swig/perl/t/c.t
	D	trunk/subversion/bindings/swig/perl/t/larger-parent
	D	trunk/subversion/bindings/swig/perl/t/
	D	trunk/subversion/bindings/swig/perl/a.pm
	D	trunk/subversion/bindings/swig/perl/b.pm
	D	trunk/subversion/bindings/swig/perl/c.pm
	A	trunk/subversion/bindings/swig/perl/native/t/a.t
	A	trunk/subversion/bindings/swig/perl/native/t/b.t
	A	trunk/subversion/bindings/swig/perl/native/t/larger-parent
	A	trunk/subversion/bindings/swig/perl/native/t/c.t
	A	trunk/subversion/bindings/swig/perl/native/a.pm
	A	trunk/subversion/bindings/swig/perl/native/b.pm
	A	trunk/subversion/bindings/swig/perl/native/c.pm
r14 = 3886315283b97980593e7d3c158763daa88fe06e (refs/remotes/glob@20)
	A	drunk/subversion/bindings/swig/perl/native/t/a.t
	A	drunk/subversion/bindings/swig/perl/native/t/b.t
	A	drunk/subversion/bindings/swig/perl/native/t/larger-parent
	A	drunk/subversion/bindings/swig/perl/native/t/c.t
	A	drunk/subversion/bindings/swig/perl/native/a.pm
	A	drunk/subversion/bindings/swig/perl/native/b.pm
	A	drunk/subversion/bindings/swig/perl/native/c.pm
	A	drunk/subversion/bindings/swig/perl/another-larger
	A	drunk/thunk/bump/thud/file
	A	drunk/readme
r15 = cd6812b66350965d81ddcc96b98b044e4efa40fa (refs/remotes/glob@20)
r21 = ef65b42157da18ac8448037cba0c3a22278e760c (refs/remotes/glob)

ok 11 - track multi-parent paths

expecting success: 
	git svn multi-fetch
	

ok 12 - multi-fetch continues to work

expecting success: 
	rm -r "$GIT_DIR/svn" "$GIT_DIR/refs/remotes" "$GIT_DIR/logs" &&
	mkdir "$GIT_DIR/svn" &&
	git svn multi-fetch
	
	A	readme
r1 = 1ed0665c47f514c819384f0812a13db2a080e177 (refs/remotes/svn/trunk)
	M	readme
r2 = 670c54ebd202e18834824f8d289101c675f18423 (refs/remotes/svn/trunk)
	M	readme
r3 = 65b9020509284d515edb4ab22bbd7e3cfca85e77 (refs/remotes/svn/thunk)
r4 = 7afff31e609d39287affcb5e271915301e46ce39 (refs/remotes/svn/junk)
	A	file
r5 = 1ef978609f0bbe001cdc4252a6f8ef18388b96b5 (refs/remotes/larger@5)
r6 = 7992ef0be8d9dcb33b5e5468b27caf7341ce87cc (refs/remotes/larger)
r9 = c1ef4f2e002766eacfbcfe8acabe9903c37ab6da (refs/remotes/glob)
r7 = ec88fb65482d24c66748039783b6be0f7527ff21 (refs/remotes/blob@9)
	A	hi
r8 = cb44cd70076f18b1280a973426b9e5a26ede385e (refs/remotes/blob@9)
r10 = 22c4e146f4bb799a48270a7cfb7eae789fbb0fe9 (refs/remotes/blob)
	A	blob/hi
r10 = f1d0e1ee560ad889b40456a9a14d88459a828a47 (refs/remotes/glob)
	D	hi
	A	bye
r11 = 48176762abb10eb73ac7026d3fd32b7ae0f25c52 (refs/remotes/blob)
	D	blob/hi
	A	blob/bye
r11 = c6488113b2cb37f51a9f5fe724ed169dcd78b2b0 (refs/remotes/glob)
	A	a.t
	A	b.t
	A	larger-parent
	A	c.t
r13 = bd7e8db85478489ae1d880834bc72481226baf43 (refs/remotes/r9270-t@13)
	M	c.t
r14 = d2c53fb6b18fde34f4bf2b57488a0f84330c8f89 (refs/remotes/r9270-t)
r15 = 95d1129093844f512f5c9dfb7400087e95cf25e3 (refs/remotes/r9270-d)
	A	readme
r16 = 20293899f00018fa0f0a8b77b6d402c9e2d50aff (refs/remotes/stunk)
	M	readme
r17 = 824328ae91a9cb5623874a0f0903c62b9a8e14cc (refs/remotes/stunk)
	M	readme
r18 = 024070bb9d123532035581530dc3bfe82eaa2c3f (refs/remotes/stunk)
r19 = 0f48e1bdd78025f4a94303e6fe20f37ca89c3e0a (refs/remotes/flunk)
r20 = c359659af58c29d3c4c9f635e28896d021bb0e4b (refs/remotes/flunked)
	A	trunk/subversion/bindings/swig/perl/t/a.t
	A	trunk/subversion/bindings/swig/perl/t/b.t
	A	trunk/subversion/bindings/swig/perl/t/larger-parent
	A	trunk/subversion/bindings/swig/perl/t/c.t
	A	trunk/subversion/bindings/swig/perl/another-larger
	A	trunk/subversion/bindings/swig/perl/a.pm
	A	trunk/subversion/bindings/swig/perl/b.pm
	A	trunk/subversion/bindings/swig/perl/c.pm
	A	trunk/thunk/bump/thud/file
	A	trunk/readme
r13 = 5c5dadfd7673b69c0f61ab0358ac1574d9990917 (refs/remotes/glob@20)
	D	trunk/subversion/bindings/swig/perl/t/a.t
	D	trunk/subversion/bindings/swig/perl/t/b.t
	D	trunk/subversion/bindings/swig/perl/t/c.t
	D	trunk/subversion/bindings/swig/perl/t/larger-parent
	D	trunk/subversion/bindings/swig/perl/t/
	D	trunk/subversion/bindings/swig/perl/a.pm
	D	trunk/subversion/bindings/swig/perl/b.pm
	D	trunk/subversion/bindings/swig/perl/c.pm
	A	trunk/subversion/bindings/swig/perl/native/t/a.t
	A	trunk/subversion/bindings/swig/perl/native/t/b.t
	A	trunk/subversion/bindings/swig/perl/native/t/larger-parent
	A	trunk/subversion/bindings/swig/perl/native/t/c.t
	A	trunk/subversion/bindings/swig/perl/native/a.pm
	A	trunk/subversion/bindings/swig/perl/native/b.pm
	A	trunk/subversion/bindings/swig/perl/native/c.pm
r14 = 3886315283b97980593e7d3c158763daa88fe06e (refs/remotes/glob@20)
	A	drunk/subversion/bindings/swig/perl/native/t/a.t
	A	drunk/subversion/bindings/swig/perl/native/t/b.t
	A	drunk/subversion/bindings/swig/perl/native/t/larger-parent
	A	drunk/subversion/bindings/swig/perl/native/t/c.t
	A	drunk/subversion/bindings/swig/perl/native/a.pm
	A	drunk/subversion/bindings/swig/perl/native/b.pm
	A	drunk/subversion/bindings/swig/perl/native/c.pm
	A	drunk/subversion/bindings/swig/perl/another-larger
	A	drunk/thunk/bump/thud/file
	A	drunk/readme
r15 = cd6812b66350965d81ddcc96b98b044e4efa40fa (refs/remotes/glob@20)
r21 = ef65b42157da18ac8448037cba0c3a22278e760c (refs/remotes/glob)

ok 13 - multi-fetch works off a 'clean' repository

# passed all 13 test(s)
1..13

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
r1 = 3a8a5661bfe13f7c003cb449e98306bb8df364a1 (refs/remotes/thunk@2)
	M	readme
r2 = 1a78e792949ec9684164c2e89158beab6d069b10 (refs/remotes/thunk@2)
	M	readme
r3 = c0bcff7e8637ae8a5f1df91c153efbc52a2bbe7e (refs/remotes/thunk)
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
r1 = 3a8a5661bfe13f7c003cb449e98306bb8df364a1 (refs/remotes/svn/trunk)
	M	readme
r2 = 1a78e792949ec9684164c2e89158beab6d069b10 (refs/remotes/svn/trunk)
	M	readme
r3 = c0bcff7e8637ae8a5f1df91c153efbc52a2bbe7e (refs/remotes/svn/thunk)

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
r4 = dfb8e15aa5706307f07a3a62884ea88d009ab7b5 (refs/remotes/svn/junk)

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
r5 = 442d7ebadf103deac226db21726cacdfcd68f688 (refs/remotes/larger@5)
r6 = 19e3782771de502cb77b987bdc8828826cb1a5bd (refs/remotes/larger)
19e3782771de502cb77b987bdc8828826cb1a5bd

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
r7 = 6e2157cd6f2c468c2e4a8d324b768be382781b93 (refs/remotes/blob@9)
	A	hi
r8 = cec83b138ae2ac87a9374328f5936a825ba2f3af (refs/remotes/blob@9)
r10 = 32f0a0cea2e11dfb3e772afc215ce73e962900f2 (refs/remotes/blob)
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
r9 = 34a28444d54f496d08c345867b85faba9c50ded3 (refs/remotes/glob)
	A	blob/hi
r10 = d8de524913a4c88deab8ce0e782a6aec80d728dc (refs/remotes/glob)
	D	hi
	A	bye
r11 = ad88e6477c8710644dab5a55a9ca9933b6ad3b99 (refs/remotes/blob)
	D	blob/hi
	A	blob/bye
r11 = 1e7ee90a701f49f5dbc50b7d66980035b2e441af (refs/remotes/glob)
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
r13 = 2136caecfcded5653c32d12ad4f463f1de8d952f (refs/remotes/r9270-t@13)
	M	c.t
r14 = 1bb99b3497868aa5b77f7247b2de5a1e9e7dcfcf (refs/remotes/r9270-t)
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
r15 = c41849bea9db52374125ddb49240e469e529e5dc (refs/remotes/r9270-d)

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
r16 = f7d3bab7bbd038dacf958970ae2eb4044388d579 (refs/remotes/stunk)
	M	readme
r17 = 3982967b2b91912368f8e976427d05a71526b3d3 (refs/remotes/stunk)
	M	readme
r18 = b363a29cac879ac626d7469a622cae41044732e8 (refs/remotes/stunk)
	M	readme
r17 = 3982967b2b91912368f8e976427d05a71526b3d3 (refs/remotes/flunk@18)
	M	readme
r18 = b363a29cac879ac626d7469a622cae41044732e8 (refs/remotes/flunk@18)
r19 = 0cbdaa8df71f30ece228d5bc11dcbd4ab939ed49 (refs/remotes/flunk)
	A	readme
r16 = f7d3bab7bbd038dacf958970ae2eb4044388d579 (refs/remotes/stunk)
	M	readme
r17 = 3982967b2b91912368f8e976427d05a71526b3d3 (refs/remotes/stunk)
	M	readme
r18 = b363a29cac879ac626d7469a622cae41044732e8 (refs/remotes/stunk)
r20 = 5822d7b7887bed536a3856d642a2a180f7ddb5ca (refs/remotes/flunked)

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
r13 = 97a0261d22bd68d9783b324f4fb8d9ffdac8041e (refs/remotes/glob@20)
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
r14 = 1f93daf6ce1c6a98ab63c5c79f4c4fd2b49a48aa (refs/remotes/glob@20)
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
r15 = c1ded15e05f64c75ab4d5c8dd15365739031bc24 (refs/remotes/glob@20)
r21 = 5d3e4fe8916a796e3d8fc52ede5443646a3b2dff (refs/remotes/glob)
ok 11 - track multi-parent paths
expecting success: 
	git svn multi-fetch
	

ok 12 - multi-fetch continues to work

expecting success: 
	rm -r "$GIT_DIR/svn" "$GIT_DIR/refs/remotes" "$GIT_DIR/logs" &&
	mkdir "$GIT_DIR/svn" &&
	git svn multi-fetch
	
	A	readme
r1 = 3a8a5661bfe13f7c003cb449e98306bb8df364a1 (refs/remotes/svn/trunk)
	M	readme
r2 = 1a78e792949ec9684164c2e89158beab6d069b10 (refs/remotes/svn/trunk)
	M	readme
r3 = c0bcff7e8637ae8a5f1df91c153efbc52a2bbe7e (refs/remotes/svn/thunk)
r4 = dfb8e15aa5706307f07a3a62884ea88d009ab7b5 (refs/remotes/svn/junk)
	A	file
r5 = 442d7ebadf103deac226db21726cacdfcd68f688 (refs/remotes/larger@5)
r6 = 19e3782771de502cb77b987bdc8828826cb1a5bd (refs/remotes/larger)
r9 = 34a28444d54f496d08c345867b85faba9c50ded3 (refs/remotes/glob)
r7 = 6e2157cd6f2c468c2e4a8d324b768be382781b93 (refs/remotes/blob@9)
	A	hi
r8 = cec83b138ae2ac87a9374328f5936a825ba2f3af (refs/remotes/blob@9)
r10 = 32f0a0cea2e11dfb3e772afc215ce73e962900f2 (refs/remotes/blob)
	A	blob/hi
r10 = d8de524913a4c88deab8ce0e782a6aec80d728dc (refs/remotes/glob)
	D	hi
	A	bye
r11 = ad88e6477c8710644dab5a55a9ca9933b6ad3b99 (refs/remotes/blob)
	D	blob/hi
	A	blob/bye
r11 = 1e7ee90a701f49f5dbc50b7d66980035b2e441af (refs/remotes/glob)
	A	a.t
	A	b.t
	A	larger-parent
	A	c.t
r13 = 2136caecfcded5653c32d12ad4f463f1de8d952f (refs/remotes/r9270-t@13)
	M	c.t
r14 = 1bb99b3497868aa5b77f7247b2de5a1e9e7dcfcf (refs/remotes/r9270-t)
r15 = c41849bea9db52374125ddb49240e469e529e5dc (refs/remotes/r9270-d)
	A	readme
r16 = f7d3bab7bbd038dacf958970ae2eb4044388d579 (refs/remotes/stunk)
	M	readme
r17 = 3982967b2b91912368f8e976427d05a71526b3d3 (refs/remotes/stunk)
	M	readme
r18 = b363a29cac879ac626d7469a622cae41044732e8 (refs/remotes/stunk)
r19 = 0cbdaa8df71f30ece228d5bc11dcbd4ab939ed49 (refs/remotes/flunk)
r20 = 5822d7b7887bed536a3856d642a2a180f7ddb5ca (refs/remotes/flunked)
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
r13 = 97a0261d22bd68d9783b324f4fb8d9ffdac8041e (refs/remotes/glob@20)
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
r14 = 1f93daf6ce1c6a98ab63c5c79f4c4fd2b49a48aa (refs/remotes/glob@20)
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
r15 = c1ded15e05f64c75ab4d5c8dd15365739031bc24 (refs/remotes/glob@20)
r21 = 5d3e4fe8916a796e3d8fc52ede5443646a3b2dff (refs/remotes/glob)

ok 13 - multi-fetch works off a 'clean' repository

# passed all 13 test(s)
1..13

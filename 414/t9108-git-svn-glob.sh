Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9108-git-svn-glob/.git/
expecting success: 
	mkdir -p trunk/src/a trunk/src/b trunk/doc &&
	echo "hello world" > trunk/src/a/readme &&
	echo "goodbye world" > trunk/src/b/readme &&
	svn_cmd import -m "initial" trunk "$svnrepo"/trunk &&
	svn_cmd co "$svnrepo" tmp &&
	(
		cd tmp &&
		mkdir branches tags &&
		svn_cmd add branches tags &&
		svn_cmd cp trunk branches/start &&
		svn_cmd commit -m "start a new branch" &&
		svn_cmd up &&
		echo "hi" >> branches/start/src/b/readme &&
		poke branches/start/src/b/readme &&
		echo "hey" >> branches/start/src/a/readme &&
		poke branches/start/src/a/readme &&
		svn_cmd commit -m "hi" &&
		svn_cmd up &&
		svn_cmd cp branches/start tags/end &&
		echo "bye" >> tags/end/src/b/readme &&
		poke tags/end/src/b/readme &&
		echo "aye" >> tags/end/src/a/readme &&
		poke tags/end/src/a/readme &&
		svn_cmd commit -m "the end" &&
		echo "byebye" >> tags/end/src/b/readme &&
		poke tags/end/src/b/readme &&
		svn_cmd commit -m "nothing to see here"
	) &&
	git config --add svn-remote.svn.url "$svnrepo" &&
	git config --add svn-remote.svn.fetch \
	                 "trunk/src/a:refs/remotes/trunk" &&
	git config --add svn-remote.svn.branches \
	                 "branches/*/src/a:refs/remotes/branches/*" &&
	git config --add svn-remote.svn.tags\
	                 "tags/*/src/a:refs/remotes/tags/*" &&
	git svn multi-fetch &&
	git log --pretty=oneline refs/remotes/tags/end | \
	    sed -e "s/^.\{41\}//" > output.end &&
	test_cmp expect.end output.end &&
	test "`git rev-parse refs/remotes/tags/end~1`" = \
		"`git rev-parse refs/remotes/branches/start`" &&
	test "`git rev-parse refs/remotes/branches/start~2`" = \
		"`git rev-parse refs/remotes/trunk`" &&
	test_must_fail git rev-parse refs/remotes/tags/end@3
	
Adding         trunk/doc
Adding         trunk/src
Adding         trunk/src/a
Adding         trunk/src/a/readme
Adding         trunk/src/b
Adding         trunk/src/b/readme

Committed revision 1.
A    tmp/trunk
A    tmp/trunk/doc
A    tmp/trunk/src
A    tmp/trunk/src/a
A    tmp/trunk/src/a/readme
A    tmp/trunk/src/b
A    tmp/trunk/src/b/readme
Checked out revision 1.
A         branches
A         tags
A         branches/start
Adding         branches
Adding         branches/start
Adding         tags

Committed revision 2.
At revision 2.
Sending        branches/start/src/a/readme
Sending        branches/start/src/b/readme
Transmitting file data ..
Committed revision 3.
At revision 3.
A         tags/end
Adding         tags/end
Sending        tags/end/src/a/readme
Sending        tags/end/src/b/readme
Transmitting file data ..
Committed revision 4.
Sending        tags/end/src/b/readme
Transmitting file data .
Committed revision 5.
	A	readme
r1 = dbacce4cf16db948725c84d6cfc1c0a92dce49dc (refs/remotes/trunk)
r2 = 889c93eabc7e2dc8de9a6fb341f78795ef1ef335 (refs/remotes/branches/start)
	M	readme
r3 = 25b8f216a9cab1fa78e3cad6f666900edc8ca2bd (refs/remotes/branches/start)
	M	readme
r4 = 485938845c6f1bf2f9bf5b925a1bfb253e5ea0aa (refs/remotes/tags/end)
refs/remotes/tags/end@3

ok 1 - test refspec globbing
expecting success: 
	git config --add svn-remote.two.url "$svnrepo" &&
	git config --add svn-remote.two.fetch trunk:refs/remotes/two/trunk &&
	git config --add svn-remote.two.branches \
	                 "branches/*:refs/remotes/two/branches/*" &&
	git config --add svn-remote.two.tags \
	                 "tags/*:refs/remotes/two/tags/*" &&
	(
		cd tmp &&
		echo "try try" >> tags/end/src/b/readme &&
		poke tags/end/src/b/readme &&
		svn_cmd commit -m "try to try"
	) &&
	git svn fetch two &&
	test `git rev-list refs/remotes/two/tags/end | wc -l` -eq 6 &&
	test `git rev-list refs/remotes/two/branches/start | wc -l` -eq 3 &&
	test `git rev-parse refs/remotes/two/branches/start~2` = \
	     `git rev-parse refs/remotes/two/trunk` &&
	test `git rev-parse refs/remotes/two/tags/end~3` = \
	     `git rev-parse refs/remotes/two/branches/start` &&
	git log --pretty=oneline refs/remotes/two/tags/end | \
	    sed -e "s/^.\{41\}//" > output.two &&
	test_cmp expect.two output.two
	
Sending        tags/end/src/b/readme
Transmitting file data .
Committed revision 6.
	A	src/a/readme
	A	src/b/readme
r1 = e51c310f90ab48d9a4ad8a6c7cc02b54ccece60e (refs/remotes/two/trunk)
r2 = 3c79aef20b1749ed1f6654d276eeb4568addf7d9 (refs/remotes/two/branches/start)
	M	src/a/readme
	M	src/b/readme
r3 = 7126e2c9e59e305272b042ddb58f1271db726f04 (refs/remotes/two/branches/start)
	M	src/a/readme
	M	src/b/readme
r4 = 64027a0940f1b363bfcf4263452cdd14f2830864 (refs/remotes/two/tags/end)
	M	src/b/readme
r5 = f0952bfed643be64c946d6ac81857310b87badc6 (refs/remotes/two/tags/end)
	M	src/b/readme
r6 = 443cd5d857aa261b09be080e3d205f8f7d04a476 (refs/remotes/two/tags/end)

ok 2 - test left-hand-side only globbing

expecting success: 
	git config --add svn-remote.three.url "$svnrepo" &&
	git config --add svn-remote.three.fetch \
	                 trunk:refs/remotes/three/trunk &&
	git config --add svn-remote.three.branches \
	                 "branches/*/t/*:refs/remotes/three/branches/*" &&
	git config --add svn-remote.three.tags \
	                 "tags/*/*:refs/remotes/three/tags/*" &&
	(
		cd tmp &&
		echo "try try" >> tags/end/src/b/readme &&
		poke tags/end/src/b/readme &&
		svn_cmd commit -m "try to try"
	) &&
	test_must_fail git svn fetch three 2> stderr.three &&
	test_cmp expect.three stderr.three
	
Sending        tags/end/src/b/readme
Transmitting file data .
Committed revision 7.

ok 3 - test disallow multi-globs

# passed all 3 test(s)
1..3

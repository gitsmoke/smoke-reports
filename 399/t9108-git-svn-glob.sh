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
r1 = 0d10d982b302f5422a11e92e61fb075f8a23711e (refs/remotes/trunk)
r2 = d2e28869ddbd8d6489716a7d03e473a84c88e955 (refs/remotes/branches/start)
	M	readme
r3 = 7566c1e82645638a91cfc6f7b68dda2576b07ca4 (refs/remotes/branches/start)
	M	readme
r4 = 9ffbf02c74dd6969b1d2330b018fcc14e0ecf109 (refs/remotes/tags/end)
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
r1 = 68b9c7f3bb648e76bb02b82f902ebeb68306d529 (refs/remotes/two/trunk)
r2 = 2507f08e170e0102dee25ed42dca8711b5d3db1f (refs/remotes/two/branches/start)
	M	src/a/readme
	M	src/b/readme
r3 = df0b14b96673033be78d2bf70be308d0d9df0903 (refs/remotes/two/branches/start)
	M	src/a/readme
	M	src/b/readme
r4 = 9e08a172b770e0002b6bd65cfe786894ceab74c6 (refs/remotes/two/tags/end)
	M	src/b/readme
r5 = 67412aa5ff782f976ceadb5c30fd2c80a343c2a7 (refs/remotes/two/tags/end)
	M	src/b/readme
r6 = 2aa8fba93f8e5b0fb1cb943abe5870c7df00c75f (refs/remotes/two/tags/end)

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

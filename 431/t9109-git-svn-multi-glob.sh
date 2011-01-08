Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9109-git-svn-multi-glob/.git/
expecting success: 
	mkdir -p trunk/src/a trunk/src/b trunk/doc &&
	echo "hello world" > trunk/src/a/readme &&
	echo "goodbye world" > trunk/src/b/readme &&
	svn_cmd import -m "initial" trunk "$svnrepo"/trunk &&
	svn_cmd co "$svnrepo" tmp &&
	(
		cd tmp &&
		mkdir branches branches/v1 tags &&
		svn_cmd add branches tags &&
		svn_cmd cp trunk branches/v1/start &&
		svn_cmd commit -m "start a new branch" &&
		svn_cmd up &&
		echo "hi" >> branches/v1/start/src/b/readme &&
		poke branches/v1/start/src/b/readme &&
		echo "hey" >> branches/v1/start/src/a/readme &&
		poke branches/v1/start/src/a/readme &&
		svn_cmd commit -m "hi" &&
		svn_cmd up &&
		svn_cmd cp branches/v1/start tags/end &&
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
	                 "branches/*/*/src/a:refs/remotes/branches/*/*" &&
	git config --add svn-remote.svn.tags\
	                 "tags/*/src/a:refs/remotes/tags/*" &&
	git svn multi-fetch &&
	git log --pretty=oneline refs/remotes/tags/end | \
	    sed -e "s/^.\{41\}//" > output.end &&
	test_cmp expect.end output.end &&
	test "`git rev-parse refs/remotes/tags/end~1`" = \
		"`git rev-parse refs/remotes/branches/v1/start`" &&
	test "`git rev-parse refs/remotes/branches/v1/start~2`" = \
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
A         branches/v1
A         tags
A         branches/v1/start
Adding         branches
Adding         branches/v1
Adding         branches/v1/start
Adding         tags

Committed revision 2.
At revision 2.
Sending        branches/v1/start/src/a/readme
Sending        branches/v1/start/src/b/readme
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
r1 = 8a90e2b9641f519ad0d35f1b158f850ee316a293 (refs/remotes/trunk)
r2 = f36f144f1febb1c8d094d5c2ae9dd4ef4a2d1cec (refs/remotes/branches/v1/start)
	M	readme
r3 = 762994972ea446d3357b6bc07a4bfd18eac64d70 (refs/remotes/branches/v1/start)
	M	readme
r4 = f942ec35653efa5df0ace5c1b81a2d1f5435da4a (refs/remotes/tags/end)
refs/remotes/tags/end@3

ok 1 - test refspec globbing
expecting success: 
	git config --add svn-remote.two.url "$svnrepo" &&
	git config --add svn-remote.two.fetch trunk:refs/remotes/two/trunk &&
	git config --add svn-remote.two.branches \
	                 "branches/*/*:refs/remotes/two/branches/*/*" &&
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
	test `git rev-list refs/remotes/two/branches/v1/start | wc -l` -eq 3 &&
	test `git rev-parse refs/remotes/two/branches/v1/start~2` = \
	     `git rev-parse refs/remotes/two/trunk` &&
	test `git rev-parse refs/remotes/two/tags/end~3` = \
	     `git rev-parse refs/remotes/two/branches/v1/start` &&
	git log --pretty=oneline refs/remotes/two/tags/end | \
	    sed -e "s/^.\{41\}//" > output.two &&
	test_cmp expect.two output.two
	
Sending        tags/end/src/b/readme
Transmitting file data .
Committed revision 6.
	A	src/a/readme
	A	src/b/readme
r1 = 31cede0dcf32d67ffb505edb889cd1afda1514fa (refs/remotes/two/trunk)
r2 = fcd2985f9c0fc88b886a4f25e4800b4314a1d876 (refs/remotes/two/branches/v1/start)
	M	src/a/readme
	M	src/b/readme
r3 = a1da329489bb46318b2d1831d12f5532106b81ca (refs/remotes/two/branches/v1/start)
	M	src/a/readme
	M	src/b/readme
r4 = 2cea5675c17819b31453bc9dcf3282ef73e72cc5 (refs/remotes/two/tags/end)
	M	src/b/readme
r5 = 7a413105c4ea2efa1bcb174848c2e7828089ad6e (refs/remotes/two/tags/end)
	M	src/b/readme
r6 = c9bcceac4dc328815c15274056c11d33288bf21d (refs/remotes/two/tags/end)

ok 2 - test left-hand-side only globbing

expecting success: 
	(
		cd tmp &&
		mkdir branches/v2 &&
		svn_cmd add branches/v2 &&
		svn_cmd cp trunk branches/v2/start &&
		svn_cmd commit -m "Another versioned branch" &&
		svn_cmd up &&
		echo "hello" >> branches/v2/start/src/b/readme &&
		poke branches/v2/start/src/b/readme &&
		echo "howdy" >> branches/v2/start/src/a/readme &&
		poke branches/v2/start/src/a/readme &&
		svn_cmd commit -m "Changed 2 in v2/start" &&
		svn_cmd up &&
		svn_cmd cp branches/v2/start tags/next &&
		echo "bye" >> tags/next/src/b/readme &&
		poke tags/next/src/b/readme &&
		echo "aye" >> tags/next/src/a/readme &&
		poke tags/next/src/a/readme &&
		svn_cmd commit -m "adding more" &&
		echo "byebye" >> tags/next/src/b/readme &&
		poke tags/next/src/b/readme &&
		svn_cmd commit -m "adios"
	) &&
	git config --add svn-remote.four.url "$svnrepo" &&
	git config --add svn-remote.four.fetch trunk:refs/remotes/four/trunk &&
	git config --add svn-remote.four.branches \
	                 "branches/*/*:refs/remotes/four/branches/*/*" &&
	git config --add svn-remote.four.tags \
	                 "tags/*:refs/remotes/four/tags/*" &&
	git svn fetch four &&
	test `git rev-list refs/remotes/four/tags/next | wc -l` -eq 5 &&
	test `git rev-list refs/remotes/four/branches/v2/start | wc -l` -eq 3 &&
	test `git rev-parse refs/remotes/four/branches/v2/start~2` = \
	     `git rev-parse refs/remotes/four/trunk` &&
	test `git rev-parse refs/remotes/four/tags/next~2` = \
	     `git rev-parse refs/remotes/four/branches/v2/start` &&
	git log --pretty=oneline refs/remotes/four/tags/next | \
	    sed -e "s/^.\{41\}//" > output.four &&
	test_cmp expect.four output.four
	
A         branches/v2
A         branches/v2/start
Adding         branches/v2
Adding         branches/v2/start

Committed revision 7.
At revision 7.
Sending        branches/v2/start/src/a/readme
Sending        branches/v2/start/src/b/readme
Transmitting file data ..
Committed revision 8.
At revision 8.
A         tags/next
Adding         tags/next
Sending        tags/next/src/a/readme
Sending        tags/next/src/b/readme
Transmitting file data ..
Committed revision 9.
Sending        tags/next/src/b/readme
Transmitting file data .
Committed revision 10.
	A	src/a/readme
	A	src/b/readme
r1 = 31cede0dcf32d67ffb505edb889cd1afda1514fa (refs/remotes/four/trunk)
r2 = fcd2985f9c0fc88b886a4f25e4800b4314a1d876 (refs/remotes/four/branches/v1/start)
	M	src/a/readme
	M	src/b/readme
r3 = a1da329489bb46318b2d1831d12f5532106b81ca (refs/remotes/four/branches/v1/start)
	M	src/a/readme
	M	src/b/readme
r4 = 2cea5675c17819b31453bc9dcf3282ef73e72cc5 (refs/remotes/four/tags/end)
	M	src/b/readme
r5 = 7a413105c4ea2efa1bcb174848c2e7828089ad6e (refs/remotes/four/tags/end)
	M	src/b/readme
r6 = c9bcceac4dc328815c15274056c11d33288bf21d (refs/remotes/four/tags/end)
r7 = 89ddb42091e7dff3c1793e50ec416051c60384a6 (refs/remotes/four/branches/v2/start)
	M	src/a/readme
	M	src/b/readme
r8 = e60d0ff1d398c78985d119c56d8e1f40fd548c3c (refs/remotes/four/branches/v2/start)
	M	src/a/readme
	M	src/b/readme
r9 = 56aa59d0d9c07766e74b694d0f92cc26a05ad9ba (refs/remotes/four/tags/next)
	M	src/b/readme
r10 = afc963ae037e622fe3c734120750d2aa636bab18 (refs/remotes/four/tags/next)

ok 3 - test another branch

expecting success: 
	git config --add svn-remote.three.url "$svnrepo" &&
	git config --add svn-remote.three.fetch \
	                 trunk:refs/remotes/three/trunk &&
	git config --add svn-remote.three.branches \
	                 "branches/*/t/*:refs/remotes/three/branches/*/*" &&
	git config --add svn-remote.three.tags \
	                 "tags/*:refs/remotes/three/tags/*" &&
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
Committed revision 11.

ok 4 - test disallow multiple globs

# passed all 4 test(s)
1..4

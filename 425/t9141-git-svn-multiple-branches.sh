Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/.git/
expecting success: 
	mkdir	project \
		project/trunk \
		project/b_one \
		project/b_two \
		project/tags_A \
		project/tags_B &&
	echo 1 > project/trunk/a.file &&
	svn_cmd import -m "$test_description" project "$svnrepo/project" &&
	rm -rf project &&
	svn_cmd cp -m "Branch 1" "$svnrepo/project/trunk" \
				 "$svnrepo/project/b_one/first" &&
	svn_cmd cp -m "Tag 1" "$svnrepo/project/trunk" \
			      "$svnrepo/project/tags_A/1.0" &&
	svn_cmd co "$svnrepo/project" svn_project &&
	( cd svn_project &&
		echo 2 > trunk/a.file &&
		svn_cmd ci -m "Change 1" trunk/a.file &&
		svn_cmd cp -m "Branch 2" "$svnrepo/project/trunk" \
					 "$svnrepo/project/b_one/second" &&
		svn_cmd cp -m "Tag 2" "$svnrepo/project/trunk" \
				      "$svnrepo/project/tags_A/2.0" &&
		echo 3 > trunk/a.file &&
		svn_cmd ci -m "Change 2" trunk/a.file &&
		svn_cmd cp -m "Branch 3" "$svnrepo/project/trunk" \
					 "$svnrepo/project/b_two/1" &&
		svn_cmd cp -m "Tag 3" "$svnrepo/project/trunk" \
				      "$svnrepo/project/tags_A/3.0" &&
		echo 4 > trunk/a.file &&
		svn_cmd ci -m "Change 3" trunk/a.file &&
		svn_cmd cp -m "Branch 4" "$svnrepo/project/trunk" \
					 "$svnrepo/project/b_two/2" &&
		svn_cmd cp -m "Tag 4" "$svnrepo/project/trunk" \
				      "$svnrepo/project/tags_A/4.0" &&
		svn_cmd up &&
		echo 5 > b_one/first/a.file &&
		svn_cmd ci -m "Change 4" b_one/first/a.file &&
		svn_cmd cp -m "Tag 5" "$svnrepo/project/b_one/first" \
				      "$svnrepo/project/tags_B/v5" &&
		echo 6 > b_one/second/a.file &&
		svn_cmd ci -m "Change 5" b_one/second/a.file &&
		svn_cmd cp -m "Tag 6" "$svnrepo/project/b_one/second" \
				      "$svnrepo/project/tags_B/v6" &&
		echo 7 > b_two/1/a.file &&
		svn_cmd ci -m "Change 6" b_two/1/a.file &&
		svn_cmd cp -m "Tag 7" "$svnrepo/project/b_two/1" \
				      "$svnrepo/project/tags_B/v7" &&
		echo 8 > b_two/2/a.file &&
		svn_cmd ci -m "Change 7" b_two/2/a.file &&
		svn_cmd cp -m "Tag 8" "$svnrepo/project/b_two/2" \
				      "$svnrepo/project/tags_B/v8"
	)

Adding         project/tags_B
Adding         project/b_one
Adding         project/trunk
Adding         project/trunk/a.file
Adding         project/b_two
Adding         project/tags_A

Committed revision 1.

Committed revision 2.

Committed revision 3.
A    svn_project/tags_B
A    svn_project/b_one
A    svn_project/b_one/first
A    svn_project/b_one/first/a.file
A    svn_project/trunk
A    svn_project/trunk/a.file
A    svn_project/b_two
A    svn_project/tags_A
A    svn_project/tags_A/1.0
A    svn_project/tags_A/1.0/a.file
Checked out revision 3.
Sending        trunk/a.file
Transmitting file data .
Committed revision 4.

Committed revision 5.

Committed revision 6.
Sending        trunk/a.file
Transmitting file data .
Committed revision 7.

Committed revision 8.

Committed revision 9.
Sending        trunk/a.file
Transmitting file data .
Committed revision 10.

Committed revision 11.

Committed revision 12.
A    b_one/second
A    b_one/second/a.file
A    b_two/1
A    b_two/1/a.file
A    b_two/2
A    b_two/2/a.file
A    tags_A/2.0
A    tags_A/2.0/a.file
A    tags_A/3.0
A    tags_A/3.0/a.file
A    tags_A/4.0
A    tags_A/4.0/a.file
Updated to revision 12.
Sending        b_one/first/a.file
Transmitting file data .
Committed revision 13.

Committed revision 14.
Sending        b_one/second/a.file
Transmitting file data .
Committed revision 15.

Committed revision 16.
Sending        b_two/1/a.file
Transmitting file data .
Committed revision 17.

Committed revision 18.
Sending        b_two/2/a.file
Transmitting file data .
Committed revision 19.

Committed revision 20.

ok 1 - setup svnrepo

expecting success: 
	git svn clone -T trunk \
		      -b b_one/* --branches b_two/* \
		      -t tags_A/* --tags tags_B \
		      "$svnrepo/project" git_project &&
	( cd git_project &&
		git rev-parse refs/remotes/first &&
		git rev-parse refs/remotes/second &&
		git rev-parse refs/remotes/1 &&
		git rev-parse refs/remotes/2 &&
		git rev-parse refs/remotes/tags/1.0 &&
		git rev-parse refs/remotes/tags/2.0 &&
		git rev-parse refs/remotes/tags/3.0 &&
		git rev-parse refs/remotes/tags/4.0 &&
		git rev-parse refs/remotes/tags/v5 &&
		git rev-parse refs/remotes/tags/v6 &&
		git rev-parse refs/remotes/tags/v7 &&
		git rev-parse refs/remotes/tags/v8
	)
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/git_project/.git/
	A	a.file
r1 = 3a9745135a4dbcd52619abc35a54961bcbe166b9 (refs/remotes/trunk)
r2 = 63937c7afc26bd4105e903af6caa462c859e3a02 (refs/remotes/first)
r3 = d918b5f667b75a675d801d3221da6a8365f05f95 (refs/remotes/tags/1.0)
	M	a.file
r4 = 15bbfb27178999770b5abfb7d36961271ecf0b39 (refs/remotes/trunk)
r5 = a9487fb54fc783075e8969e140da824af46b0744 (refs/remotes/second)
r6 = e05fbb41e740bbe1a3cfea0100c123f48569af5e (refs/remotes/tags/2.0)
	M	a.file
r7 = 1f929311cb123f6c1b1fee8e643de3c9ac45650d (refs/remotes/trunk)
r8 = cd46eeeb3a9fd08cbba7a62dc048db679780f2e4 (refs/remotes/1)
r9 = 28910d05243293fbdb71977fd84bc809ff1d8b8a (refs/remotes/tags/3.0)
	M	a.file
r10 = 89daf7a81670c10d788045d42897913974545a64 (refs/remotes/trunk)
r11 = fafca1bb1eddeb28b42e7c8cd942871f662bd11b (refs/remotes/2)
r12 = 2b90626d9471fb69247443eb9df1aa414e6a8848 (refs/remotes/tags/4.0)
	M	a.file
r13 = 19ddc2fda5f53f014e350409af2014fe30105c3c (refs/remotes/first)
r14 = 05d5abd82db7622737157c6f60915ad3949ad1e7 (refs/remotes/tags/v5)
	M	a.file
r15 = 2e16b4fa3557cc8e173aaa802f3fe099373ca540 (refs/remotes/second)
r16 = 52be7fc45e6c3852bb788042078356417964d525 (refs/remotes/tags/v6)
	M	a.file
r17 = a77762a16d8e625d2a6b9a9072e6d9c9eb1a75eb (refs/remotes/1)
r18 = 161a3add28199815236e0ac76591975ba0996a48 (refs/remotes/tags/v7)
	M	a.file
r19 = 32f900c2f84d03612bdb48349b0f0b7695f02ff6 (refs/remotes/2)
r20 = 2681a9544ec3705dd6a2250c391bd5f58ab1d1cf (refs/remotes/tags/v8)
19ddc2fda5f53f014e350409af2014fe30105c3c
2e16b4fa3557cc8e173aaa802f3fe099373ca540
a77762a16d8e625d2a6b9a9072e6d9c9eb1a75eb
32f900c2f84d03612bdb48349b0f0b7695f02ff6
d918b5f667b75a675d801d3221da6a8365f05f95
e05fbb41e740bbe1a3cfea0100c123f48569af5e
28910d05243293fbdb71977fd84bc809ff1d8b8a
2b90626d9471fb69247443eb9df1aa414e6a8848
05d5abd82db7622737157c6f60915ad3949ad1e7
52be7fc45e6c3852bb788042078356417964d525
161a3add28199815236e0ac76591975ba0996a48
2681a9544ec3705dd6a2250c391bd5f58ab1d1cf

ok 2 - clone multiple branch and tag paths

expecting success: 
	( cd git_project &&
		test_must_fail git svn branch -m "No new branch" Nope &&
		test_must_fail git svn tag -m "No new tag" Tagless &&
		test_must_fail git rev-parse refs/remotes/Nope &&
		test_must_fail git rev-parse refs/remotes/tags/Tagless
	) &&
	( cd svn_project &&
		svn_cmd up &&
		test_must_fail test -d b_one/Nope &&
		test_must_fail test -d b_two/Nope &&
		test_must_fail test -d tags_A/Tagless &&
		test_must_fail test -d tags_B/Tagless
	)
refs/remotes/Nope
refs/remotes/tags/Tagless
A    tags_B/v5
A    tags_B/v5/a.file
A    tags_B/v6
A    tags_B/v6/a.file
A    tags_B/v7
A    tags_B/v7/a.file
A    tags_B/v8
A    tags_B/v8/a.file
Updated to revision 20.

ok 3 - Multiple branch or tag paths require -d

expecting success: 
	( cd git_project &&
		git svn branch -m "New branch 1" -d b_one New1 ) &&
	( cd svn_project &&
		svn_cmd up && test -e b_one/New1/a.file ) &&

	( cd git_project &&
		git svn branch -m "New branch 2" -d b_two New2 ) &&
	( cd svn_project &&
		svn_cmd up && test -e b_two/New2/a.file ) &&

	( cd git_project &&
		git svn branch -t -m "New tag 1" -d tags_A Tag1 ) &&
	( cd svn_project &&
		svn_cmd up && test -e tags_A/Tag1/a.file ) &&

	( cd git_project &&
		git svn tag -m "New tag 2" -d tags_B Tag2 ) &&
	( cd svn_project &&
		svn_cmd up && test -e tags_B/Tag2/a.file )
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/b_one/New1...
r21 = 9ffb844c803e7bc9a7c38d0facceb8de971889ed (refs/remotes/New1)
A    b_one/New1
A    b_one/New1/a.file
Updated to revision 21.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/b_two/New2...
r22 = f09a074760ec84dbb6e18417244e143c91de7217 (refs/remotes/New2)
A    b_two/New2
A    b_two/New2/a.file
Updated to revision 22.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/tags_A/Tag1...
r23 = 93169802b5b7453c2c11d906114f6923c0fc41c8 (refs/remotes/tags/Tag1)
A    tags_A/Tag1
A    tags_A/Tag1/a.file
Updated to revision 23.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/tags_B/Tag2...
r24 = cfb7a4a673ef32da66822e81fc2d1b79f4adbb3a (refs/remotes/tags/Tag2)
A    tags_B/Tag2
A    tags_B/Tag2/a.file
Updated to revision 24.

ok 4 - create new branches and tags

# passed all 4 test(s)
1..4

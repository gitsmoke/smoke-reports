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
r1 = 117ab91d9be0827bfc9ad5c2a69747aee836bf18 (refs/remotes/trunk)
r2 = 4c46a2ed2c871347e5df912ff06b4d9a2a4b9a99 (refs/remotes/first)
r3 = 474d02e567e0bcd636610647a0edc3ffda3e04ad (refs/remotes/tags/1.0)
	M	a.file
r4 = 6824fe17cb41c46b87acde77fe12741a1c6e557f (refs/remotes/trunk)
r5 = 40be36a8335ef6d7581a1ba30d3ed62802fa7f32 (refs/remotes/second)
r6 = 179e711f189148c1066edfa9eea8d36d66c1b7b3 (refs/remotes/tags/2.0)
	M	a.file
r7 = 08e7ce7309f0fea88017a5361de83da8742abc2a (refs/remotes/trunk)
r8 = d0390678109cc82e7282f45dcb1c338dff395ad7 (refs/remotes/1)
r9 = 0893da8ec8b05b7688ed10cd67ebf96be8a71d7d (refs/remotes/tags/3.0)
	M	a.file
r10 = d8632b37ab5587a18761cf655245d7b625eb7916 (refs/remotes/trunk)
r11 = b5dfab70e8a2dbd208b7481b9488c5ba2fc5eea6 (refs/remotes/2)
r12 = 3cbe2b40b1f83ebd8b5d2ef2578480bce1faeafc (refs/remotes/tags/4.0)
	M	a.file
r13 = ebdd52bd43ef6cc606c2c1b55e541cb4e7a907ce (refs/remotes/first)
r14 = 8ae6fa1b4d4597564843304a45b272b605fe3740 (refs/remotes/tags/v5)
	M	a.file
r15 = be25afd62395deaf0178c44b59a2120c287dd900 (refs/remotes/second)
r16 = 979b21453b8402a73c85016473497544e586b168 (refs/remotes/tags/v6)
	M	a.file
r17 = b141a29dbd9fc28851da83f363c73d9c142e7d8c (refs/remotes/1)
r18 = 449b370600ad75d9225be86f43de4d15ad5d3cee (refs/remotes/tags/v7)
	M	a.file
r19 = d1a0a082daf47e64e637634673e4bd35b03807e3 (refs/remotes/2)
r20 = cd2f228ae76b89478db88130ee78045fb81f6421 (refs/remotes/tags/v8)
ebdd52bd43ef6cc606c2c1b55e541cb4e7a907ce
be25afd62395deaf0178c44b59a2120c287dd900
b141a29dbd9fc28851da83f363c73d9c142e7d8c
d1a0a082daf47e64e637634673e4bd35b03807e3
474d02e567e0bcd636610647a0edc3ffda3e04ad
179e711f189148c1066edfa9eea8d36d66c1b7b3
0893da8ec8b05b7688ed10cd67ebf96be8a71d7d
3cbe2b40b1f83ebd8b5d2ef2578480bce1faeafc
8ae6fa1b4d4597564843304a45b272b605fe3740
979b21453b8402a73c85016473497544e586b168
449b370600ad75d9225be86f43de4d15ad5d3cee
cd2f228ae76b89478db88130ee78045fb81f6421
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
r21 = ff051624c111c992d816bb9bc1f32c689232388e (refs/remotes/New1)
A    b_one/New1
A    b_one/New1/a.file
Updated to revision 21.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/b_two/New2...
r22 = 3786394013be97a92ede2ecac4411f76f3477380 (refs/remotes/New2)
A    b_two/New2
A    b_two/New2/a.file
Updated to revision 22.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/tags_A/Tag1...
r23 = 894c25b2ee54d6388665ac11258e15c1c4ce40a2 (refs/remotes/tags/Tag1)
A    tags_A/Tag1
A    tags_A/Tag1/a.file
Updated to revision 23.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/tags_B/Tag2...
r24 = c26ef61c92a47a4130a874bac3809d6b07f572c8 (refs/remotes/tags/Tag2)
A    tags_B/Tag2
A    tags_B/Tag2/a.file
Updated to revision 24.

ok 4 - create new branches and tags

# passed all 4 test(s)
1..4

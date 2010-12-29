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
r1 = 4d9d40c88d082ea3513eff3d40e280116c50ce3f (refs/remotes/trunk)
r2 = 85fd8b99c5a09f0c9770de71b63b66653b28ea01 (refs/remotes/first)
r3 = 8aacf9f9aaeb7bf0d11624dd07bc6e7cbb7a8348 (refs/remotes/tags/1.0)
	M	a.file
r4 = 808fa77bac9fbf744852e603e3c0c3840d1ae5b0 (refs/remotes/trunk)
r5 = beca8f99d206c158590c7a2389130c5fff0ac5fb (refs/remotes/second)
r6 = b979859698b0688b9995e34fa40bad2bdeba93f6 (refs/remotes/tags/2.0)
	M	a.file
r7 = 9fa918b86ccf47b148d336531d47e19417f22219 (refs/remotes/trunk)
r8 = fb070877d56694043c215897259106896b2e08c2 (refs/remotes/1)
r9 = caa4ca6da5014e1410274283b085b5b7c821d505 (refs/remotes/tags/3.0)
	M	a.file
r10 = f408ac18b71436db4b26fa9ddf4e90a860b67be9 (refs/remotes/trunk)
r11 = 09074d990a8b009cad67f9ba68d15554d3fd7478 (refs/remotes/2)
r12 = 2485e6fde96ef25f55044813900ba495fbc6d54b (refs/remotes/tags/4.0)
	M	a.file
r13 = b99c7ddb5bb1c69e38c30921812a046f7e4a25f2 (refs/remotes/first)
r14 = 9aa7039ee6ad66c29b90c41ede42f3a18048bc76 (refs/remotes/tags/v5)
	M	a.file
r15 = 5d482d00a5c9a6aac6f618a28bf0042dee49e3bc (refs/remotes/second)
r16 = 7ad54669639099415b1b73b5e23f23b5d286a646 (refs/remotes/tags/v6)
	M	a.file
r17 = 67436d6c098c9fbc3d6a3d276e54b3afc7bd0c8a (refs/remotes/1)
r18 = 26b6e93710305d1d0fb88019f0472743694d83d2 (refs/remotes/tags/v7)
	M	a.file
r19 = 8a6dfa2aa26a4186e0ef016e4a5aee9da454c0f4 (refs/remotes/2)
r20 = 96dc680615a4c1ccd092b6b795e1536228ecc0d9 (refs/remotes/tags/v8)
b99c7ddb5bb1c69e38c30921812a046f7e4a25f2
5d482d00a5c9a6aac6f618a28bf0042dee49e3bc
67436d6c098c9fbc3d6a3d276e54b3afc7bd0c8a
8a6dfa2aa26a4186e0ef016e4a5aee9da454c0f4
8aacf9f9aaeb7bf0d11624dd07bc6e7cbb7a8348
b979859698b0688b9995e34fa40bad2bdeba93f6
caa4ca6da5014e1410274283b085b5b7c821d505
2485e6fde96ef25f55044813900ba495fbc6d54b
9aa7039ee6ad66c29b90c41ede42f3a18048bc76
7ad54669639099415b1b73b5e23f23b5d286a646
26b6e93710305d1d0fb88019f0472743694d83d2
96dc680615a4c1ccd092b6b795e1536228ecc0d9
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
r21 = 191db5bf4509c489c3c395524bbe363eef806bce (refs/remotes/New1)
A    b_one/New1
A    b_one/New1/a.file
Updated to revision 21.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/b_two/New2...
r22 = 3d42d6ca089b8bf9b2ed9279b96abd66fae43a54 (refs/remotes/New2)
A    b_two/New2
A    b_two/New2/a.file
Updated to revision 22.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/tags_A/Tag1...
r23 = 707320047f3589335714333244ce8530c52993b2 (refs/remotes/tags/Tag1)
A    tags_A/Tag1
A    tags_A/Tag1/a.file
Updated to revision 23.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/tags_B/Tag2...
r24 = ec28321a7fe9865034f2de7d11f154b557999c17 (refs/remotes/tags/Tag2)
A    tags_B/Tag2
A    tags_B/Tag2/a.file
Updated to revision 24.
ok 4 - create new branches and tags
# passed all 4 test(s)
1..4

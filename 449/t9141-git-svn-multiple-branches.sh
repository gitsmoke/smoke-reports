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
r1 = d7dbf48b874aba22f853ea0deae1dd0377ec6d4f (refs/remotes/trunk)
r2 = 67611d7f4158cdb98fb88f590c0d5c4d872447a3 (refs/remotes/first)
r3 = 00df087a0b494d1418c357b24c2ebb164ba15526 (refs/remotes/tags/1.0)
	M	a.file
r4 = c052515637def015f932fc7a9ba6648c05827acd (refs/remotes/trunk)
r5 = c575166fefbf256e450d5bea57035ff1008dcab1 (refs/remotes/second)
r6 = 8ffb85ee849fc3491ed7adac64c530632c6e02e6 (refs/remotes/tags/2.0)
	M	a.file
r7 = 56a5e0bec79a8d21f312320c15a091b68b44ef76 (refs/remotes/trunk)
r8 = e8333237a1ee8d76a3ab9a2ea9907d13f6df6830 (refs/remotes/1)
r9 = c59e8805d460c1298fdbb328152c2ea2b59f6961 (refs/remotes/tags/3.0)
	M	a.file
r10 = b9db1de0d2e9851549101fc94586921d334c426a (refs/remotes/trunk)
r11 = dd4656f2383e456b9ae0dd45e2a0f57b6b717134 (refs/remotes/2)
r12 = 4d89cb8e4d9c468898c488004d5f37bfc8c601d7 (refs/remotes/tags/4.0)
	M	a.file
r13 = 57f526b472673e4b1895bcb342f4735bce38a91b (refs/remotes/first)
r14 = 93362430867c172be84a0e1141549fb6a878cb36 (refs/remotes/tags/v5)
	M	a.file
r15 = 7a1ff141f77cf5c978a511405fddb9b26502ebf0 (refs/remotes/second)
r16 = 132431fd9795006d2991b2228876f67ffadd2bcc (refs/remotes/tags/v6)
	M	a.file
r17 = 33d4434b5a80525cd8aec9d2aeb6094a0bb7f3d3 (refs/remotes/1)
r18 = 4cc9b5fa51936fbbe3cf4fdc73ce45a5e97d8428 (refs/remotes/tags/v7)
	M	a.file
r19 = 7086208af3729a53c8ace3d930e1a025844e963b (refs/remotes/2)
r20 = 8c3df2befe9aeb94e09e692d220a135fa6c14d1e (refs/remotes/tags/v8)
57f526b472673e4b1895bcb342f4735bce38a91b
7a1ff141f77cf5c978a511405fddb9b26502ebf0
33d4434b5a80525cd8aec9d2aeb6094a0bb7f3d3
7086208af3729a53c8ace3d930e1a025844e963b
00df087a0b494d1418c357b24c2ebb164ba15526
8ffb85ee849fc3491ed7adac64c530632c6e02e6
c59e8805d460c1298fdbb328152c2ea2b59f6961
4d89cb8e4d9c468898c488004d5f37bfc8c601d7
93362430867c172be84a0e1141549fb6a878cb36
132431fd9795006d2991b2228876f67ffadd2bcc
4cc9b5fa51936fbbe3cf4fdc73ce45a5e97d8428
8c3df2befe9aeb94e09e692d220a135fa6c14d1e

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
r21 = a149ed411cf7f990a4a6ade65f21cc598a1ba173 (refs/remotes/New1)
A    b_one/New1
A    b_one/New1/a.file
Updated to revision 21.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/b_two/New2...
r22 = f9686ac1518b24b75989b02f2703ab0faed1ee07 (refs/remotes/New2)
A    b_two/New2
A    b_two/New2/a.file
Updated to revision 22.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/tags_A/Tag1...
r23 = ce3890555edb5065d37263c3d12f1babf4481a12 (refs/remotes/tags/Tag1)
A    tags_A/Tag1
A    tags_A/Tag1/a.file
Updated to revision 23.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/tags_B/Tag2...
r24 = ff8a2f357463634184ad09bd1ca2a59c7e0ef801 (refs/remotes/tags/Tag2)
A    tags_B/Tag2
A    tags_B/Tag2/a.file
Updated to revision 24.
ok 4 - create new branches and tags

# passed all 4 test(s)
1..4

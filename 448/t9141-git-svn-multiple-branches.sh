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
r1 = 7756e42184555f886bfbd566b84dbfcd0318ea7f (refs/remotes/trunk)
r2 = 9856104396f0c69cbd521501f833c6e6432a1ca3 (refs/remotes/first)
r3 = 540080ea2f47eda0c7eb661ce13ae55314cae79a (refs/remotes/tags/1.0)
	M	a.file
r4 = cdcc32d95a0a935b65ffb80f5c6e63eaf3b6682d (refs/remotes/trunk)
r5 = e3477dbbed7f7fb4bf55f72e0e7e457f5a899097 (refs/remotes/second)
r6 = e00dd338f468f00a1bd67ffd7a82db804d958774 (refs/remotes/tags/2.0)
	M	a.file
r7 = 1398d7c6d002c4af14b7976d6e808042041ea254 (refs/remotes/trunk)
r8 = c104f075b55e084739d343653393454eb859f70d (refs/remotes/1)
r9 = 2fbc136e084fe0311f86e3a6b2974dbbfc7dd39f (refs/remotes/tags/3.0)
	M	a.file
r10 = f6c5ad2758648ca9d9628dbdf8870411c2a7b41e (refs/remotes/trunk)
r11 = 948fb8ac0be67970ebdeb6e24f929758c9e649a3 (refs/remotes/2)
r12 = 8aea5e9b019da918ebe4b3ee8e699e51e3da6c92 (refs/remotes/tags/4.0)
	M	a.file
r13 = 65fc9591567afce4beba42174ad0779832ee77d9 (refs/remotes/first)
r14 = de94b1e4ef7e60adfcbcd56b609ee122e3f4d654 (refs/remotes/tags/v5)
	M	a.file
r15 = 82add24bdee93cc1d0f526621d1783a2fa953f5f (refs/remotes/second)
r16 = 408838f4a78c02cf17044f9132c6339e1b9d7ee5 (refs/remotes/tags/v6)
	M	a.file
r17 = 8435be7adadcc36fd8966aef3db4637f9dc063f7 (refs/remotes/1)
r18 = e8cd50ecd1ca45c7800515190336ccffc49dc078 (refs/remotes/tags/v7)
	M	a.file
r19 = b6bfb6f5826b0f08aa4da268827ec927ae88a8dc (refs/remotes/2)
r20 = 3c7cc25a3abc0545bd217b9263906b6e6bb2c829 (refs/remotes/tags/v8)
65fc9591567afce4beba42174ad0779832ee77d9
82add24bdee93cc1d0f526621d1783a2fa953f5f
8435be7adadcc36fd8966aef3db4637f9dc063f7
b6bfb6f5826b0f08aa4da268827ec927ae88a8dc
540080ea2f47eda0c7eb661ce13ae55314cae79a
e00dd338f468f00a1bd67ffd7a82db804d958774
2fbc136e084fe0311f86e3a6b2974dbbfc7dd39f
8aea5e9b019da918ebe4b3ee8e699e51e3da6c92
de94b1e4ef7e60adfcbcd56b609ee122e3f4d654
408838f4a78c02cf17044f9132c6339e1b9d7ee5
e8cd50ecd1ca45c7800515190336ccffc49dc078
3c7cc25a3abc0545bd217b9263906b6e6bb2c829

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
r21 = 33298f11c6af304ff92d93bbb26b18646637e650 (refs/remotes/New1)
A    b_one/New1
A    b_one/New1/a.file
Updated to revision 21.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/b_two/New2...
r22 = 2f00e3c86b5245ff9dab98505c523ddde5deaec2 (refs/remotes/New2)
A    b_two/New2
A    b_two/New2/a.file
Updated to revision 22.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/tags_A/Tag1...
r23 = 70cc6a82d1b8b17a5be7cfcaa872e5ce7fde4760 (refs/remotes/tags/Tag1)
A    tags_A/Tag1
A    tags_A/Tag1/a.file
Updated to revision 23.
Copying file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/trunk at r10 to file:///Users/trast/git-smoke/t/trash directory.t9141-git-svn-multiple-branches/svnrepo/project/tags_B/Tag2...
r24 = ce57ac799c7d5b9d2aaf55fe890fba300443de77 (refs/remotes/tags/Tag2)
A    tags_B/Tag2
A    tags_B/Tag2/a.file
Updated to revision 24.
ok 4 - create new branches and tags

# passed all 4 test(s)
1..4

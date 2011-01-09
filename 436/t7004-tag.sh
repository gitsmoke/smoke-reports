Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7004-tag/.git/
expecting success: 
	git tag -l &&
	git tag

ok 1 - listing all tags in an empty tree should succeed
expecting success: 
	test `git tag -l | wc -l` -eq 0 &&
	test `git tag | wc -l` -eq 0

ok 2 - listing all tags in an empty tree should output nothing

expecting success: ! (tag_exists mytag)

ok 3 - looking for a tag in an empty tree should fail

expecting success: 
	test_must_fail git tag mynotag &&
	! tag_exists mynotag


ok 4 - creating a tag in an empty tree should fail

expecting success: 
	test_must_fail git tag mytaghead HEAD &&
	! tag_exists mytaghead


ok 5 - creating a tag for HEAD in an empty tree should fail

expecting success: 
	test_must_fail git tag mytagnorev aaaaaaaaaaa &&
	! tag_exists mytagnorev


ok 6 - creating a tag for an unknown revision should fail

expecting success: 
	test_tick &&
	echo foo >foo &&
	git add foo &&
	git commit -m Foo &&
	git tag mytag
[master (root-commit) 86e17e4] Foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo

ok 7 - creating a tag using default HEAD should succeed

expecting success: 
	git tag -l &&
	git tag

mytag
mytag

ok 8 - listing all tags if one exists should succeed

expecting success: 
	test `git tag -l` = mytag &&
	test `git tag` = mytag

ok 9 - listing all tags if one exists should output that tag

expecting success: git tag -l mytag
mytag

ok 10 - listing a tag using a matching pattern should succeed

expecting success: test `git tag -l mytag` = mytag

ok 11 - listing a tag using a matching pattern should output that tag

expecting success: git tag -l xxx

ok 12 - listing tags using a non-matching pattern should suceed

expecting success: test `git tag -l xxx | wc -l` -eq 0

ok 13 - listing tags using a non-matching pattern should output nothing

expecting success: test_must_fail git tag mytag

ok 14 - trying to create a tag with the name of one existing should fail

expecting success: 
	test `git tag -l | wc -l` -eq 1 &&
	test_must_fail git tag "" &&
	test_must_fail git tag .othertag &&
	test_must_fail git tag "other tag" &&
	test_must_fail git tag "othertag^" &&
	test_must_fail git tag "other~tag" &&
	test `git tag -l | wc -l` -eq 1
ok 15 - trying to create a tag with a non-valid name should fail

expecting success: 
	git tag myhead HEAD &&
	tag_exists myhead

ok 16 - creating a tag using HEAD directly should succeed
expecting success: 
	! tag_exists unknown-tag &&
	test_must_fail git tag -d unknown-tag
ok 17 - trying to delete an unknown tag should fail
expecting success: 
	git tag -l > actual && test_cmp expect actual &&
	git tag -d &&
	git tag -l > actual && test_cmp expect actual

ok 18 - trying to delete tags without params should succeed and do nothing
expecting success: 
	tag_exists mytag &&
	tag_exists myhead &&
	git tag -d mytag myhead &&
	! tag_exists mytag &&
	! tag_exists myhead
Deleted tag 'mytag' (was 86e17e4)
Deleted tag 'myhead' (was 86e17e4)

ok 19 - deleting two existing tags in one command should succeed
expecting success: 
	! tag_exists mytag &&
	git tag mytag &&
	tag_exists mytag

ok 20 - creating a tag with the name of another deleted one should succeed
expecting success: 
	tag_exists mytag &&
	! tag_exists myhead &&
	test_must_fail git tag -d mytag anothertag &&
	! tag_exists mytag &&
	! tag_exists myhead
Deleted tag 'mytag' (was 86e17e4)
ok 21 - trying to delete two tags, existing and not, should fail in the 2nd

expecting success: test_must_fail git tag -d mytag
ok 22 - trying to delete an already deleted tag should fail
expecting success: 
	git tag v1.0.1 &&
	git tag t211 &&
	git tag aa1 &&
	git tag v0.2.1 &&
	git tag v1.1.3 &&
	git tag cba &&
	git tag a1 &&
	git tag v1.0 &&
	git tag t210 &&
	git tag -l > actual &&
	test_cmp expect actual &&
	git tag > actual &&
	test_cmp expect actual

ok 23 - listing all tags should print them ordered

expecting success: 
	rm *a* &&
	git tag -l "*a*" > current &&
	test_cmp expect current


ok 24 - listing tags with substring as pattern must print those matching

expecting success: 
	git tag -l "*.1" > actual &&
	test_cmp expect actual


ok 25 - listing tags with a suffix as pattern must print those matching

expecting success: 
	git tag -l "t21*" > actual &&
	test_cmp expect actual


ok 26 - listing tags with a prefix as pattern must print those matching

expecting success: 
	git tag -l a1 > actual &&
	test_cmp expect actual


ok 27 - listing tags using a name as pattern must print that one matching

expecting success: 
	git tag -l v1.0 > actual &&
	test_cmp expect actual


ok 28 - listing tags using a name as pattern must print that one matching

expecting success: 
	git tag -l "v1.?.?" > actual &&
	test_cmp expect actual


ok 29 - listing tags with ? in the pattern should print those matching

expecting success: 
	git tag -l "v.*" > actual &&
	test_cmp expect actual


ok 30 - listing tags using v.* should print nothing because none have v.

expecting success: 
	git tag -l "v*" > actual &&
	test_cmp expect actual


ok 31 - listing tags using v* should print only those having v

expecting success: 
	git tag non-annotated-tag &&
	test $(git cat-file -t non-annotated-tag) = commit &&
	test $(git rev-parse non-annotated-tag) = $(git rev-parse HEAD)


ok 32 - a non-annotated tag created without parameters should point to HEAD

expecting success: test_must_fail git tag -v unknown-tag

ok 33 - trying to verify an unknown tag should fail

expecting success: test_must_fail git tag -v non-annotated-tag

ok 34 - trying to verify a non-annotated and non-signed tag should fail

expecting success: test_must_fail git tag -v unknown-tag1 non-annotated-tag unknown-tag2

ok 35 - trying to verify many non-annotated or unknown tags, should fail

expecting success: 
	git tag -m "A message" annotated-tag &&
	get_tag_msg annotated-tag >actual &&
	test_cmp expect actual


ok 36 - creating an annotated tag with -m message should succeed

expecting success: 
	git tag -F msgfile file-annotated-tag &&
	get_tag_msg file-annotated-tag >actual &&
	test_cmp expect actual


ok 37 - creating an annotated tag with -F messagefile should succeed

expecting success: 
	git tag -F - stdin-annotated-tag <inputmsg &&
	get_tag_msg stdin-annotated-tag >actual &&
	test_cmp expect actual


ok 38 - creating an annotated tag with -F - should succeed

expecting success: 
	! test -f nonexistingfile &&
	! tag_exists notag &&
	test_must_fail git tag -F nonexistingfile notag &&
	! tag_exists notag


ok 39 - trying to create a tag with a non-existing -F file should fail

expecting success: 
	echo "message file 1" >msgfile1 &&
	echo "message file 2" >msgfile2 &&
	! tag_exists msgtag &&
	test_must_fail git tag -m "message 1" -F msgfile1 msgtag &&
	! tag_exists msgtag &&
	test_must_fail git tag -F msgfile1 -m "message 1" msgtag &&
	! tag_exists msgtag &&
	test_must_fail git tag -m "message 1" -F msgfile1 \
		-m "message 2" msgtag &&
	! tag_exists msgtag


ok 40 - trying to create tags giving both -m or -F options should fail

expecting success: 
	git tag -m "" empty-annotated-tag &&
	get_tag_msg empty-annotated-tag >actual &&
	test_cmp expect actual


ok 41 - creating a tag with an empty -m message should succeed

expecting success: 
	git tag -F emptyfile emptyfile-annotated-tag &&
	get_tag_msg emptyfile-annotated-tag >actual &&
	test_cmp expect actual


ok 42 - creating a tag with an empty -F messagefile should succeed
expecting success: 
	git tag -F blanksfile blanks-annotated-tag &&
	get_tag_msg blanks-annotated-tag >actual &&
	test_cmp expect actual


ok 43 - extra blanks in the message for an annotated tag should be removed

expecting success: 
	git tag -m "     " blank-annotated-tag &&
	get_tag_msg blank-annotated-tag >actual &&
	test_cmp expect actual


ok 44 - creating a tag with blank -m message with spaces should succeed
expecting success: 
	git tag -F blankfile blankfile-annotated-tag &&
	get_tag_msg blankfile-annotated-tag >actual &&
	test_cmp expect actual
ok 45 - creating a tag with blank -F messagefile with spaces should succeed
expecting success: 
	git tag -F blanknonlfile blanknonlfile-annotated-tag &&
	get_tag_msg blanknonlfile-annotated-tag >actual &&
	test_cmp expect actual

ok 46 - creating a tag with -F file of spaces and no newline should succeed

expecting success: 
	git tag -F commentsfile comments-annotated-tag &&
	get_tag_msg comments-annotated-tag >actual &&
	test_cmp expect actual


ok 47 - creating a tag using a -F messagefile with #comments should succeed

expecting success: 
	git tag -m "#comment" comment-annotated-tag &&
	get_tag_msg comment-annotated-tag >actual &&
	test_cmp expect actual

ok 48 - creating a tag with a #comment in the -m message should succeed

expecting success: 
	git tag -F commentfile commentfile-annotated-tag &&
	get_tag_msg commentfile-annotated-tag >actual &&
	test_cmp expect actual

ok 49 - creating a tag with #comments in the -F messagefile should succeed
expecting success: 
	git tag -F commentnonlfile commentnonlfile-annotated-tag &&
	get_tag_msg commentnonlfile-annotated-tag >actual &&
	test_cmp expect actual


ok 50 - creating a tag with a file of #comment and no newline should succeed

expecting success: 
	git tag -m "A msg" tag-one-line &&

	echo "tag-one-line" >expect &&
	git tag -l | grep "^tag-one-line" >actual &&
	test_cmp expect actual &&
	git tag -n0 -l | grep "^tag-one-line" >actual &&
	test_cmp expect actual &&
	git tag -n0 -l tag-one-line >actual &&
	test_cmp expect actual &&

	echo "tag-one-line    A msg" >expect &&
	git tag -n1 -l | grep "^tag-one-line" >actual &&
	test_cmp expect actual &&
	git tag -n -l | grep "^tag-one-line" >actual &&
	test_cmp expect actual &&
	git tag -n1 -l tag-one-line >actual &&
	test_cmp expect actual &&
	git tag -n2 -l tag-one-line >actual &&
	test_cmp expect actual &&
	git tag -n999 -l tag-one-line >actual &&
	test_cmp expect actual


ok 51 - listing the one-line message of a non-signed tag should succeed

expecting success: 
	git tag -m "" tag-zero-lines &&

	echo "tag-zero-lines" >expect &&
	git tag -l | grep "^tag-zero-lines" >actual &&
	test_cmp expect actual &&
	git tag -n0 -l | grep "^tag-zero-lines" >actual &&
	test_cmp expect actual &&
	git tag -n0 -l tag-zero-lines >actual &&
	test_cmp expect actual &&

	echo "tag-zero-lines  " >expect &&
	git tag -n1 -l | grep "^tag-zero-lines" >actual &&
	test_cmp expect actual &&
	git tag -n -l | grep "^tag-zero-lines" >actual &&
	test_cmp expect actual &&
	git tag -n1 -l tag-zero-lines >actual &&
	test_cmp expect actual &&
	git tag -n2 -l tag-zero-lines >actual &&
	test_cmp expect actual &&
	git tag -n999 -l tag-zero-lines >actual &&
	test_cmp expect actual


ok 52 - listing the zero-lines message of a non-signed tag should succeed

expecting success: 
	git tag -F annotagmsg tag-lines &&

	echo "tag-lines" >expect &&
	git tag -l | grep "^tag-lines" >actual &&
	test_cmp expect actual &&
	git tag -n0 -l | grep "^tag-lines" >actual &&
	test_cmp expect actual &&
	git tag -n0 -l tag-lines >actual &&
	test_cmp expect actual &&

	echo "tag-lines       tag line one" >expect &&
	git tag -n1 -l | grep "^tag-lines" >actual &&
	test_cmp expect actual &&
	git tag -n -l | grep "^tag-lines" >actual &&
	test_cmp expect actual &&
	git tag -n1 -l tag-lines >actual &&
	test_cmp expect actual &&

	echo "    tag line two" >>expect &&
	git tag -n2 -l | grep "^ *tag.line" >actual &&
	test_cmp expect actual &&
	git tag -n2 -l tag-lines >actual &&
	test_cmp expect actual &&

	echo "    tag line three" >>expect &&
	git tag -n3 -l | grep "^ *tag.line" >actual &&
	test_cmp expect actual &&
	git tag -n3 -l tag-lines >actual &&
	test_cmp expect actual &&
	git tag -n4 -l | grep "^ *tag.line" >actual &&
	test_cmp expect actual &&
	git tag -n4 -l tag-lines >actual &&
	test_cmp expect actual &&
	git tag -n99 -l | grep "^ *tag.line" >actual &&
	test_cmp expect actual &&
	git tag -n99 -l tag-lines >actual &&
	test_cmp expect actual

ok 53 - listing many message lines of a non-signed tag should succeed

# gpg not found - skipping tag signing and verification tests
skipping test: trying to verify an annotated non-signed tag should fail 
	tag_exists annotated-tag &&
	test_must_fail git tag -v annotated-tag

ok 54 # skip trying to verify an annotated non-signed tag should fail (missing GPG)

skipping test: trying to verify a file-annotated non-signed tag should fail 
	tag_exists file-annotated-tag &&
	test_must_fail git tag -v file-annotated-tag

ok 55 # skip trying to verify a file-annotated non-signed tag should fail (missing GPG)

skipping test: trying to verify two annotated non-signed tags should fail 
	tag_exists annotated-tag file-annotated-tag &&
	test_must_fail git tag -v annotated-tag file-annotated-tag

ok 56 # skip trying to verify two annotated non-signed tags should fail (missing GPG)

skipping test: creating a signed tag with -m message should succeed 
	git tag -s -m "A signed tag message" signed-tag &&
	get_tag_msg signed-tag >actual &&
	test_cmp expect actual

ok 57 # skip creating a signed tag with -m message should succeed (missing GPG)

skipping test: sign with a given key id 

	git tag -u committer@example.com -m "Another message" u-signed-tag &&
	get_tag_msg u-signed-tag >actual &&
	test_cmp expect actual


ok 58 # skip sign with a given key id (missing GPG)

skipping test: sign with an unknown id (1) 

	test_must_fail git tag -u author@example.com \
		-m "Another message" o-signed-tag


ok 59 # skip sign with an unknown id (1) (missing GPG)

skipping test: sign with an unknown id (2) 

	test_must_fail git tag -u DEADBEEF -m "Another message" o-signed-tag


ok 60 # skip sign with an unknown id (2) (missing GPG)
skipping test: -u implies signed tag 
	GIT_EDITOR=./fakeeditor git tag -u CDDE430D implied-sign &&
	get_tag_msg implied-sign >actual &&
	test_cmp expect actual

ok 61 # skip -u implies signed tag (missing GPG)

skipping test: creating a signed tag with -F messagefile should succeed 
	git tag -s -F sigmsgfile file-signed-tag &&
	get_tag_msg file-signed-tag >actual &&
	test_cmp expect actual

ok 62 # skip creating a signed tag with -F messagefile should succeed (missing GPG)

skipping test: creating a signed tag with -F - should succeed 
	git tag -s -F - stdin-signed-tag <siginputmsg &&
	get_tag_msg stdin-signed-tag >actual &&
	test_cmp expect actual

ok 63 # skip creating a signed tag with -F - should succeed (missing GPG)

skipping test: -s implies annotated tag 
	GIT_EDITOR=./fakeeditor git tag -s implied-annotate &&
	get_tag_msg implied-annotate >actual &&
	test_cmp expect actual

ok 64 # skip -s implies annotated tag (missing GPG)

skipping test: trying to create a signed tag with non-existing -F file should fail 
	! test -f nonexistingfile &&
	! tag_exists nosigtag &&
	test_must_fail git tag -s -F nonexistingfile nosigtag &&
	! tag_exists nosigtag

ok 65 # skip trying to create a signed tag with non-existing -F file should fail (missing GPG)

skipping test: verifying a signed tag should succeed git tag -v signed-tag
ok 66 # skip verifying a signed tag should succeed (missing GPG)

skipping test: verifying two signed tags in one command should succeed git tag -v signed-tag file-signed-tag
ok 67 # skip verifying two signed tags in one command should succeed (missing GPG)

skipping test: verifying many signed and non-signed tags should fail 
	test_must_fail git tag -v signed-tag annotated-tag &&
	test_must_fail git tag -v file-annotated-tag file-signed-tag &&
	test_must_fail git tag -v annotated-tag \
		file-signed-tag file-annotated-tag &&
	test_must_fail git tag -v signed-tag annotated-tag file-signed-tag

ok 68 # skip verifying many signed and non-signed tags should fail (missing GPG)

skipping test: verifying a forged tag should fail 
	forged=$(git cat-file tag signed-tag |
		sed -e "s/signed-tag/forged-tag/" |
		git mktag) &&
	git tag forged-tag $forged &&
	test_must_fail git tag -v forged-tag

ok 69 # skip verifying a forged tag should fail (missing GPG)

skipping test: creating a signed tag with an empty -m message should succeed 
	git tag -s -m "" empty-signed-tag &&
	get_tag_msg empty-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -v empty-signed-tag

ok 70 # skip creating a signed tag with an empty -m message should succeed (missing GPG)

skipping test: creating a signed tag with an empty -F messagefile should succeed 
	git tag -s -F sigemptyfile emptyfile-signed-tag &&
	get_tag_msg emptyfile-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -v emptyfile-signed-tag

ok 71 # skip creating a signed tag with an empty -F messagefile should succeed (missing GPG)

skipping test: extra blanks in the message for a signed tag should be removed 
	git tag -s -F sigblanksfile blanks-signed-tag &&
	get_tag_msg blanks-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -v blanks-signed-tag

ok 72 # skip extra blanks in the message for a signed tag should be removed (missing GPG)

skipping test: creating a signed tag with a blank -m message should succeed 
	git tag -s -m "     " blank-signed-tag &&
	get_tag_msg blank-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -v blank-signed-tag

ok 73 # skip creating a signed tag with a blank -m message should succeed (missing GPG)

skipping test: creating a signed tag with blank -F file with spaces should succeed 
	git tag -s -F sigblankfile blankfile-signed-tag &&
	get_tag_msg blankfile-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -v blankfile-signed-tag

ok 74 # skip creating a signed tag with blank -F file with spaces should succeed (missing GPG)

skipping test: creating a signed tag with spaces and no newline should succeed 
	git tag -s -F sigblanknonlfile blanknonlfile-signed-tag &&
	get_tag_msg blanknonlfile-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -v signed-tag

ok 75 # skip creating a signed tag with spaces and no newline should succeed (missing GPG)

skipping test: creating a signed tag with a -F file with #comments should succeed 
	git tag -s -F sigcommentsfile comments-signed-tag &&
	get_tag_msg comments-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -v comments-signed-tag

ok 76 # skip creating a signed tag with a -F file with #comments should succeed (missing GPG)

skipping test: creating a signed tag with #commented -m message should succeed 
	git tag -s -m "#comment" comment-signed-tag &&
	get_tag_msg comment-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -v comment-signed-tag

ok 77 # skip creating a signed tag with #commented -m message should succeed (missing GPG)

skipping test: creating a signed tag with #commented -F messagefile should succeed 
	git tag -s -F sigcommentfile commentfile-signed-tag &&
	get_tag_msg commentfile-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -v commentfile-signed-tag

ok 78 # skip creating a signed tag with #commented -F messagefile should succeed (missing GPG)

skipping test: creating a signed tag with a #comment and no newline should succeed 
	git tag -s -F sigcommentnonlfile commentnonlfile-signed-tag &&
	get_tag_msg commentnonlfile-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -v commentnonlfile-signed-tag

ok 79 # skip creating a signed tag with a #comment and no newline should succeed (missing GPG)

skipping test: listing the one-line message of a signed tag should succeed 
	git tag -s -m "A message line signed" stag-one-line &&

	echo "stag-one-line" >expect &&
	git tag -l | grep "^stag-one-line" >actual &&
	test_cmp expect actual &&
	git tag -n0 -l | grep "^stag-one-line" >actual &&
	test_cmp expect actual &&
	git tag -n0 -l stag-one-line >actual &&
	test_cmp expect actual &&

	echo "stag-one-line   A message line signed" >expect &&
	git tag -n1 -l | grep "^stag-one-line" >actual &&
	test_cmp expect actual &&
	git tag -n -l | grep "^stag-one-line" >actual &&
	test_cmp expect actual &&
	git tag -n1 -l stag-one-line >actual &&
	test_cmp expect actual &&
	git tag -n2 -l stag-one-line >actual &&
	test_cmp expect actual &&
	git tag -n999 -l stag-one-line >actual &&
	test_cmp expect actual

ok 80 # skip listing the one-line message of a signed tag should succeed (missing GPG)

skipping test: listing the zero-lines message of a signed tag should succeed 
	git tag -s -m "" stag-zero-lines &&

	echo "stag-zero-lines" >expect &&
	git tag -l | grep "^stag-zero-lines" >actual &&
	test_cmp expect actual &&
	git tag -n0 -l | grep "^stag-zero-lines" >actual &&
	test_cmp expect actual &&
	git tag -n0 -l stag-zero-lines >actual &&
	test_cmp expect actual &&

	echo "stag-zero-lines " >expect &&
	git tag -n1 -l | grep "^stag-zero-lines" >actual &&
	test_cmp expect actual &&
	git tag -n -l | grep "^stag-zero-lines" >actual &&
	test_cmp expect actual &&
	git tag -n1 -l stag-zero-lines >actual &&
	test_cmp expect actual &&
	git tag -n2 -l stag-zero-lines >actual &&
	test_cmp expect actual &&
	git tag -n999 -l stag-zero-lines >actual &&
	test_cmp expect actual

ok 81 # skip listing the zero-lines message of a signed tag should succeed (missing GPG)

skipping test: listing many message lines of a signed tag should succeed 
	git tag -s -F sigtagmsg stag-lines &&

	echo "stag-lines" >expect &&
	git tag -l | grep "^stag-lines" >actual &&
	test_cmp expect actual &&
	git tag -n0 -l | grep "^stag-lines" >actual &&
	test_cmp expect actual &&
	git tag -n0 -l stag-lines >actual &&
	test_cmp expect actual &&

	echo "stag-lines      stag line one" >expect &&
	git tag -n1 -l | grep "^stag-lines" >actual &&
	test_cmp expect actual &&
	git tag -n -l | grep "^stag-lines" >actual &&
	test_cmp expect actual &&
	git tag -n1 -l stag-lines >actual &&
	test_cmp expect actual &&

	echo "    stag line two" >>expect &&
	git tag -n2 -l | grep "^ *stag.line" >actual &&
	test_cmp expect actual &&
	git tag -n2 -l stag-lines >actual &&
	test_cmp expect actual &&

	echo "    stag line three" >>expect &&
	git tag -n3 -l | grep "^ *stag.line" >actual &&
	test_cmp expect actual &&
	git tag -n3 -l stag-lines >actual &&
	test_cmp expect actual &&
	git tag -n4 -l | grep "^ *stag.line" >actual &&
	test_cmp expect actual &&
	git tag -n4 -l stag-lines >actual &&
	test_cmp expect actual &&
	git tag -n99 -l | grep "^ *stag.line" >actual &&
	test_cmp expect actual &&
	git tag -n99 -l stag-lines >actual &&
	test_cmp expect actual

ok 82 # skip listing many message lines of a signed tag should succeed (missing GPG)

skipping test: creating a signed tag pointing to a tree should succeed 
	git tag -s -m "A message for a tree" tree-signed-tag HEAD^{tree} &&
	get_tag_msg tree-signed-tag >actual &&
	test_cmp expect actual

ok 83 # skip creating a signed tag pointing to a tree should succeed (missing GPG)

skipping test: creating a signed tag pointing to a blob should succeed 
	git tag -s -m "A message for a blob" blob-signed-tag HEAD:foo &&
	get_tag_msg blob-signed-tag >actual &&
	test_cmp expect actual

ok 84 # skip creating a signed tag pointing to a blob should succeed (missing GPG)

skipping test: creating a signed tag pointing to another tag should succeed 
	git tag -s -m "A message for another tag" tag-signed-tag signed-tag &&
	get_tag_msg tag-signed-tag >actual &&
	test_cmp expect actual

ok 85 # skip creating a signed tag pointing to another tag should succeed (missing GPG)

skipping test: creating a signed tag with rfc1991 
	git tag -s -m "RFC1991 signed tag" rfc1991-signed-tag $commit &&
	get_tag_msg rfc1991-signed-tag >actual &&
	test_cmp expect actual

ok 86 # skip creating a signed tag with rfc1991 (missing GPG)

skipping test: reediting a signed tag body omits signature 
	echo "RFC1991 signed tag" >expect &&
	GIT_EDITOR=./fakeeditor git tag -f -s rfc1991-signed-tag $commit &&
	test_cmp expect actual

ok 87 # skip reediting a signed tag body omits signature (missing GPG)

skipping test: verifying rfc1991 signature 
	git tag -v rfc1991-signed-tag

ok 88 # skip verifying rfc1991 signature (missing GPG)

skipping test: list tag with rfc1991 signature 
	echo "rfc1991-signed-tag RFC1991 signed tag" >expect &&
	git tag -l -n1 rfc1991-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -l -n2 rfc1991-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -l -n999 rfc1991-signed-tag >actual &&
	test_cmp expect actual

ok 89 # skip list tag with rfc1991 signature (missing GPG)

skipping test: verifying rfc1991 signature without --rfc1991 
	git tag -v rfc1991-signed-tag

ok 90 # skip verifying rfc1991 signature without --rfc1991 (missing GPG)

skipping test: list tag with rfc1991 signature without --rfc1991 
	echo "rfc1991-signed-tag RFC1991 signed tag" >expect &&
	git tag -l -n1 rfc1991-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -l -n2 rfc1991-signed-tag >actual &&
	test_cmp expect actual &&
	git tag -l -n999 rfc1991-signed-tag >actual &&
	test_cmp expect actual

ok 91 # skip list tag with rfc1991 signature without --rfc1991 (missing GPG)

skipping test: reediting a signed tag body omits signature 
	echo "RFC1991 signed tag" >expect &&
	GIT_EDITOR=./fakeeditor git tag -f -s rfc1991-signed-tag $commit &&
	test_cmp expect actual

ok 92 # skip reediting a signed tag body omits signature (missing GPG)

skipping test: git tag -s fails if gpg is misconfigured test_must_fail git tag -s -m tail tag-gpg-failure
ok 93 # skip git tag -s fails if gpg is misconfigured (missing GPG)

skipping test: verify signed tag fails when public key is not present test_must_fail git tag -v signed-tag
ok 94 # skip verify signed tag fails when public key is not present (missing GPG)

expecting success: 
	! (GIT_EDITOR=cat git tag -a initial-comment)


#
# Write a tag message
#

ok 95 - git tag -a fails if tag annotation is empty

expecting success: 
	! (GIT_EDITOR=cat git tag -a initial-comment > actual)

ok 96 - message in editor has initial comment

expecting success: 
	# check the first line --- should be empty
	echo >first.expect &&
	sed -e 1q <actual >first.actual &&
	test_cmp first.expect first.actual


ok 97 - message in editor has initial comment: first line

expecting success: 
	# remove commented lines from the remainder -- should be empty
	>rest.expect
	sed -e 1d -e /^#/d <actual >rest.actual &&
	test_cmp rest.expect rest.actual


ok 98 - message in editor has initial comment: remainder

expecting success: 
	git tag -a -m "An annotation to be reused" reuse &&
	GIT_EDITOR=true git tag -f -a reuse &&
	get_tag_msg reuse >actual &&
	test_cmp expect actual

ok 99 - overwriting an annoted tag should use its previous body

expecting success: 
	mkdir subdir &&
	echo "Tag message in top directory" >msgfile-5 &&
	echo "Tag message in sub directory" >subdir/msgfile-5 &&
	(
		cd subdir &&
		git tag -a -F msgfile-5 tag-from-subdir
	) &&
	git cat-file tag tag-from-subdir | grep "in sub directory"
Tag message in sub directory

ok 100 - filename for the message is relative to cwd

expecting success: 
	echo "Tag message in sub directory" >subdir/msgfile-6 &&
	(
		cd subdir &&
		git tag -a -F msgfile-6 tag-from-subdir-2
	) &&
	git cat-file tag tag-from-subdir-2 | grep "in sub directory"

Tag message in sub directory

ok 101 - filename for the message is relative to cwd
expecting success: 
	echo foo-2.0 >foo &&
	git add foo &&
	git commit -m second &&
	git tag v2.0

[master d3200cb] second
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 102 - creating second commit and tag

expecting success: 
	echo foo-dev >foo &&
	git add foo &&
	git commit -m third

[master c282771] third
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 103 - creating third commit without tag

expecting success: 
	git tag -l --contains 86e17e4ed4cddf9a4f960da789f8378f6ea1ff2b v* >actual &&
	test_cmp expected actual


ok 104 - checking that first commit is in all tags (hash)

expecting success: 
	git tag -l --contains v1.0 v* >actual &&
	test_cmp expected actual


ok 105 - checking that first commit is in all tags (tag)

expecting success: 
	git tag -l --contains HEAD~2 v* >actual &&
	test_cmp expected actual


ok 106 - checking that first commit is in all tags (relative)

expecting success: 
	git tag -l --contains d3200cb2a2a0c653d5ddeedfef2b94eba9226013 v* >actual &&
	test_cmp expected actual


ok 107 - checking that second commit only has one tag

expecting success: 
	git tag -l --contains c282771867dd40cef6c1f87644fce5e5bc6b13ad v* >actual &&
	test_cmp expected actual


ok 108 - checking that third commit has no tags

expecting success: 
	git branch stable v2.0 &&
        git checkout stable &&
	echo foo-3.0 > foo &&
	git commit foo -m fourth &&
	git tag v3.0

[stable 820ea75] fourth
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 109 - creating simple branch

expecting success: 
	git tag -l --contains 820ea75a3bc5b6aafd076dbee5f2daa3dea70df9 v* >actual &&
	test_cmp expected actual


ok 110 - checking that branch head only has one tag

expecting success: 
	git merge --strategy=ours master &&
        git tag v4.0

Merge made by ours.

ok 111 - merging original branch into this branch

expecting success: 
	git tag -l --contains c282771867dd40cef6c1f87644fce5e5bc6b13ad v* >actual &&
	test_cmp expected actual


ok 112 - checking that original branch head has one tag now

expecting success: 
	git tag -l --contains 86e17e4ed4cddf9a4f960da789f8378f6ea1ff2b v* >actual &&
	test_cmp expected actual


ok 113 - checking that initial commit is in all tags

expecting success: 
	test_must_fail git tag -a &&
	test_must_fail git tag -l -v &&
	test_must_fail git tag -n 100 &&
	test_must_fail git tag -l -m msg &&
	test_must_fail git tag -l -F some file &&
	test_must_fail git tag -v -s


ok 114 - mixing incompatibles modes and options is forbidden

# passed all 114 test(s)
1..114

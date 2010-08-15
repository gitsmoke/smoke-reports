ok 1 - listing all tags in an empty tree should succeed
ok 2 - listing all tags in an empty tree should output nothing
ok 3 - looking for a tag in an empty tree should fail
ok 4 - creating a tag in an empty tree should fail
ok 5 - creating a tag for HEAD in an empty tree should fail
ok 6 - creating a tag for an unknown revision should fail
ok 7 - creating a tag using default HEAD should succeed
ok 8 - listing all tags if one exists should succeed
ok 9 - listing all tags if one exists should output that tag
ok 10 - listing a tag using a matching pattern should succeed
ok 11 - listing a tag using a matching pattern should output that tag
ok 12 - listing tags using a non-matching pattern should suceed
ok 13 - listing tags using a non-matching pattern should output nothing
ok 14 - trying to create a tag with the name of one existing should fail
ok 15 - trying to create a tag with a non-valid name should fail
ok 16 - creating a tag using HEAD directly should succeed
ok 17 - trying to delete an unknown tag should fail
ok 18 - trying to delete tags without params should succeed and do nothing
ok 19 - deleting two existing tags in one command should succeed
ok 20 - creating a tag with the name of another deleted one should succeed
ok 21 - trying to delete two tags, existing and not, should fail in the 2nd
ok 22 - trying to delete an already deleted tag should fail
ok 23 - listing all tags should print them ordered
ok 24 - listing tags with substring as pattern must print those matching
ok 25 - listing tags with a suffix as pattern must print those matching
ok 26 - listing tags with a prefix as pattern must print those matching
ok 27 - listing tags using a name as pattern must print that one matching
ok 28 - listing tags using a name as pattern must print that one matching
ok 29 - listing tags with ? in the pattern should print those matching
ok 30 - listing tags using v.* should print nothing because none have v.
ok 31 - listing tags using v* should print only those having v
ok 32 - a non-annotated tag created without parameters should point to HEAD
ok 33 - trying to verify an unknown tag should fail
ok 34 - trying to verify a non-annotated and non-signed tag should fail
ok 35 - trying to verify many non-annotated or unknown tags, should fail
ok 36 - creating an annotated tag with -m message should succeed
ok 37 - creating an annotated tag with -F messagefile should succeed
ok 38 - creating an annotated tag with -F - should succeed
ok 39 - trying to create a tag with a non-existing -F file should fail
ok 40 - trying to create tags giving both -m or -F options should fail
ok 41 - creating a tag with an empty -m message should succeed
ok 42 - creating a tag with an empty -F messagefile should succeed
ok 43 - extra blanks in the message for an annotated tag should be removed
ok 44 - creating a tag with blank -m message with spaces should succeed
ok 45 - creating a tag with blank -F messagefile with spaces should succeed
ok 46 - creating a tag with -F file of spaces and no newline should succeed
ok 47 - creating a tag using a -F messagefile with #comments should succeed
ok 48 - creating a tag with a #comment in the -m message should succeed
ok 49 - creating a tag with #comments in the -F messagefile should succeed
ok 50 - creating a tag with a file of #comment and no newline should succeed
ok 51 - listing the one-line message of a non-signed tag should succeed
ok 52 - listing the zero-lines message of a non-signed tag should succeed
ok 53 - listing many message lines of a non-signed tag should succeed
ok 54 - trying to verify an annotated non-signed tag should fail
ok 55 - trying to verify a file-annotated non-signed tag should fail
ok 56 - trying to verify two annotated non-signed tags should fail
not ok - 57 creating a signed tag with -m message should succeed
#	
#		git tag -s -m "A signed tag message" signed-tag &&
#		get_tag_msg signed-tag >actual &&
#		test_cmp expect actual
#	
not ok - 58 sign with a given key id
#	
#	
#		git tag -u committer@example.com -m "Another message" u-signed-tag &&
#		get_tag_msg u-signed-tag >actual &&
#		test_cmp expect actual
#	
#	
ok 59 - sign with an unknown id (1)
ok 60 - sign with an unknown id (2)
not ok - 61 -u implies signed tag
#	
#		GIT_EDITOR=./fakeeditor git tag -u CDDE430D implied-sign &&
#		get_tag_msg implied-sign >actual &&
#		test_cmp expect actual
#	
not ok - 62 creating a signed tag with -F messagefile should succeed
#	
#		git tag -s -F sigmsgfile file-signed-tag &&
#		get_tag_msg file-signed-tag >actual &&
#		test_cmp expect actual
#	
not ok - 63 creating a signed tag with -F - should succeed
#	
#		git tag -s -F - stdin-signed-tag <siginputmsg &&
#		get_tag_msg stdin-signed-tag >actual &&
#		test_cmp expect actual
#	
not ok - 64 -s implies annotated tag
#	
#		GIT_EDITOR=./fakeeditor git tag -s implied-annotate &&
#		get_tag_msg implied-annotate >actual &&
#		test_cmp expect actual
#	
ok 65 - trying to create a signed tag with non-existing -F file should fail
not ok - 66 verifying a signed tag should succeed
#	git tag -v signed-tag
not ok - 67 verifying two signed tags in one command should succeed
#	git tag -v signed-tag file-signed-tag
ok 68 - verifying many signed and non-signed tags should fail
not ok - 69 verifying a forged tag should fail
#	
#		forged=$(git cat-file tag signed-tag |
#			sed -e "s/signed-tag/forged-tag/" |
#			git mktag) &&
#		git tag forged-tag $forged &&
#		test_must_fail git tag -v forged-tag
#	
not ok - 70 creating a signed tag with an empty -m message should succeed
#	
#		git tag -s -m "" empty-signed-tag &&
#		get_tag_msg empty-signed-tag >actual &&
#		test_cmp expect actual &&
#		git tag -v empty-signed-tag
#	
not ok - 71 creating a signed tag with an empty -F messagefile should succeed
#	
#		git tag -s -F sigemptyfile emptyfile-signed-tag &&
#		get_tag_msg emptyfile-signed-tag >actual &&
#		test_cmp expect actual &&
#		git tag -v emptyfile-signed-tag
#	
not ok - 72 extra blanks in the message for a signed tag should be removed
#	
#		git tag -s -F sigblanksfile blanks-signed-tag &&
#		get_tag_msg blanks-signed-tag >actual &&
#		test_cmp expect actual &&
#		git tag -v blanks-signed-tag
#	
not ok - 73 creating a signed tag with a blank -m message should succeed
#	
#		git tag -s -m "     " blank-signed-tag &&
#		get_tag_msg blank-signed-tag >actual &&
#		test_cmp expect actual &&
#		git tag -v blank-signed-tag
#	
not ok - 74 creating a signed tag with blank -F file with spaces should succeed
#	
#		git tag -s -F sigblankfile blankfile-signed-tag &&
#		get_tag_msg blankfile-signed-tag >actual &&
#		test_cmp expect actual &&
#		git tag -v blankfile-signed-tag
#	
not ok - 75 creating a signed tag with spaces and no newline should succeed
#	
#		git tag -s -F sigblanknonlfile blanknonlfile-signed-tag &&
#		get_tag_msg blanknonlfile-signed-tag >actual &&
#		test_cmp expect actual &&
#		git tag -v signed-tag
#	
not ok - 76 creating a signed tag with a -F file with #comments should succeed
#	
#		git tag -s -F sigcommentsfile comments-signed-tag &&
#		get_tag_msg comments-signed-tag >actual &&
#		test_cmp expect actual &&
#		git tag -v comments-signed-tag
#	
not ok - 77 creating a signed tag with #commented -m message should succeed
#	
#		git tag -s -m "#comment" comment-signed-tag &&
#		get_tag_msg comment-signed-tag >actual &&
#		test_cmp expect actual &&
#		git tag -v comment-signed-tag
#	
not ok - 78 creating a signed tag with #commented -F messagefile should succeed
#	
#		git tag -s -F sigcommentfile commentfile-signed-tag &&
#		get_tag_msg commentfile-signed-tag >actual &&
#		test_cmp expect actual &&
#		git tag -v commentfile-signed-tag
#	
not ok - 79 creating a signed tag with a #comment and no newline should succeed
#	
#		git tag -s -F sigcommentnonlfile commentnonlfile-signed-tag &&
#		get_tag_msg commentnonlfile-signed-tag >actual &&
#		test_cmp expect actual &&
#		git tag -v commentnonlfile-signed-tag
#	
not ok - 80 listing the one-line message of a signed tag should succeed
#	
#		git tag -s -m "A message line signed" stag-one-line &&
#	
#		echo "stag-one-line" >expect &&
#		git tag -l | grep "^stag-one-line" >actual &&
#		test_cmp expect actual &&
#		git tag -n0 -l | grep "^stag-one-line" >actual &&
#		test_cmp expect actual &&
#		git tag -n0 -l stag-one-line >actual &&
#		test_cmp expect actual &&
#	
#		echo "stag-one-line   A message line signed" >expect &&
#		git tag -n1 -l | grep "^stag-one-line" >actual &&
#		test_cmp expect actual &&
#		git tag -n -l | grep "^stag-one-line" >actual &&
#		test_cmp expect actual &&
#		git tag -n1 -l stag-one-line >actual &&
#		test_cmp expect actual &&
#		git tag -n2 -l stag-one-line >actual &&
#		test_cmp expect actual &&
#		git tag -n999 -l stag-one-line >actual &&
#		test_cmp expect actual
#	
not ok - 81 listing the zero-lines message of a signed tag should succeed
#	
#		git tag -s -m "" stag-zero-lines &&
#	
#		echo "stag-zero-lines" >expect &&
#		git tag -l | grep "^stag-zero-lines" >actual &&
#		test_cmp expect actual &&
#		git tag -n0 -l | grep "^stag-zero-lines" >actual &&
#		test_cmp expect actual &&
#		git tag -n0 -l stag-zero-lines >actual &&
#		test_cmp expect actual &&
#	
#		echo "stag-zero-lines " >expect &&
#		git tag -n1 -l | grep "^stag-zero-lines" >actual &&
#		test_cmp expect actual &&
#		git tag -n -l | grep "^stag-zero-lines" >actual &&
#		test_cmp expect actual &&
#		git tag -n1 -l stag-zero-lines >actual &&
#		test_cmp expect actual &&
#		git tag -n2 -l stag-zero-lines >actual &&
#		test_cmp expect actual &&
#		git tag -n999 -l stag-zero-lines >actual &&
#		test_cmp expect actual
#	
not ok - 82 listing many message lines of a signed tag should succeed
#	
#		git tag -s -F sigtagmsg stag-lines &&
#	
#		echo "stag-lines" >expect &&
#		git tag -l | grep "^stag-lines" >actual &&
#		test_cmp expect actual &&
#		git tag -n0 -l | grep "^stag-lines" >actual &&
#		test_cmp expect actual &&
#		git tag -n0 -l stag-lines >actual &&
#		test_cmp expect actual &&
#	
#		echo "stag-lines      stag line one" >expect &&
#		git tag -n1 -l | grep "^stag-lines" >actual &&
#		test_cmp expect actual &&
#		git tag -n -l | grep "^stag-lines" >actual &&
#		test_cmp expect actual &&
#		git tag -n1 -l stag-lines >actual &&
#		test_cmp expect actual &&
#	
#		echo "    stag line two" >>expect &&
#		git tag -n2 -l | grep "^ *stag.line" >actual &&
#		test_cmp expect actual &&
#		git tag -n2 -l stag-lines >actual &&
#		test_cmp expect actual &&
#	
#		echo "    stag line three" >>expect &&
#		git tag -n3 -l | grep "^ *stag.line" >actual &&
#		test_cmp expect actual &&
#		git tag -n3 -l stag-lines >actual &&
#		test_cmp expect actual &&
#		git tag -n4 -l | grep "^ *stag.line" >actual &&
#		test_cmp expect actual &&
#		git tag -n4 -l stag-lines >actual &&
#		test_cmp expect actual &&
#		git tag -n99 -l | grep "^ *stag.line" >actual &&
#		test_cmp expect actual &&
#		git tag -n99 -l stag-lines >actual &&
#		test_cmp expect actual
#	
not ok - 83 creating a signed tag pointing to a tree should succeed
#	
#		git tag -s -m "A message for a tree" tree-signed-tag HEAD^{tree} &&
#		get_tag_msg tree-signed-tag >actual &&
#		test_cmp expect actual
#	
not ok - 84 creating a signed tag pointing to a blob should succeed
#	
#		git tag -s -m "A message for a blob" blob-signed-tag HEAD:foo &&
#		get_tag_msg blob-signed-tag >actual &&
#		test_cmp expect actual
#	
not ok - 85 creating a signed tag pointing to another tag should succeed
#	
#		git tag -s -m "A message for another tag" tag-signed-tag signed-tag &&
#		get_tag_msg tag-signed-tag >actual &&
#		test_cmp expect actual
#	
ok 86 - git tag -s fails if gpg is misconfigured
ok 87 - verify signed tag fails when public key is not present
ok 88 - git tag -a fails if tag annotation is empty
ok 89 - message in editor has initial comment
ok 90 - overwriting an annoted tag should use its previous body
ok 91 - filename for the message is relative to cwd
ok 92 - filename for the message is relative to cwd
ok 93 - creating second commit and tag
ok 94 - creating third commit without tag
ok 95 - checking that first commit is in all tags (hash)
ok 96 - checking that first commit is in all tags (tag)
ok 97 - checking that first commit is in all tags (relative)
ok 98 - checking that second commit only has one tag
ok 99 - checking that third commit has no tags
ok 100 - creating simple branch
ok 101 - checking that branch head only has one tag
ok 102 - merging original branch into this branch
ok 103 - checking that original branch head has one tag now
ok 104 - checking that initial commit is in all tags
ok 105 - mixing incompatibles modes and options is forbidden
# failed 25 among 105 test(s)
1..105

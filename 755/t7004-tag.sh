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
# gpg not found - skipping tag signing and verification tests
ok 54 # skip trying to verify an annotated non-signed tag should fail (missing GPG)
ok 55 # skip trying to verify a file-annotated non-signed tag should fail (missing GPG)
ok 56 # skip trying to verify two annotated non-signed tags should fail (missing GPG)
ok 57 # skip creating a signed tag with -m message should succeed (missing GPG)
ok 58 # skip sign with a given key id (missing GPG)
ok 59 # skip sign with an unknown id (1) (missing GPG)
ok 60 # skip sign with an unknown id (2) (missing GPG)
ok 61 # skip -u implies signed tag (missing GPG)
ok 62 # skip creating a signed tag with -F messagefile should succeed (missing GPG)
ok 63 # skip creating a signed tag with -F - should succeed (missing GPG)
ok 64 # skip -s implies annotated tag (missing GPG)
ok 65 # skip trying to create a signed tag with non-existing -F file should fail (missing GPG)
ok 66 # skip verifying a signed tag should succeed (missing GPG)
ok 67 # skip verifying two signed tags in one command should succeed (missing GPG)
ok 68 # skip verifying many signed and non-signed tags should fail (missing GPG)
ok 69 # skip verifying a forged tag should fail (missing GPG)
ok 70 # skip creating a signed tag with an empty -m message should succeed (missing GPG)
ok 71 # skip creating a signed tag with an empty -F messagefile should succeed (missing GPG)
ok 72 # skip extra blanks in the message for a signed tag should be removed (missing GPG)
ok 73 # skip creating a signed tag with a blank -m message should succeed (missing GPG)
ok 74 # skip creating a signed tag with blank -F file with spaces should succeed (missing GPG)
ok 75 # skip creating a signed tag with spaces and no newline should succeed (missing GPG)
ok 76 # skip creating a signed tag with a -F file with #comments should succeed (missing GPG)
ok 77 # skip creating a signed tag with #commented -m message should succeed (missing GPG)
ok 78 # skip creating a signed tag with #commented -F messagefile should succeed (missing GPG)
ok 79 # skip creating a signed tag with a #comment and no newline should succeed (missing GPG)
ok 80 # skip listing the one-line message of a signed tag should succeed (missing GPG)
ok 81 # skip listing the zero-lines message of a signed tag should succeed (missing GPG)
ok 82 # skip listing many message lines of a signed tag should succeed (missing GPG)
ok 83 # skip creating a signed tag pointing to a tree should succeed (missing GPG)
ok 84 # skip creating a signed tag pointing to a blob should succeed (missing GPG)
ok 85 # skip creating a signed tag pointing to another tag should succeed (missing GPG)
ok 86 # skip creating a signed tag with rfc1991 (missing GPG)
ok 87 # skip reediting a signed tag body omits signature (missing GPG)
ok 88 # skip verifying rfc1991 signature (missing GPG)
ok 89 # skip list tag with rfc1991 signature (missing GPG)
ok 90 # skip verifying rfc1991 signature without --rfc1991 (missing GPG)
ok 91 # skip list tag with rfc1991 signature without --rfc1991 (missing GPG)
ok 92 # skip reediting a signed tag body omits signature (missing GPG)
ok 93 # skip git tag -s fails if gpg is misconfigured (missing GPG)
ok 94 # skip verify signed tag fails when public key is not present (missing GPG)
ok 95 - git tag -a fails if tag annotation is empty
ok 96 - message in editor has initial comment
ok 97 - message in editor has initial comment: first line
ok 98 - message in editor has initial comment: remainder
ok 99 - overwriting an annoted tag should use its previous body
ok 100 - filename for the message is relative to cwd
ok 101 - filename for the message is relative to cwd
ok 102 - creating second commit and tag
ok 103 - creating third commit without tag
ok 104 - checking that first commit is in all tags (hash)
ok 105 - checking that first commit is in all tags (tag)
ok 106 - checking that first commit is in all tags (relative)
ok 107 - checking that second commit only has one tag
ok 108 - checking that third commit has no tags
ok 109 - creating simple branch
ok 110 - checking that branch head only has one tag
ok 111 - merging original branch into this branch
ok 112 - checking that original branch head has one tag now
ok 113 - checking that initial commit is in all tags
ok 114 - mixing incompatibles modes and options is forbidden
# passed all 114 test(s)
1..114

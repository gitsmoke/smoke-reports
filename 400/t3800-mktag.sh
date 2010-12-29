Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3800-mktag/.git/
expecting success: 
	echo Hello >A &&
	git update-index --add A &&
	git commit -m "Initial commit" &&
	head=$(git rev-parse --verify HEAD)

[master (root-commit) 5717af1] Initial commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 A

ok 1 - setup

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: wanna fool me ? you obviously got the size wrong !

ok 2 - Tag object length check

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char0: does not start with "object "

ok 3 - "object" line label check

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char7: could not get SHA1 hash

ok 4 - "object" line SHA1 check

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char47: could not find "\ntype "

ok 5 - "type" line label check

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char48: could not find next "\n"

ok 6 - "type" line eol check

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char57: no "tag " found

ok 7 - "tag" line label check #1

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char87: no "tag " found

ok 8 - "tag" line label check #2

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char53: type too long

ok 9 - "type" line type-name length check

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char7: could not verify object 779e9b33986b1c2670fff52c5067603117b3e895

ok 10 - verify object (SHA1/type) check

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char67: could not verify tag name

ok 11 - verify tag-name check

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char70: could not find "tagger "

ok 12 - "tagger" line label check #1

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char70: could not find "tagger "

ok 13 - "tagger" line label check #2

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char77: missing tagger name

ok 14 - disallow missing tag author name

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char77: malformed tagger field

ok 15 - disallow malformed tagger

expecting success: git mktag <tag.sig >.git/refs/tags/mytag 2>message

ok 16 - allow empty tag email

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char77: malformed tagger field

ok 17 - disallow spaces in tag email

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char107: missing tag timestamp

ok 18 - disallow missing tag timestamp

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char107: missing tag timestamp

ok 19 - detect invalid tag timestamp1

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char111: malformed tag timestamp

ok 20 - detect invalid tag timestamp2

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char118: malformed tag timezone

ok 21 - detect invalid tag timezone1

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char118: malformed tag timezone

ok 22 - detect invalid tag timezone2

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char118: malformed tag timezone

ok 23 - detect invalid tag timezone3

expecting success: 
		( test_must_fail git mktag <tag.sig 2>message ) &&
		grep "$expect" message
	
error: char124: trailing garbage in tag header

ok 24 - detect invalid header entry

expecting success: git mktag <tag.sig >.git/refs/tags/mytag 2>message

ok 25 - create valid tag

expecting success: git tag -l | grep mytag
mytag

ok 26 - check mytag

# passed all 26 test(s)
1..26

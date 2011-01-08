Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1450-fsck/.git/
expecting success: 
	git config gc.auto 0 &&
	git config i18n.commitencoding ISO-8859-1 &&
	test_commit A fileA one &&
	git config --unset i18n.commitencoding &&
	git checkout HEAD^0 &&
	test_commit B fileB two &&
	git tag -d A B &&
	git reflog expire --expire=now --all &&
	>empty
[master (root-commit) 1347563] A
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileA
[detached HEAD c9145d6] B
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileB
Deleted tag 'A' (was 1347563)
Deleted tag 'B' (was c9145d6)

ok 1 - setup

expecting success: 
	mkdir another &&
	(
		cd another &&
		git init &&
		echo ../../../.git/objects >.git/objects/info/alternates &&
		test_commit C fileC one &&
		git fsck >../out 2>&1
	) &&
	{
		grep -v dangling out >actual ||
		:
	} &&
	test_cmp empty actual
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1450-fsck/another/.git/
[master (root-commit) 1aac250] C
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 fileC

ok 2 - loose objects borrowed from alternate are not missing
expecting success: 
	git fsck >actual 2>&1 &&
	test_cmp empty actual

ok 3 - HEAD is part of refs, valid objects appear valid
expecting success: 
	sha1_file() {
		echo "$*" | sed "s#..#.git/objects/&/#"
	} &&

	remove_object() {
		file=$(sha1_file "$*") &&
		test -e "$file" &&
		rm -f "$file"
	}

ok 4 - setup: helpers for corruption tests

expecting success: 
	sha=$(echo blob | git hash-object -w --stdin) &&
	old=$(echo $sha | sed "s+^..+&/+") &&
	new=$(dirname $old)/ffffffffffffffffffffffffffffffffffffff &&
	sha="$(dirname $new)$(basename $new)" &&
	mv .git/objects/$old .git/objects/$new &&
	test_when_finished "remove_object $sha" &&
	git update-index --add --cacheinfo 100644 $sha foo &&
	test_when_finished "git read-tree -u --reset HEAD" &&
	tree=$(git write-tree) &&
	test_when_finished "remove_object $tree" &&
	cmt=$(echo bogus | git commit-tree $tree) &&
	test_when_finished "remove_object $cmt" &&
	git update-ref refs/heads/bogus $cmt &&
	test_when_finished "git update-ref -d refs/heads/bogus" &&

	test_might_fail git fsck 2>out &&
	cat out &&
	grep "$sha.*corrupt" out
missing blob 63ffffffffffffffffffffffffffffffffffffff
error: sha1 mismatch 63ffffffffffffffffffffffffffffffffffffff

error: 63ffffffffffffffffffffffffffffffffffffff: object corrupt or missing
error: 63ffffffffffffffffffffffffffffffffffffff: object corrupt or missing

ok 5 - object with bad sha1

expecting success: 
	git rev-parse HEAD^{tree} >.git/refs/heads/invalid &&
	test_when_finished "git update-ref -d refs/heads/invalid" &&
	git fsck 2>out &&
	cat out &&
	grep "not a commit" out
error: refs/heads/invalid: not a commit
error: refs/heads/invalid: not a commit
ok 6 - branch pointing to non-commit
expecting success: 
	git cat-file commit HEAD >basis &&
	sed "s/@/AT/" basis >okay &&
	new=$(git hash-object -t commit -w --stdin <okay) &&
	test_when_finished "remove_object $new" &&
	git update-ref refs/heads/bogus "$new" &&
	test_when_finished "git update-ref -d refs/heads/bogus" &&
	git fsck 2>out &&
	cat out &&
	! grep "commit $new" out

ok 7 - email without @ is okay

expecting success: 
	git cat-file commit HEAD >basis &&
	sed "s/@[a-z]/&>/" basis >bad-email &&
	new=$(git hash-object -t commit -w --stdin <bad-email) &&
	test_when_finished "remove_object $new" &&
	git update-ref refs/heads/bogus "$new" &&
	test_when_finished "git update-ref -d refs/heads/bogus" &&
	git fsck 2>out &&
	cat out &&
	grep "error in commit $new" out
error in commit af421232fcba11d582d625f9041afbe3fccc01d9: invalid author/committer line - missing space before date
error in commit af421232fcba11d582d625f9041afbe3fccc01d9: invalid author/committer line - missing space before date

ok 8 - email with embedded > is not okay
expecting success: 
	cat >invalid-tag <<-\EOF &&
	object ffffffffffffffffffffffffffffffffffffffff
	type commit
	tag invalid
	tagger T A Gger <tagger@example.com> 1234567890 -0000

	This is an invalid tag.
	EOF

	tag=$(git hash-object -t tag -w --stdin <invalid-tag) &&
	test_when_finished "remove_object $tag" &&
	echo $tag >.git/refs/tags/invalid &&
	test_when_finished "git update-ref -d refs/tags/invalid" &&
	test_must_fail git fsck --tags >out &&
	cat out &&
	grep "broken link" out
tagged commit ffffffffffffffffffffffffffffffffffffffff (invalid) in 1b6f5c03992c29264810d290b006c47651933356
broken link from     tag 1b6f5c03992c29264810d290b006c47651933356
              to  commit ffffffffffffffffffffffffffffffffffffffff
missing commit ffffffffffffffffffffffffffffffffffffffff
broken link from     tag 1b6f5c03992c29264810d290b006c47651933356

ok 9 - tag pointing to nonexistent

expecting success: 
	sha=$(echo blob | git hash-object -w --stdin) &&
	test_when_finished "remove_object $sha" &&
	cat >wrong-tag <<-EOF &&
	object $sha
	type commit
	tag wrong
	tagger T A Gger <tagger@example.com> 1234567890 -0000

	This is an invalid tag.
	EOF

	tag=$(git hash-object -t tag -w --stdin <wrong-tag) &&
	test_when_finished "remove_object $tag" &&
	echo $tag >.git/refs/tags/wrong &&
	test_when_finished "git update-ref -d refs/tags/wrong" &&
	test_must_fail git fsck --tags 2>out &&
	cat out &&
	grep "error in tag.*broken links" out
broken link from     tag 66f6581d549f70e05ca586bc2df5c15a95662c36
broken link from unknown unknown
dangling blob 63499e4ea8e096b831515ceb1d5a7593e4d87ae5
error: Object 63499e4ea8e096b831515ceb1d5a7593e4d87ae5 is a blob, not a commit
error in tag 66f6581d549f70e05ca586bc2df5c15a95662c36: broken links
error in tag 66f6581d549f70e05ca586bc2df5c15a95662c36: could not load tagged object
error in tag 66f6581d549f70e05ca586bc2df5c15a95662c36: broken links
ok 10 - tag pointing to something else than its type
expecting success: 
	git fsck >actual 2>&1 &&
	test_cmp empty actual

ok 11 - cleaned up

# passed all 11 test(s)
1..11

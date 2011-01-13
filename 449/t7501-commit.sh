Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7501-commit/.git/
expecting success: echo 'bongo bongo' >file &&
	 git add file

ok 1 - initial status
expecting success: git status | grep 'Initial commit'
# Initial commit
ok 2 - Constructing initial commit
expecting success: test_must_fail git commit --amend
ok 3 - fail initial amend
expecting success: git commit -m initial
[master (root-commit) 402702b] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 4 - initial commit
expecting success: test_must_fail git commit -m foo -m bar -F file
ok 5 - invalid options 1
expecting success: test_must_fail git commit -C HEAD -m illegal
ok 6 - invalid options 2
expecting success: echo King of the bongo >file &&
	test_must_fail git commit -m foo -a file
ok 7 - using paths with -a
expecting success: echo bong-o-bong >file &&
	! (echo 7 | git commit -m foo --interactive file)
ok 8 - using paths with --interactive
expecting success: test_must_fail git commit -C bogus
ok 9 - using invalid commit with -C
expecting success: test_must_fail git commit -m initial
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   file
#
no changes added to commit (use "git add" and/or "git commit -a")

ok 10 - testing nothing to commit

expecting success: echo 'bongo bongo bongo' >file 	 git commit -m next -a

ok 11 - next commit

expecting success: echo 'more bongo: bongo bongo bongo bongo' >file && 	 test_must_fail git commit -F gah -a

ok 12 - commit message from non-existing file

expecting success: test_must_fail git commit -F msg -a
ok 13 - empty commit message

expecting success: echo 'this is the commit message, coming from a file' >msg && 	 git commit -F msg -a
[master f5702da] this is the commit message, coming from a file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 14 - commit message from file

expecting success: EDITOR=./editor git commit --amend
[master 4fd4409] this is the commit message, coming from an amend commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 15 - amend commit

expecting success: echo 'enough with the bongos' >file && 	 test_must_fail git commit -F msg -m amending .

ok 16 - passing -m and -F

expecting success: git commit -C HEAD^ .
[master d381ac4] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 17 - using message from other commit

expecting success: echo 'hula hula' >file && 	 EDITOR=./editor git commit -c HEAD^ -a
[master 3536bbb] this is the commit message, coming from an older commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 18 - editing message from other commit

expecting success: echo 'silly new contents' >file && 	 echo commit message from stdin | git commit -F - -a
[master 9b88fc1] commit message from stdin
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 19 - message from stdin

expecting success: echo 'gak' >file && 	 git commit -m 'author' --author 'Rubber Duck <rduck@convoy.org>' -a >output 2>&1

ok 20 - overriding author from command line

expecting success: grep Rubber.Duck output
 Author: Rubber Duck <rduck@convoy.org>
ok 21 - commit --author output mentions author
expecting success: echo 7 | git commit --interactive | grep 'What now'
What now> Bye.

ok 22 - interactive add

expecting success: git rev-list HEAD >current

ok 23 - showing committed revisions

expecting success: 
	 echo "moo" >file &&
	 EDITOR=./editor git commit -a -F msg &&
	 git show -s --pretty=format:"%s" | grep -q good &&
	 echo "quack" >file &&
	 echo "Another good message." | EDITOR=./editor git commit -a -F - &&
	 git show -s --pretty=format:"%s" | grep -q good
	 
[master 514b5a4] A good commit message.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master b08e1ec] Another good message.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 24 - editor not invoked if -F is given

expecting success: test_cmp expected current

ok 25 - validate git rev-list output.

expecting success: 

	git rm --cached file &&
	mv file elif &&
	git add elif &&
	git commit -m "Partial: add elif" elif &&
	git diff-tree --name-status HEAD^ HEAD >current &&
	echo "A	elif" >expected &&
	test_cmp expected current


rm 'file'
[master 2953b63] Partial: add elif
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 elif

ok 26 - partial commit that involves removal (1)
expecting success: 

	git commit -m "Partial: remove file" file &&
	git diff-tree --name-status HEAD^ HEAD >current &&
	echo "D	file" >expected &&
	test_cmp expected current
[master 9d1fc68] Partial: remove file
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 file

ok 27 - partial commit that involves removal (2)
expecting success: 

	git rm --cached elif &&
	echo elif >elif &&
	git commit -m "Partial: modify elif" elif &&
	git diff-tree --name-status HEAD^ HEAD >current &&
	echo "M	elif" >expected &&
	test_cmp expected current
rm 'elif'
[master c51ef39] Partial: modify elif
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 28 - partial commit that involves removal (3)
expecting success: 

	oldtick=$GIT_AUTHOR_DATE &&
	test_tick &&
	git reset --hard &&
	git cat-file -p HEAD |
	sed -e "s/author.*/author $author $oldtick/" \
		-e "s/^\(committer.*> \).*$/\1$GIT_COMMITTER_DATE/" > \
		expected &&
	git commit --amend --author="$author" &&
	git cat-file -p HEAD > current &&
	test_cmp expected current
HEAD is now at c51ef39 Partial: modify elif
[master 1012164] Partial: modify elif
 Author: The Real Author <someguy@his.email.org>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 29 - amend commit to fix author
expecting success: 

	test_tick &&
	newtick=$GIT_AUTHOR_DATE &&
	git reset --hard &&
	git cat-file -p HEAD |
	sed -e "s/author.*/author $author $newtick/" \
		-e "s/^\(committer.*> \).*$/\1$GIT_COMMITTER_DATE/" > \
		expected &&
	git commit --amend --date="$newtick" &&
	git cat-file -p HEAD > current &&
	test_cmp expected current
HEAD is now at 1012164 Partial: modify elif
[master 6484860] Partial: modify elif
 Author: The Real Author <someguy@his.email.org>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 30 - amend commit to fix date
expecting success: 
	test_must_fail git commit --amend --date=10.11.2010

ok 31 - commit complains about bogus date

expecting success: 

	echo 1 >positive &&
	git add positive &&
	git commit -s -m "thank you" &&
	git cat-file commit HEAD | sed -e "1,/^\$/d" >actual &&
	(
		echo thank you
		echo
		git var GIT_COMMITTER_IDENT |
		sed -e "s/>.*/>/" -e "s/^/Signed-off-by: /"
	) >expected &&
	test_cmp expected actual
[master d9d9c00] thank you
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 positive

ok 32 - sign off (1)

expecting success: 

	echo 2 >positive &&
	git add positive &&
	existing="Signed-off-by: Watch This <watchthis@example.com>" &&
	git commit -s -m "thank you

$existing" &&
	git cat-file commit HEAD | sed -e "1,/^\$/d" >actual &&
	(
		echo thank you
		echo
		echo $existing
		git var GIT_COMMITTER_IDENT |
		sed -e "s/>.*/>/" -e "s/^/Signed-off-by: /"
	) >expected &&
	test_cmp expected actual
[master 9e7cae1] thank you
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 33 - sign off (2)

expecting success: 

	echo 3 >positive &&
	git add positive &&
	alt="Alt-RFC-822-Header: Value" &&
	git commit -s -m "welcome

$alt" &&
	git cat-file commit HEAD | sed -e "1,/^\$/d" > actual &&
	(
		echo welcome
		echo
		echo $alt
		git var GIT_COMMITTER_IDENT |
		sed -e "s/>.*/>/" -e "s/^/Signed-off-by: /"
	) >expected &&
	test_cmp expected actual
[master 30373ba] welcome
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 34 - signoff gap
expecting success: 

	echo 4 >positive &&
	git add positive &&
	alt="fixed: 34" &&
	git commit -s -m "welcome

We have now
$alt" &&
	git cat-file commit HEAD | sed -e "1,/^\$/d" > actual &&
	(
		echo welcome
		echo
		echo We have now
		echo $alt
		echo
		git var GIT_COMMITTER_IDENT |
		sed -e "s/>.*/>/" -e "s/^/Signed-off-by: /"
	) >expected &&
	test_cmp expected actual
[master 62c8064] welcome
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 35 - signoff gap 2
expecting success: 

	>negative &&
	git add negative &&
	git commit -m "one" -m "two" -m "three" &&
	git cat-file commit HEAD | sed -e "1,/^\$/d" >actual &&
	(
		echo one
		echo
		echo two
		echo
		echo three
	) >expected &&
	test_cmp expected actual
[master fe687bf] one
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 negative

ok 36 - multiple -m
expecting success: 

	oldtick=$GIT_AUTHOR_DATE &&
	test_tick &&
	git reset --hard &&
	git cat-file -p HEAD |
	sed -e "s/author.*/author $author $oldtick/" \
		-e "s/^\(committer.*> \).*$/\1$GIT_COMMITTER_DATE/" > \
		expected &&
	git commit --amend --author="$author" &&
	git cat-file -p HEAD > current &&
	test_cmp expected current
HEAD is now at fe687bf one
[master faf95f4] one
 Author: The Real Author <someguy@his.email.org>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 negative

ok 37 - amend commit to fix author

expecting success: 
	echo tacocat > elif &&
	echo tehlulz > chz &&
	git add chz &&
	git commit elif -m "tacocat is a palindrome" &&
	git show --stat | grep elif &&
	git diff --cached | grep chz
[master 468f987] tacocat is a palindrome
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
 elif |    2 +-
diff --git a/chz b/chz
+++ b/chz
ok 38 - git commit <file> with dirty index
expecting success: 

	git reset --hard

	if git commit -m empty
	then
		echo oops -- should have complained
		false
	else
		: happy
	fi
HEAD is now at 468f987 tacocat is a palindrome
# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	actual
#	current
#	editor
#	expected
#	msg
#	output
nothing added to commit but untracked files present (use "git add" to track)

ok 39 - same tree (single parent)

expecting success: 

	git commit --allow-empty -m "forced empty" &&
	git cat-file commit HEAD | grep forced
[master 652ad85] forced empty
 Author: A U Thor <author@example.com>
forced empty

ok 40 - same tree (single parent) --allow-empty

expecting success: 

	git checkout -b side HEAD^ &&
	echo zero >zero &&
	git add zero &&
	git commit -m "add zero" &&
	git checkout master &&

	git merge -s ours side -m "empty ok" &&
	git diff HEAD^ HEAD >actual &&
	: >expected &&
	test_cmp expected actual &&

	git commit --amend -m "empty really ok" &&
	git diff HEAD^ HEAD >actual &&
	: >expected &&
	test_cmp expected actual


[side 5bdd08e] add zero
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 zero
Merge made by ours.
[master 177d1ad] empty really ok
 Author: A U Thor <author@example.com>

ok 41 - same tree (merge and amend merge)

expecting success: 

	git reset --hard &&
	test_tick &&
	git commit --allow-empty -m "old commit" &&
	old=$(git rev-parse --verify HEAD) &&
	test_tick &&
	git commit --allow-empty -m "new commit" &&
	new=$(git rev-parse --verify HEAD) &&
	test_tick &&
	git commit --allow-empty --amend -C "$old" &&
	git show --pretty="format:%ad %s" "$old" >expected &&
	git show --pretty="format:%ad %s" HEAD >actual &&
	test_cmp expected actual


HEAD is now at 177d1ad empty really ok
[master 882d552] old commit
 Author: A U Thor <author@example.com>
[master d7e882d] new commit
 Author: A U Thor <author@example.com>
[master 4850bb7] old commit
 Author: A U Thor <author@example.com>

ok 42 - amend using the message from another commit

expecting success: 

	git reset --hard &&
	test_tick &&
	git commit --allow-empty -m "old commit" &&
	old=$(git rev-parse --verify HEAD) &&
	git tag -a -m "tag on old" tagged-old HEAD &&
	test_tick &&
	git commit --allow-empty -m "new commit" &&
	new=$(git rev-parse --verify HEAD) &&
	test_tick &&
	git commit --allow-empty --amend -C tagged-old &&
	git show --pretty="format:%ad %s" "$old" >expected &&
	git show --pretty="format:%ad %s" HEAD >actual &&
	test_cmp expected actual


HEAD is now at 4850bb7 old commit
[master b8be432] old commit
 Author: A U Thor <author@example.com>
[master af63559] new commit
 Author: A U Thor <author@example.com>
[master ffe57f8] old commit
 Author: A U Thor <author@example.com>

ok 43 - amend using the message from a commit named with tag

expecting success: 

	git config notes.rewrite.amend true &&
	git config notes.rewriteRef "refs/notes/*" &&
	test_commit foo &&
	git notes add -m"a note" &&
	test_tick &&
	git commit --amend -m"new foo" &&
	test "$(git notes show)" = "a note"


[master e42fee2] foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo.t
[master 0f762e0] new foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo.t

ok 44 - amend can copy notes

# passed all 44 test(s)
1..44

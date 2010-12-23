Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0002-gitfile/.git/
expecting success: 
	REAL="$(pwd)/.real" &&
	mv .git "$REAL"

ok 1 - initial setup
expecting success: 
	echo "gitdir $REAL" >.git &&
	if git rev-parse 2>.err
	then
		echo "git rev-parse accepted an invalid .git file"
		false
	fi &&
	if ! grep "Invalid gitfile format" .err
	then
		echo "git rev-parse returned wrong error"
		false
	fi
fatal: Invalid gitfile format: .git

ok 2 - bad setup: invalid .git file format

expecting success: 
	echo "gitdir: $REAL.not" >.git &&
	if git rev-parse 2>.err
	then
		echo "git rev-parse accepted an invalid .git file path"
		false
	fi &&
	if ! grep "Not a git repository" .err
	then
		echo "git rev-parse returned wrong error"
		false
	fi
fatal: Not a git repository: /Users/trast/git-smoke/t/trash directory.t0002-gitfile/.real.not

ok 3 - bad setup: invalid .git file path

expecting success: 
	echo "gitdir: $REAL" >.git &&
	test "$REAL" = "$(git rev-parse --git-dir)"


ok 4 - final setup + check rev-parse --git-dir

expecting success: 
	echo "foo" >bar &&
	SHA=$(cat bar | git hash-object -w --stdin) &&
	objck $SHA

ok 5 - check hash-object

expecting success: 
	git cat-file blob $SHA >actual &&
	test_cmp bar actual

ok 6 - check cat-file
expecting success: 
	if test -f "$REAL/index"
	then
		echo "Hmm, $REAL/index exists?"
		false
	fi &&
	rm -f "$REAL/objects/$(objpath $SHA)" &&
	git update-index --add bar &&
	if ! test -f "$REAL/index"
	then
		echo "$REAL/index not found"
		false
	fi &&
	objck $SHA

ok 7 - check update-index

expecting success: 
	SHA=$(git write-tree) &&
	objck $SHA

ok 8 - check write-tree

expecting success: 
	SHA=$(echo "commit bar" | git commit-tree $SHA) &&
	objck $SHA

ok 9 - check commit-tree

expecting success: 
	echo $SHA >"$REAL/HEAD" &&
	test "$SHA" = "$(git rev-list HEAD)"

ok 10 - check rev-list

# passed all 10 test(s)
1..10

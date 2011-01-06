Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4022-diff-rewrite/.git/
expecting success: 

	cat "$TEST_DIRECTORY"/../COPYING >test &&
	git add test &&
	tr \
	  "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" \
	  "nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM" \
	  <"$TEST_DIRECTORY"/../COPYING >test



ok 1 - setup

expecting success: 

	actual=$(git diff-files -B --summary test) &&
	expr "$actual" : " rewrite test ([0-9]*%)$" || {
		echo "Eh? <<$actual>>"
		false
	}


19

ok 2 - detect rewrite

# passed all 2 test(s)
1..2

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4025-hunk-header/.git/
expecting success: 

	(
		echo "A $NS"
		for c in B C D E F G H I J K
		do
			echo "  $c"
		done
		echo "L  $NS"
		for c in M N O P Q R S T U V
		do
			echo "  $c"
		done
	) >file &&
	git add file &&

	sed -e "/^  [EP]/s/$/ modified/" <file >file+ &&
	mv file+ file

ok 1 - setup

expecting success: 

	git diff | sed -n -e "s/^.*@@//p" >actual &&
	(
		echo " A $N$N$N$N$N$N$N$N$N2"
		echo " L  $N$N$N$N$N$N$N$N$N1"
	) >expected &&
	test_cmp actual expected

ok 2 - hunk header truncation with an overly long line

# passed all 2 test(s)
1..2

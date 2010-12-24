Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4123-apply-shrink/.git/
expecting success: 

	git add F &&
	mv F G &&
	sed -e "s/1/11/" -e "s/999999/9/" -e "s/H/HH/" <G >F &&
	git diff >patch &&
	sed -e "/^\$/d" <G >F &&
	git add F

ok 1 - setup

expecting success: 

	if git apply --index patch
	then
		echo Oops, should not have succeeded
		false
	else
		status=$?
		echo "Status was $status"
		if test -f .git/index.lock
		then
			echo Oops, should not have crashed
			false
		fi
	fi
Status was 1

ok 2 - apply should fail gracefully

# passed all 2 test(s)
1..2

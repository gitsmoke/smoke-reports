Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2300-cd-to-toplevel/.git/
expecting success: 
		(
			cd 'repo' &&
			. "$(git --exec-path)"/git-sh-setup &&
			cd_to_toplevel &&
			[ "$(pwd -P)" = "$TOPLEVEL" ]
		)
	

ok 1 - at physical root

expecting success: 
		(
			cd 'repo/sub/dir' &&
			. "$(git --exec-path)"/git-sh-setup &&
			cd_to_toplevel &&
			[ "$(pwd -P)" = "$TOPLEVEL" ]
		)
	

ok 2 - at physical subdir
expecting success: 
		(
			cd 'symrepo' &&
			. "$(git --exec-path)"/git-sh-setup &&
			cd_to_toplevel &&
			[ "$(pwd -P)" = "$TOPLEVEL" ]
		)
	

ok 3 - at symbolic root
expecting success: 
		(
			cd 'subdir-link' &&
			. "$(git --exec-path)"/git-sh-setup &&
			cd_to_toplevel &&
			[ "$(pwd -P)" = "$TOPLEVEL" ]
		)
	

ok 4 - at symbolic subdir

expecting success: 
		(
			cd 'internal-link' &&
			. "$(git --exec-path)"/git-sh-setup &&
			cd_to_toplevel &&
			[ "$(pwd -P)" = "$TOPLEVEL" ]
		)
	

ok 5 - at internal symbolic subdir

# passed all 5 test(s)
1..5

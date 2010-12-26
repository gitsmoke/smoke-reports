Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0005-signals/.git/
expecting success: 
	test-sigchain >actual
	case "$?" in
	143) true ;; # POSIX w/ SIGTERM=15
	271) true ;; # ksh w/ SIGTERM=15
	  3) true ;; # Windows
	  *) false ;;
	esac &&
	test_cmp expect actual
ok 1 - sigchain works

# passed all 1 test(s)
1..1

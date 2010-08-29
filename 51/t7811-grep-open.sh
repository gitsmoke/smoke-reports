ok 1 - determine default pager
ok 2 - setup
ok 3 - git grep -O
ok 4 - git grep -O --cached
not ok - 5 git grep -O --no-index
#	
#		rm -f expect.less pager-args out &&
#		cat >expect <<-\EOF &&
#		grep.h
#		untracked
#		EOF
#		>empty &&
#	
#		(
#			GIT_PAGER='printf "%s\n" >pager-args' &&
#			export GIT_PAGER &&
#			git grep --no-index -O GREP_PATTERN >out
#		) &&
#		test_cmp expect pager-args &&
#		test_cmp empty out
#	
ok 6 - setup: fake "less"
ok 7 - git grep -O jumps to line in less
ok 8 - modified file
not ok - 9 copes with color settings
#	
#		rm -f actual &&
#		echo grep.h >expect &&
#		test_config color.grep always &&
#		test_config color.grep.filename yellow &&
#		test_config color.grep.separator green &&
#		git grep -O'printf "%s\n" >actual' GREP_AND &&
#		test_cmp expect actual
#	
not ok - 10 run from subdir
#	
#		rm -f actual &&
#		echo grep.c >expect &&
#		>empty &&
#	
#		(
#			cd subdir &&
#			export GIT_PAGER &&
#			GIT_PAGER='printf "%s\n" >../args' &&
#			git grep -O "enum grep_pat_token" >../out &&
#			git grep -O"pwd >../dir; :" "enum grep_pat_token" >../out2
#		) &&
#		case $(cat dir) in
#		*subdir)
#			: good
#			;;
#		*)
#			false
#			;;
#		esac &&
#		test_cmp expect args &&
#		test_cmp empty out &&
#		test_cmp empty out2
#	
# failed 3 among 10 test(s)
1..10

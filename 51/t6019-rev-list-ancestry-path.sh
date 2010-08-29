ok 1 - setup
ok 2 - rev-list D..M
not ok - 3 rev-list --ancestry-path D..M
#	
#		for c in E F H I J L M; do echo $c; done >expect &&
#		git rev-list --ancestry-path --format=%s D..M |
#		sed -e "/^commit /d" |
#		sort >actual &&
#		test_cmp expect actual
#	
ok 4 - rev-list D..M -- M.t
not ok - 5 rev-list --ancestry-patch D..M -- M.t
#	
#		echo M >expect &&
#		git rev-list --ancestry-path --format=%s D..M -- M.t |
#		sed -e "/^commit /d" >actual &&
#		test_cmp expect actual
#	
# failed 2 among 5 test(s)
1..5

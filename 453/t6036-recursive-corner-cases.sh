ok 1 - setup basic criss-cross + rename with no modifications
ok 2 - merge simple rename+criss-cross with no modifications
ok 3 - setup criss-cross + rename merges with basic modification
not ok - 4 merge criss-cross + rename merges with basic modification
#	
#		git reset --hard &&
#		git checkout L2^0 &&
#	
#		test_must_fail git merge -s recursive R2^0 &&
#	
#		test 5 = $(git ls-files -s | wc -l) &&
#		test 3 = $(git ls-files -u | wc -l) &&
#		test 0 = $(git ls-files -o | wc -l) &&
#	
#		test $(git rev-parse :0:one) = $(git rev-parse L2:one) &&
#		test $(git rev-parse :0:two) = $(git rev-parse R2:two) &&
#		test $(git rev-parse :2:three) = $(git rev-parse L2:three) &&
#		test $(git rev-parse :3:three) = $(git rev-parse R2:three) &&
#	
#		head -n 10 two >merged &&
#		cp one merge-me &&
#		>empty &&
#		test_must_fail git merge-file \
#			-L "Temporary merge branch 2" \
#			-L "" \
#			-L "Temporary merge branch 1" \
#			merged empty merge-me &&
#		test $(git rev-parse :1:three) = $(git hash-object merged)
#	
ok 5 - setup differently handled merges of rename/add conflict
not ok - 6 git detects differently handled merges conflict
#	
#		git reset --hard &&
#		git checkout D^0 &&
#	
#		git merge -s recursive E^0 && {
#			echo "BAD: should have conflicted"
#			test "Incorrectly merged content" = "$(cat new_a)" &&
#				echo "BAD: Silently accepted wrong content"
#			return 1
#		}
#	
#		test 3 = $(git ls-files -s | wc -l) &&
#		test 3 = $(git ls-files -u | wc -l) &&
#		test 0 = $(git ls-files -o | wc -l) &&
#	
#		test $(git rev-parse :2:new_a) = $(git rev-parse D:new_a) &&
#		test $(git rev-parse :3:new_a) = $(git rev-parse E:new_a) &&
#	
#		git cat-file -p B:new_a >>merged &&
#		git cat-file -p C:new_a >>merge-me &&
#		>empty &&
#		test_must_fail git merge-file \
#			-L "Temporary merge branch 2" \
#			-L "" \
#			-L "Temporary merge branch 1" \
#			merged empty merge-me &&
#		test $(git rev-parse :1:new_a) = $(git hash-object merged)
#	
# failed 2 among 6 test(s)
1..6

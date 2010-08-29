ok 1 - prepare repository
ok 2 - Merge with d/f conflicts
not ok - 3 F/D conflict
#	
#		git reset --hard &&
#		git checkout master &&
#		rm .git/index &&
#	
#		mkdir before &&
#		echo FILE >before/one &&
#		echo FILE >after &&
#		git add . &&
#		git commit -m first &&
#	
#		rm -f after &&
#		git mv before after &&
#		git commit -m move &&
#	
#		git checkout -b para HEAD^ &&
#		echo COMPLETELY ANOTHER FILE >another &&
#		git add . &&
#		git commit -m para &&
#	
#		git merge master
#	
# failed 1 among 3 test(s)
1..3

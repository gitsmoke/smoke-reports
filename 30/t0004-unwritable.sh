ok 1 - setup
not ok - 2 write-tree should notice unwritable repository
#	
#	
#		(
#			chmod a-w .git/objects .git/objects/?? &&
#			test_must_fail git write-tree
#		)
#		status=$?
#		chmod 775 .git/objects .git/objects/??
#		(exit $status)
#	
#	
not ok - 3 commit should notice unwritable repository
#	
#	
#		(
#			chmod a-w .git/objects .git/objects/?? &&
#			test_must_fail git commit -m second
#		)
#		status=$?
#		chmod 775 .git/objects .git/objects/??
#		(exit $status)
#	
#	
not ok - 4 update-index should notice unwritable repository
#	
#	
#		(
#			echo 6O >file &&
#			chmod a-w .git/objects .git/objects/?? &&
#			test_must_fail git update-index file
#		)
#		status=$?
#		chmod 775 .git/objects .git/objects/??
#		(exit $status)
#	
#	
not ok - 5 add should notice unwritable repository
#	
#	
#		(
#			echo b >file &&
#			chmod a-w .git/objects .git/objects/?? &&
#			test_must_fail git add file
#		)
#		status=$?
#		chmod 775 .git/objects .git/objects/??
#		(exit $status)
#	
#	
# failed 4 among 5 test(s)
1..5

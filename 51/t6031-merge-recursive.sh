filemode disabled on the filesystem
ok 1 - mode change in one branch: keep changed version
ok 2 # skip verify executable bit on file (missing FILEMODE of FILEMODE)
ok 3 - mode change in both branches: expect conflict
ok 4 # skip verify executable bit on file (missing FILEMODE of FILEMODE)
not ok - 5 merging with triple rename across D/F conflict
#	
#		git reset --hard HEAD &&
#		git checkout -b main &&
#		git rm -rf . &&
#	
#		echo "just a file" >sub1 &&
#		mkdir -p sub2 &&
#		echo content1 >sub2/file1 &&
#		echo content2 >sub2/file2 &&
#		echo content3 >sub2/file3 &&
#		mkdir simple &&
#		echo base >simple/bar &&
#		git add -A &&
#		test_tick &&
#		git commit -m base &&
#	
#		git checkout -b other &&
#		echo more >>simple/bar &&
#		test_tick &&
#		git commit -a -m changesimplefile &&
#	
#		git checkout main &&
#		git rm sub1 &&
#		git mv sub2 sub1 &&
#		test_tick &&
#		git commit -m changefiletodir &&
#	
#		test_tick &&
#		git merge other
#	
# failed 1 among 5 test(s)
1..5

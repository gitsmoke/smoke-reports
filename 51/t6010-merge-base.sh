ok 1 - setup
ok 2 - set up G and H
ok 3 - merge-base G H
not ok - 4 merge-base/show-branch --independent
#	
#		git name-rev "$H" >expected1 &&
#		git name-rev "$H" "$G" >expected2 &&
#	
#		parents=$(git merge-base --independent H) &&
#		git name-rev $parents >actual1.mb &&
#		parents=$(git merge-base --independent A H G) &&
#		git name-rev $parents >actual2.mb &&
#	
#		parents=$(git show-branch --independent H) &&
#		git name-rev $parents >actual1.sb &&
#		parents=$(git show-branch --independent A H G) &&
#		git name-rev $parents >actual2.sb &&
#	
#		test_cmp expected1 actual1.mb &&
#		test_cmp expected2 actual2.mb &&
#		test_cmp expected1 actual1.sb &&
#		test_cmp expected2 actual2.sb
#	
ok 5 - unsynchronized clocks
not ok - 6 --independent with unsynchronized clocks
#	
#		IB=$(doit 0 IB) &&
#		I1=$(doit -10 I1 $IB) &&
#		I2=$(doit  -9 I2 $I1) &&
#		I3=$(doit  -8 I3 $I2) &&
#		I4=$(doit  -7 I4 $I3) &&
#		I5=$(doit  -6 I5 $I4) &&
#		I6=$(doit  -5 I6 $I5) &&
#		I7=$(doit  -4 I7 $I6) &&
#		I8=$(doit  -3 I8 $I7) &&
#		IH=$(doit  -2 IH $I8) &&
#	
#		echo $IH >expected &&
#		git merge-base --independent IB IH >actual &&
#		test_cmp expected actual
#	
ok 7 - merge-base for octopus-step (setup)
not ok - 8 merge-base A B C
#	
#		git rev-parse --verify MM1 >expected &&
#		git rev-parse --verify MMR >expected.sb &&
#	
#		git merge-base --all MMA MMB MMC >actual &&
#		git merge-base --all --octopus MMA MMB MMC >actual.common &&
#		git show-branch --merge-base MMA MMB MMC >actual.sb &&
#	
#		test_cmp expected actual &&
#		test_cmp expected.sb actual.common &&
#		test_cmp expected.sb actual.sb
#	
ok 9 - criss-cross merge-base for octopus-step
# failed 3 among 9 test(s)
1..9

ok 1 - setup
ok 2 - naive merge fails
not ok - 3 --ignore-space-change makes merge succeed
#	
#		git read-tree --reset -u HEAD &&
#		git merge-recursive --ignore-space-change HEAD^ -- HEAD remote
#	
not ok - 4 --ignore-space-change: our w/s-only change wins
#	
#		q_to_cr <<-\EOF >expected &&
#		    justice and holiness and is the nurse of his age and theQ
#		EOF
#	
#		git read-tree --reset -u HEAD &&
#		git merge-recursive --ignore-space-change HEAD^ -- HEAD remote &&
#		grep "justice and holiness" text.txt >actual &&
#		test_cmp expected actual
#	
not ok - 5 --ignore-space-change: their real change wins over w/s
#	
#		cat <<-\EOF >expected &&
#		it?---to speak the truth and to pay your debts---no more than this? And
#		EOF
#	
#		git read-tree --reset -u HEAD &&
#		git merge-recursive --ignore-space-change HEAD^ -- HEAD remote &&
#		grep "pay your debts" text.txt >actual &&
#		test_cmp expected actual
#	
not ok - 6 --ignore-space-change: does not ignore new spaces
#	
#		cat <<-\EOF >expected1 &&
#		Well said, Cephalus, I replied; but as con cerning justice, what is
#		EOF
#		q_to_cr <<-\EOF >expected2 &&
#		un intentionally; and when he departs to the world below he is not inQ
#		EOF
#	
#		git read-tree --reset -u HEAD &&
#		git merge-recursive --ignore-space-change HEAD^ -- HEAD remote &&
#		grep "Well said" text.txt >actual1 &&
#		grep "when he departs" text.txt >actual2 &&
#		test_cmp expected1 actual1 &&
#		test_cmp expected2 actual2
#	
not ok - 7 --ignore-all-space drops their new spaces
#	
#		cat <<-\EOF >expected &&
#		Well said, Cephalus, I replied; but as concerning justice, what is
#		EOF
#	
#		git read-tree --reset -u HEAD &&
#		git merge-recursive --ignore-all-space HEAD^ -- HEAD remote &&
#		grep "Well said" text.txt >actual &&
#		test_cmp expected actual
#	
not ok - 8 --ignore-all-space keeps our new spaces
#	
#		q_to_cr <<-\EOF >expected &&
#		un intentionally; and when he departs to the world below he is not inQ
#		EOF
#	
#		git read-tree --reset -u HEAD &&
#		git merge-recursive --ignore-all-space HEAD^ -- HEAD remote &&
#		grep "when he departs" text.txt >actual &&
#		test_cmp expected actual
#	
not ok - 9 --ignore-space-at-eol
#	
#		q_to_cr <<-\EOF >expected &&
#		<<<<<<< HEAD
#		is not in his right mind; ought I to give them back to him?  No oneQ
#		=======
#		is not in his right mind, ought I to give them back to him? No one
#		>>>>>>> remote
#		EOF
#	
#		git read-tree --reset -u HEAD &&
#		test_must_fail git merge-recursive --ignore-space-at-eol \
#							 HEAD^ -- HEAD remote &&
#		conflict_hunks text.txt >actual &&
#		test_cmp expected actual
#	
# failed 7 among 9 test(s)
1..9

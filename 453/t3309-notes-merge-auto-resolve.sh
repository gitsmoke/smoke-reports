ok 1 - setup commits
ok 2 - setup merge base (x)
ok 3 - verify state of merge base (x)
ok 4 - setup local branch (y)
ok 5 - verify state of local branch (y)
ok 6 - setup remote branch (z)
ok 7 - verify state of remote branch (z)
ok 8 - merge z into y with invalid strategy => Fail/No changes
not ok - 9 merge z into y with "ours" strategy => Non-conflicting 3-way merge
#	
#		git notes merge --strategy=ours z &&
#		verify_notes y ours
#	
not ok - 10 reset to pre-merge state (y)
#	
#		git update-ref refs/notes/y refs/notes/y^1 &&
#		# Verify pre-merge state
#		verify_notes y y
#	
not ok - 11 merge z into y with "theirs" strategy => Non-conflicting 3-way merge
#	
#		git notes merge --strategy=theirs z &&
#		verify_notes y theirs
#	
not ok - 12 reset to pre-merge state (y)
#	
#		git update-ref refs/notes/y refs/notes/y^1 &&
#		# Verify pre-merge state
#		verify_notes y y
#	
not ok - 13 merge z into y with "union" strategy => Non-conflicting 3-way merge
#	
#		git notes merge --strategy=union z &&
#		verify_notes y union
#	
not ok - 14 reset to pre-merge state (y)
#	
#		git update-ref refs/notes/y refs/notes/y^1 &&
#		# Verify pre-merge state
#		verify_notes y y
#	
not ok - 15 merge y into z with "union" strategy => Non-conflicting 3-way merge
#	
#		git config core.notesRef refs/notes/z &&
#		git notes merge --strategy=union y &&
#		verify_notes z union2
#	
not ok - 16 reset to pre-merge state (z)
#	
#		git update-ref refs/notes/z refs/notes/z^1 &&
#		# Verify pre-merge state
#		verify_notes z z
#	
not ok - 17 merge y into z with "cat_sort_uniq" strategy => Non-conflicting 3-way merge
#	
#		git notes merge --strategy=cat_sort_uniq y &&
#		verify_notes z cat_sort_uniq
#	
# failed 9 among 17 test(s)
1..17

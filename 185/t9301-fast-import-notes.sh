ok 1 - set up master branch
ok 2 - add notes with simple M command
ok 3 - add notes with simple N command
ok 4 - update existing notes with N command
ok 5 - add concatentation notes with M command
ok 6 - verify that deleteall also removes notes
ok 7 - verify that later N commands override earlier M commands
not ok - 8 add lots of commits and notes
#	
#	
#		git fast-import <input &&
#		GIT_NOTES_REF=refs/notes/many_notes git log refs/heads/many_commits |
#		    grep "^    " > actual &&
#		test_cmp expect actual
#	
#	
ok 9 - verify that lots of notes trigger a fanout scheme
ok 10 - verify that non-notes are untouched by a fanout change
not ok - 11 remove lots of notes
#	
#	
#		git fast-import <input &&
#		GIT_NOTES_REF=refs/notes/many_notes git log refs/heads/many_commits |
#		    grep "^    " > actual &&
#		test_cmp expect actual
#	
#	
ok 12 - verify that removing notes trigger fanout consolidation
ok 13 - verify that non-notes are untouched by a fanout change
ok 14 - add notes to 16 commits in each of 10 refs
# failed 2 among 14 test(s)
1..14

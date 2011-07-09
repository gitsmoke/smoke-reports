ok 1 - setup basic criss-cross + rename with no modifications
ok 2 - merge simple rename+criss-cross with no modifications
ok 3 - setup criss-cross + rename merges with basic modification
ok 4 - merge criss-cross + rename merges with basic modification
ok 5 - setup differently handled merges of rename/add conflict
ok 6 - git detects differently handled merges conflict
ok 7 - setup criss-cross + modify/delete resolved differently
ok 8 - git detects conflict merging criss-cross+modify/delete
ok 9 - git detects conflict merging criss-cross+modify/delete, reverse direction
ok 10 - setup differently handled merges of content conflict
not ok 11 - git detects conflict w/ criss-cross+contrived resolution # TODO known breakage
ok 12 - setup differently handled merges of directory/file conflict
ok 13 - git detects conflict and handles merge of D & E1 correctly
ok 14 - git detects conflict and handles merge of E1 & D correctly
ok 15 - git detects conflict and handles merge of D & E2 correctly
ok 16 - git detects conflict and handles merge of E2 & D correctly
ok 17 - setup rename/rename(1to2)/modify followed by what looks like rename/rename(2to1)/modify
ok 18 - handle rename/rename(1to2)/modify followed by what looks like rename/rename(2to1)/modify
ok 19 - setup criss-cross + rename/rename/add + modify/modify
not ok 20 - correctly resolves criss-cross with rename/rename/add and modify/modify conflict # TODO known breakage
# still have 2 known breakage(s)
# passed all remaining 18 test(s)
1..20

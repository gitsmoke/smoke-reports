ok 1 - prepare reference tree
ok 2 - check all lines blamed on A
ok 3 - Setup new lines blamed on B
ok 4 - Two lines blamed on A, two on B
ok 5 - merge-setup part 1
ok 6 - Two lines blamed on A, two on B, two on B1
ok 7 - merge-setup part 2
ok 8 - Two lines blamed on A, one on B, one on B2
ok 9 - merge-setup part 3
ok 10 - Two lines blamed on A, one on B, two on B1, one on B2
ok 11 - Annotating an old revision works
ok 12 - Annotating an old revision works
ok 13 - merge-setup part 4
ok 14 - Two lines blamed on A, one on B, two on B1, one on B2, one on A U Thor
ok 15 - an incomplete line added
ok 16 - With incomplete lines.
ok 17 - some edit
ok 18 - some edit
not ok - 19 Blame --show-email works
#	
#	    check_count "<A@test.git>" 1 "<B@test.git>" 1 "<B1@test.git>" 1 "<B2@test.git>" 1 "<author@example.com>" 1 "<C@test.git>" 1 "<D@test.git>" 1
#	
# failed 1 among 19 test(s)
1..19

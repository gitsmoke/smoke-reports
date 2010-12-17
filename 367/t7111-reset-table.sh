ok 1 - creating initial commits
ok 2 - check: A B C D --soft A B D
ok 3 - check: A B C D --mixed A D D
ok 4 - check: A B C D --hard D D D
ok 5 - check: A B C D --merge XXXXX  
ok 6 - check: A B C D --keep XXXXX  
ok 7 - check: A B C C --soft A B C
ok 8 - check: A B C C --mixed A C C
ok 9 - check: A B C C --hard C C C
ok 10 - check: A B C C --merge XXXXX  
ok 11 - check: A B C C --keep A C C
ok 12 - check: B B C D --soft B B D
ok 13 - check: B B C D --mixed B D D
ok 14 - check: B B C D --hard D D D
ok 15 - check: B B C D --merge D D D
ok 16 - check: B B C D --keep XXXXX  
ok 17 - check: B B C C --soft B B C
ok 18 - check: B B C C --mixed B C C
ok 19 - check: B B C C --hard C C C
ok 20 - check: B B C C --merge C C C
ok 21 - check: B B C C --keep B C C
ok 22 - check: B C C D --soft B C D
ok 23 - check: B C C D --mixed B D D
ok 24 - check: B C C D --hard D D D
ok 25 - check: B C C D --merge XXXXX  
ok 26 - check: B C C D --keep XXXXX  
ok 27 - check: B C C C --soft B C C
ok 28 - check: B C C C --mixed B C C
ok 29 - check: B C C C --hard C C C
ok 30 - check: B C C C --merge B C C
ok 31 - check: B C C C --keep B C C
ok 32 - setting up branches to test with unmerged entries
ok 33 - check: X U B C --soft XXXXX  
ok 34 - check: X U B C --mixed X C C
ok 35 - check: X U B C --hard C C C
ok 36 - check: X U B C --merge C C C
ok 37 - check: X U B C --keep XXXXX  
ok 38 - check: X U B B --soft XXXXX  
ok 39 - check: X U B B --mixed X B B
ok 40 - check: X U B B --hard B B B
ok 41 - check: X U B B --merge B B B
ok 42 - check: X U B B --keep XXXXX  
# passed all 42 test(s)
1..42

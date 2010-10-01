ok 1 - set up rev-list --graph test
ok 2 - --graph --all
ok 3 - --graph --simplify-by-decoration
ok 4 - setup: get rid of decorations on branch B
ok 5 - --graph --simplify-by-decoration prune branch B
ok 6 - --graph --full-history -- bar.txt
ok 7 - --graph --full-history --simplify-merges -- bar.txt
ok 8 - --graph -- bar.txt
ok 9 - --graph --sparse -- bar.txt
ok 10 - --graph ^C4
ok 11 - --graph ^C3
ok 12 - --graph --boundary ^C3
# passed all 12 test(s)
1..12

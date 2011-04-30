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
not ok - 19 an obfuscated email added
#	sed -e "1i No robots allowed" < file > file.new &&
#	     mv file.new file &&
#	     GIT_AUTHOR_NAME="E" GIT_AUTHOR_EMAIL="E at test dot git" git commit -a -m "norobots"
not ok - 20 obfuscated email parsed
#	check_count A 1 B 1 B1 1 B2 1 "A U Thor" 1 C 1 D 1 E 1
ok 21 - Annotating an old revision works
# failed 2 among 21 test(s)
1..21

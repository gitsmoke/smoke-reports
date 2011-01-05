Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3902-quoted/.git/
expecting success: 

	mkdir "$FN" &&
	for_each_name "echo initial >\"\$name\"" &&
	git add . &&
	git commit -q -m Initial &&

	for_each_name "echo second >\"\$name\"" &&
	git commit -a -m Second &&

	for_each_name "echo modified >\"\$name\""


[master 27dd415] Second
 Author: A U Thor <author@example.com>
 11 files changed, 11 insertions(+), 11 deletions(-)

ok 1 - setup

expecting success: 
cat >expect.quoted <<\EOF &&
Name
"Name and a
LF"
"Name and an	HT"
"Name\""
With SP in it
"\346\277\261\351\207\216	\347\264\224"
"\346\277\261\351\207\216
\347\264\224"
"\346\277\261\351\207\216 \347\264\224"
"\346\277\261\351\207\216\"\347\264\224"
"\346\277\261\351\207\216/file"
"\346\277\261\351\207\216\347\264\224"
EOF

cat >expect.raw <<\EOF
Name
"Name and a
LF"
"Name and an	HT"
"Name\""
With SP in it
"濱野	純"
"濱野
純"
濱野 純
"濱野\"純"
濱野/file
濱野純
EOF


ok 2 - setup expected files

expecting success: 

	git ls-files >current && test_cmp expect.quoted current



ok 3 - check fully quoted output from ls-files

expecting success: 

	git diff --name-only >current &&
	test_cmp expect.quoted current



ok 4 - check fully quoted output from diff-files

expecting success: 

	git diff --name-only HEAD >current &&
	test_cmp expect.quoted current

ok 5 - check fully quoted output from diff-index

expecting success: 

	git diff --name-only HEAD^ HEAD >current &&
	test_cmp expect.quoted current



ok 6 - check fully quoted output from diff-tree

expecting success: 

	git ls-tree --name-only -r HEAD >current &&
	test_cmp expect.quoted current



ok 7 - check fully quoted output from ls-tree

expecting success: 

	git config --bool core.quotepath false

ok 8 - setting core.quotepath

expecting success: 

	git ls-files >current && test_cmp expect.raw current

ok 9 - check fully quoted output from ls-files

expecting success: 

	git diff --name-only >current &&
	test_cmp expect.raw current

ok 10 - check fully quoted output from diff-files

expecting success: 

	git diff --name-only HEAD >current &&
	test_cmp expect.raw current



ok 11 - check fully quoted output from diff-index

expecting success: 

	git diff --name-only HEAD^ HEAD >current &&
	test_cmp expect.raw current



ok 12 - check fully quoted output from diff-tree

expecting success: 

	git ls-tree --name-only -r HEAD >current &&
	test_cmp expect.raw current



ok 13 - check fully quoted output from ls-tree

# passed all 13 test(s)
1..13

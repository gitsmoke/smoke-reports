Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4016-diff-quote/.git/
expecting success: 
	echo P0.0 >"$P0.0" &&
	echo P0.1 >"$P0.1" &&
	echo P0.2 >"$P0.2" &&
	echo P0.3 >"$P0.3" &&
	echo P1.0 >"$P1.0" &&
	echo P1.2 >"$P1.2" &&
	echo P1.3 >"$P1.3" &&
	git add . &&
	git commit -m initial &&
	git mv "$P0.0" "R$P0.0" &&
	git mv "$P0.1" "R$P1.0" &&
	git mv "$P0.2" "R$P2.0" &&
	git mv "$P0.3" "R$P3.0" &&
	git mv "$P1.0" "R$P0.1" &&
	git mv "$P1.2" "R$P2.1" &&
	git mv "$P1.3" "R$P3.1" &&
	:
[master (root-commit) d4cd119] initial
 Author: A U Thor <author@example.com>
 7 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 "pathname\twith HT.0"
 create mode 100644 "pathname\twith HT.2"
 create mode 100644 "pathname\twith HT.3"
 create mode 100644 pathname.0
 create mode 100644 pathname.1
 create mode 100644 pathname.2
 create mode 100644 pathname.3

ok 1 - setup

expecting success: 
cat >expect <<\EOF
 rename pathname.1 => "Rpathname	with HT.0" (100%)
 rename pathname.3 => "Rpathname
with LF.0" (100%)
 rename "pathname	with HT.3" => "Rpathname
with LF.1" (100%)
 rename pathname.2 => Rpathname with SP.0 (100%)
 rename "pathname	with HT.2" => Rpathname with SP.1 (100%)
 rename pathname.0 => Rpathname.0 (100%)
 rename "pathname	with HT.0" => Rpathname.1 (100%)
EOF


ok 2 - setup expected files

expecting success: 
	git diff --summary -M HEAD >actual &&
	test_cmp expect actual


ok 3 - git diff --summary -M HEAD

expecting success: 
cat >expect <<\EOF
 pathname.1 => "Rpathname	with HT.0"            |    0
 pathname.3 => "Rpathname
with LF.0"            |    0
 "pathname	with HT.3" => "Rpathname
with LF.1" |    0
 pathname.2 => Rpathname with SP.0               |    0
 "pathname	with HT.2" => Rpathname with SP.1    |    0
 pathname.0 => Rpathname.0                       |    0
 "pathname	with HT.0" => Rpathname.1            |    0
 7 files changed, 0 insertions(+), 0 deletions(-)
EOF


ok 4 - setup expected files

expecting success: 
	git diff --stat -M HEAD >actual &&
	test_cmp expect actual


ok 5 - git diff --stat -M HEAD

# passed all 5 test(s)
1..5

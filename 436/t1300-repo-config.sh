Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1300-repo-config/.git/
expecting success: cmp .git/config expect

ok 1 - initial
expecting success: cmp .git/config expect
ok 2 - mixed case
expecting success: cmp .git/config expect
ok 3 - similar section
expecting success: cmp .git/config expect
ok 4 - similar section
expecting success: git config core.penguin kingpin !blue
ok 5 - replace with non-match
expecting success: git config core.penguin "very blue" !kingpin

ok 6 - replace with non-match (actually matching)
expecting success: cmp .git/config expect
ok 7 - non-match result
expecting success: git config --unset beta.baz
ok 8 - unset with cont. lines
expecting success: cmp .git/config expect
ok 9 - unset with cont. lines is correct
expecting success: git config --unset-all beta.haha

ok 10 - multiple unset

expecting success: cmp .git/config expect

ok 11 - multiple unset is correct

expecting success: 
	test_must_fail git config --replace-all beta.haha &&
	test_cmp .git/config2 .git/config


ok 12 - --replace-all missing value

expecting success: git config --replace-all beta.haha gamma
ok 13 - --replace-all
expecting success: cmp .git/config expect
ok 14 - all replaced
expecting success: cmp .git/config expect

ok 15 - really mean test
expecting success: cmp .git/config expect
ok 16 - really really mean test
expecting success: test alpha = $(git config beta.haha)
ok 17 - get value
expecting success: cmp .git/config expect

ok 18 - unset
expecting success: cmp .git/config expect
ok 19 - multivar
expecting success: git config --get nextsection.nonewline !for
wow
ok 20 - non-match

expecting success: test wow = $(git config --get nextsection.nonewline !for)

ok 21 - non-match value

expecting success: 
	test_must_fail git config --get nextsection.nonewline

wow

ok 22 - ambiguous get

expecting success: git config --get-all nextsection.nonewline
wow
wow2 for me

ok 23 - get multivar
expecting success: cmp .git/config expect
ok 24 - multivar replace
expecting success: 
	test_must_fail git config nextsection.nonewline
wow3
ok 25 - ambiguous value
expecting success: 
	test_must_fail git config --unset nextsection.nonewline
ok 26 - ambiguous unset
expecting success: 
	test_must_fail git config --unset somesection.nonewline

ok 27 - invalid unset
expecting success: cmp .git/config expect
ok 28 - multivar unset
expecting success: test_must_fail git config inval.2key blabla
ok 29 - invalid key

expecting success: git config 123456.a123 987

ok 30 - correct key
expecting success: git config Version.1.2.3eX.Alpha beta
ok 31 - hierarchical section
expecting success: cmp .git/config expect
ok 32 - hierarchical section value
expecting success: git config --list > output && cmp output expect
ok 33 - working --list
expecting success: 
	git --git-dir=nonexistent config --list >output &&
	test_cmp expect output

ok 34 - --list without repo produces empty output
expecting success: git config --get-regexp in > output && cmp output expect
ok 35 - --get-regexp
expecting success: git config --get-all nextsection.nonewline > output && cmp output expect
ok 36 - --add
expecting success: git config --get novalue.variable ^$
ok 37 - get variable with no value
expecting success: git config --get emptyvalue.variable ^$
ok 38 - get variable with empty value
expecting success: git config --get-regexp novalue > output &&
	 cmp output expect

ok 39 - get-regexp variable with no value
expecting success: git config --get-regexp emptyvalue > output &&
	 cmp output expect

ok 40 - get-regexp variable with empty value

expecting success: git config --bool novalue.variable > output &&
	 cmp output expect

ok 41 - get bool variable with no value
expecting success: git config --bool emptyvalue.variable > output &&
	 cmp output expect

ok 42 - get bool variable with empty value
expecting success: 
	test_must_fail git config >output 2>&1 &&
	grep usage output
usage: git config [options]
ok 43 - no arguments, but no crash
expecting success: cmp .git/config expect
ok 44 - new section is partial match of another
expecting success: cmp .git/config expect

ok 45 - new variable inserts into proper section

expecting success: test_must_fail git config --file non-existing-config -l

ok 46 - alternative GIT_CONFIG (non-existing file should fail)
expecting success: cmp output expect
ok 47 - alternative GIT_CONFIG
expecting success: git config --file other-config -l > output && cmp output expect
ok 48 - alternative GIT_CONFIG (--file)
expecting success: 
	mkdir x &&
	(
		cd x &&
		echo strasse >expect
		git config --get --file ../other-config ein.bahn >actual &&
		test_cmp expect actual
	)

ok 49 - refer config from subdirectory
expecting success: cmp other-config expect
ok 50 - --set in alternative GIT_CONFIG
expecting success: git config --rename-section branch.eins branch.zwei
ok 51 - rename section
expecting success: test_cmp expect .git/config

ok 52 - rename succeeded

expecting success: 
	test_must_fail git config --rename-section \
		branch."world domination" branch.drei
ok 53 - rename non-existing section
expecting success: test_cmp expect .git/config

ok 54 - rename succeeded

expecting success: git config --rename-section branch."1 234 blabl/a" branch.drei

ok 55 - rename another section
expecting success: test_cmp expect .git/config
ok 56 - rename succeeded
expecting success: git config --rename-section branch.vier branch.zwei
ok 57 - rename a section with a var on the same line
expecting success: test_cmp expect .git/config
ok 58 - rename succeeded
expecting success: git config --remove-section branch.zwei
ok 59 - remove section
expecting success: test_cmp expect .git/config
ok 60 - section was removed properly
expecting success: 

	git config gitcvs.enabled true &&
	git config gitcvs.ext.dbname %Ggitcvs1.%a.%m.sqlite &&
	git config gitcvs.dbname %Ggitcvs2.%a.%m.sqlite &&
	cmp .git/config expect

ok 61 - section ending

expecting success: 

	git config kilo.gram 1k &&
	git config mega.ton 1m &&
	k=$(git config --int --get kilo.gram) &&
	test z1024 = "z$k" &&
	m=$(git config --int --get mega.ton) &&
	test z1048576 = "z$m"

ok 62 - numbers
expecting success: 

	git config aninvalid.unit "1auto" &&
	s=$(git config aninvalid.unit) &&
	test "z1auto" = "z$s" &&
	if git config --int --get aninvalid.unit 2>actual
	then
		echo config should have failed
		false
	fi &&
	cmp actual expect

ok 63 - invalid unit
expecting success: 

	git config bool.true1 01 &&
	git config bool.true2 -1 &&
	git config bool.true3 YeS &&
	git config bool.true4 true &&
	git config bool.false1 000 &&
	git config bool.false2 "" &&
	git config bool.false3 nO &&
	git config bool.false4 FALSE &&
	rm -f result &&
	for i in 1 2 3 4
	do
	    git config --bool --get bool.true$i >>result
	    git config --bool --get bool.false$i >>result
        done &&
	cmp expect result

ok 64 - bool

expecting success: 

	git config bool.nobool foobar &&
	test_must_fail git config --bool --get bool.nobool
ok 65 - invalid bool (--get)
expecting success: 

	test_must_fail git config --bool bool.nobool foobar

ok 66 - invalid bool (set)
expecting success: 

	git config --bool bool.true1 01 &&
	git config --bool bool.true2 -1 &&
	git config --bool bool.true3 YeS &&
	git config --bool bool.true4 true &&
	git config --bool bool.false1 000 &&
	git config --bool bool.false2 "" &&
	git config --bool bool.false3 nO &&
	git config --bool bool.false4 FALSE &&
	cmp expect .git/config

ok 67 - set --bool
expecting success: 

	git config --int int.val1 01 &&
	git config --int int.val2 -1 &&
	git config --int int.val3 5m &&
	cmp expect .git/config

ok 68 - set --int
expecting success: 
	(
		echo "[bool]"
		echo true1
		echo true2 = true
		echo false = false
		echo "[int]"
		echo int1 = 0
		echo int2 = 1
		echo int3 = -1
	) >>.git/config &&
	test $(git config --bool-or-int bool.true1) = true &&
	test $(git config --bool-or-int bool.true2) = true &&
	test $(git config --bool-or-int bool.false) = false &&
	test $(git config --bool-or-int int.int1) = 0 &&
	test $(git config --bool-or-int int.int2) = 1 &&
	test $(git config --bool-or-int int.int3) = -1

ok 69 - get --bool-or-int
expecting success: 
	git config --bool-or-int bool.true1 true &&
	git config --bool-or-int bool.false1 false &&
	git config --bool-or-int bool.true2 yes &&
	git config --bool-or-int bool.false2 no &&
	git config --bool-or-int int.int1 0 &&
	git config --bool-or-int int.int2 1 &&
	git config --bool-or-int int.int3 -1 &&
	test_cmp expect .git/config

ok 70 - set --bool-or-int
expecting success: 
	git config --path path.home "~/" &&
	git config --path path.normal "/dev/null" &&
	git config --path path.trailingtilde "foo~" &&
	test_cmp expect .git/config

ok 71 - set --path
expecting success: 
	git config --get --path path.home > result &&
	git config --get --path path.normal >> result &&
	git config --get --path path.trailingtilde >> result &&
	test_cmp expect result

ok 72 - get --path

expecting success: 
	(
		unset HOME;
		test_must_fail git config --get --path path.home \
			>result 2>msg &&
		git config --get --path path.normal >>result &&
		git config --get --path path.trailingtilde >>result
	) &&
	grep "[Ff]ailed to expand.*~/" msg &&
	test_cmp expect result
fatal: Failed to expand user dir in: '~/'
ok 73 - get --path copes with unset $HOME
expecting success: cmp .git/config expect
ok 74 - quoting
expecting success: 
	test_must_fail git config "key.with
newline" 123
ok 75 - key with newline
expecting success: git config key.sub value.with\\
newline

ok 76 - value with newline
expecting success: cmp result expect
ok 77 - value continued on next line
expecting success: cmp result expect

ok 78 - --null --list
expecting success: cmp result expect

ok 79 - --null --get-regexp

expecting success: 
	git config section.val "foo 	  bar" &&
	test "z$(git config section.val)" = "zfoo 	  bar"


ok 80 - inner whitespace kept verbatim

expecting success: 

	ln -s notyet myconfig &&
	GIT_CONFIG=myconfig git config test.frotz nitfol &&
	test -h myconfig &&
	test -f notyet &&
	test "z$(GIT_CONFIG=notyet git config test.frotz)" = znitfol &&
	GIT_CONFIG=myconfig git config test.xyzzy rezrov &&
	test -h myconfig &&
	test -f notyet &&
	test "z$(GIT_CONFIG=notyet git config test.frotz)" = znitfol &&
	test "z$(GIT_CONFIG=notyet git config test.xyzzy)" = zrezrov

ok 81 - symlinked configuration

expecting success: 
	(
		GIT_CONFIG=doesnotexist &&
		export GIT_CONFIG &&
		test_must_fail git config --list &&
		test_must_fail git config test.xyzzy
	)
ok 82 - nonexistent configuration
expecting success: 
	ln -s doesnotexist linktonada &&
	ln -s linktonada linktolinktonada &&
	(
		GIT_CONFIG=linktonada &&
		export GIT_CONFIG &&
		test_must_fail git config --list &&
		GIT_CONFIG=linktolinktonada &&
		test_must_fail git config --list
	)
ok 83 - symlink to nonexistent configuration
expecting success: 
	git config alias.split-cmdline-fix 'echo "' &&
	test_must_fail git split-cmdline-fix &&
	echo foo > foo &&
	git add foo &&
	git commit -m 'initial commit' &&
	git config branch.master.mergeoptions 'echo "' &&
	test_must_fail git merge master
	
[master (root-commit) 1a5c5a1] initial commit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 foo
ok 84 - check split_cmdline return
expecting success: 
	test "z$(git -c name=value config name)" = zvalue &&
	test "z$(git -c core.name=value config core.name)" = zvalue &&
	test "z$(git -c CamelCase=value config camelcase)" = zvalue &&
	test "z$(git -c flag config --bool flag)" = ztrue &&
	test_must_fail git -c core.name=value config name

ok 85 - git -c "key=value" support

# passed all 85 test(s)
1..85

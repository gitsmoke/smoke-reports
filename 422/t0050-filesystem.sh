Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0050-filesystem/.git/
expecting success: 

	test_case=test_expect_success &&
	test_unicode=test_expect_success &&
	mkdir junk &&
	echo good >junk/CamelCase &&
	echo bad >junk/camelcase &&
	if test "$(cat junk/CamelCase)" != good
	then
		test_case=test_expect_failure &&
		case_insensitive=t
	fi &&
	rm -fr junk &&
	mkdir junk &&
	>junk/"$auml" &&
	case "$(cd junk && echo *)" in
	"$aumlcdiar")
		test_unicode=test_expect_failure &&
		unibad=t
		;;
	*)	;;
	esac &&
	rm -fr junk &&
	{
		ln -s x y 2> /dev/null &&
		test -h y 2> /dev/null ||
		no_symlinks=1 &&
		rm -f y
	}

ok 1 - see what we expect

will test on a case insensitive filesystem
will test on a unicode corrupting filesystem
expecting success: 

	test $(git config --bool core.ignorecase) = true

ok 2 - detection of case insensitive filesystem during repo init

expecting success: 

	test_must_fail git config --bool core.symlinks ||
	test "$(git config --bool core.symlinks)" = true

ok 3 - detection of filesystem w/o symlink support during repo init

expecting success: 

	git config core.ignorecase true &&
	touch camelcase &&
	git add camelcase &&
	git commit -m "initial" &&
	git tag initial &&
	git checkout -b topic &&
	git mv camelcase tmp &&
	git mv tmp CamelCase &&
	git commit -m "rename" &&
	git checkout -f master
[master (root-commit) 52772e7] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 camelcase
[topic edb5b87] rename
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename camelcase => CamelCase (100%)
ok 4 - setup case tests
checking known breakage: 

	git mv camelcase CamelCase &&
	git commit -m "rename"
not ok 5 - rename (case change) # TODO known breakage
checking known breakage: 

	rm -f CamelCase &&
	rm -f camelcase &&
	git reset --hard initial &&
	git merge topic
HEAD is now at 52772e7 initial
Updating 52772e7..edb5b87
Fast-forward
 camelcase => CamelCase |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename camelcase => CamelCase (100%)

ok 6 - merge (case change) # TODO known breakage
checking known breakage: 

	git reset --hard initial &&
	rm camelcase &&
	echo 1 >CamelCase &&
	git add CamelCase &&
	camel=$(git ls-files | grep -i camelcase) &&
	test $(echo "$camel" | wc -l) = 1 &&
	test "z$(git cat-file blob :$camel)" = z1
HEAD is now at 52772e7 initial

not ok 7 - add (with different case) # TODO known breakage

expecting success: 

  test_create_repo unicode &&
  cd unicode &&
  touch "$aumlcdiar" &&
  git add "$aumlcdiar" &&
  git commit -m initial &&
  git tag initial &&
  git checkout -b topic &&
  git mv $aumlcdiar tmp &&
  git mv tmp "$auml" &&
  git commit -m rename &&
  git checkout -f master
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0050-filesystem/unicode/.git/
[master (root-commit) 8f78ef1] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 "a\314\210"
[topic 53b55c7] rename
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename "a\314\210" => "\303\244" (100%)
ok 8 - setup unicode normalization tests

checking known breakage: 

 git mv "$aumlcdiar" "$auml" &&
 git commit -m rename

not ok 9 - rename (silent unicode normalization) # TODO known breakage
checking known breakage: 

 git reset --hard initial &&
 git merge topic
HEAD is now at 8f78ef1 initial
Updating 8f78ef1..53b55c7
Aborting

not ok 10 - merge (silent unicode normalization) # TODO known breakage

# fixed 1 known breakage(s)
# still have 4 known breakage(s)
# passed all remaining 6 test(s)
1..10

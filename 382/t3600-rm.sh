Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3600-rm/.git/
expecting success: touch -- foo bar baz 'space embedded' -q &&
     git add -- foo bar baz 'space embedded' -q &&
     git commit -m 'add normal files'
[master (root-commit) 1241b3d] add normal files
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 -q
 create mode 100644 bar
 create mode 100644 baz
 create mode 100644 foo
 create mode 100644 space embedded

ok 1 - Initialize test directory

expecting success: 
     git add -- 'tab	embedded' 'newline
embedded' &&
     git commit -m 'add files with tabs and newlines'

[master 618ba8e] add files with tabs and newlines
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 "newline\nembedded"
 create mode 100644 "tab\tembedded"

ok 2 - add files with funny names

expecting success: [ -f foo ] && git ls-files --error-unmatch foo
foo

ok 3 - Pre-check that foo exists and is in index before git rm foo

expecting success: git rm --cached foo
rm 'foo'

ok 4 - Test that git rm foo succeeds

expecting success: echo content > foo
     git add foo
     git rm --cached foo
rm 'foo'

ok 5 - Test that git rm --cached foo succeeds if the index matches the file

expecting success: echo content > foo
     git add foo
     git commit -m foo
     echo "other content" > foo
     git rm --cached foo
[master abc2e42] foo
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
rm 'foo'

ok 6 - Test that git rm --cached foo succeeds if the index matches the file

expecting success: 
     echo content > foo
     git add foo
     git commit -m foo
     echo "other content" > foo
     git add foo
     echo "yet another content" > foo
     test_must_fail git rm --cached foo

# On branch master
nothing to commit (working directory clean)

ok 7 - Test that git rm --cached foo fails if the index matches neither the file nor HEAD

expecting success: echo content > foo
     git add foo
     git commit -m foo
     echo "other content" > foo
     git add foo
     echo "yet another content" > foo
     git rm --cached -f foo
# On branch master
nothing to commit (working directory clean)
rm 'foo'

ok 8 - Test that git rm --cached -f foo works in case where --cached only did not

expecting success: [ -f foo ] && test_must_fail git ls-files --error-unmatch foo

ok 9 - Post-check that foo exists but is not in index after git rm foo

expecting success: [ -f bar ] && git ls-files --error-unmatch bar
bar

ok 10 - Pre-check that bar exists and is in index before "git rm bar"

expecting success: git rm bar
rm 'bar'

ok 11 - Test that "git rm bar" succeeds

expecting success: ! [ -f bar ] && test_must_fail git ls-files --error-unmatch bar

ok 12 - Post-check that bar does not exist and is not in index after "git rm -f bar"

expecting success: git rm -- -q
rm '-q'

ok 13 - Test that "git rm -- -q" succeeds (remove a file that looks like an option)

expecting success: git rm -f 'space embedded' 'tab	embedded' 'newline
embedded'
rm 'newline
embedded'
rm 'space embedded'
rm 'tab	embedded'

ok 14 - Test that "git rm -f" succeeds with embedded space, tab, or newline characters.

expecting success: 
	chmod a-w . &&
	test_must_fail git rm -f baz &&
	chmod 775 .

rm 'baz'

ok 15 - Test that "git rm -f" fails if its rm fails

expecting success: git ls-files --error-unmatch baz
baz

ok 16 - When the rm in "git rm -f" fails, it should not remove the file from the index

expecting success: 
	git rm --ignore-unmatch nonexistent


ok 17 - Remove nonexistent file with --ignore-unmatch

expecting success: 
	echo frotz > test-file &&
	git add test-file &&
	git commit -m "add file for rm test" &&
	git rm test-file > rm-output &&
	test `grep "^rm " rm-output | wc -l` = 1 &&
	rm -f test-file rm-output &&
	git commit -m "remove file from rm test"
[master ab1f95d] add file for rm test
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 1 deletions(-)
 delete mode 100644 -q
 delete mode 100644 bar
 delete mode 100644 foo
 delete mode 100644 "newline\nembedded"
 delete mode 100644 space embedded
 delete mode 100644 "tab\tembedded"
 create mode 100644 test-file
[master 4889120] remove file from rm test
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 test-file

ok 18 - "rm" command printed

expecting success: 
	echo frotz > test-file &&
	git add test-file &&
	git commit -m "add file for rm --quiet test" &&
	git rm --quiet test-file > rm-output &&
	test `wc -l < rm-output` = 0 &&
	rm -f test-file rm-output &&
	git commit -m "remove file from rm --quiet test"

[master ab26d77] add file for rm --quiet test
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 test-file
[master 414cdc1] remove file from rm --quiet test
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 test-file

ok 19 - "rm" command suppressed with --quiet

expecting success: 
	git add foo baz &&
	git ls-files --error-unmatch foo baz

baz
foo

ok 20 - Re-add foo and baz

expecting success: 
	echo >>foo &&
	test_must_fail git rm foo baz &&
	test -f foo &&
	test -f baz &&
	git ls-files --error-unmatch foo baz

baz
foo

ok 21 - Modify foo -- rm should refuse

expecting success: 
	git rm -f foo baz &&
	test ! -f foo &&
	test ! -f baz &&
	test_must_fail git ls-files --error-unmatch foo &&
	test_must_fail git ls-files --error-unmatch bar

rm 'baz'
rm 'foo'

ok 22 - Modified foo -- rm -f should work

expecting success: 
	echo frotz >foo &&
	git checkout HEAD -- baz &&
	git add foo baz &&
	git ls-files --error-unmatch foo baz

baz
foo

ok 23 - Re-add foo and baz for HEAD tests

expecting success: 
	test_must_fail git rm foo baz &&
	test -f foo &&
	test -f baz &&
	git ls-files --error-unmatch foo baz
baz
foo

ok 24 - foo is different in index from HEAD -- rm should refuse

expecting success: 
	git rm -f foo baz &&
	test ! -f foo &&
	test ! -f baz &&
	test_must_fail git ls-files --error-unmatch foo
	test_must_fail git ls-files --error-unmatch baz
rm 'baz'
rm 'foo'

ok 25 - but with -f it should work.

expecting success: 
	>empty &&
	git add empty &&
	echo content >empty &&
	test_must_fail git rm --cached empty
ok 26 - refuse to remove cached empty file with modifications

expecting success: 
	echo content >intent-to-add &&
	git add -N intent-to-add
	git rm --cached intent-to-add
rm 'intent-to-add'
ok 27 - remove intent-to-add file without --force
expecting success: 
	mkdir -p frotz &&
	echo qfwfq >frotz/nitfol &&
	git add frotz &&
	git commit -m "subdir test"
[master cac9b15] subdir test
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 0 deletions(-)
 rename baz => empty (100%)
 create mode 100644 frotz/nitfol

ok 28 - Recursive test setup

expecting success: 
	test_must_fail git rm frotz &&
	test -d frotz &&
	test -f frotz/nitfol


ok 29 - Recursive without -r fails

expecting success: 
	echo qfwfq >>frotz/nitfol
	test_must_fail git rm -r frotz &&
	test -d frotz &&
	test -f frotz/nitfol


ok 30 - Recursive with -r but dirty

expecting success: 
	git rm -f -r frotz &&
	! test -f frotz/nitfol &&
	! test -d frotz

rm 'frotz/nitfol'

ok 31 - Recursive with -r -f

expecting success: 
	test_must_fail git rm nonexistent


ok 32 - Remove nonexistent file returns nonzero exit status

expecting success: 
	mkdir repo &&
	(cd repo &&
	 git init &&
	 echo something > somefile &&
	 git add somefile &&
	 git commit -m "add a file" &&
	 (cd .. &&
	  git --git-dir=repo/.git --work-tree=repo rm somefile) &&
	test_must_fail git ls-files --error-unmatch somefile)

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3600-rm/repo/.git/
[master (root-commit) 4ecc2e4] add a file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 somefile
rm 'somefile'

ok 33 - Call "rm" from outside the work tree

expecting success: 

	git reset --hard &&
	test-chmtime -86400 frotz/nitfol &&
	git rm frotz/nitfol &&
	test ! -f frotz/nitfol


HEAD is now at cac9b15 subdir test
rm 'frotz/nitfol'

ok 34 - refresh index before checking if it is up-to-date

expecting success: 
	git reset -q --hard &&
	H=0000000000000000000000000000000000000000 &&
	i=0 &&
	while test $i -lt 12000
	do
	    echo "100644 $H 0	some-file-$i"
	    i=$(( $i + 1 ))
	done | git update-index --index-info &&
	git rm -n "some-file-*" | :;
	test -f .git/index.lock
	status=$?
	rm -f .git/index.lock
	git reset -q --hard
	test "$status" != 0

ok 35 - choking "git rm" should not let it die with cruft

expecting success: 
	mkdir -p dir/subdir/subsubdir &&
	echo content >dir/subdir/subsubdir/file &&
	git add dir/subdir/subsubdir/file &&
	git rm -f dir/subdir/subsubdir/file &&
	! test -d dir

rm 'dir/subdir/subsubdir/file'

ok 36 - rm removes subdirectories recursively

# passed all 36 test(s)
1..36

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0020-crlf/.git/
expecting success: 

	git config core.autocrlf false &&

	for w in Hello world how are you; do echo $w; done >one &&
	mkdir dir &&
	for w in I am very very fine thank you; do echo $w; done >dir/two &&
	for w in Oh here is NULQin text here; do echo $w; done | q_to_nul >three &&
	git add . &&

	git commit -m initial &&

	one=`git rev-parse HEAD:one` &&
	dir=`git rev-parse HEAD:dir` &&
	two=`git rev-parse HEAD:dir/two` &&
	three=`git rev-parse HEAD:three` &&

	for w in Some extra lines here; do echo $w; done >>one &&
	git diff >patch.file &&
	patched=`git hash-object --stdin <one` &&
	git read-tree --reset -u HEAD &&

	echo happy.
[master (root-commit) 90956b3] initial
 Author: A U Thor <author@example.com>
 3 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 dir/two
 create mode 100644 one
 create mode 100644 three
happy.

ok 1 - setup
expecting success: 

	git config core.autocrlf input &&
	git config core.safecrlf true &&

	for w in I am all CRLF; do echo $w; done | append_cr >allcrlf &&
	test_must_fail git add allcrlf

ok 2 - safecrlf: autocrlf=input, all CRLF

expecting success: 

	git config core.autocrlf input &&
	git config core.safecrlf true &&

	for w in Oh here is CRLFQ in text; do echo $w; done | q_to_cr >mixed &&
	test_must_fail git add mixed
ok 3 - safecrlf: autocrlf=input, mixed LF/CRLF

expecting success: 

	git config core.autocrlf true &&
	git config core.safecrlf true &&

	for w in I am all LF; do echo $w; done >alllf &&
	test_must_fail git add alllf

ok 4 - safecrlf: autocrlf=true, all LF

expecting success: 

	git config core.autocrlf true &&
	git config core.safecrlf true &&

	for w in Oh here is CRLFQ in text; do echo $w; done | q_to_cr >mixed &&
	test_must_fail git add mixed
ok 5 - safecrlf: autocrlf=true mixed LF/CRLF
expecting success: 

	git config core.autocrlf input &&
	git config core.safecrlf warn &&

	for w in I am all LF; do echo $w; done >doublewarn &&
	git add doublewarn &&
	git commit -m "nowarn" &&
	for w in Oh here is CRLFQ in text; do echo $w; done | q_to_cr >doublewarn &&
	test $(git add doublewarn 2>&1 | grep "CRLF will be replaced by LF" | wc -l) = 1
[master f7686a4] nowarn
 Author: A U Thor <author@example.com>
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 doublewarn

ok 6 - safecrlf: print warning only once

expecting success: 
	git config core.autocrlf false &&
	git config core.safecrlf false &&
	git reset --hard HEAD^
HEAD is now at 90956b3 initial
ok 7 - switch off autocrlf, safecrlf, reset HEAD
expecting success: 

	rm -f tmp one dir/two three &&
	git read-tree --reset -u HEAD &&
	git config core.autocrlf input &&

	for f in one dir/two
	do
		append_cr <$f >tmp && mv -f tmp $f &&
		git update-index -- $f || {
			echo Oops
			false
			break
		}
	done &&

	differs=`git diff-index --cached HEAD` &&
	test -z "$differs" || {
		echo Oops "$differs"
		false
	}

ok 8 - update with autocrlf=input

expecting success: 

	rm -f tmp one dir/two three &&
	git read-tree --reset -u HEAD &&
	git config core.autocrlf true &&

	for f in one dir/two
	do
		append_cr <$f >tmp && mv -f tmp $f &&
		git update-index -- $f || {
			echo "Oops $f"
			false
			break
		}
	done &&

	differs=`git diff-index --cached HEAD` &&
	test -z "$differs" || {
		echo Oops "$differs"
		false
	}

ok 9 - update with autocrlf=true

expecting success: 

	rm -f tmp one dir/two three &&
	git config core.autocrlf true &&
	git read-tree --reset -u HEAD &&

	for f in one dir/two
	do
		remove_cr <"$f" >tmp && mv -f tmp $f &&
		git update-index -- $f || {
			echo "Eh? $f"
			false
			break
		}
	done &&
	test "$one" = `git hash-object --stdin <one` &&
	test "$two" = `git hash-object --stdin <dir/two` &&
	differs=`git diff-index --cached HEAD` &&
	test -z "$differs" || {
		echo Oops "$differs"
		false
	}

ok 10 - checkout with autocrlf=true

expecting success: 

	rm -f tmp one dir/two three &&
	git config core.autocrlf input &&
	git read-tree --reset -u HEAD &&

	for f in one dir/two
	do
		if has_cr "$f"
		then
			echo "Eh? $f"
			false
			break
		else
			git update-index -- $f
		fi
	done &&
	test "$one" = `git hash-object --stdin <one` &&
	test "$two" = `git hash-object --stdin <dir/two` &&
	differs=`git diff-index --cached HEAD` &&
	test -z "$differs" || {
		echo Oops "$differs"
		false
	}

ok 11 - checkout with autocrlf=input

expecting success: 

	rm -f tmp one dir/two three &&
	git config core.autocrlf input &&
	git read-tree --reset -u HEAD &&

	git apply patch.file &&
	test "$patched" = "`git hash-object --stdin <one`" || {
		echo "Eh?  apply without index"
		false
	}

ok 12 - apply patch (autocrlf=input)

expecting success: 

	rm -f tmp one dir/two three &&
	git config core.autocrlf input &&
	git read-tree --reset -u HEAD &&

	git apply --cached patch.file &&
	test "$patched" = `git rev-parse :one` || {
		echo "Eh?  apply with --cached"
		false
	}

ok 13 - apply patch --cached (autocrlf=input)

expecting success: 

	rm -f tmp one dir/two three &&
	git config core.autocrlf input &&
	git read-tree --reset -u HEAD &&

	git apply --index patch.file &&
	test "$patched" = `git rev-parse :one` &&
	test "$patched" = `git hash-object --stdin <one` || {
		echo "Eh?  apply with --index"
		false
	}

ok 14 - apply patch --index (autocrlf=input)

expecting success: 

	rm -f tmp one dir/two three &&
	git config core.autocrlf true &&
	git read-tree --reset -u HEAD &&

	git apply patch.file &&
	test "$patched" = "`remove_cr <one | git hash-object --stdin`" || {
		echo "Eh?  apply without index"
		false
	}

ok 15 - apply patch (autocrlf=true)

expecting success: 

	rm -f tmp one dir/two three &&
	git config core.autocrlf true &&
	git read-tree --reset -u HEAD &&

	git apply --cached patch.file &&
	test "$patched" = `git rev-parse :one` || {
		echo "Eh?  apply without index"
		false
	}

ok 16 - apply patch --cached (autocrlf=true)

expecting success: 

	rm -f tmp one dir/two three &&
	git config core.autocrlf true &&
	git read-tree --reset -u HEAD &&

	git apply --index patch.file &&
	test "$patched" = `git rev-parse :one` &&
	test "$patched" = "`remove_cr <one | git hash-object --stdin`" || {
		echo "Eh?  apply with --index"
		false
	}

ok 17 - apply patch --index (autocrlf=true)

expecting success: 

	rm -f tmp one dir/two three &&
	echo "two -crlf" >.gitattributes &&
	git config core.autocrlf true &&
	git read-tree --reset -u HEAD &&

	if has_cr dir/two
	then
		echo "Huh?"
		false
	else
		: happy
	fi &&

	if has_cr one
	then
		: happy
	else
		echo "Huh?"
		false
	fi &&

	if has_cr three
	then
		echo "Huh?"
		false
	else
		: happy
	fi


ok 18 - .gitattributes says two is binary

expecting success: 

	rm -f tmp one dir/two three &&
	echo "two crlf=input" >.gitattributes &&
	git read-tree --reset -u HEAD &&

	if has_cr dir/two
	then
		echo "Huh?"
		false
	else
		: happy
	fi

ok 19 - .gitattributes says two is input

expecting success: 

	rm -f tmp one dir/two three &&
	echo "t* crlf" >.gitattributes &&
	git read-tree --reset -u HEAD &&

	if has_cr dir/two
	then
		: happy
	else
		echo "Huh?"
		false
	fi &&

	if has_cr three
	then
		: happy
	else
		echo "Huh?"
		false
	fi

ok 20 - .gitattributes says two and three are text

expecting success: 

	echo "one -crlf" >>.gitattributes &&
	git add .gitattributes &&
	git commit -m "Add .gitattributes" &&

	rm -rf tmp one dir .gitattributes patch.file three &&
	git read-tree --reset -u HEAD &&

	if has_cr one
	then
		echo "Eh? one should not have CRLF"
		false
	else
		: happy
	fi &&
	has_cr three || {
		echo "Eh? three should still have CRLF"
		false
	}
[master f7c68d4] Add .gitattributes
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 .gitattributes

ok 21 - in-tree .gitattributes (1)
expecting success: 

	rm -rf tmp one dir .gitattributes patch.file three &&
	git read-tree --reset HEAD &&
	git checkout-index -f -q -u -a &&

	if has_cr one
	then
		echo "Eh? one should not have CRLF"
		false
	else
		: happy
	fi &&
	has_cr three || {
		echo "Eh? three should still have CRLF"
		false
	}

ok 22 - in-tree .gitattributes (2)

expecting success: 

	rm -rf tmp one dir .gitattributes patch.file three &&
	git read-tree --reset HEAD &&
	git checkout-index -u .gitattributes &&
	git checkout-index -u one dir/two three &&

	if has_cr one
	then
		echo "Eh? one should not have CRLF"
		false
	else
		: happy
	fi &&
	has_cr three || {
		echo "Eh? three should still have CRLF"
		false
	}

ok 23 - in-tree .gitattributes (3)

expecting success: 

	rm -rf tmp one dir .gitattributes patch.file three &&
	git read-tree --reset HEAD &&
	git checkout-index -u one dir/two three &&
	git checkout-index -u .gitattributes &&

	if has_cr one
	then
		echo "Eh? one should not have CRLF"
		false
	else
		: happy
	fi &&
	has_cr three || {
		echo "Eh? three should still have CRLF"
		false
	}

ok 24 - in-tree .gitattributes (4)

expecting success: 

	git config core.autocrlf true &&
	git config --unset core.safecrlf &&
	echo ".file2 -crlfQ" | q_to_cr >> .gitattributes &&
	git add .gitattributes &&
	git commit -m initial &&
	echo ".file -crlfQ" | q_to_cr >> .gitattributes &&
	echo "contents" > .file &&
	git add .gitattributes .file &&
	git commit -m second &&

	git checkout master~1 &&
	git checkout master &&
	test "$(git diff-files --raw)" = ""


[master 085bdd2] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 030b385] second
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 .file

ok 25 - checkout with existing .gitattributes

expecting success: 

	git rm .gitattributes &&
	echo "contentsQ" | q_to_cr > .file2 &&
	git add .file2 &&
	git commit -m third &&

	git checkout master~1 &&
	git checkout master &&
	has_cr .file2


rm '.gitattributes'
[master 0334638] third
 Author: A U Thor <author@example.com>
 2 files changed, 1 insertions(+), 4 deletions(-)
 create mode 100644 .file2
 delete mode 100644 .gitattributes

ok 26 - checkout when deleting .gitattributes

expecting success: 

	echo "three +crlf" >>.gitattributes &&
	git diff



ok 27 - invalid .gitattributes (must not crash)

expecting success: 
	git config core.autocrlf false &&
	git config core.safecrlf false &&
	rm -rf .????* * &&
	for w in I am all LF; do echo $w; done >alllf &&
	for w in Oh here is CRLFQ in text; do echo $w; done | q_to_cr >mixed &&
	for w in I am all CRLF; do echo $w; done | append_cr >allcrlf &&
	git add -A . &&
	git commit -m "alllf, allcrlf and mixed only" &&
	git tag -a -m "message" autocrlf-checkpoint

[master aa2bb53] alllf, allcrlf and mixed only
 Author: A U Thor <author@example.com>
 7 files changed, 8 insertions(+), 14 deletions(-)
 delete mode 100644 .file
 delete mode 100644 .file2
 create mode 100644 allcrlf
 create mode 100644 alllf
 delete mode 100644 dir/two
 rename three => mixed (57%)
 delete mode 100644 one

ok 28 - setting up for new autocrlf tests

expecting success: 
	git config core.autocrlf true &&
	touch * &&
	git diff --exit-code


ok 29 - report no change after setting autocrlf

expecting success: 
	rm * &&
	git checkout -f &&
	git diff --exit-code


ok 30 - files are clean after checkout

expecting success: 
	test "$(cr_to_Q_no_NL < alllf)" = "IQamQallQLFQ"


ok 31 - LF only file gets CRLF with autocrlf

expecting success: 
	test "$(cr_to_Q_no_NL < mixed)" = "OhhereisCRLFQintext"


ok 32 - Mixed file is still mixed with autocrlf

expecting success: 
	test "$(cr_to_Q_no_NL < allcrlf)" = "IQamQallQCRLFQ"


ok 33 - CRLF only file has CRLF with autocrlf

expecting success: 
	tr -d "" < alllf | append_cr > alllf2 &&
	git add alllf2 &&
	git commit -m "alllf2 added" &&
	git config core.autocrlf false &&
	rm * &&
	git checkout -f &&
	test_cmp alllf alllf2

[master ff9d239] alllf2 added
 Author: A U Thor <author@example.com>
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 alllf2

ok 34 - New CRLF file gets LF in repo

# passed all 34 test(s)
1..34

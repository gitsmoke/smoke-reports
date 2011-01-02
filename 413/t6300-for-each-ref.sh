Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6300-for-each-ref/.git/
expecting success: 
	setdate_and_increment &&
	echo "Using $datestamp" > one &&
	git add one &&
	git commit -m "Initial" &&
	setdate_and_increment &&
	git tag -a -m "Tagging at $datestamp" testtag
[master (root-commit) 67a36f1] Initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 one

ok 1 - Create sample commit with known timestamp
expecting success: 
	git update-ref refs/remotes/origin/master master &&
	git remote add origin nowhere &&
	git config branch.master.remote origin &&
	git config branch.master.merge refs/heads/master

ok 2 - Create upstream config

expecting success: 
		git for-each-ref --format='%(refname)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 3 - basic atom: head refname

expecting success: 
		git for-each-ref --format='%(upstream)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 4 - basic atom: head upstream

expecting success: 
		git for-each-ref --format='%(objecttype)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 5 - basic atom: head objecttype

expecting success: 
		git for-each-ref --format='%(objectsize)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 6 - basic atom: head objectsize

expecting success: 
		git for-each-ref --format='%(objectname)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 7 - basic atom: head objectname

expecting success: 
		git for-each-ref --format='%(tree)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 8 - basic atom: head tree

expecting success: 
		git for-each-ref --format='%(parent)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 9 - basic atom: head parent

expecting success: 
		git for-each-ref --format='%(numparent)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 10 - basic atom: head numparent

expecting success: 
		git for-each-ref --format='%(object)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 11 - basic atom: head object

expecting success: 
		git for-each-ref --format='%(type)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 12 - basic atom: head type

expecting success: 
		git for-each-ref --format='%(author)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 13 - basic atom: head author

expecting success: 
		git for-each-ref --format='%(authorname)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 14 - basic atom: head authorname

expecting success: 
		git for-each-ref --format='%(authoremail)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 15 - basic atom: head authoremail

expecting success: 
		git for-each-ref --format='%(authordate)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 16 - basic atom: head authordate

expecting success: 
		git for-each-ref --format='%(committer)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 17 - basic atom: head committer

expecting success: 
		git for-each-ref --format='%(committername)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 18 - basic atom: head committername

expecting success: 
		git for-each-ref --format='%(committeremail)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 19 - basic atom: head committeremail

expecting success: 
		git for-each-ref --format='%(committerdate)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 20 - basic atom: head committerdate

expecting success: 
		git for-each-ref --format='%(tag)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 21 - basic atom: head tag

expecting success: 
		git for-each-ref --format='%(tagger)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 22 - basic atom: head tagger

expecting success: 
		git for-each-ref --format='%(taggername)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 23 - basic atom: head taggername

expecting success: 
		git for-each-ref --format='%(taggeremail)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 24 - basic atom: head taggeremail

expecting success: 
		git for-each-ref --format='%(taggerdate)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 25 - basic atom: head taggerdate

expecting success: 
		git for-each-ref --format='%(creator)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 26 - basic atom: head creator

expecting success: 
		git for-each-ref --format='%(creatordate)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 27 - basic atom: head creatordate

expecting success: 
		git for-each-ref --format='%(subject)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 28 - basic atom: head subject

expecting success: 
		git for-each-ref --format='%(body)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 29 - basic atom: head body

expecting success: 
		git for-each-ref --format='%(contents)' refs/heads/master >actual &&
		test_cmp expected actual
	

ok 30 - basic atom: head contents

expecting success: 
		git for-each-ref --format='%(refname)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 31 - basic atom: tag refname

expecting success: 
		git for-each-ref --format='%(upstream)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 32 - basic atom: tag upstream

expecting success: 
		git for-each-ref --format='%(objecttype)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 33 - basic atom: tag objecttype

expecting success: 
		git for-each-ref --format='%(objectsize)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 34 - basic atom: tag objectsize

expecting success: 
		git for-each-ref --format='%(objectname)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 35 - basic atom: tag objectname

expecting success: 
		git for-each-ref --format='%(tree)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 36 - basic atom: tag tree
expecting success: 
		git for-each-ref --format='%(parent)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 37 - basic atom: tag parent

expecting success: 
		git for-each-ref --format='%(numparent)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 38 - basic atom: tag numparent

expecting success: 
		git for-each-ref --format='%(object)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 39 - basic atom: tag object

expecting success: 
		git for-each-ref --format='%(type)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 40 - basic atom: tag type

expecting success: 
		git for-each-ref --format='%(author)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 41 - basic atom: tag author

expecting success: 
		git for-each-ref --format='%(authorname)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 42 - basic atom: tag authorname

expecting success: 
		git for-each-ref --format='%(authoremail)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 43 - basic atom: tag authoremail

expecting success: 
		git for-each-ref --format='%(authordate)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 44 - basic atom: tag authordate

expecting success: 
		git for-each-ref --format='%(committer)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 45 - basic atom: tag committer

expecting success: 
		git for-each-ref --format='%(committername)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 46 - basic atom: tag committername

expecting success: 
		git for-each-ref --format='%(committeremail)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 47 - basic atom: tag committeremail

expecting success: 
		git for-each-ref --format='%(committerdate)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 48 - basic atom: tag committerdate

expecting success: 
		git for-each-ref --format='%(tag)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 49 - basic atom: tag tag

expecting success: 
		git for-each-ref --format='%(tagger)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 50 - basic atom: tag tagger

expecting success: 
		git for-each-ref --format='%(taggername)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 51 - basic atom: tag taggername

expecting success: 
		git for-each-ref --format='%(taggeremail)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 52 - basic atom: tag taggeremail

expecting success: 
		git for-each-ref --format='%(taggerdate)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 53 - basic atom: tag taggerdate

expecting success: 
		git for-each-ref --format='%(creator)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 54 - basic atom: tag creator

expecting success: 
		git for-each-ref --format='%(creatordate)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 55 - basic atom: tag creatordate

expecting success: 
		git for-each-ref --format='%(subject)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 56 - basic atom: tag subject

expecting success: 
		git for-each-ref --format='%(body)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 57 - basic atom: tag body
expecting success: 
		git for-each-ref --format='%(contents)' refs/tags/testtag >actual &&
		test_cmp expected actual
	

ok 58 - basic atom: tag contents
expecting success: 
	test_must_fail git for-each-ref --format="%(INVALID)" refs/heads
ok 59 - Check invalid atoms names are errors
expecting success: 
	git for-each-ref --format="%(authordate)" refs/heads &&
	git for-each-ref --format="%(authordate:default) %(authordate)" refs/heads &&
	git for-each-ref --format="%(authordate) %(authordate:default)" refs/heads &&
	git for-each-ref --format="%(authordate:default) %(authordate:default)" refs/heads
Mon Jul 3 17:18:44 2006 +0200
Mon Jul 3 17:18:44 2006 +0200 Mon Jul 3 17:18:44 2006 +0200
Mon Jul 3 17:18:44 2006 +0200 Mon Jul 3 17:18:44 2006 +0200
Mon Jul 3 17:18:44 2006 +0200 Mon Jul 3 17:18:44 2006 +0200

ok 60 - Check format specifiers are ignored in naming date atoms

expecting success: 
	git for-each-ref --format="%(authordate:default)" refs/heads &&
	git for-each-ref --format="%(authordate:relative)" refs/heads &&
	git for-each-ref --format="%(authordate:short)" refs/heads &&
	git for-each-ref --format="%(authordate:local)" refs/heads &&
	git for-each-ref --format="%(authordate:iso8601)" refs/heads &&
	git for-each-ref --format="%(authordate:rfc2822)" refs/heads

Mon Jul 3 17:18:44 2006 +0200
4 years, 6 months ago
2006-07-03
Mon Jul 3 15:18:44 2006
2006-07-03 17:18:44 +0200
Mon, 3 Jul 2006 17:18:44 +0200
ok 61 - Check valid format specifiers for date fields
expecting success: 
	test_must_fail git for-each-ref --format="%(authordate:INVALID)" refs/heads
ok 62 - Check invalid format specifiers are errors
expecting success: 
	(git for-each-ref --shell --format="%(refname) %(committerdate) %(authordate)" refs/heads &&
	git for-each-ref --shell --format="%(refname) %(taggerdate)" refs/tags) >actual &&
	test_cmp expected actual

ok 63 - Check unformatted date fields output

expecting success: 
	f=default &&
	(git for-each-ref --shell --format="%(refname) %(committerdate:$f) %(authordate:$f)" refs/heads &&
	git for-each-ref --shell --format="%(refname) %(taggerdate:$f)" refs/tags) >actual &&
	test_cmp expected actual


ok 64 - Check format "default" formatted date fields output

expecting success: 
	f=relative &&
	(git for-each-ref --shell --format="%(refname) %(committerdate:$f) %(authordate:$f)" refs/heads &&
	git for-each-ref --shell --format="%(refname) %(taggerdate:$f)" refs/tags) >actual

ok 65 - Check format "relative" date fields output

expecting success: 
	f=short &&
	(git for-each-ref --shell --format="%(refname) %(committerdate:$f) %(authordate:$f)" refs/heads &&
	git for-each-ref --shell --format="%(refname) %(taggerdate:$f)" refs/tags) >actual &&
	test_cmp expected actual


ok 66 - Check format "short" date fields output

expecting success: 
	f=local &&
	(git for-each-ref --shell --format="%(refname) %(committerdate:$f) %(authordate:$f)" refs/heads &&
	git for-each-ref --shell --format="%(refname) %(taggerdate:$f)" refs/tags) >actual &&
	test_cmp expected actual


ok 67 - Check format "local" date fields output

expecting success: 
	f=iso8601 &&
	(git for-each-ref --shell --format="%(refname) %(committerdate:$f) %(authordate:$f)" refs/heads &&
	git for-each-ref --shell --format="%(refname) %(taggerdate:$f)" refs/tags) >actual &&
	test_cmp expected actual

ok 68 - Check format "iso8601" date fields output

expecting success: 
	f=rfc2822 &&
	(git for-each-ref --shell --format="%(refname) %(committerdate:$f) %(authordate:$f)" refs/heads &&
	git for-each-ref --shell --format="%(refname) %(taggerdate:$f)" refs/tags) >actual &&
	test_cmp expected actual


ok 69 - Check format "rfc2822" date fields output

expecting success: 
	git for-each-ref --format="%(refname)" --sort=refname >actual &&
	test_cmp expected actual


ok 70 - Verify ascending sort

expecting success: 
	git for-each-ref --format="%(refname)" --sort=-refname >actual &&
	test_cmp expected actual


ok 71 - Verify descending sort
expecting success: 
	git for-each-ref --shell --format="%(refname)" >actual &&
	test_cmp expected actual

ok 72 - Quoting style: shell
expecting success: 
	git for-each-ref --perl --format="%(refname)" >actual &&
	test_cmp expected actual

ok 73 - Quoting style: perl
expecting success: 
	git for-each-ref --python --format="%(refname)" >actual &&
	test_cmp expected actual

ok 74 - Quoting style: python
expecting success: 
	git for-each-ref --tcl --format="%(refname)" >actual &&
	test_cmp expected actual

ok 75 - Quoting style: tcl

expecting success: 
		git for-each-ref --perl --shell 2>&1 | (read line &&
		case $line in
		"error: more than one quoting style"*) : happy;;
		*) false
		esac)
	

ok 76 - more than one quoting style: --perl --shell

expecting success: 
		git for-each-ref -s --python 2>&1 | (read line &&
		case $line in
		"error: more than one quoting style"*) : happy;;
		*) false
		esac)
	

ok 77 - more than one quoting style: -s --python

expecting success: 
		git for-each-ref --python --tcl 2>&1 | (read line &&
		case $line in
		"error: more than one quoting style"*) : happy;;
		*) false
		esac)
	

ok 78 - more than one quoting style: --python --tcl

expecting success: 
		git for-each-ref --tcl --perl 2>&1 | (read line &&
		case $line in
		"error: more than one quoting style"*) : happy;;
		*) false
		esac)
	

ok 79 - more than one quoting style: --tcl --perl
expecting success: 
	(git for-each-ref --format="%(refname:short)" refs/heads &&
	git for-each-ref --format="%(refname:short)" refs/tags) >actual &&
	test_cmp expected actual

ok 80 - Check short refname format

expecting success: 
	git for-each-ref --format="%(upstream:short)" refs/heads >actual &&
	test_cmp expected actual


ok 81 - Check short upstream format

expecting success: 
	git for-each-ref --format="%(objectname:short)" refs/heads >actual &&
	test_cmp expected actual


ok 82 - Check short objectname format

expecting success: 
	test_must_fail git for-each-ref --format="%(refname:INVALID)"


ok 83 - Check for invalid refname format

expecting success: 
	git config --bool core.warnambiguousrefs true &&
	git checkout -b newtag &&
	echo "Using $datestamp" > one &&
	git add one &&
	git commit -m "Branch" &&
	setdate_and_increment &&
	git tag -m "Tagging at $datestamp" master &&
	git for-each-ref --format "%(refname:short)" refs/heads/master refs/tags/master >actual &&
	test_cmp expected actual

[newtag 9658eaf] Branch
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 84 - Check ambiguous head and tag refs (strict)

expecting success: 
	git config --bool core.warnambiguousrefs false &&
	git for-each-ref --format "%(refname:short)" refs/heads/master refs/tags/master >actual &&
	test_cmp expected actual

ok 85 - Check ambiguous head and tag refs (loose)

expecting success: 
	git checkout master &&
	git tag ambiguous testtag^0 &&
	git branch ambiguous testtag^0 &&
	git for-each-ref --format "%(refname:short)" refs/heads/ambiguous refs/tags/ambiguous >actual &&
	test_cmp expected actual

ok 86 - Check ambiguous head and tag refs II (loose)

expecting success: 

	git tag -m "bogo" bogo &&
	bogo=$(git cat-file tag bogo) &&
	bogo=$(printf "%s" "$bogo" | git mktag) &&
	git tag -f bogo "$bogo" &&
	git for-each-ref --format "%(body)" refs/tags/bogo


Updated tag 'bogo' (was 276342e)


ok 87 - an unusual tag with an incomplete line

# passed all 87 test(s)
1..87

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0025-crlf-auto/.git/
expecting success: 

	git config core.autocrlf false &&

	for w in Hello world how are you; do echo $w; done >one &&
	for w in I am very very fine thank you; do echo ${w}Q; done | q_to_cr >two &&
	for w in Oh here is a QNUL byte how alarming; do echo ${w}; done | q_to_nul >three &&
	git add . &&

	git commit -m initial &&

	one=`git rev-parse HEAD:one` &&
	two=`git rev-parse HEAD:two` &&
	three=`git rev-parse HEAD:three` &&

	echo happy.
[master (root-commit) 6e4cc71] initial
 Author: A U Thor <author@example.com>
 3 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 one
 create mode 100644 three
 create mode 100644 two
happy.

ok 1 - setup
expecting success: 

	rm -f .gitattributes tmp one two three &&
	git read-tree --reset -u HEAD &&

	! has_cr one &&
	has_cr two &&
	onediff=`git diff one` &&
	twodiff=`git diff two` &&
	threediff=`git diff three` &&
	test -z "$onediff" -a -z "$twodiff" -a -z "$threediff"

ok 2 - default settings cause no changes

expecting success: 

	# Backwards compatibility check
	rm -f .gitattributes tmp one two three &&
	echo "two crlf" > .gitattributes &&
	git read-tree --reset -u HEAD &&

	# Note, "normalized" means that git will normalize it if added
	has_cr two &&
	twodiff=`git diff two` &&
	test -n "$twodiff"

ok 3 - crlf=true causes a CRLF file to be normalized

expecting success: 

	rm -f .gitattributes tmp one two three &&
	echo "two text" > .gitattributes &&
	git read-tree --reset -u HEAD &&

	# Note, "normalized" means that git will normalize it if added
	has_cr two &&
	twodiff=`git diff two` &&
	test -n "$twodiff"
ok 4 - text=true causes a CRLF file to be normalized

expecting success: 

	rm -f .gitattributes tmp one two three &&
	git config core.autocrlf false &&
	echo "one eol=crlf" > .gitattributes &&
	git read-tree --reset -u HEAD &&

	has_cr one &&
	onediff=`git diff one` &&
	test -z "$onediff"

ok 5 - eol=crlf gives a normalized file CRLFs with autocrlf=false

expecting success: 

	rm -f .gitattributes tmp one two three &&
	git config core.autocrlf input &&
	echo "one eol=crlf" > .gitattributes &&
	git read-tree --reset -u HEAD &&

	has_cr one &&
	onediff=`git diff one` &&
	test -z "$onediff"

ok 6 - eol=crlf gives a normalized file CRLFs with autocrlf=input

expecting success: 

	rm -f .gitattributes tmp one two three &&
	git config core.autocrlf true &&
	echo "one eol=lf" > .gitattributes &&
	git read-tree --reset -u HEAD &&

	! has_cr one &&
	onediff=`git diff one` &&
	test -z "$onediff"


ok 7 - eol=lf gives a normalized file LFs with autocrlf=true

expecting success: 

	rm -f .gitattributes tmp one two three &&
	git config core.autocrlf true &&
	git read-tree --reset -u HEAD &&

	has_cr one &&
	has_cr two &&
	onediff=`git diff one` &&
	twodiff=`git diff two` &&
	threediff=`git diff three` &&
	test -z "$onediff" -a -z "$twodiff" -a -z "$threediff"

ok 8 - autocrlf=true does not normalize CRLF files

expecting success: 

	rm -f .gitattributes tmp one two three &&
	git config core.autocrlf true &&
	echo "* text=auto" > .gitattributes &&
	git read-tree --reset -u HEAD &&

	has_cr one &&
	has_cr two &&
	onediff=`git diff one` &&
	twodiff=`git diff two` &&
	threediff=`git diff three` &&
	test -z "$onediff" -a -n "$twodiff" -a -z "$threediff"

ok 9 - text=auto, autocrlf=true _does_ normalize CRLF files

expecting success: 

	rm -f .gitattributes tmp one two three &&
	git config core.autocrlf true &&
	echo "* text=auto" > .gitattributes &&
	git read-tree --reset -u HEAD &&

	! has_cr three &&
	threediff=`git diff three` &&
	test -z "$threediff"

ok 10 - text=auto, autocrlf=true does not normalize binary files

expecting success: 

	rm -f .gitattributes tmp one two three &&
	echo "three eol=crlf" > .gitattributes &&
	git read-tree --reset -u HEAD &&

	has_cr three &&
	threediff=`git diff three` &&
	test -z "$threediff"

ok 11 - eol=crlf _does_ normalize binary files

# passed all 11 test(s)
1..11

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0026-eol-config/.git/
expecting success: 

	git config core.autocrlf false &&

	echo "one text" > .gitattributes &&

	for w in Hello world how are you; do echo $w; done >one &&
	for w in I am very very fine thank you; do echo $w; done >two &&
	git add . &&

	git commit -m initial &&

	one=`git rev-parse HEAD:one` &&
	two=`git rev-parse HEAD:two` &&

	echo happy.
[master (root-commit) 1ff123a] initial
 Author: A U Thor <author@example.com>
 3 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 .gitattributes
 create mode 100644 one
 create mode 100644 two
happy.

ok 1 - setup
expecting success: 

	rm -f .gitattributes tmp one two &&
	git config core.eol lf &&
	git read-tree --reset -u HEAD &&

	! has_cr one &&
	! has_cr two &&
	onediff=`git diff one` &&
	twodiff=`git diff two` &&
	test -z "$onediff" -a -z "$twodiff"

ok 2 - eol=lf puts LFs in normalized file

expecting success: 

	rm -f .gitattributes tmp one two &&
	git config core.eol crlf &&
	git read-tree --reset -u HEAD &&

	has_cr one &&
	! has_cr two &&
	onediff=`git diff one` &&
	twodiff=`git diff two` &&
	test -z "$onediff" -a -z "$twodiff"

ok 3 - eol=crlf puts CRLFs in normalized file

expecting success: 

	rm -f .gitattributes tmp one two &&
	git config core.eol lf &&
	git config core.autocrlf true &&
	git read-tree --reset -u HEAD &&

	has_cr one &&
	has_cr two &&
	onediff=`git diff one` &&
	twodiff=`git diff two` &&
	test -z "$onediff" -a -z "$twodiff"

ok 4 - autocrlf=true overrides eol=lf

expecting success: 

	rm -f .gitattributes tmp one two &&
	git config --unset-all core.eol &&
	git config core.autocrlf true &&
	git read-tree --reset -u HEAD &&

	has_cr one &&
	has_cr two &&
	onediff=`git diff one` &&
	twodiff=`git diff two` &&
	test -z "$onediff" -a -z "$twodiff"

ok 5 - autocrlf=true overrides unset eol

# passed all 5 test(s)
1..5

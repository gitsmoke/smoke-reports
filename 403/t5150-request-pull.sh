Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5150-request-pull/.git/
expecting success: 

	git init --bare upstream.git &&
	git init --bare downstream.git &&
	git clone upstream.git upstream-private &&
	git clone downstream.git local &&

	trash_url="file://$TRASH_DIRECTORY" &&
	downstream_url="$trash_url/downstream.git/" &&
	upstream_url="$trash_url/upstream.git/" &&

	(
		cd upstream-private &&
		cat <<-\EOT >mnemonic.txt &&
		Thirtey days hath November,
		Aprile, June, and September:
		EOT
		git add mnemonic.txt &&
		test_tick &&
		git commit -m "\"Thirty days\", a reminder of month lengths" &&
		git tag -m "version 1" -a initial &&
		git push --tags origin master
	) &&
	(
		cd local &&
		git remote add upstream "$trash_url/upstream.git" &&
		git fetch upstream &&
		git pull upstream master &&
		cat <<-\EOT >>mnemonic.txt &&
		Of twyecescore-eightt is but eine,
		And all the remnante be thrycescore-eine.
		O’course Leap yare comes an’pynes,
		Ev’rie foure yares, gote it ryghth.
		An’twyecescore-eight is but twyecescore-nyne.
		EOT
		git add mnemonic.txt &&
		test_tick &&
		git commit -m "More detail" &&
		git tag -m "version 2" -a full &&
		git checkout -b simplify HEAD^ &&
		mv mnemonic.txt mnemonic.standard &&
		cat <<-\EOT >mnemonic.clarified &&
		Thirty days has September,
		All the rest I can’t remember.
		EOT
		git add -N mnemonic.standard mnemonic.clarified &&
		git commit -a -m "Adapt to use modern, simpler English

But keep the old version, too, in case some people prefer it." &&
		git checkout master
	)


Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5150-request-pull/upstream.git/
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5150-request-pull/downstream.git/
Cloning into upstream-private...
done.
Cloning into local...
done.
[master (root-commit) 7244768] "Thirty days", a reminder of month lengths
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 mnemonic.txt
[master cc0f4ce] More detail
 Author: A U Thor <author@example.com>
 1 files changed, 5 insertions(+), 0 deletions(-)
[simplify 6fa5b4f] Adapt to use modern, simpler English
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 mnemonic.clarified
 rename mnemonic.txt => mnemonic.standard (100%)

ok 1 - setup
expecting success: 

	downstream_url_for_sed=$(
		printf "%s
" "$downstream_url" |
		sed -e 's/\/\\/g' -e 's/[[/.*^$]/\&/g'
	) &&

	cat <<-\EOT >read-request.sed &&
	#!/bin/sed -nf
	/ in the git repository at:$/!d
	n
	/^$/ n
	s/^[ 	]*\(.*\) \([^ ]*\)/please pull\
	\1\
	\2/p
	q
	EOT

	cat <<-EOT >fuzz.sed
	#!/bin/sed -nf
	s/$_x40/OBJECT_NAME/g
	s/A U Thor/AUTHOR/g
	s/[-0-9]\{10\} [:0-9]\{8\} [-+][0-9]\{4\}/DATE/g
	s/        [^ ].*/        SUBJECT/g
	s/  [^ ].* (DATE)/  SUBJECT (DATE)/g
	s/$downstream_url_for_sed/URL/g
	s/for-upstream/BRANCH/g
	s/mnemonic.txt/FILENAME/g
	/^ FILENAME | *[0-9]* [-+]*\$/ b diffstat
	/^AUTHOR ([0-9]*):\$/ b shortlog
	p
	b
	: diffstat
	n
	/ [0-9]* files changed/ {
		a\
	DIFFSTAT
		b
	}
	b diffstat
	: shortlog
	/^        [a-zA-Z]/ n
	/^[a-zA-Z]* ([0-9]*):\$/ n
	/^\$/ N
	/^
[a-zA-Z]* ([0-9]*):\$/!{
		a\
	SHORTLOG
		D
	}
	n
	b shortlog
	EOT

ok 2 - setup: two scripts for reading pull requests

expecting success: 

	rm -fr downstream.git &&
	git init --bare downstream.git &&
	(
		cd local &&
		git checkout initial &&
		git merge --ff-only master &&
		test_must_fail git request-pull initial "$downstream_url" \
			2>../err
	) &&
	grep "No branch of.*is at:\$" err &&
	grep "Are you sure you pushed" err
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5150-request-pull/downstream.git/
Updating 7244768..cc0f4ce
Fast-forward
 mnemonic.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
The following changes since commit 7244768f7e34b5fbdf65e26dda6c138d29596555:

  "Thirty days", a reminder of month lengths (2005-04-07 15:13:13 -0700)

are available in the git repository at:
  file:///Users/trast/git-smoke/t/trash directory.t5150-request-pull/downstream.git/ ..BRANCH.NOT.VERIFIED..

A U Thor (1):
      More detail
 mnemonic.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
warn: No branch of file:///Users/trast/git-smoke/t/trash directory.t5150-request-pull/downstream.git/ is at:
warn: Are you sure you pushed HEAD there?
ok 3 - pull request when forgot to push
expecting success: 

	rm -fr downstream.git &&
	git init --bare downstream.git &&
	(
		cd local &&
		git checkout initial &&
		git merge --ff-only master &&
		git push origin master:for-upstream &&
		git request-pull initial origin >../request
	) &&
	sed -nf read-request.sed <request >digest &&
	cat digest &&
	{
		read task &&
		read repository &&
		read branch
	} <digest &&
	(
		cd upstream-private &&
		git checkout initial &&
		git pull --ff-only "$repository" "$branch"
	) &&
	test "$branch" = for-upstream &&
	test_cmp local/mnemonic.txt upstream-private/mnemonic.txt
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5150-request-pull/downstream.git/
Updating 7244768..cc0f4ce
Fast-forward
 mnemonic.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
please pull
/Users/trast/git-smoke/t/trash directory.t5150-request-pull/downstream.git
for-upstream
Updating 7244768..cc0f4ce
Fast-forward
 mnemonic.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

ok 4 - pull request after push
expecting success: 

	rm -fr downstream.git &&
	git init --bare downstream.git &&
	(
		cd local &&
		git checkout initial &&
		git merge --ff-only master &&
		git push --tags origin master simplify &&
		git push origin master:for-upstream &&
		git request-pull initial "$downstream_url" >../request
	) &&
	sed -nf read-request.sed <request >digest &&
	cat digest &&
	{
		read task &&
		read repository &&
		read branch
	} <digest &&
	{
		test "$branch" = master ||
		test "$branch" = for-upstream
	}
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5150-request-pull/downstream.git/
Updating 7244768..cc0f4ce
Fast-forward
 mnemonic.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
please pull
file:///Users/trast/git-smoke/t/trash directory.t5150-request-pull/downstream.git/
for-upstream

ok 5 - request names an appropriate branch

expecting success: 

	rm -fr downstream.git &&
	git init --bare downstream.git &&
	cat <<-\EOT >expect &&
	The following changes since commit OBJECT_NAME:

	  SUBJECT (DATE)

	are available in the git repository at:
	  URL BRANCH

	SHORTLOG

	DIFFSTAT
	EOT
	(
		cd local &&
		git checkout initial &&
		git merge --ff-only master &&
		git push origin master:for-upstream &&
		git request-pull initial "$downstream_url" >../request
	) &&
	<request sed -nf fuzz.sed >request.fuzzy &&
	test_cmp expect request.fuzzy
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5150-request-pull/downstream.git/
Updating 7244768..cc0f4ce
Fast-forward
 mnemonic.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
ok 6 - pull request format

expecting success: 

	(
		cd local &&
		OPTIONS_KEEPDASHDASH=Yes &&
		export OPTIONS_KEEPDASHDASH &&
		git checkout initial &&
		git merge --ff-only master &&
		git push origin master:for-upstream &&
		git request-pull -- initial "$downstream_url" >../request
	)
Updating 7244768..cc0f4ce
Fast-forward
 mnemonic.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

ok 7 - request-pull ignores OPTIONS_KEEPDASHDASH poison

# passed all 7 test(s)
1..7

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4203-mailmap/.git/
expecting success: 
	echo one >one &&
	git add one &&
	test_tick &&
	git commit -m initial &&
	echo two >>one &&
	git add one &&
	test_tick &&
	git commit --author "nick1 <bugs@company.xx>" -m second
[master (root-commit) 3a2fdcb] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 one
[master e0f6049] second
 Author: nick1 <bugs@company.xx>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 1 - setup

expecting success: 
	git shortlog HEAD >actual &&
	test_cmp expect actual


ok 2 - No mailmap

expecting success: 
	echo "Repo Guy <author@example.com>" > .mailmap &&
	git shortlog HEAD >actual &&
	test_cmp expect actual


ok 3 - default .mailmap

expecting success: 
	mkdir -p internal_mailmap &&
	echo "Internal Guy <bugs@company.xx>" > internal_mailmap/.mailmap &&
	git config mailmap.file internal_mailmap/.mailmap &&
	git shortlog HEAD >actual &&
	test_cmp expect actual


ok 4 - mailmap.file set

expecting success: 
	echo "External Guy <author@example.com>" >> internal_mailmap/.mailmap &&
	git config mailmap.file internal_mailmap/.mailmap &&
	git shortlog HEAD >actual &&
	test_cmp expect actual


ok 5 - mailmap.file override

expecting success: 
	rm internal_mailmap/.mailmap &&
	rmdir internal_mailmap &&
	git shortlog HEAD >actual &&
	test_cmp expect actual


ok 6 - mailmap.file non-existant

expecting success: 
	mkdir -p internal_mailmap &&
	echo "<bugs@company.xy> <bugs@company.xx>" >internal_mailmap/.mailmap &&
	echo "Internal Guy <bugs@company.xx>" >>internal_mailmap/.mailmap &&
	git shortlog HEAD >actual &&
	test_cmp expect actual

ok 7 - name entry after email entry

expecting success: 
	mkdir -p internal_mailmap &&
	echo "<bugs@company.xy> <bugs@company.xx>" >internal_mailmap/.mailmap &&
	echo "Internal Guy <BUGS@Company.xx>" >>internal_mailmap/.mailmap &&
	git shortlog HEAD >actual &&
	test_cmp expect actual


ok 8 - name entry after email entry, case-insensitive

expecting success: 
	rm -f .mailmap internal_mailmap/.mailmap &&
	git shortlog HEAD >actual &&
	test_cmp expect actual


ok 9 - No mailmap files, but configured

expecting success: 
	echo three >>one &&
	git add one &&
	test_tick &&
	git commit --author "nick2 <bugs@company.xx>" -m third &&

	echo four >>one &&
	git add one &&
	test_tick &&
	git commit --author "nick2 <nick2@company.xx>" -m fourth &&

	echo five >>one &&
	git add one &&
	test_tick &&
	git commit --author "santa <me@company.xx>" -m fifth &&

	echo six >>one &&
	git add one &&
	test_tick &&
	git commit --author "claus <me@company.xx>" -m sixth &&

	echo seven >>one &&
	git add one &&
	test_tick &&
	git commit --author "CTO <cto@coompany.xx>" -m seventh &&

	mkdir -p internal_mailmap &&
	echo "Committed <committer@example.com>" > internal_mailmap/.mailmap &&
	echo "<cto@company.xx>                       <cto@coompany.xx>" >> internal_mailmap/.mailmap &&
	echo "Some Dude <some@dude.xx>         nick1 <bugs@company.xx>" >> internal_mailmap/.mailmap &&
	echo "Other Author <other@author.xx>   nick2 <bugs@company.xx>" >> internal_mailmap/.mailmap &&
	echo "Other Author <other@author.xx>         <nick2@company.xx>" >> internal_mailmap/.mailmap &&
	echo "Santa Claus <santa.claus@northpole.xx> <me@company.xx>" >> internal_mailmap/.mailmap &&
	echo "Santa Claus <santa.claus@northpole.xx> <me@company.xx>" >> internal_mailmap/.mailmap &&

	git shortlog -e HEAD >actual &&
	test_cmp expect actual


[master 4db1a3d] third
 Author: nick2 <bugs@company.xx>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master e371838] fourth
 Author: nick2 <nick2@company.xx>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 25e4bf3] fifth
 Author: santa <me@company.xx>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master 17c3971] sixth
 Author: claus <me@company.xx>
 1 files changed, 1 insertions(+), 0 deletions(-)
[master f399f22] seventh
 Author: CTO <cto@coompany.xx>
 1 files changed, 1 insertions(+), 0 deletions(-)

ok 10 - Shortlog output (complex mapping)

expecting success: 
	git log --pretty=format:"Author %an <%ae> maps to %aN <%aE>%nCommitter %cn <%ce> maps to %cN <%cE>%n" >actual &&
	test_cmp expect actual


ok 11 - Log output (complex mapping)

expecting success: 
	git blame one >actual &&
	fuzz_blame actual >actual.fuzz &&
	test_cmp expect actual.fuzz


ok 12 - Blame output (complex mapping)

# passed all 12 test(s)
1..12

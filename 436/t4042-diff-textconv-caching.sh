Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4042-diff-textconv-caching/.git/
expecting success: 
	echo foo content 1 >foo.bin &&
	echo bar content 1 >bar.bin &&
	git add . &&
	git commit -m one &&
	echo foo content 2 >foo.bin &&
	echo bar content 2 >bar.bin &&
	git commit -a -m two &&
	echo "*.bin diff=magic" >.gitattributes &&
	git config diff.magic.textconv ./helper &&
	git config diff.magic.cachetextconv true
[master (root-commit) acba69f] one
 Author: A U Thor <author@example.com>
 3 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 bar.bin
 create mode 100644 foo.bin
 create mode 100755 helper
[master 788fcff] two
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 2 deletions(-)

ok 1 - setup
expecting success: 
	git diff HEAD^ HEAD >actual &&
	test_cmp expect actual

ok 2 - first textconv works
expecting success: 
	git diff HEAD^ HEAD >actual &&
	test_cmp expect actual

ok 3 - cached textconv produces same output
expecting success: 
	rm -f helper.out &&
	git diff HEAD^ HEAD >actual &&
	test_cmp expect actual &&
	! test -r helper.out

ok 4 - cached textconv does not run helper
expecting success: 
	echo other >other &&
	git config diff.magic.textconv "./helper other" &&
	git diff HEAD^ HEAD >actual &&
	test_cmp expect actual

ok 5 - changing textconv invalidates cache
expecting success: 
	git config diff.moremagic.textconv ./helper &&
	echo foo.bin diff=moremagic >>.gitattributes &&
	git diff HEAD^ HEAD >actual &&
	test_cmp expect actual

ok 6 - switching diff driver produces correct results

# passed all 6 test(s)
1..6

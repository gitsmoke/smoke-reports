Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4030-diff-textconv/.git/
expecting success: 
	printf "\0\n" >file &&
	git add file &&
	git commit -m one &&
	printf "\01\n" >>file &&
	git add file &&
	git commit -m two
[master (root-commit) 99dad5e] one
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file
[master 4b328e6] two
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)

ok 1 - setup binary file with history
expecting success: 
	git diff HEAD^ HEAD >diff &&
	find_diff <diff >actual &&
	test_cmp expect.binary actual

ok 2 - file is considered binary by porcelain

expecting success: 
	git diff-tree -p HEAD^ HEAD >diff &&
	find_diff <diff >actual &&
	test_cmp expect.binary actual

ok 3 - file is considered binary by plumbing

expecting success: 
	echo file diff=foo >.gitattributes &&
	git config diff.foo.textconv "\"$(pwd)\""/hexdump &&
	git config diff.fail.textconv false

ok 4 - setup textconv filters

expecting success: 
	git diff HEAD^ HEAD >diff &&
	find_diff <diff >actual &&
	test_cmp expect.text actual

ok 5 - diff produces text

expecting success: 
	git diff-tree -p HEAD^ HEAD >diff &&
	find_diff <diff >actual &&
	test_cmp expect.binary actual

ok 6 - diff-tree produces binary

expecting success: 
	git log -1 -p >log &&
	find_diff <log >actual &&
	test_cmp expect.text actual

ok 7 - log produces text

expecting success: 
	git format-patch --no-binary --stdout HEAD^ >patch &&
	find_diff <patch >actual &&
	test_cmp expect.binary actual

ok 8 - format-patch produces binary

expecting success: 
	git reset --soft HEAD^ &&
	git status -v >diff &&
	find_diff <diff >actual &&
	test_cmp expect.text actual &&
	git reset --soft HEAD@{1}

ok 9 - status -v produces text
expecting success: 
	echo file diff=fail >.gitattributes &&
	git diff --stat HEAD^ HEAD >actual &&
	test_cmp expect.stat actual

ok 10 - diffstat does not run textconv
expecting success: 
	printf frotz > file &&
	git add file &&
	git ls-files -s | sed -e s/100644/120000/ |
		git update-index --index-info &&
	git commit -m typechange &&
	git show >diff &&
	find_diff <diff >actual &&
	test_cmp expect.typechange actual
[master 445de84] typechange
 Author: A U Thor <author@example.com>
 1 files changed, 0 insertions(+), 0 deletions(-)
 rewrite file (100%)
 mode change 100644 => 120000

ok 11 - textconv does not act on symlinks

# passed all 11 test(s)
1..11

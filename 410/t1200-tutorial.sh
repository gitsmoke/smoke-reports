Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1200-tutorial/.git/
expecting success: 
	echo "Hello World" > hello &&
	echo "Silly example" > example &&

	git update-index --add hello example &&

	test blob = "$(git cat-file -t 557db03)"

ok 1 - blob

expecting success: 
	test "Hello World" = "$(git cat-file blob 557db03)"

ok 2 - blob 557db03
expecting success: 
	git diff-files -p > diff.output &&
	test_cmp diff.expect diff.output

ok 3 - git diff-files -p
expecting success: 
	git diff > diff.output &&
	test_cmp diff.expect diff.output

ok 4 - git diff

expecting success: 
	tree=$(git write-tree 2>/dev/null) &&
	test 8988da15d077d4829fc51d8544c097def6644dbb = $tree

ok 5 - tree

expecting success: 
	test_tick &&
	tree=$(git write-tree) &&
	commit=$(echo "Initial commit" | git commit-tree $tree) &&
	git update-ref HEAD $commit &&
	git diff-index -p HEAD > diff.output &&
	test_cmp diff.expect diff.output

ok 6 - git diff-index -p HEAD

expecting success: 
	git diff HEAD > diff.output &&
	test_cmp diff.expect diff.output

ok 7 - git diff HEAD

expecting success: 
	git whatchanged -p --root |
		sed -e "1s/^\(.\{7\}\).\{40\}/\1VARIABLE/" \
		-e "2,3s/^\(.\{8\}\).*$/\1VARIABLE/" \
	> whatchanged.output &&
	test_cmp whatchanged.expect whatchanged.output

ok 8 - git whatchanged -p --root

expecting success: 
	git tag my-first-tag &&
	test_cmp .git/refs/heads/master .git/refs/tags/my-first-tag


ok 9 - git tag my-first-tag

expecting success: 
	git checkout -b mybranch &&
	test_cmp .git/refs/heads/master .git/refs/heads/mybranch
M	hello
ok 10 - git checkout -b mybranch
expecting success: 
	git branch > branch.output &&
	test_cmp branch.expect branch.output

ok 11 - git branch

expecting success: 
	git checkout mybranch &&
	echo "Work, work, work" >>hello &&
	test_tick &&
	git commit -m "Some work." -i hello &&

	git checkout master &&

	echo "Play, play, play" >>hello &&
	echo "Lots of fun" >>example &&
	test_tick &&
	git commit -m "Some fun." -i hello example &&

	test_must_fail git merge -m "Merge work in mybranch" mybranch

M	hello
[mybranch 9014374] Some work.
 Author: A U Thor <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
[master ab01a1a] Some fun.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
Merging:
ab01a1a Some fun.
virtual mybranch
found 1 common ancestor(s):
6758fe8 Initial commit
Auto-merging hello
CONFLICT (content): Merge conflict in hello
Automatic merge failed; fix conflicts and then commit the result.

ok 12 - git resolve now fails

expecting success: 
	test_tick &&
	git commit -m "Merge work in mybranch" -i hello &&
	git show-branch --topo-order --more=1 master mybranch \
		> show-branch.output &&
	test_cmp show-branch.expect show-branch.output
[master 062f127] Merge work in mybranch
 Author: A U Thor <author@example.com>

ok 13 - git show-branch
expecting success: 
	git checkout mybranch &&
	git merge -m "Merge upstream changes." master |
		sed -e "1s/[0-9a-f]\{7\}/VARIABLE/g" \
		-e "s/^Fast[- ]forward /FASTFORWARD /" >resolve.output &&
	test_cmp resolve.expect resolve.output
ok 14 - git resolve
expecting success: 
	git show-branch --topo-order master mybranch > show-branch2.output &&
	test_cmp show-branch2.expect show-branch2.output

ok 15 - git show-branch (part 2)
expecting success: 
	git show-branch --topo-order --more=2 master mybranch \
		> show-branch3.output &&
	test_cmp show-branch3.expect show-branch3.output

ok 16 - git show-branch (part 3)
expecting success: 
	git checkout mybranch &&
	git reset --hard master^2 &&
	git checkout master &&
	git reset --hard master^
HEAD is now at 9014374 Some work.
HEAD is now at ab01a1a Some fun.

ok 17 - rewind to "Some fun." and "Some work."
expecting success: 
	git show-branch --topo-order > show-branch4.output &&
	test_cmp show-branch4.expect show-branch4.output

ok 18 - git show-branch (part 4)

expecting success: 
	mb=$(git merge-base HEAD mybranch) &&
	git name-rev --name-only --tags $mb > name-rev.output &&
	test "my-first-tag" = $(cat name-rev.output) &&

	git read-tree -m -u $mb HEAD mybranch

ok 19 - manual merge
expecting success: 
	git ls-files --stage > ls-files.output &&
	test_cmp ls-files.expect ls-files.output

ok 20 - git ls-files --stage
expecting success: 
	git ls-files --unmerged > ls-files-unmerged.output &&
	test_cmp ls-files-unmerged.expect ls-files-unmerged.output

ok 21 - git ls-files --unmerged
expecting success: 
	test_must_fail git merge-index git-merge-one-file hello
Auto-merging hello
ERROR: content conflict in hello

ok 22 - git-merge-index

expecting success: 
	git ls-files --stage > ls-files.output2 &&
	test_cmp ls-files.expect ls-files.output2
ok 23 - git ls-files --stage (part 2)

expecting success: git repack

ok 24 - git repack
expecting success: git prune-packed
ok 25 - git prune-packed
expecting success: 
	git prune && # Remove conflict marked blobs
	test $(find .git/objects/[0-9a-f][0-9a-f] -type f -print 2>/dev/null | wc -l) = 0

ok 26 - -> only packed objects
# passed all 26 test(s)
1..26

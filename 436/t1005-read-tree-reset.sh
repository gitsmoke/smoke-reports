Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1005-read-tree-reset/.git/
expecting success: 
  git init &&
  mkdir df &&
  echo content >df/file &&
  git add df/file &&
  git commit -m one &&
  git ls-files >expect &&
  rm -rf df &&
  echo content >df &&
  git add df &&
  echo content >new &&
  git add new &&
  git commit -m two
Reinitialized existing Git repository in /Users/trast/git-smoke/t/trash directory.t1005-read-tree-reset/.git/
[master (root-commit) 348f2ba] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 df/file
[master d3986cc] two
 Author: A U Thor <author@example.com>
 2 files changed, 0 insertions(+), 0 deletions(-)
 copy df/file => df (100%)
 rename df/file => new (100%)

ok 1 - setup
expecting success: 
  git read-tree -u --reset HEAD^ &&
  git ls-files >actual &&
  test_cmp expect actual

ok 2 - reset should work

expecting success: 
  git read-tree --reset -u HEAD &&
  git ls-files -s >expect &&
  sha1=$(git rev-parse :new) &&
  (
	echo "100644 $sha1 1	old"
	echo "100644 $sha1 3	old"
  ) | git update-index --index-info &&
  >old &&
  git ls-files -s &&
  git read-tree --reset -u HEAD &&
  git ls-files -s >actual &&
  ! test -f old
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 0	df
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 0	new
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 1	old
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 3	old

ok 3 - reset should remove remnants from a failed merge
expecting success: 
  git read-tree --reset -u HEAD &&
  git ls-files -s >expect &&
  sha1=$(git rev-parse :new) &&
  (
	echo "100644 $sha1 1	old"
	echo "100644 $sha1 3	old"
  ) | git update-index --index-info &&
  >old &&
  git ls-files -s &&
  git reset --hard &&
  git ls-files -s >actual &&
  ! test -f old
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 0	df
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 0	new
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 1	old
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 3	old
HEAD is now at d3986cc two

ok 4 - Porcelain reset should remove remnants too

expecting success: 
  git read-tree --reset -u HEAD &&
  git ls-files -s >expect &&
  sha1=$(git rev-parse :new) &&
  (
	echo "100644 $sha1 1	old"
	echo "100644 $sha1 3	old"
  ) | git update-index --index-info &&
  >old &&
  git ls-files -s &&
  git checkout -f &&
  git ls-files -s >actual &&
  ! test -f old
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 0	df
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 0	new
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 1	old
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 3	old

ok 5 - Porcelain checkout -f should remove remnants too

expecting success: 
  git read-tree --reset -u HEAD &&
  git ls-files -s >expect &&
  sha1=$(git rev-parse :new) &&
  (
	echo "100644 $sha1 1	old"
	echo "100644 $sha1 3	old"
  ) | git update-index --index-info &&
  >old &&
  git ls-files -s &&
  git checkout -f HEAD &&
  git ls-files -s >actual &&
  ! test -f old
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 0	df
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 0	new
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 1	old
100644 d95f3ad14dee633a758d2e331151e950dd13e4ed 3	old

ok 6 - Porcelain checkout -f HEAD should remove remnants too

# passed all 6 test(s)
1..6

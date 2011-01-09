Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1100-commit-tree-options/.git/
expecting success: git write-tree >treeid

ok 1 - test preparation: write empty tree

expecting success: echo comment text |
     GIT_AUTHOR_NAME="Author Name" \
     GIT_AUTHOR_EMAIL="author@email" \
     GIT_AUTHOR_DATE="2005-05-26 23:00" \
     GIT_COMMITTER_NAME="Committer Name" \
     GIT_COMMITTER_EMAIL="committer@email" \
     GIT_COMMITTER_DATE="2005-05-26 23:30" \
     TZ=GMT git commit-tree `cat treeid` >commitid 2>/dev/null

ok 2 - construct commit

expecting success: git cat-file commit `cat commitid` >commit

ok 3 - read commit
expecting success: test_cmp expected commit
ok 4 - compare commit
# passed all 4 test(s)
1..4

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2050-git-dir-relative/.git/
expecting success: 
mkdir -p .git/hooks &&
echo >.git/hooks/post-commit "#!/bin/sh
touch \"\${COMMIT_FILE}\"
echo Post commit hook was called." &&
chmod +x .git/hooks/post-commit

ok 1 - Setting up post-commit hook

expecting success: 
echo initial >top &&
git add top &&
git commit -m initial &&
test -r "${COMMIT_FILE}"
[master (root-commit) 3fc0b62] initial
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 top

ok 2 - post-commit hook used ordinarily

expecting success: 
echo changed >top &&
git --git-dir subdir/.git add top &&
git --git-dir subdir/.git commit -m topcommit &&
test -r "${COMMIT_FILE}"

[master c2ba90c] topcommit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 3 - post-commit-hook created and used from top dir

expecting success: 
echo changed again >top &&
cd subdir &&
git --git-dir .git --work-tree .. add ../top &&
git --git-dir .git --work-tree .. commit -m subcommit &&
test -r "${COMMIT_FILE}"

[master ec1360f] subcommit
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 4 - post-commit-hook from sub dir

# passed all 4 test(s)
1..4

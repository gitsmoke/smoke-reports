Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2107-update-index-basic/.git/
expecting success: 
	test_must_fail git update-index --nonsense 2>msg &&
	cat msg &&
	test -s msg
error: unknown option 'nonsense'
usage: git update-index [options] [--] [<file>...]

    -q                    continue refresh even when index needs update
    --ignore-submodules   refresh: ignore submodules
    --add                 do not ignore new files
    --replace             let files replace directories and vice-versa
    --remove              notice files missing from worktree
    --unmerged            refresh even if index contains unmerged entries
    --refresh             refresh stat information
    --really-refresh      like --refresh, but ignore assume-unchanged setting
    --cacheinfo <mode> <object> <path>
                          add the specified entry to the index
    --chmod (+/-)x        override the executable bit of the listed files
    --assume-unchanged    mark files as "not changing"
    --no-assume-unchanged
                          clear assumed-unchanged bit
    --skip-worktree       mark files as "index-only"
    --no-skip-worktree    clear skip-worktree bit
    --info-only           add to index only; do not add content to object database
    --force-remove        remove named paths even if present in worktree
    -z                    with --stdin: input lines are terminated by null bytes
    --stdin               read list of paths to be updated from standard input
    --index-info          add entries from standard input to the index
    --unresolve           repopulate stages #2 and #3 for the listed paths
    -g, --again           only update entries that differ from HEAD
    --ignore-missing      ignore files missing from worktree
    --verbose             report actions to standard output
    --clear-resolve-undo  (for porcelains) forget saved unresolved conflicts


ok 1 - update-index --nonsense fails

expecting success: 
	test_expect_code 129 git update-index --nonsense 2>err &&
	grep "[Uu]sage: git update-index" err
usage: git update-index [options] [--] [<file>...]

ok 2 - update-index --nonsense dumps usage

expecting success: 
	mkdir broken &&
	(
		cd broken &&
		git init &&
		>.git/index &&
		test_expect_code 129 git update-index -h >usage 2>&1
	) &&
	grep "[Uu]sage: git update-index" broken/usage
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2107-update-index-basic/broken/.git/
usage: git update-index [options] [--] [<file>...]
ok 3 - update-index -h with corrupt index
# passed all 3 test(s)
1..3

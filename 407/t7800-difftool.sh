Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7800-difftool/.git/
expecting success: 
	echo master >file &&
	git add file &&
	git commit -m "added file" &&

	git checkout -b branch master &&
	echo branch >file &&
	git commit -a -m "branch changed file" &&
	git checkout master
[master (root-commit) 69c21c5] added file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
[branch 72ea088] branch changed file
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
	restore_test_defaults &&
	git config difftool.test-tool.cmd "cat \$REMOTE" &&

	diff=$(git difftool --no-prompt branch) &&
	test "$diff" = "master" &&

	restore_test_defaults &&
	diff=$(git difftool --no-prompt branch) &&
	test "$diff" = "branch"
ok 2 - custom commands

expecting success: 
	diff=$(git difftool --no-prompt --tool=bad-tool branch)
	test "$?" = 1 &&
	test "$diff" = ""

ok 3 - difftool ignores bad --tool values

expecting success: 
	git config merge.tool bogus-tool &&
	git config diff.tool bogus-tool &&
	git config diff.guitool test-tool &&

	diff=$(git difftool --no-prompt --gui branch) &&
	test "$diff" = "branch" &&

	restore_test_defaults
ok 4 - difftool honors --gui

expecting success: 
	git config diff.tool test-tool &&

	diff=$(git difftool --no-prompt --gui branch) &&
	test "$diff" = "branch" &&

	restore_test_defaults

ok 5 - difftool --gui works without configured diff.guitool

expecting success: 
	test_might_fail git config --unset diff.tool &&
	GIT_DIFF_TOOL=test-tool &&
	export GIT_DIFF_TOOL &&

	diff=$(git difftool --no-prompt branch) &&
	test "$diff" = "branch" &&

	restore_test_defaults

ok 6 - GIT_DIFF_TOOL variable

expecting success: 
	git config diff.tool bogus-tool &&
	git config merge.tool bogus-tool &&

	GIT_DIFF_TOOL=test-tool &&
	export GIT_DIFF_TOOL &&

	diff=$(git difftool --no-prompt branch) &&
	test "$diff" = "branch" &&

	GIT_DIFF_TOOL=bogus-tool &&
	export GIT_DIFF_TOOL &&

	diff=$(git difftool --no-prompt --tool=test-tool branch) &&
	test "$diff" = "branch" &&

	restore_test_defaults

ok 7 - GIT_DIFF_TOOL overrides

expecting success: 
	GIT_DIFFTOOL_NO_PROMPT=true &&
	export GIT_DIFFTOOL_NO_PROMPT &&

	diff=$(git difftool branch) &&
	test "$diff" = "branch" &&

	restore_test_defaults

ok 8 - GIT_DIFFTOOL_NO_PROMPT variable

expecting success: 
	git config difftool.prompt false &&
	GIT_DIFFTOOL_PROMPT=true &&
	export GIT_DIFFTOOL_PROMPT &&

	prompt=$(echo | git difftool branch | tail -1) &&
	prompt_given "$prompt" &&

	restore_test_defaults

ok 9 - GIT_DIFFTOOL_PROMPT variable

expecting success: 
	git config difftool.prompt false &&

	diff=$(git difftool branch) &&
	test "$diff" = "branch" &&

	restore_test_defaults

ok 10 - difftool.prompt config variable is false

expecting success: 
	test_might_fail git config --unset difftool.prompt &&
	git config mergetool.prompt false &&

	diff=$(git difftool branch) &&
	test "$diff" = "branch" &&

	restore_test_defaults

ok 11 - difftool merge.prompt = false

expecting success: 
	git config difftool.prompt true &&

	diff=$(git difftool -y branch) &&
	test "$diff" = "branch" &&

	restore_test_defaults

ok 12 - difftool.prompt can overridden with -y

expecting success: 
	git config difftool.prompt false &&

	prompt=$(echo | git difftool --prompt branch | tail -1) &&
	prompt_given "$prompt" &&

	restore_test_defaults

ok 13 - difftool.prompt can overridden with --prompt

expecting success: 
	diff=$(git difftool --prompt --no-prompt branch) &&
	test "$diff" = "branch" &&

	restore_test_defaults &&

	prompt=$(echo | git difftool --no-prompt --prompt branch | tail -1) &&
	prompt_given "$prompt" &&

	restore_test_defaults

ok 14 - difftool last flag wins

expecting success: 
	remove_config_vars &&
	git config merge.tool test-tool &&
	git config mergetool.test-tool.cmd "cat \$LOCAL" &&

	diff=$(git difftool --no-prompt branch) &&
	test "$diff" = "branch" &&

	# set merge.tool to something bogus, diff.tool to test-tool
	git config merge.tool bogus-tool &&
	git config diff.tool test-tool &&

	diff=$(git difftool --no-prompt branch) &&
	test "$diff" = "branch" &&

	restore_test_defaults

ok 15 - difftool + mergetool config variables

expecting success: 
	git config difftool.tkdiff.path echo &&
	diff=$(git difftool --tool=tkdiff --no-prompt branch) &&
	git config --unset difftool.tkdiff.path &&
	lines=$(echo "$diff" | grep file | wc -l) &&
	test "$lines" -eq 1 &&

	restore_test_defaults


ok 16 - difftool.<tool>.path

expecting success: 
	diff=$(git difftool --no-prompt --extcmd=cat branch) &&
	test "$diff" = branch"$LF"master


ok 17 - difftool --extcmd=cat

expecting success: 
	diff=$(git difftool --no-prompt --extcmd cat branch) &&
	test "$diff" = branch"$LF"master

ok 18 - difftool --extcmd cat

expecting success: 
	diff=$(git difftool --no-prompt -x cat branch) &&
	test "$diff" = branch"$LF"master

ok 19 - difftool -x cat

expecting success: 
	diff=$(git difftool --no-prompt --extcmd sh\ -c\ \"echo\ \$1\" branch) &&
	test "$diff" = file

ok 20 - difftool --extcmd echo arg1

expecting success: 
	diff=$(git difftool --no-prompt --extcmd sh\ -c\ \"cat\ \$1\" branch) &&
	test "$diff" = master

ok 21 - difftool --extcmd cat arg1

expecting success: 
	diff=$(git difftool --no-prompt --extcmd sh\ -c\ \"cat\ \$2\" branch) &&
	test "$diff" = branch

ok 22 - difftool --extcmd cat arg2

# passed all 22 test(s)
1..22

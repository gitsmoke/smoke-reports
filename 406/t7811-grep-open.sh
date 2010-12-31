Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t7811-grep-open/.git/
expecting success: 
	test_might_fail git config --unset core.pager &&
	less=$(
		unset PAGER GIT_PAGER;
		git var GIT_PAGER
	) &&
	test -n "$less"

ok 1 - determine default pager
expecting success: 
	test_commit initial grep.h "
enum grep_pat_token {
	GREP_PATTERN,
	GREP_PATTERN_HEAD,
	GREP_PATTERN_BODY,
	GREP_AND,
	GREP_OPEN_PAREN,
	GREP_CLOSE_PAREN,
	GREP_NOT,
	GREP_OR,
};" &&

	test_commit add-user revision.c "
	}
	if (seen_dashdash)
		read_pathspec_from_stdin(revs, &sb, prune);
	strbuf_release(&sb);
}

static void add_grep(struct rev_info *revs, const char *ptn, enum grep_pat_token what)
{
	append_grep_pattern(&revs->grep_filter, ptn, \"command line\", 0, what);
" &&

	mkdir subdir &&
	test_commit subdir subdir/grep.c "enum grep_pat_token" &&

	test_commit uninteresting unrelated "hello, world" &&

	echo GREP_PATTERN >untracked
[master (root-commit) 6a780d2] initial
 Author: A U Thor <author@example.com>
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 grep.h
[master 7eeae3c] add-user
 Author: A U Thor <author@example.com>
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 revision.c
[master 22c3f1e] subdir
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 subdir/grep.c
[master cd972f3] uninteresting
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 unrelated

ok 2 - setup

expecting success: 
	cat >$less <<-\EOF &&
	#!/bin/sh
	printf "%s
" "$@" >pager-args
	EOF
	chmod +x $less &&
	cat >expect.less <<-\EOF &&
	+/*GREP_PATTERN
	grep.h
	EOF
	echo grep.h >expect.notless &&
	>empty &&

	PATH=.:$PATH git grep -O GREP_PATTERN >out &&
	{
		test_cmp expect.less pager-args ||
		test_cmp expect.notless pager-args
	} &&
	test_cmp empty out


ok 3 - git grep -O

expecting success: 
	test_must_fail git grep --cached -O GREP_PATTERN >out 2>msg &&
	grep open-files-in-pager msg

fatal: --open-files-in-pager only works on the worktree

ok 4 - git grep -O --cached

expecting success: 
	rm -f expect.less pager-args out &&
	cat >expect <<-\EOF &&
	grep.h
	untracked
	EOF
	>empty &&

	(
		GIT_PAGER='printf "%s
" >pager-args' &&
		export GIT_PAGER &&
		git grep --no-index -O GREP_PATTERN >out
	) &&
	test_cmp expect pager-args &&
	test_cmp empty out


ok 5 - git grep -O --no-index

expecting success: 
	cat >less <<-\EOF &&
	#!/bin/sh
	printf "%s
" "$@" >actual
	EOF
	chmod +x less


ok 6 - setup: fake "less"

expecting success: 
	cat >expect <<-\EOF &&
	+/*GREP_PATTERN
	grep.h
	EOF
	>empty &&

	GIT_PAGER=./less git grep -O GREP_PATTERN >out &&
	test_cmp expect actual &&
	test_cmp empty out &&

	git grep -O./less GREP_PATTERN >out2 &&
	test_cmp expect actual &&
	test_cmp empty out2


ok 7 - git grep -O jumps to line in less

expecting success: 
	rm -f actual &&
	cat >expect <<-\EOF &&
	+/*enum grep_pat_token
	grep.h
	revision.c
	subdir/grep.c
	unrelated
	EOF
	>empty &&

	echo "enum grep_pat_token" >unrelated &&
	test_when_finished "git checkout HEAD unrelated" &&
	GIT_PAGER=./less git grep -F -O "enum grep_pat_token" >out &&
	test_cmp expect actual &&
	test_cmp empty out


ok 8 - modified file

expecting success: 
	rm -f actual &&
	echo grep.h >expect &&
	test_config color.grep always &&
	test_config color.grep.filename yellow &&
	test_config color.grep.separator green &&
	git grep -O'printf "%s
" >actual' GREP_AND &&
	test_cmp expect actual

ok 9 - copes with color settings

expecting success: 
	rm -f actual &&
	echo grep.c >expect &&
	>empty &&

	(
		cd subdir &&
		export GIT_PAGER &&
		GIT_PAGER='printf "%s
" >../args' &&
		git grep -O "enum grep_pat_token" >../out &&
		git grep -O"pwd >../dir; :" "enum grep_pat_token" >../out2
	) &&
	case $(cat dir) in
	*subdir)
		: good
		;;
	*)
		false
		;;
	esac &&
	test_cmp expect args &&
	test_cmp empty out &&
	test_cmp empty out2

ok 10 - run from subdir

# passed all 10 test(s)
1..10

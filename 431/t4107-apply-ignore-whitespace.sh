Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4107-apply-ignore-whitespace/.git/
expecting success: 
	git apply patch1.patch


ok 1 - file creation

expecting success: 
	test_must_fail git apply patch2.patch


ok 2 - patch2 fails (retab)

expecting success: 
	git apply --ignore-whitespace patch2.patch


ok 3 - patch2 applies with --ignore-whitespace

expecting success: 
	git apply -R --ignore-space-change patch2.patch


ok 4 - patch2 reverse applies with --ignore-space-change

expecting success: 
	git apply patch2.patch

ok 5 - patch2 applies (apply.ignorewhitespace = change)

expecting success: 
	test_must_fail git apply patch3.patch

ok 6 - patch3 fails (missing string at EOL)

expecting success: 
	test_must_fail git apply patch4.patch


ok 7 - patch4 fails (missing EOL at EOF)

expecting success: 
	git apply patch5.patch
ok 8 - patch5 applies (leading whitespace)

expecting success: 
	test_cmp main.c main.c.final

ok 9 - patches do not mangle whitespace

expecting success: 
	rm -f main.c &&
	git apply patch1.patch

ok 10 - re-create file (with --ignore-whitespace)

expecting success: 
	test_must_fail git apply --no-ignore-whitespace patch5.patch
ok 11 - patch5 fails (--no-ignore-whitespace)
# passed all 11 test(s)
1..11

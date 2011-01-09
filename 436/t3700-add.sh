Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t3700-add/.git/
expecting success: touch foo && git add foo

ok 1 - Test of git add

expecting success: git ls-files foo | grep foo
foo

ok 2 - Post-check that foo is in the index

expecting success: touch -- -q && git add -- -q

ok 3 - Test that "git add -- -q" works

expecting success: git config core.filemode 0 &&
	 echo foo >xfoo1 &&
	 chmod 755 xfoo1 &&
	 git add xfoo1 &&
	 case "`git ls-files --stage xfoo1`" in
	 100644" "*xfoo1) echo pass;;
	 *) echo fail; git ls-files --stage xfoo1; (exit 1);;
	 esac
pass

ok 4 - git add: Test that executable bit is not used if core.filemode=0

expecting success: 
	rm -f xfoo1 &&
	ln -s foo xfoo1 &&
	git add xfoo1 &&
	case "`git ls-files --stage xfoo1`" in
	120000" "*xfoo1) echo pass;;
	*) echo fail; git ls-files --stage xfoo1; (exit 1);;
	esac

pass

ok 5 - git add: filemode=0 should not get confused by symlink

expecting success: git config core.filemode 0 &&
	 echo foo >xfoo2 &&
	 chmod 755 xfoo2 &&
	 git update-index --add xfoo2 &&
	 case "`git ls-files --stage xfoo2`" in
	 100644" "*xfoo2) echo pass;;
	 *) echo fail; git ls-files --stage xfoo2; (exit 1);;
	 esac
pass

ok 6 - git update-index --add: Test that executable bit is not used...

expecting success: 
	rm -f xfoo2 &&
	ln -s foo xfoo2 &&
	git update-index --add xfoo2 &&
	case "`git ls-files --stage xfoo2`" in
	120000" "*xfoo2) echo pass;;
	*) echo fail; git ls-files --stage xfoo2; (exit 1);;
	esac

pass

ok 7 - git add: filemode=0 should not get confused by symlink

expecting success: git config core.filemode 0 &&
	 ln -s xfoo2 xfoo3 &&
	 git update-index --add xfoo3 &&
	 case "`git ls-files --stage xfoo3`" in
	 120000" "*xfoo3) echo pass;;
	 *) echo fail; git ls-files --stage xfoo3; (exit 1);;
	 esac
pass

ok 8 - git update-index --add: Test that executable bit is not used...

expecting success: 
	echo "*.ig" >.gitignore &&
	mkdir c.if d.ig &&
	>a.ig && >b.if &&
	>c.if/c.if && >c.if/c.ig &&
	>d.ig/d.if && >d.ig/d.ig


ok 9 - .gitignore test setup

expecting success: 
	git add . &&
	! (git ls-files | grep "\.ig")


ok 10 - .gitignore is honored

expecting success: 
	test_must_fail git add a.?? &&
	! (git ls-files | grep "\.ig")
ok 11 - error out when attempting to add ignored ones without -f
expecting success: 
	test_must_fail git add d.?? &&
	! (git ls-files | grep "\.ig")

ok 12 - error out when attempting to add ignored ones without -f

expecting success: 
	git add -f a.?? &&
	git ls-files --error-unmatch a.ig

a.ig

ok 13 - add ignored ones with -f

expecting success: 
	git add -f d.??/* &&
	git ls-files --error-unmatch d.ig/d.if d.ig/d.ig

d.ig/d.if
d.ig/d.ig

ok 14 - add ignored ones with -f

expecting success: 
	rm -f .git/index &&
	git add -f d.?? &&
	git ls-files --error-unmatch d.ig/d.if d.ig/d.ig

d.ig/d.if
d.ig/d.ig

ok 15 - add ignored ones with -f

expecting success: 

	rm -f .git/index &&
	mkdir -p sub/dir &&
	echo "!dir/a.*" >sub/.gitignore &&
	>sub/a.ig &&
	>sub/dir/a.ig &&
	git add sub/dir &&
	git ls-files --error-unmatch sub/dir/a.ig &&
	rm -f .git/index &&
	(
		cd sub/dir &&
		git add .
	) &&
	git ls-files --error-unmatch sub/dir/a.ig

sub/dir/a.ig
sub/dir/a.ig

ok 16 - .gitignore with subdirectory

expecting success: 
	rm -f .git/index &&
	git add 1/2/a 1/3/b 1/2/c


ok 17 - check correct prefix detection

expecting success: 
	for s in 1 2 3
	do
		echo $s > stage$s
		echo "100755 $(git hash-object -w stage$s) $s	file"
		echo "120000 $(printf $s | git hash-object -w -t blob --stdin) $s	symlink"
	done | git update-index --index-info &&
	git config core.filemode 0 &&
	git config core.symlinks 0 &&
	echo new > file &&
	echo new > symlink &&
	git add file symlink &&
	git ls-files --stage | grep "^100755 .* 0	file$" &&
	git ls-files --stage | grep "^120000 .* 0	symlink$"
100755 3e757656cf36eca53338e520d134963a44f793f8 0	file
120000 3e757656cf36eca53338e520d134963a44f793f8 0	symlink

ok 18 - git add with filemode=0, symlinks=0, and unmerged entries

expecting success: 
	git rm --cached -f file symlink &&
	(
		echo "100644 $(git hash-object -w stage1) 1	file"
		echo "100755 $(git hash-object -w stage2) 2	file"
		echo "100644 $(printf 1 | git hash-object -w -t blob --stdin) 1	symlink"
		echo "120000 $(printf 2 | git hash-object -w -t blob --stdin) 2	symlink"
	) | git update-index --index-info &&
	git config core.filemode 0 &&
	git config core.symlinks 0 &&
	echo new > file &&
	echo new > symlink &&
	git add file symlink &&
	git ls-files --stage | grep "^100755 .* 0	file$" &&
	git ls-files --stage | grep "^120000 .* 0	symlink$"

rm 'file'
rm 'symlink'
100755 3e757656cf36eca53338e520d134963a44f793f8 0	file
120000 3e757656cf36eca53338e520d134963a44f793f8 0	symlink

ok 19 - git add with filemode=0, symlinks=0 prefers stage 2 over stage 1

expecting success: 
	>foo && git add foo && git commit -a -m "commit all" &&
	test -z "`git diff-index HEAD -- foo`" &&
	git read-tree HEAD &&
	case "`git diff-index HEAD -- foo`" in
	:100644" "*"M	foo") echo pass;;
	*) echo fail; (exit 1);;
	esac &&
	git add --refresh -- foo &&
	test -z "`git diff-index HEAD -- foo`"
[master (root-commit) b054fd4] commit all
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 1/2/a
 create mode 100644 1/2/c
 create mode 100644 1/3/b
 create mode 100755 file
 create mode 100644 foo
 create mode 120000 symlink
pass

ok 20 - git add --refresh

expecting success: 
	git reset --hard &&
	date >foo1 &&
	date >foo2 &&
	chmod 0 foo2 &&
	test_must_fail git add --verbose . &&
	! ( git ls-files foo1 | grep foo1 )

HEAD is now at b054fd4 commit all
add '-q'
add '.gitignore'
add 'b.if'
add 'c.if/c.if'
add 'foo1'

ok 21 - git add should fail atomically upon an unreadable file

expecting success: 
	git reset --hard &&
	date >foo1 &&
	date >foo2 &&
	chmod 0 foo2 &&
	test_must_fail git add --verbose --ignore-errors . &&
	git ls-files foo1 | grep foo1

HEAD is now at b054fd4 commit all
add '-q'
add '.gitignore'
add 'b.if'
add 'c.if/c.if'
add 'foo1'
add 'stage1'
add 'stage2'
add 'stage3'
add 'sub/.gitignore'
add 'sub/dir/a.ig'
add 'xfoo1'
add 'xfoo2'
add 'xfoo3'
foo1

ok 22 - git add --ignore-errors

expecting success: 
	git config add.ignore-errors 1 &&
	git reset --hard &&
	date >foo1 &&
	date >foo2 &&
	chmod 0 foo2 &&
	test_must_fail git add --verbose . &&
	git ls-files foo1 | grep foo1

HEAD is now at b054fd4 commit all
add 'a.ig'
add 'c.if/c.ig'
add 'd.ig/d.if'
add 'd.ig/d.ig'
add 'foo1'
add 'sub/a.ig'
foo1

ok 23 - git add (add.ignore-errors)

expecting success: 
	git config add.ignore-errors 0 &&
	git reset --hard &&
	date >foo1 &&
	date >foo2 &&
	chmod 0 foo2 &&
	test_must_fail git add --verbose . &&
	! ( git ls-files foo1 | grep foo1 )

HEAD is now at b054fd4 commit all
add 'foo1'

ok 24 - git add (add.ignore-errors = false)

expecting success: 
       git config add.ignore-errors 1 &&
       git reset --hard &&
       date >foo1 &&
       date >foo2 &&
       chmod 0 foo2 &&
       test_must_fail git add --verbose --no-ignore-errors . &&
       ! ( git ls-files foo1 | grep foo1 ) &&
       git config add.ignore-errors 0

HEAD is now at b054fd4 commit all
add 'foo1'

ok 25 - --no-ignore-errors overrides config

expecting success: 
	git reset --hard &&
	touch fo\[ou\]bar foobar &&
	git add 'fo\[ou\]bar' &&
	git ls-files fo\[ou\]bar | fgrep fo\[ou\]bar &&
	! ( git ls-files foobar | grep foobar )

HEAD is now at b054fd4 commit all
fo[ou]bar

ok 26 - git add 'fo\[ou\]bar' ignores foobar

expecting success: 
	git reset --hard &&
	H=$(git rev-parse :1/2/a) &&
	(
		echo "100644 $H 1	track-this"
		echo "100644 $H 3	track-this"
	) | git update-index --index-info &&
	echo track-this >>.gitignore &&
	echo resolved >track-this &&
	git add track-this

HEAD is now at b054fd4 commit all

ok 27 - git add to resolve conflicts on otherwise ignored path

expecting success: 
	test_must_fail git add non-existent &&
	! (git ls-files | grep "non-existent")


ok 28 - "add non-existent" should fail

expecting success: 
	echo new >>track-this &&
	git add --dry-run track-this >actual 2>&1 &&
	echo "add 'track-this'" | test_cmp - actual


ok 29 - git add --dry-run of existing changed file

expecting success: 
	echo ignored-file >>.gitignore &&
	test_must_fail git add --dry-run track-this ignored-file >actual 2>&1 &&
	echo "fatal: pathspec 'ignored-file' did not match any files" >expect


ok 30 - git add --dry-run of non-existing file

expecting success: 
	test_cmp expect actual


ok 31 - git add --dry-run of an existing file output

expecting success: 
	test_must_fail git add --dry-run --ignore-missing track-this ignored-file >actual.out 2>actual.err


ok 32 - git add --dry-run --ignore-missing of non-existing file

expecting success: 
	test_cmp expect.out actual.out &&
	test_cmp expect.err actual.err


ok 33 - git add --dry-run --ignore-missing of non-existing file output

# passed all 33 test(s)
1..33

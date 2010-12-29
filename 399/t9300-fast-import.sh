Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9300-fast-import/.git/
expecting success: 
	git fast-import </dev/null


ok 1 - empty stream succeeds

expecting success: git fast-import --export-marks=marks.out <input &&
	 git whatchanged master
commit 5ba2d0485e3e071f4ccbfdb22c474b305ebd159c
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    initial

:000000 100644 0000000... 7123f7f... A	file2
:000000 100644 0000000... 0d92e9f... A	file3
:000000 100755 0000000... 85df507... A	file4

ok 2 - A: create pack from stdin

expecting success: for p in .git/objects/pack/*.pack;do git verify-pack $p||exit;done

ok 3 - A: verify pack

expecting success: git cat-file commit master | sed 1d >actual &&
	test_cmp expect actual

ok 4 - A: verify commit

expecting success: git cat-file -p master^{tree} | sed "s/ [0-9a-f]*	/ /" >actual &&
	 test_cmp expect actual

ok 5 - A: verify tree

expecting success: git cat-file blob master:file2 >actual && test_cmp expect actual

ok 6 - A: verify file2

expecting success: git cat-file blob master:file3 >actual && test_cmp expect actual

ok 7 - A: verify file3

expecting success: git cat-file blob master:file4 >actual && test_cmp expect actual

ok 8 - A: verify file4

expecting success: 
	git cat-file tag tags/series-A >actual &&
	test_cmp expect actual


ok 9 - A: verify tag/series-A

expecting success: test_cmp expect marks.out

ok 10 - A: verify marks output

expecting success: git fast-import \
		--import-marks=marks.out \
		--export-marks=marks.new \
		</dev/null &&
	test_cmp expect marks.new

ok 11 - A: verify marks import

expecting success: git fast-import --import-marks=marks.out <input &&
	 git whatchanged verify--import-marks
commit 2624ac81d4330b08d5021424410f0d39d645c2b1
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:14:13 2005 -0700

    recreate from :5

:000000 100755 0000000... 7123f7f... A	copy-of-file2

commit 5ba2d0485e3e071f4ccbfdb22c474b305ebd159c
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    initial

:000000 100644 0000000... 7123f7f... A	file2
:000000 100644 0000000... 0d92e9f... A	file3
:000000 100755 0000000... 85df507... A	file4

ok 12 - A: verify marks import does not crash

expecting success: for p in .git/objects/pack/*.pack;do git verify-pack $p||exit;done

ok 13 - A: verify pack

expecting success: compare_diff_raw expect actual &&
	 test `git rev-parse --verify master:file2` \
	    = `git rev-parse --verify verify--import-marks:copy-of-file2`

ok 14 - A: verify diff

expecting success: 
	cat input.blob input.commit | git fast-import --export-marks=marks.large &&
	git ls-tree refs/heads/verify--dump-marks >tree.out &&
	test_cmp tree.exp_s tree.out &&
	test_cmp marks.exp marks.large

ok 15 - A: export marks with large values

expecting success: 
    test_must_fail git fast-import <input


ok 16 - B: fail on invalid blob sha1

expecting success: 
    test_must_fail git fast-import <input


ok 17 - B: fail on invalid branch name ".badbranchname"

expecting success: 
    test_must_fail git fast-import <input


ok 18 - B: fail on invalid branch name "bad[branch]name"

expecting success: git fast-import <input &&
	 test -f .git/TEMP_TAG &&
	 test `git rev-parse master` = `git rev-parse TEMP_TAG^`

ok 19 - B: accept branch name "TEMP_TAG"

expecting success: git fast-import <input &&
	 git whatchanged branch
commit 40a21027148a50d9063cd3fbd087bda2a045dade
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:17:13 2005 -0700

    second

:100644 000000 7123f7f... 0000000... D	file2
:000000 100755 0000000... f1fb5da... A	file2/newf
:000000 100644 0000000... 7123f7f... A	file2/oldf
:100644 000000 0d92e9f... 0000000... D	file3

commit 5ba2d0485e3e071f4ccbfdb22c474b305ebd159c
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    initial

:000000 100644 0000000... 7123f7f... A	file2
:000000 100644 0000000... 0d92e9f... A	file3
:000000 100755 0000000... 85df507... A	file4

ok 20 - C: incremental import create pack from stdin

expecting success: for p in .git/objects/pack/*.pack;do git verify-pack $p||exit;done

ok 21 - C: verify pack

expecting success: test $newf = `git rev-parse --verify branch:file2/newf` &&
	 test $oldf = `git rev-parse --verify branch:file2/oldf`

ok 22 - C: validate reuse existing blob

expecting success: git cat-file commit branch | sed 1d >actual &&
	 test_cmp expect actual

ok 23 - C: verify commit

expecting success: compare_diff_raw expect actual

ok 24 - C: validate rename result

expecting success: git fast-import <input &&
	 git whatchanged branch
commit 17a903ceb8a2c0f5f5362ef507e213661eaf3163
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:18:13 2005 -0700

    third

:000000 100755 0000000... e74b7d4... A	newdir/exec.sh
:000000 100644 0000000... fcf778c... A	newdir/interesting

commit 40a21027148a50d9063cd3fbd087bda2a045dade
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:17:13 2005 -0700

    second

:100644 000000 7123f7f... 0000000... D	file2
:000000 100755 0000000... f1fb5da... A	file2/newf
:000000 100644 0000000... 7123f7f... A	file2/oldf
:100644 000000 0d92e9f... 0000000... D	file3

commit 5ba2d0485e3e071f4ccbfdb22c474b305ebd159c
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    initial

:000000 100644 0000000... 7123f7f... A	file2
:000000 100644 0000000... 0d92e9f... A	file3
:000000 100755 0000000... 85df507... A	file4

ok 25 - D: inline data in commit

expecting success: for p in .git/objects/pack/*.pack;do git verify-pack $p||exit;done

ok 26 - D: verify pack

expecting success: compare_diff_raw expect actual

ok 27 - D: validate new files added

expecting success: git cat-file blob branch:newdir/interesting >actual &&
	 test_cmp expect actual

ok 28 - D: verify file5

expecting success: git cat-file blob branch:newdir/exec.sh >actual &&
	 test_cmp expect actual

ok 29 - D: verify file6

expecting success: 
    test_must_fail git fast-import --date-format=raw <input


ok 30 - E: rfc2822 date, --date-format=raw

expecting success: git fast-import --date-format=rfc2822 <input

ok 31 - E: rfc2822 date, --date-format=rfc2822

expecting success: for p in .git/objects/pack/*.pack;do git verify-pack $p||exit;done

ok 32 - E: verify pack

expecting success: git cat-file commit branch | sed 1,2d >actual &&
	test_cmp expect actual

ok 33 - E: verify commit

expecting success: if git fast-import <input
	 then
		echo BAD gfi did not fail
		return 1
	 else
		if test $old_branch = `git rev-parse --verify branch^0`
		then
			: branch unaffected and failure returned
			return 0
		else
			echo BAD gfi changed branch $old_branch
			return 1
		fi
	 fi
	
ok 34 - F: non-fast-forward update skips

expecting success: for p in .git/objects/pack/*.pack;do git verify-pack $p||exit;done

ok 35 - F: verify pack

expecting success: git cat-file commit other >actual &&
	test_cmp expect actual

ok 36 - F: verify other commit

expecting success: git fast-import --force <input

ok 37 - G: non-fast-forward update forced

expecting success: for p in .git/objects/pack/*.pack;do git verify-pack $p||exit;done

ok 38 - G: verify pack

expecting success: test $old_branch != `git rev-parse --verify branch^0` &&
	 test $old_branch = `git rev-parse --verify branch@{1}`

ok 39 - G: branch changed, but logged

expecting success: git fast-import <input &&
	 git whatchanged H
commit c5061923aed73d8e84092f31a5bd3adbf4defaa3
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:21:13 2005 -0700

    third

:100755 000000 f1fb5da... 0000000... D	file2/newf
:100644 000000 7123f7f... 0000000... D	file2/oldf
:100755 000000 85df507... 0000000... D	file4
:000000 100644 0000000... fcf778c... A	h/e/l/lo
:100755 000000 e74b7d4... 0000000... D	newdir/exec.sh
:100644 000000 fcf778c... 0000000... D	newdir/interesting

commit 17a903ceb8a2c0f5f5362ef507e213661eaf3163
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:18:13 2005 -0700

    third

:000000 100755 0000000... e74b7d4... A	newdir/exec.sh
:000000 100644 0000000... fcf778c... A	newdir/interesting

commit 40a21027148a50d9063cd3fbd087bda2a045dade
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:17:13 2005 -0700

    second

:100644 000000 7123f7f... 0000000... D	file2
:000000 100755 0000000... f1fb5da... A	file2/newf
:000000 100644 0000000... 7123f7f... A	file2/oldf
:100644 000000 0d92e9f... 0000000... D	file3

commit 5ba2d0485e3e071f4ccbfdb22c474b305ebd159c
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    initial

:000000 100644 0000000... 7123f7f... A	file2
:000000 100644 0000000... 0d92e9f... A	file3
:000000 100755 0000000... 85df507... A	file4

ok 40 - H: deletall, add 1

expecting success: for p in .git/objects/pack/*.pack;do git verify-pack $p||exit;done

ok 41 - H: verify pack

expecting success: compare_diff_raw expect actual

ok 42 - H: validate old files removed, new files added

expecting success: git cat-file blob H:h/e/l/lo >actual &&
	 test_cmp expect actual

ok 43 - H: verify file

expecting success: git fast-import --export-pack-edges=edges.list <input
ok 44 - I: export-pack-edges
expecting success: sed -e s/pack-.*pack/pack-.pack/ edges.list >actual &&
	 test_cmp expect actual

ok 45 - I: verify edge list
expecting success: git fast-import <input
ok 46 - J: reset existing branch creates empty commit

expecting success: test 1 = `git rev-list J | wc -l` &&
	 test 0 = `git ls-tree J | wc -l`

ok 47 - J: branch has 1 commit, empty tree
expecting success: git fast-import <input
ok 48 - K: reinit branch with from
expecting success: test `git rev-parse --verify branch^1` \
		= `git rev-parse --verify K^1`

ok 49 - K: verify K^1 = branch^1
expecting success: git fast-import <input &&
	 git diff-tree --abbrev --raw L^ L >output &&
	 test_cmp expect output
ok 50 - L: verify internal tree sorting
expecting success: git fast-import <input &&
	 git diff-tree -M -r M1^ M1 >actual &&
	 compare_diff_raw expect actual
ok 51 - M: rename file in same subdirectory
expecting success: git fast-import <input &&
	 git diff-tree -M -r M2^ M2 >actual &&
	 compare_diff_raw expect actual
ok 52 - M: rename file to new subdirectory
expecting success: git fast-import <input &&
	 git diff-tree -M -r M3^ M3 >actual &&
	 compare_diff_raw expect actual
ok 53 - M: rename subdirectory to new subdirectory
expecting success: git fast-import <input &&
	 git diff-tree -C --find-copies-harder -r N1^ N1 >actual &&
	 compare_diff_raw expect actual
ok 54 - N: copy file in same subdirectory
expecting success: git fast-import <input &&
	 git diff-tree -C --find-copies-harder -r N2^^ N2 >actual &&
	 compare_diff_raw expect actual
ok 55 - N: copy then modify subdirectory
expecting success: git fast-import <input &&
	 test `git rev-parse N2^{tree}` = `git rev-parse N3^{tree}`
ok 56 - N: copy dirty subdirectory
expecting success: cat >expect <<-\EOF &&
	:100755 100755 f1fb5da718392694d0076d677d6d0e364c79b0bc f1fb5da718392694d0076d677d6d0e364c79b0bc C100	file2/newf	file3/newf
	:100644 100644 7123f7f44e39be127c5eb701e5968176ee9d78b1 7123f7f44e39be127c5eb701e5968176ee9d78b1 C100	file2/oldf	file3/oldf
	EOF
	 subdir=$(git rev-parse refs/heads/branch^0:file2) &&
	 cat >input <<-INPUT_END &&
	commit refs/heads/N4
	committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
	data <<COMMIT
	copy by tree hash
	COMMIT

	from refs/heads/branch^0
	M 040000 $subdir file3
	INPUT_END
	 git fast-import <input &&
	 git diff-tree -C --find-copies-harder -r N4^ N4 >actual &&
	 compare_diff_raw expect actual
ok 57 - N: copy directory by id
expecting success: cat >expect <<-\EOF &&
	:100755 000000 f1fb5da718392694d0076d677d6d0e364c79b0bc 0000000000000000000000000000000000000000 D	file3/newf
	:100644 000000 7123f7f44e39be127c5eb701e5968176ee9d78b1 0000000000000000000000000000000000000000 D	file3/oldf
	EOF
	 root=$(git rev-parse refs/heads/branch^0^{tree}) &&
	 cat >input <<-INPUT_END &&
	commit refs/heads/N6
	committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
	data <<COMMIT
	copy root directory by tree hash
	COMMIT

	from refs/heads/branch^0
	M 040000 $root ""
	INPUT_END
	 git fast-import <input &&
	 git diff-tree -C --find-copies-harder -r N4 N6 >actual &&
	 compare_diff_raw expect actual
ok 58 - N: copy root directory by tree hash
expecting success: cat >expect <<-\EOF &&
	:100644 100644 fcf778cda181eaa1cbc9e9ce3a2e15ee9f9fe791 fcf778cda181eaa1cbc9e9ce3a2e15ee9f9fe791 C100	newdir/interesting	file3/file5
	:100755 100755 f1fb5da718392694d0076d677d6d0e364c79b0bc f1fb5da718392694d0076d677d6d0e364c79b0bc C100	file2/newf	file3/newf
	:100644 100644 7123f7f44e39be127c5eb701e5968176ee9d78b1 7123f7f44e39be127c5eb701e5968176ee9d78b1 C100	file2/oldf	file3/oldf
	EOF
	 subdir=$(git rev-parse refs/heads/branch^0:file2) &&
	 cat >input <<-INPUT_END &&
	commit refs/heads/N5
	committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
	data <<COMMIT
	copy by tree hash
	COMMIT

	from refs/heads/branch^0
	M 040000 $subdir file3

	commit refs/heads/N5
	committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
	data <<COMMIT
	modify directory copy
	COMMIT

	M 644 inline file3/file5
	data <<EOF
	$file5_data
	EOF
	INPUT_END
	 git fast-import <input &&
	 git diff-tree -C --find-copies-harder -r N5^^ N5 >actual &&
	 compare_diff_raw expect actual

ok 59 - N: modify copied tree

expecting success: subdir=$(git rev-parse refs/heads/branch^0:file2) &&
	 test_must_fail git fast-import <<-INPUT_END
	commit refs/heads/N5B
	committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
	data <<COMMIT
	copy with invalid syntax
	COMMIT

	from refs/heads/branch^0
	M 040000 $subdir file3/
	INPUT_END

ok 60 - N: reject foo/ syntax

expecting success: echo "hello, world" >expect.foo &&
	 echo hello >expect.bar &&
	 git fast-import <<-SETUP_END &&
	commit refs/heads/N7
	committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
	data <<COMMIT
	hello, tree
	COMMIT

	deleteall
	M 644 inline foo/bar
	data <<EOF
	hello
	EOF
	SETUP_END

	 tree=$(git rev-parse --verify N7:) &&
	 git fast-import <<-INPUT_END &&
	commit refs/heads/N8
	committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
	data <<COMMIT
	copy to root by id and modify
	COMMIT

	M 040000 $tree ""
	M 644 inline foo/foo
	data <<EOF
	hello, world
	EOF
	INPUT_END
	 git show N8:foo/foo >actual.foo &&
	 git show N8:foo/bar >actual.bar &&
	 test_cmp expect.foo actual.foo &&
	 test_cmp expect.bar actual.bar

ok 61 - N: copy to root by id and modify

expecting success: branch=$(git rev-parse --verify refs/heads/branch^{tree}) &&
	 cat >input <<-INPUT_END &&
	commit refs/heads/N9
	committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
	data <<COMMIT
	extract subtree branch:newdir
	COMMIT

	M 040000 $branch ""
	C "newdir" ""
	INPUT_END
	 git fast-import <input &&
	 git diff --exit-code branch:newdir N9

ok 62 - N: extract subtree

expecting success: echo hello >expect.baz &&
	 echo hello, world >expect.qux &&
	 git fast-import <<-SETUP_END &&
	commit refs/heads/N10
	committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
	data <<COMMIT
	hello, tree
	COMMIT

	deleteall
	M 644 inline foo/bar/baz
	data <<EOF
	hello
	EOF
	SETUP_END

	 tree=$(git rev-parse --verify N10:) &&
	 git fast-import <<-INPUT_END &&
	commit refs/heads/N11
	committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
	data <<COMMIT
	copy to root by id and modify
	COMMIT

	M 040000 $tree ""
	M 100644 inline foo/bar/qux
	data <<EOF
	hello, world
	EOF
	R "foo" ""
	C "bar/qux" "bar/quux"
	INPUT_END
	 git show N11:bar/baz >actual.baz &&
	 git show N11:bar/qux >actual.qux &&
	 git show N11:bar/quux >actual.quux &&
	 test_cmp expect.baz actual.baz &&
	 test_cmp expect.qux actual.qux &&
	 test_cmp expect.qux actual.quux

ok 63 - N: modify subtree, extract it, and modify again

expecting success: git fast-import <input &&
	 test `git rev-parse N3` = `git rev-parse O1`

ok 64 - O: comments are all skipped

expecting success: git fast-import <input &&
	 test `git rev-parse N3` = `git rev-parse O2`

ok 65 - O: blank lines not necessary after data commands

expecting success: git repack -a -d
ok 66 - O: repack before next test
expecting success: git fast-import <input &&
	 test 8 = `find .git/objects/pack -type f | wc -l` &&
	 test `git rev-parse refs/tags/O3-2nd` = `git rev-parse O3^` &&
	 git log --reverse --pretty=oneline O3 | sed s/^.*z// >actual &&
	 test_cmp expect actual
ok 67 - O: blank lines not necessary after other commands
expecting success: git fast-import <input >actual &&
	 grep "progress " <input >expect &&
	 test_cmp expect actual
ok 68 - O: progress outputs as requested by input
expecting success: git fast-import <input &&
	 git checkout subuse1 &&
	 rm -rf sub && mkdir sub && (cd sub &&
	 git init &&
	 git fetch --update-head-ok .. refs/heads/sub:refs/heads/master &&
	 git checkout master) &&
	 git submodule init &&
	 git submodule update
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9300-fast-import/sub/.git/
Submodule 'sub' (/Users/trast/git-smoke/t/trash directory.t9300-fast-import/sub) registered for path 'sub'
ok 69 - P: supermodule & submodule mix
expecting success: git branch -D sub &&
	 git gc && git prune &&
	 git fast-import <input &&
	 test $(git rev-parse --verify subuse2) = $(git rev-parse --verify subuse1)
Deleted branch sub (was 26bc2b7).
ok 70 - P: verbatim SHA gitlinks
expecting success: 
    test_must_fail git fast-import <input
ok 71 - P: fail on inline gitlink
expecting success: 
    test_must_fail git fast-import <input
ok 72 - P: fail on blob mark in gitlink
expecting success: git fast-import <input &&
	 git whatchanged notes-test
commit acd7d8655b7914992f78068dd8387a07d6484361
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:26:13 2005 -0700

    third (:6)

:000000 100644 0000000... fcf778c... A	file5
:000000 100755 0000000... e74b7d4... A	file6

commit 2a2953c2eec7c59bb9b51efd2931bc74d8b51923
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:26:13 2005 -0700

    second (:5)

:000000 100644 0000000... 85df507... A	file4

commit 9b163d45d94a9e412e25f4f8a53fa2959c4dedd3
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:26:13 2005 -0700

    first (:3)

:000000 100644 0000000... 7123f7f... A	file2

ok 73 - Q: commit notes
expecting success: for p in .git/objects/pack/*.pack;do git verify-pack $p||exit;done
ok 74 - Q: verify pack
expecting success: git cat-file commit notes-test~2 | sed 1d >actual &&
	test_cmp expect actual

ok 75 - Q: verify first commit
expecting success: git cat-file commit notes-test^ | sed 1d >actual &&
	test_cmp expect actual

ok 76 - Q: verify second commit
expecting success: git cat-file commit notes-test | sed 1d >actual &&
	test_cmp expect actual

ok 77 - Q: verify third commit
expecting success: git cat-file commit refs/notes/foobar~2 | sed 1d >actual &&
	test_cmp expect actual

ok 78 - Q: verify first notes commit
expecting success: git cat-file -p refs/notes/foobar~2^{tree} | sed "s/ [0-9a-f]*	/ /" >actual &&
	 test_cmp expect actual

ok 79 - Q: verify first notes tree
expecting success: git cat-file blob refs/notes/foobar~2:$commit1 >actual && test_cmp expect actual
ok 80 - Q: verify first note for first commit
expecting success: git cat-file blob refs/notes/foobar~2:$commit2 >actual && test_cmp expect actual
ok 81 - Q: verify first note for second commit
expecting success: git cat-file blob refs/notes/foobar~2:$commit3 >actual && test_cmp expect actual
ok 82 - Q: verify first note for third commit
expecting success: git cat-file commit refs/notes/foobar^ | sed 1d >actual &&
	test_cmp expect actual

ok 83 - Q: verify second notes commit
expecting success: git cat-file -p refs/notes/foobar^^{tree} | sed "s/ [0-9a-f]*	/ /" >actual &&
	 test_cmp expect actual

ok 84 - Q: verify second notes tree
expecting success: git cat-file blob refs/notes/foobar^:$commit1 >actual && test_cmp expect actual
ok 85 - Q: verify second note for first commit
expecting success: git cat-file blob refs/notes/foobar^:$commit2 >actual && test_cmp expect actual
ok 86 - Q: verify first note for second commit
expecting success: git cat-file blob refs/notes/foobar^:$commit3 >actual && test_cmp expect actual
ok 87 - Q: verify first note for third commit
expecting success: git cat-file commit refs/notes/foobar2 | sed 1d >actual &&
	test_cmp expect actual

ok 88 - Q: verify third notes commit
expecting success: git cat-file -p refs/notes/foobar2^{tree} | sed "s/ [0-9a-f]*	/ /" >actual &&
	 test_cmp expect actual

ok 89 - Q: verify third notes tree
expecting success: git cat-file blob refs/notes/foobar2:$commit1 >actual && test_cmp expect actual
ok 90 - Q: verify third note for first commit
expecting success: git cat-file commit refs/notes/foobar | sed 1d >actual &&
	test_cmp expect actual

ok 91 - Q: verify fourth notes commit
expecting success: git cat-file -p refs/notes/foobar^{tree} | sed "s/ [0-9a-f]*	/ /" >actual &&
	 test_cmp expect actual

ok 92 - Q: verify fourth notes tree
expecting success: git cat-file blob refs/notes/foobar:$commit2 >actual && test_cmp expect actual
ok 93 - Q: verify second note for second commit
expecting success: 
	test_must_fail git fast-import <input
ok 94 - R: abort on unsupported feature
expecting success: 
	git fast-import <input
ok 95 - R: supported feature is accepted
expecting success: 
	test_must_fail git fast-import <input
ok 96 - R: abort on receiving feature after data command
expecting success: 
	test_must_fail git fast-import <input
ok 97 - R: only one import-marks feature allowed per stream
expecting success: cat input | git fast-import &&
    grep :1 git.marks
:1 45b983be36b73c0788dc9cbcb76cbb80fc7bb057
ok 98 - R: export-marks feature results in a marks file being created
expecting success: cat input | git fast-import --export-marks=other.marks &&
    grep :1 other.marks
:1 45b983be36b73c0788dc9cbcb76cbb80fc7bb057
ok 99 - R: export-marks options can be overriden by commandline options
expecting success: cat input | git fast-import &&
    test_cmp marks.out marks.new
ok 100 - R: import to output marks works without any content
expecting success: cat input | git fast-import --import-marks=marks.out &&
    test_cmp marks.out marks.new
ok 101 - R: import marks prefers commandline marks file over the stream
expecting success: 
    head -n2 marks.out > one.marks &&
    tail -n +3 marks.out > two.marks &&
    git fast-import --import-marks=one.marks --import-marks=two.marks <input &&
    test_cmp marks.out combined.marks
ok 102 - R: multiple --import-marks= should be honoured
expecting success: 
    mkdir -p .git/info/fast-import/ &&
    cp marks.new .git/info/fast-import/relative.in &&
    git fast-import <input &&
    test_cmp marks.new .git/info/fast-import/relative.out
ok 103 - R: feature relative-marks should be honoured
expecting success: 
    git fast-import <input &&
    test_cmp marks.new non-relative.out
ok 104 - R: feature no-relative-marks should be honoured
expecting success: 
	echo "feature cat-blob" |
	git fast-import
ok 105 - R: feature cat-blob supported
expecting success: 
	test_must_fail git fast-import --cat-blob-fd=-1 </dev/null
ok 106 - R: cat-blob-fd must be a nonnegative integer
expecting success: 
	blob=$(echo "yes it can" | git hash-object -w --stdin) &&
	cat >expect <<-EOF &&
	${blob} blob 11
	yes it can

	EOF
	echo "cat-blob $blob" |
	git fast-import --cat-blob-fd=6 6>actual &&
	test_cmp expect actual
ok 107 - R: print old blob
expecting success: 
	echo hello >greeting &&
	blob=$(git hash-object -w greeting) &&
	cat >expect <<-EOF &&
	${blob} blob 6
	hello

	EOF
	git fast-import --cat-blob-fd=3 3>actual.3 >actual.1 <<-EOF &&
	cat-blob $blob
	EOF
	test_cmp expect actual.3 &&
	test_cmp empty actual.1 &&
	git fast-import 3>actual.3 >actual.1 <<-EOF &&
	option cat-blob-fd=3
	cat-blob $blob
	EOF
	test_cmp empty actual.3 &&
	test_cmp expect actual.1
ok 108 - R: in-stream cat-blob-fd not respected
expecting success: 
	blob=$(echo "yep yep yep" | git hash-object --stdin) &&
	cat >expect <<-EOF &&
	${blob} blob 12
	yep yep yep

	EOF
	git fast-import --cat-blob-fd=6 6>actual <<-\EOF &&
	blob
	mark :1
	data <<BLOB_END
	yep yep yep
	BLOB_END
	cat-blob :1
	EOF
	test_cmp expect actual
ok 109 - R: print new blob
expecting success: 
	blob=$(echo "a new blob named by sha1" | git hash-object --stdin) &&
	cat >expect <<-EOF &&
	${blob} blob 25
	a new blob named by sha1

	EOF
	git fast-import --cat-blob-fd=6 6>actual <<-EOF &&
	blob
	data <<BLOB_END
	a new blob named by sha1
	BLOB_END
	cat-blob $blob
	EOF
	test_cmp expect actual
ok 110 - R: print new blob by sha1
expecting success: 
	(
		echo "the quick brown fox jumps over the lazy dog" >big &&
		for i in 1 2 3
		do
			cat big big big big >bigger &&
			cat bigger bigger bigger bigger >big ||
			exit
		done
	)

ok 111 - setup: big file

expecting success: 
	blob1=$(git hash-object big) &&
	blob1_len=$(wc -c <big) &&
	blob2=$(echo hello | git hash-object --stdin) &&
	{
		echo ${blob1} blob $blob1_len &&
		cat big &&
		cat <<-EOF

		${blob2} blob 6
		hello

		EOF
	} >expect &&
	{
		cat <<-\END_PART1 &&
			blob
			mark :1
			data <<data_end
		END_PART1
		cat big &&
		cat <<-\EOF
			data_end
			blob
			mark :2
			data <<data_end
			hello
			data_end
			cat-blob :1
			cat-blob :2
		EOF
	} |
	git fast-import >actual &&
	test_cmp expect actual
ok 112 - R: print two blobs to stdout
expecting success: 
	rm -f frob &&
	if mkfifo frob
	then
		test_set_prereq PIPE
	fi

ok 113 - setup: have pipes?
expecting success: 
	expect_id=$(git hash-object big) &&
	expect_len=$(wc -c <big) &&
	echo $expect_id blob $expect_len >expect.response &&

	rm -f blobs &&
	cat >frontend <<-\FRONTEND_END &&
	#!/bin/sh
	FRONTEND_END

	mkfifo blobs &&
	(
		export GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL GIT_COMMITTER_DATE &&
		cat <<-\EOF &&
		feature cat-blob
		blob
		mark :1
		data <<BLOB
		EOF
		cat big &&
		cat <<-\EOF &&
		BLOB
		cat-blob :1
		EOF

		read blob_id type size <&3 &&
		echo "$blob_id $type $size" >response &&
		head_c $size >blob <&3 &&
		read newline <&3 &&

		cat <<-EOF &&
		commit refs/heads/copied
		committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
		data <<COMMIT
		copy big file as file3
		COMMIT
		M 644 inline file3
		data <<BLOB
		EOF
		cat blob &&
		echo BLOB
	) 3<blobs |
	git fast-import --cat-blob-fd=3 3>blobs &&
	git show copied:file3 >actual &&
	test_cmp expect.response response &&
	test_cmp big actual
ok 114 - R: copy using cat-file
expecting success: 
	rm -f blobs &&
	echo "A blob from _before_ the commit." >expect &&
	mkfifo blobs &&
	(
		exec 3<blobs &&
		cat <<-EOF &&
		feature cat-blob
		blob
		mark :1
		data <<BLOB
		A blob from _before_ the commit.
		BLOB
		commit refs/heads/temporary
		committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
		data <<COMMIT
		Empty commit
		COMMIT
		cat-blob :1
		EOF

		read blob_id type size <&3 &&
		head_c $size >actual <&3 &&
		read newline <&3 &&

		echo
	) |
	git fast-import --cat-blob-fd=3 3>blobs &&
	test_cmp expect actual
ok 115 - R: print blob mid-commit
expecting success: 
	rm -f blobs &&
	echo "A blob from _within_ the commit." >expect &&
	mkfifo blobs &&
	(
		exec 3<blobs &&
		cat <<-EOF &&
		feature cat-blob
		commit refs/heads/within
		committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
		data <<COMMIT
		Empty commit
		COMMIT
		M 644 inline within
		data <<BLOB
		A blob from _within_ the commit.
		BLOB
		EOF

		to_get=$(
			echo "A blob from _within_ the commit." |
			git hash-object --stdin
		) &&
		echo "cat-blob $to_get" &&

		read blob_id type size <&3 &&
		head_c $size >actual <&3 &&
		read newline <&3 &&

		echo deleteall
	) |
	git fast-import --cat-blob-fd=3 3>blobs &&
	test_cmp expect actual
ok 116 - R: print staged blob within commit
expecting success: 
    cat input | git fast-import 2> output &&
    test_cmp empty output

ok 117 - R: quiet option results in no stats being output
expecting success: 
    test_must_fail git fast-import <input
ok 118 - R: die on unknown option

expecting success: \
    test_must_fail git fast-import --non-existing-option < /dev/null
ok 119 - R: unknown commandline options are rejected
expecting success: 
	echo "option git active-branches=-5" |
	test_must_fail git fast-import &&
	echo "option git depth=" |
	test_must_fail git fast-import &&
	test_must_fail git fast-import --depth="5 elephants" </dev/null
ok 120 - R: die on invalid option argument
expecting success: 
    git fast-import <input
ok 121 - R: ignore non-git options
expecting success: test_create_repo R &&
	 git --git-dir=R/.git fast-import --big-file-threshold=1 <input
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9300-fast-import/R/.git/
ok 122 - R: blob bigger than threshold
expecting success: : >verify &&
	 for p in R/.git/objects/pack/*.pack;
	 do
	   git verify-pack -v $p >>verify || exit;
	 done

ok 123 - R: verify created pack

expecting success: git --git-dir=R/.git cat-file blob big-file:big1 >actual &&
	 test_cmp expect actual &&
	 a=$(git --git-dir=R/.git rev-parse big-file:big1) &&
	 b=$(git --git-dir=R/.git rev-parse big-file:big2) &&
	 test $a = $b

ok 124 - R: verify written objects

expecting success: n=$(grep $a verify | wc -l) &&
	 test 1 = $n

ok 125 - R: blob appears only once

# passed all 125 test(s)
1..125

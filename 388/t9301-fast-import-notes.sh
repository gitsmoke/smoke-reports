Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9301-fast-import-notes/.git/
expecting success: 

	git fast-import <input &&
	git whatchanged master
commit 9a93771a958bca801f51ff270bc677be08b70970
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    fourth commit

:100755 100755 3c9b917... 98d1b63... M	bar

commit dbe3ab44992634d04709231cc00251483e46cff8
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    third commit

:100644 100644 215df20... 634bd2b... M	foo

commit bcc89d2db5d163929b6fbd169c2559b47a076acb
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    second commit

:100644 100755 532386d... be960bf... M	baz/xyzzy
:100644 100644 df023b2... 215df20... M	foo

commit 49f8b007d515fc33aed8245ee498753d4270cc78
Author: C O Mitter <committer@example.com>
Date:   Thu Apr 7 15:13:13 2005 -0700

    first commit

:000000 100755 0000000... 3c9b917... A	bar
:000000 100644 0000000... 532386d... A	baz/xyzzy
:000000 100644 0000000... df023b2... A	foo

ok 1 - set up master branch

expecting success: 

	git fast-import <input &&
	GIT_NOTES_REF=refs/notes/test git log | grep "^    " > actual &&
	test_cmp expect actual



ok 2 - add notes with simple M command

expecting success: 

	git fast-import <input &&
	GIT_NOTES_REF=refs/notes/test git log | grep "^    " > actual &&
	test_cmp expect actual



ok 3 - add notes with simple N command

expecting success: 

	git fast-import <input &&
	GIT_NOTES_REF=refs/notes/test git log | grep "^    " > actual &&
	test_cmp expect actual



ok 4 - update existing notes with N command

expecting success: 

	git fast-import <input &&
	GIT_NOTES_REF=refs/notes/test git log | grep "^    " > actual &&
	test_cmp expect actual



ok 5 - add concatentation notes with M command

expecting success: 

	git fast-import <input &&
	GIT_NOTES_REF=refs/notes/test git log | grep "^    " > actual &&
	test_cmp expect actual



ok 6 - verify that deleteall also removes notes

expecting success: 

	git fast-import <input &&
	GIT_NOTES_REF=refs/notes/test git log | grep "^    " > actual &&
	test_cmp expect actual

ok 7 - verify that later N commands override earlier M commands
expecting success: 

	git fast-import <input &&
	GIT_NOTES_REF=refs/notes/many_notes git log refs/heads/many_commits |
	    grep "^    " > actual &&
	test_cmp expect actual

ok 8 - add lots of commits and notes

expecting success: 

	# None of the entries in the top-level notes tree should be a full SHA1
	git ls-tree --name-only refs/notes/many_notes |
	while read path
	do
		if test $(expr length "$path") -ge 40
		then
			return 1
		fi
	done
ok 9 - verify that lots of notes trigger a fanout scheme
expecting success: 

	git cat-file -p refs/notes/many_notes:foobar/non-note.txt > actual &&
	test_cmp expect_non-note1 actual &&
	git cat-file -p refs/notes/many_notes:deadbeef > actual &&
	test_cmp expect_non-note2 actual &&
	git cat-file -p refs/notes/many_notes:de/adbeef > actual &&
	test_cmp expect_non-note3 actual

ok 10 - verify that non-notes are untouched by a fanout change
expecting success: 

	git fast-import <input &&
	GIT_NOTES_REF=refs/notes/many_notes git log refs/heads/many_commits |
	    grep "^    " > actual &&
	test_cmp expect actual



ok 11 - remove lots of notes

expecting success: 

	# All entries in the top-level notes tree should be a full SHA1
	git ls-tree --name-only -r refs/notes/many_notes |
	while read path
	do
		# Explicitly ignore the non-note paths
		test "$path" = "foobar/non-note.txt" && continue
		test "$path" = "deadbeef" && continue
		test "$path" = "de/adbeef" && continue

		if test $(expr length "$path") -ne 40
		then
			return 1
		fi
	done



ok 12 - verify that removing notes trigger fanout consolidation

expecting success: 

	git cat-file -p refs/notes/many_notes:foobar/non-note.txt > actual &&
	test_cmp expect_non-note1 actual &&
	git cat-file -p refs/notes/many_notes:deadbeef > actual &&
	test_cmp expect_non-note2 actual &&
	git cat-file -p refs/notes/many_notes:de/adbeef > actual &&
	test_cmp expect_non-note3 actual



ok 13 - verify that non-notes are untouched by a fanout change

expecting success: 

	git fast-import --active-branches=5 <input &&
	GIT_NOTES_REF=refs/notes/more_notes_1 git log refs/heads/more_commits |
	    grep "^    " > actual &&
	test_cmp expect actual



ok 14 - add notes to 16 commits in each of 10 refs

# passed all 14 test(s)
1..14

ok 1 - A: create pack from stdin
ok 2 - A: verify pack
ok 3 - A: verify commit
ok 4 - A: verify tree
ok 5 - A: verify file2
ok 6 - A: verify file3
ok 7 - A: verify file4
ok 8 - A: verify tag/series-A
ok 9 - A: verify marks output
ok 10 - A: verify marks import
ok 11 - A: verify marks import does not crash
ok 12 - A: verify pack
ok 13 - A: verify diff
ok 14 - A: export marks with large values
ok 15 - B: fail on invalid blob sha1
ok 16 - B: fail on invalid branch name ".badbranchname"
ok 17 - B: fail on invalid branch name "bad[branch]name"
ok 18 - B: accept branch name "TEMP_TAG"
ok 19 - C: incremental import create pack from stdin
ok 20 - C: verify pack
ok 21 - C: validate reuse existing blob
ok 22 - C: verify commit
ok 23 - C: validate rename result
ok 24 - D: inline data in commit
ok 25 - D: verify pack
ok 26 - D: validate new files added
ok 27 - D: verify file5
ok 28 - D: verify file6
ok 29 - E: rfc2822 date, --date-format=raw
ok 30 - E: rfc2822 date, --date-format=rfc2822
ok 31 - E: verify pack
ok 32 - E: verify commit
ok 33 - F: non-fast-forward update skips
ok 34 - F: verify pack
ok 35 - F: verify other commit
ok 36 - G: non-fast-forward update forced
ok 37 - G: verify pack
ok 38 - G: branch changed, but logged
ok 39 - H: deletall, add 1
ok 40 - H: verify pack
ok 41 - H: validate old files removed, new files added
ok 42 - H: verify file
ok 43 - I: export-pack-edges
ok 44 - I: verify edge list
ok 45 - J: reset existing branch creates empty commit
ok 46 - J: branch has 1 commit, empty tree
ok 47 - K: reinit branch with from
ok 48 - K: verify K^1 = branch^1
ok 49 - L: verify internal tree sorting
ok 50 - M: rename file in same subdirectory
ok 51 - M: rename file to new subdirectory
ok 52 - M: rename subdirectory to new subdirectory
ok 53 - N: copy file in same subdirectory
ok 54 - N: copy then modify subdirectory
ok 55 - N: copy dirty subdirectory
ok 56 - N: copy directory by id
ok 57 - N: copy root directory by tree hash
ok 58 - N: modify copied tree
ok 59 - N: reject foo/ syntax
ok 60 - N: copy to root by id and modify
ok 61 - N: extract subtree
not ok - 62 N: modify subtree, extract it, and modify again
#	echo hello >expect.baz &&
#		 echo hello, world >expect.qux &&
#		 git fast-import <<-SETUP_END &&
#		commit refs/heads/N10
#		committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
#		data <<COMMIT
#		hello, tree
#		COMMIT
#	
#		deleteall
#		M 644 inline foo/bar/baz
#		data <<EOF
#		hello
#		EOF
#		SETUP_END
#	
#		 treeÿgit rev-parse --verify N10:) &&
#		 git fast-import <<-INPUT_END &&
#		commit refs/heads/N11
#		committer $GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL> $GIT_COMMITTER_DATE
#		data <<COMMIT
#		copy to root by id and modify
#		COMMIT
#	
#		M 040000 $tree ""
#		M 100644 inline foo/bar/qux
#		data <<EOF
#		hello, world
#		EOF
#		R "foo" ""
#		C "bar/qux" "bar/quux"
#		INPUT_END
#		 git show N11:bar/baz >actual.baz &&
#		 git show N11:bar/qux >actual.qux &&
#		 git show N11:bar/quux >actual.quux &&
#		 test_cmp expect.baz actual.baz &&
#		 test_cmp expect.qux actual.qux &&
#		 test_cmp expect.qux actual.quux
ok 63 - O: comments are all skipped
ok 64 - O: blank lines not necessary after data commands
ok 65 - O: repack before next test
ok 66 - O: blank lines not necessary after other commands
ok 67 - O: progress outputs as requested by input
ok 68 - P: supermodule & submodule mix
ok 69 - P: verbatim SHA gitlinks
ok 70 - P: fail on inline gitlink
ok 71 - P: fail on blob mark in gitlink
ok 72 - Q: commit notes
ok 73 - Q: verify pack
ok 74 - Q: verify first commit
ok 75 - Q: verify second commit
ok 76 - Q: verify third commit
ok 77 - Q: verify first notes commit
ok 78 - Q: verify first notes tree
ok 79 - Q: verify first note for first commit
ok 80 - Q: verify first note for second commit
ok 81 - Q: verify first note for third commit
ok 82 - Q: verify second notes commit
ok 83 - Q: verify second notes tree
ok 84 - Q: verify second note for first commit
ok 85 - Q: verify first note for second commit
ok 86 - Q: verify first note for third commit
ok 87 - Q: verify third notes commit
ok 88 - Q: verify third notes tree
ok 89 - Q: verify third note for first commit
ok 90 - Q: verify fourth notes commit
ok 91 - Q: verify fourth notes tree
ok 92 - Q: verify second note for second commit
ok 93 - R: abort on unsupported feature
ok 94 - R: supported feature is accepted
ok 95 - R: abort on receiving feature after data command
ok 96 - R: only one import-marks feature allowed per stream
ok 97 - R: export-marks feature results in a marks file being created
ok 98 - R: export-marks options can be overriden by commandline options
ok 99 - R: import to output marks works without any content
ok 100 - R: import marks prefers commandline marks file over the stream
ok 101 - R: multiple --import-marks= should be honoured
ok 102 - R: feature relative-marks should be honoured
ok 103 - R: feature no-relative-marks should be honoured
ok 104 - R: quiet option results in no stats being output
ok 105 - R: die on unknown option
ok 106 - R: unknown commandline options are rejected
ok 107 - R: ignore non-git options
ok 108 - R: blob bigger than threshold
ok 109 - R: verify created pack
ok 110 - R: verify written objects
ok 111 - R: blob appears only once
# failed 1 among 111 test(s)
1..111

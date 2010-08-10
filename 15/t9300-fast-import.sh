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
ok 14 - B: fail on invalid blob sha1
ok 15 - B: fail on invalid branch name ".badbranchname"
ok 16 - B: fail on invalid branch name "bad[branch]name"
ok 17 - B: accept branch name "TEMP_TAG"
ok 18 - C: incremental import create pack from stdin
ok 19 - C: verify pack
ok 20 - C: validate reuse existing blob
ok 21 - C: verify commit
ok 22 - C: validate rename result
ok 23 - D: inline data in commit
ok 24 - D: verify pack
ok 25 - D: validate new files added
ok 26 - D: verify file5
ok 27 - D: verify file6
ok 28 - E: rfc2822 date, --date-format=raw
ok 29 - E: rfc2822 date, --date-format=rfc2822
ok 30 - E: verify pack
ok 31 - E: verify commit
ok 32 - F: non-fast-forward update skips
ok 33 - F: verify pack
ok 34 - F: verify other commit
ok 35 - G: non-fast-forward update forced
ok 36 - G: verify pack
ok 37 - G: branch changed, but logged
ok 38 - H: deletall, add 1
ok 39 - H: verify pack
ok 40 - H: validate old files removed, new files added
ok 41 - H: verify file
ok 42 - I: export-pack-edges
ok 43 - I: verify edge list
ok 44 - J: reset existing branch creates empty commit
ok 45 - J: branch has 1 commit, empty tree
ok 46 - K: reinit branch with from
ok 47 - K: verify K^1 = branch^1
ok 48 - L: verify internal tree sorting
ok 49 - M: rename file in same subdirectory
ok 50 - M: rename file to new subdirectory
ok 51 - M: rename subdirectory to new subdirectory
ok 52 - N: copy file in same subdirectory
ok 53 - N: copy then modify subdirectory
ok 54 - N: copy dirty subdirectory
ok 55 - N: copy directory by id
ok 56 - N: modify copied tree
ok 57 - O: comments are all skipped
ok 58 - O: blank lines not necessary after data commands
ok 59 - O: repack before next test
ok 60 - O: blank lines not necessary after other commands
ok 61 - O: progress outputs as requested by input
ok 62 - P: supermodule & submodule mix
ok 63 - P: verbatim SHA gitlinks
ok 64 - P: fail on inline gitlink
ok 65 - P: fail on blob mark in gitlink
ok 66 - Q: commit notes
ok 67 - Q: verify pack
ok 68 - Q: verify first commit
ok 69 - Q: verify second commit
ok 70 - Q: verify third commit
ok 71 - Q: verify first notes commit
ok 72 - Q: verify first notes tree
ok 73 - Q: verify first note for first commit
ok 74 - Q: verify first note for second commit
ok 75 - Q: verify first note for third commit
ok 76 - Q: verify second notes commit
ok 77 - Q: verify second notes tree
ok 78 - Q: verify second note for first commit
ok 79 - Q: verify first note for second commit
ok 80 - Q: verify first note for third commit
ok 81 - Q: verify third notes commit
ok 82 - Q: verify third notes tree
ok 83 - Q: verify third note for first commit
ok 84 - Q: verify fourth notes commit
ok 85 - Q: verify fourth notes tree
ok 86 - Q: verify second note for second commit
ok 87 - R: abort on unsupported feature
ok 88 - R: supported feature is accepted
ok 89 - R: abort on receiving feature after data command
ok 90 - R: only one import-marks feature allowed per stream
ok 91 - R: export-marks feature results in a marks file being created
ok 92 - R: export-marks options can be overriden by commandline options
ok 93 - R: import to output marks works without any content
ok 94 - R: import marks prefers commandline marks file over the stream
ok 95 - R: multiple --import-marks= should be honoured
ok 96 - R: feature relative-marks should be honoured
ok 97 - R: feature no-relative-marks should be honoured
ok 98 - R: quiet option results in no stats being output
ok 99 - R: die on unknown option
ok 100 - R: unknown commandline options are rejected
ok 101 - R: ignore non-git options
ok 102 - R: blob bigger than threshold
ok 103 - R: verify created pack
ok 104 - R: verify written objects
ok 105 - R: blob appears only once
# passed all 105 test(s)
1..105

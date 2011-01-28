ok 1 - empty stream succeeds
ok 2 - A: create pack from stdin
ok 3 - A: verify pack
ok 4 - A: verify commit
ok 5 - A: verify tree
ok 6 - A: verify file2
ok 7 - A: verify file3
ok 8 - A: verify file4
ok 9 - A: verify tag/series-A
ok 10 - A: verify marks output
ok 11 - A: verify marks import
ok 12 - A: verify marks import does not crash
ok 13 - A: verify pack
ok 14 - A: verify diff
ok 15 - A: export marks with large values
ok 16 - B: fail on invalid blob sha1
ok 17 - B: fail on invalid branch name ".badbranchname"
ok 18 - B: fail on invalid branch name "bad[branch]name"
ok 19 - B: accept branch name "TEMP_TAG"
ok 20 - C: incremental import create pack from stdin
ok 21 - C: verify pack
ok 22 - C: validate reuse existing blob
ok 23 - C: verify commit
ok 24 - C: validate rename result
ok 25 - D: inline data in commit
ok 26 - D: verify pack
ok 27 - D: validate new files added
ok 28 - D: verify file5
ok 29 - D: verify file6
ok 30 - E: rfc2822 date, --date-format=raw
ok 31 - E: rfc2822 date, --date-format=rfc2822
ok 32 - E: verify pack
ok 33 - E: verify commit
ok 34 - F: non-fast-forward update skips
ok 35 - F: verify pack
ok 36 - F: verify other commit
ok 37 - G: non-fast-forward update forced
ok 38 - G: verify pack
ok 39 - G: branch changed, but logged
ok 40 - H: deletall, add 1
ok 41 - H: verify pack
ok 42 - H: validate old files removed, new files added
ok 43 - H: verify file
ok 44 - I: export-pack-edges
ok 45 - I: verify edge list
ok 46 - J: reset existing branch creates empty commit
ok 47 - J: branch has 1 commit, empty tree
ok 48 - K: reinit branch with from
ok 49 - K: verify K^1 = branch^1
ok 50 - L: verify internal tree sorting
ok 51 - M: rename file in same subdirectory
ok 52 - M: rename file to new subdirectory
ok 53 - M: rename subdirectory to new subdirectory
ok 54 - N: copy file in same subdirectory
ok 55 - N: copy then modify subdirectory
ok 56 - N: copy dirty subdirectory
ok 57 - N: copy directory by id
ok 58 - N: copy root directory by tree hash
ok 59 - N: delete directory by copying
ok 60 - N: modify copied tree
ok 61 - N: reject foo/ syntax
ok 62 - N: copy to root by id and modify
ok 63 - N: extract subtree
ok 64 - N: modify subtree, extract it, and modify again
ok 65 - O: comments are all skipped
ok 66 - O: blank lines not necessary after data commands
ok 67 - O: repack before next test
ok 68 - O: blank lines not necessary after other commands
ok 69 - O: progress outputs as requested by input
ok 70 - P: supermodule & submodule mix
ok 71 - P: verbatim SHA gitlinks
ok 72 - P: fail on inline gitlink
ok 73 - P: fail on blob mark in gitlink
ok 74 - Q: commit notes
ok 75 - Q: verify pack
ok 76 - Q: verify first commit
ok 77 - Q: verify second commit
ok 78 - Q: verify third commit
ok 79 - Q: verify first notes commit
ok 80 - Q: verify first notes tree
ok 81 - Q: verify first note for first commit
ok 82 - Q: verify first note for second commit
ok 83 - Q: verify first note for third commit
ok 84 - Q: verify second notes commit
ok 85 - Q: verify second notes tree
ok 86 - Q: verify second note for first commit
ok 87 - Q: verify first note for second commit
ok 88 - Q: verify first note for third commit
ok 89 - Q: verify third notes commit
ok 90 - Q: verify third notes tree
ok 91 - Q: verify third note for first commit
ok 92 - Q: verify fourth notes commit
ok 93 - Q: verify fourth notes tree
ok 94 - Q: verify second note for second commit
ok 95 - R: abort on unsupported feature
ok 96 - R: supported feature is accepted
ok 97 - R: abort on receiving feature after data command
ok 98 - R: only one import-marks feature allowed per stream
ok 99 - R: export-marks feature results in a marks file being created
ok 100 - R: export-marks options can be overriden by commandline options
ok 101 - R: import to output marks works without any content
ok 102 - R: import marks prefers commandline marks file over the stream
ok 103 - R: multiple --import-marks= should be honoured
ok 104 - R: feature relative-marks should be honoured
ok 105 - R: feature no-relative-marks should be honoured
ok 106 - R: feature cat-blob supported
ok 107 - R: cat-blob-fd must be a nonnegative integer
ok 108 - R: print old blob
ok 109 - R: in-stream cat-blob-fd not respected
ok 110 - R: print new blob
ok 111 - R: print new blob by sha1
ok 112 - setup: big file
ok 113 - R: print two blobs to stdout
ok 114 - setup: have pipes?
ok 115 - R: copy using cat-file
ok 116 - R: print blob mid-commit
ok 117 - R: print staged blob within commit
ok 118 - R: quiet option results in no stats being output
ok 119 - R: die on unknown option
ok 120 - R: unknown commandline options are rejected
ok 121 - R: die on invalid option argument
ok 122 - R: ignore non-git options
ok 123 - R: blob bigger than threshold
ok 124 - R: verify created pack
ok 125 - R: verify written objects
ok 126 - R: blob appears only once
# passed all 126 test(s)
1..126

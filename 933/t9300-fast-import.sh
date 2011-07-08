ok 1 - setup: have pipes?
ok 2 - empty stream succeeds
ok 3 - A: create pack from stdin
ok 4 - A: verify pack
ok 5 - A: verify commit
ok 6 - A: verify tree
ok 7 - A: verify file2
ok 8 - A: verify file3
ok 9 - A: verify file4
ok 10 - A: verify tag/series-A
ok 11 - A: verify marks output
ok 12 - A: verify marks import
ok 13 - A: verify marks import does not crash
ok 14 - A: verify pack
ok 15 - A: verify diff
ok 16 - A: export marks with large values
ok 17 - B: fail on invalid blob sha1
ok 18 - B: fail on invalid branch name ".badbranchname"
ok 19 - B: fail on invalid branch name "bad[branch]name"
ok 20 - B: accept branch name "TEMP_TAG"
ok 21 - C: incremental import create pack from stdin
ok 22 - C: verify pack
ok 23 - C: validate reuse existing blob
ok 24 - C: verify commit
ok 25 - C: validate rename result
ok 26 - D: inline data in commit
ok 27 - D: verify pack
ok 28 - D: validate new files added
ok 29 - D: verify file5
ok 30 - D: verify file6
ok 31 - E: rfc2822 date, --date-format=raw
ok 32 - E: rfc2822 date, --date-format=rfc2822
ok 33 - E: verify pack
ok 34 - E: verify commit
ok 35 - F: non-fast-forward update skips
ok 36 - F: verify pack
ok 37 - F: verify other commit
ok 38 - G: non-fast-forward update forced
ok 39 - G: verify pack
ok 40 - G: branch changed, but logged
ok 41 - H: deletall, add 1
ok 42 - H: verify pack
ok 43 - H: validate old files removed, new files added
ok 44 - H: verify file
ok 45 - I: export-pack-edges
ok 46 - I: verify edge list
ok 47 - J: reset existing branch creates empty commit
ok 48 - J: branch has 1 commit, empty tree
ok 49 - K: reinit branch with from
ok 50 - K: verify K^1 = branch^1
ok 51 - L: verify internal tree sorting
ok 52 - M: rename file in same subdirectory
ok 53 - M: rename file to new subdirectory
ok 54 - M: rename subdirectory to new subdirectory
ok 55 - N: copy file in same subdirectory
ok 56 - N: copy then modify subdirectory
ok 57 - N: copy dirty subdirectory
ok 58 - N: copy directory by id
ok 59 - N: read and copy directory
ok 60 - N: empty directory reads as missing
ok 61 - N: copy root directory by tree hash
ok 62 - N: delete directory by copying
ok 63 - N: modify copied tree
ok 64 - N: reject foo/ syntax
ok 65 - N: copy to root by id and modify
ok 66 - N: extract subtree
ok 67 - N: modify subtree, extract it, and modify again
ok 68 - O: comments are all skipped
ok 69 - O: blank lines not necessary after data commands
ok 70 - O: repack before next test
ok 71 - O: blank lines not necessary after other commands
ok 72 - O: progress outputs as requested by input
ok 73 - P: supermodule & submodule mix
ok 74 - P: verbatim SHA gitlinks
ok 75 - P: fail on inline gitlink
ok 76 - P: fail on blob mark in gitlink
ok 77 - Q: commit notes
ok 78 - Q: verify pack
ok 79 - Q: verify first commit
ok 80 - Q: verify second commit
ok 81 - Q: verify third commit
ok 82 - Q: verify first notes commit
ok 83 - Q: verify first notes tree
ok 84 - Q: verify first note for first commit
ok 85 - Q: verify first note for second commit
ok 86 - Q: verify first note for third commit
ok 87 - Q: verify second notes commit
ok 88 - Q: verify second notes tree
ok 89 - Q: verify second note for first commit
ok 90 - Q: verify first note for second commit
ok 91 - Q: verify first note for third commit
ok 92 - Q: verify third notes commit
ok 93 - Q: verify third notes tree
ok 94 - Q: verify third note for first commit
ok 95 - Q: verify fourth notes commit
ok 96 - Q: verify fourth notes tree
ok 97 - Q: verify second note for second commit
ok 98 - R: abort on unsupported feature
ok 99 - R: supported feature is accepted
ok 100 - R: abort on receiving feature after data command
ok 101 - R: only one import-marks feature allowed per stream
ok 102 - R: export-marks feature results in a marks file being created
ok 103 - R: export-marks options can be overriden by commandline options
ok 104 - R: catch typo in marks file name
ok 105 - R: import and output marks can be the same file
ok 106 - R: --import-marks=foo --output-marks=foo to create foo fails
ok 107 - R: --import-marks-if-exists
ok 108 - R: import to output marks works without any content
ok 109 - R: import marks prefers commandline marks file over the stream
ok 110 - R: multiple --import-marks= should be honoured
ok 111 - R: feature relative-marks should be honoured
ok 112 - R: feature no-relative-marks should be honoured
ok 113 - R: feature ls supported
ok 114 - R: feature cat-blob supported
ok 115 - R: cat-blob-fd must be a nonnegative integer
ok 116 - R: print old blob
ok 117 - R: in-stream cat-blob-fd not respected
ok 118 - R: print new blob
ok 119 - R: print new blob by sha1
ok 120 - setup: big file
ok 121 - R: print two blobs to stdout
ok 122 - R: copy using cat-file
ok 123 - R: print blob mid-commit
ok 124 - R: print staged blob within commit
ok 125 - R: quiet option results in no stats being output
ok 126 - R: feature done means terminating "done" is mandatory
ok 127 - R: terminating "done" with trailing gibberish is ok
ok 128 - R: terminating "done" within commit
ok 129 - R: die on unknown option
ok 130 - R: unknown commandline options are rejected
ok 131 - R: die on invalid option argument
ok 132 - R: ignore non-git options
ok 133 - R: blob bigger than threshold
ok 134 - R: verify created pack
ok 135 - R: verify written objects
ok 136 - R: blob appears only once
# passed all 136 test(s)
1..136

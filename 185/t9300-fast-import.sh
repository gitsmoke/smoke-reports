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
FATAL: Unexpected exit with code 2

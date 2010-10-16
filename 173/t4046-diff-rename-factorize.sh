ok 1 - setup
ok 2 - diff-index --detect-bulk-moves after directory move.
ok 3 - setup non-100% rename
ok 4 - diff-index --detect-bulk-moves after content changes.
ok 5 - setup bulk move that is not directory move
ok 6 - diff-index --detect-bulk-moves without full-dir rename.
ok 7 - setup bulk move to toplevel
ok 8 - diff-index --detect-bulk-moves bulk move to toplevel.
ok 9 - setup move including a subdir, with some content changes
not ok 10 - diff-index --detect-bulk-moves on a move including a subdir. # TODO known breakage
ok 11 - setup move without a subdir
ok 12 - moving files but not subdirs is not mistaken for dir move
ok 13 - setup move of files and subdirs to different places
not ok 14 - moving subdirs into one dir and files into another is not mistaken for dir move # TODO known breakage
ok 15 - setup move of dir with only subdirs
not ok 16 - moving a dir with no direct children files # TODO known breakage
ok 17 - setup move from toplevel to subdir
ok 18 - --detect-bulk-moves everything from toplevel.
# still have 3 known breakage(s)
# passed all remaining 15 test(s)
1..18

ok 1 - setup
ok 2 - diff-index --detect-bulk-moves after directory move.
ok 3 - setup non-100% rename
ok 4 - diff-index --detect-bulk-moves after content changes.
ok 5 - setup bulk move that is not directory move
ok 6 - diff-index --detect-bulk-moves without full-dir rename.
ok 7 - setup bulk move with new file in source dir
ok 8 - diff-index --detect-bulk-moves with new file in source dir.
ok 9 - setup bulk move with interfering copy
not ok 10 - diff-index --detect-bulk-moves with interfering copy. # TODO known breakage
ok 11 - setup bulk move to toplevel
ok 12 - diff-index --detect-bulk-moves bulk move to toplevel.
ok 13 - setup move including a subdir, with some content changes
ok 14 - diff-index --detect-bulk-moves on a move including a subdir.
ok 15 - setup move of only a subdir
ok 16 - moving a subdir only
ok 17 - setup move without a subdir
ok 18 - moving files but not subdirs is not mistaken for dir move
ok 19 - setup move of files and subdirs to different places
ok 20 - moving subdirs into one dir and files into another is not mistaken for dir move
ok 21 - setup move of files and subdirs to different places
ok 22 - moving subdirs into one dir and files into another is not mistaken for dir move
ok 23 - setup move of dir with only subdirs
not ok 24 - moving a dir with no direct children files # TODO known breakage
ok 25 - setup move from toplevel to subdir
ok 26 - --detect-bulk-moves everything from toplevel.
# still have 2 known breakage(s)
# passed all remaining 24 test(s)
1..26

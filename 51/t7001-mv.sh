ok 1 - prepare reference tree
ok 2 - moving the file out of subdirectory
ok 3 - commiting the change
ok 4 - checking the commit
ok 5 - moving the file back into subdirectory
ok 6 - commiting the change
ok 7 - checking the commit
ok 8 - checking -k on non-existing file
ok 9 - checking -k on untracked file
ok 10 - checking -k on multiple untracked files
ok 11 - checking -f on untracked file with existing target
ok 12 - adding another file
ok 13 - moving whole subdirectory
ok 14 - commiting the change
ok 15 - checking the commit
ok 16 - succeed when source is a prefix of destination
ok 17 - moving whole subdirectory into subdirectory
ok 18 - commiting the change
ok 19 - checking the commit
ok 20 - do not move directory over existing directory
ok 21 - move into "."
ok 22 - Michael Cassar's test case
ok 23 - Sergey Vlasov's test case
ok 24 - absolute pathname
ok 25 - absolute pathname outside should fail
ok 26 - git mv to move multiple sources into a directory
ok 27 - git mv should not change sha1 of moved cache entry
ok 28 # skip git mv should overwrite symlink to a file (missing SYMLINKS of SYMLINKS)
ok 29 # skip git mv should overwrite file with a symlink (missing SYMLINKS of SYMLINKS)
# passed all 29 test(s)
1..29

ok 1 - setup
ok 2 - merge master into b-symlink, which has a different symbolic link
ok 3 - the merge result must be a file
ok 4 - merge master into b-file, which has a file instead of a symbolic link
ok 5 - the merge result must be a file
ok 6 - merge b-file, which has a file instead of a symbolic link, into master
ok 7 - the merge result must be a file
# passed all 7 test(s)
1..7

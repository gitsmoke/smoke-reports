ok 1 - empty dump
ok 2 - v4 dumps not supported
not ok 3 - empty revision # TODO known breakage
ok 4 - empty properties
ok 5 - author name and commit message
ok 6 - unsupported properties are ignored
not ok 7 - timestamp and empty file # TODO known breakage
ok 8 - directory with files
ok 9 - node without action
ok 10 - action: add node without text
not ok 11 - change file mode but keep old content # TODO known breakage
ok 12 - change file mode and reiterate content
ok 13 - deltas not supported
ok 14 - property deltas supported
ok 15 - properties on /
ok 16 - deltas for typechange
ok 17 - t9135/svn.dump
# still have 3 known breakage(s)
# passed all remaining 14 test(s)
1..17

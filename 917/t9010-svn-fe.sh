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
ok 12 - NUL in property value
ok 13 - NUL in log message, file content, and property name
ok 14 - change file mode and reiterate content
ok 15 - deltas not supported
ok 16 - property deltas supported
ok 17 - properties on /
ok 18 - deltas for typechange
ok 19 - set up svn repo
ok 20 - t9135/svn.dump
# still have 3 known breakage(s)
# passed all remaining 17 test(s)
1..20

ok 1 - setup
ok 2 - snapshots: tgz only default format enabled
ok 3 - snapshots: all enabled in default, use default disabled value
ok 4 - snapshots: zip explicitly disabled
ok 5 - snapshots: tgz explicitly enabled
ok 6 - snapshots: good tree-ish id
ok 7 - snapshots: bad tree-ish id
ok 8 - snapshots: bad tree-ish id (tagged object)
ok 9 - snapshots: good object id
ok 10 - snapshots: bad object id
ok 11 - load checking: load too high (default action)
ok 12 - enable caching
not ok - 13 caching enabled (non-existent commit, 404 error)
#	
#		gitweb_run "p=.git;a=commit;h=non-existent" &&
#		grep "Status: 404 Not Found" gitweb.headers &&
#		grep "404 - Unknown commit object" gitweb.body
#	
# failed 1 among 13 test(s)
1..13

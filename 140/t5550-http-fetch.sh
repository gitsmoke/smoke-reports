ok 1 - setup repository
ok 2 - create http-accessible bare repository
ok 3 - clone http repository
ok 4 - fetch changes via http
ok 5 - http remote detects correct HEAD
ok 6 - fetch packed objects
ok 7 - fetch notices corrupt pack
ok 8 - fetch notices corrupt idx
not ok - 9 did not use upload-pack service
#	
#		grep /git-upload-pack <"$HTTPD_ROOT_PATH"/access.log >act &&
#		>exp &&
#		test_cmp exp act
#	
# failed 1 among 9 test(s)
1..9

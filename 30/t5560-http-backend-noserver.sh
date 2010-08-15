ok 1 - setup repository
not ok - 2 direct refs/heads/master not found
#	
#		log_div "refs/heads/master"
#		GET refs/heads/master "404 Not Found"
#	
ok 3 - static file is ok
not ok - 4 no export by default
#	
#		log_div "no git-daemon-export-ok"
#		get_static_files "404 Not Found"
#	
ok 5 - export if git-daemon-export-ok
ok 6 - static file if http.getanyfile true is ok
not ok - 7 static file if http.getanyfile false fails
#	
#		log_div "getanyfile false"
#		config http.getanyfile false &&
#		get_static_files "403 Forbidden"
#	
ok 8 - http.uploadpack default enabled
ok 9 - http.uploadpack true
not ok - 10 http.uploadpack false
#	
#		log_div "uploadpack false"
#		config http.uploadpack false &&
#		GET info/refs?service=git-upload-pack "403 Forbidden" &&
#		POST git-upload-pack 0000 "403 Forbidden"
#	
not ok - 11 http.receivepack default disabled
#	
#		log_div "receivepack default"
#		GET info/refs?service=git-receive-pack "403 Forbidden"  &&
#		POST git-receive-pack 0000 "403 Forbidden"
#	
ok 12 - http.receivepack true
not ok - 13 http.receivepack false
#	
#		log_div "receivepack false"
#		config http.receivepack false &&
#		GET info/refs?service=git-receive-pack "403 Forbidden" &&
#		POST git-receive-pack 0000 "403 Forbidden"
#	
ok 14 - http-backend blocks bad PATH_INFO
# failed 6 among 14 test(s)
1..14

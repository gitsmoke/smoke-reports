ok 1 - setup repository
not ok - 2 direct refs/heads/master not found
#	
#		log_div "refs/heads/master"
#		GET refs/heads/master "404 Not Found"
#	
not ok - 3 static file is ok
#	
#		log_div "getanyfile default"
#		get_static_files "200 OK"
#	
not ok - 4 no export by default
#	
#		log_div "no git-daemon-export-ok"
#		get_static_files "404 Not Found"
#	
not ok - 5 export if git-daemon-export-ok
#	
#		log_div "git-daemon-export-ok"
#	        (cd "$HTTPD_DOCUMENT_ROOT_PATH/repo.git" &&
#		 touch git-daemon-export-ok
#		) &&
#	        get_static_files "200 OK"
#	
not ok - 6 static file if http.getanyfile true is ok
#	
#		log_div "getanyfile true"
#		config http.getanyfile true &&
#		get_static_files "200 OK"
#	
not ok - 7 static file if http.getanyfile false fails
#	
#		log_div "getanyfile false"
#		config http.getanyfile false &&
#		get_static_files "403 Forbidden"
#	
not ok - 8 http.uploadpack default enabled
#	
#		log_div "uploadpack default"
#		GET info/refs?service=git-upload-pack "200 OK"  &&
#		POST git-upload-pack 0000 "200 OK"
#	
not ok - 9 http.uploadpack true
#	
#		log_div "uploadpack true"
#		config http.uploadpack true &&
#		GET info/refs?service=git-upload-pack "200 OK" &&
#		POST git-upload-pack 0000 "200 OK"
#	
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
not ok - 12 http.receivepack true
#	
#		log_div "receivepack true"
#		config http.receivepack true &&
#		GET info/refs?service=git-receive-pack "200 OK" &&
#		POST git-receive-pack 0000 "200 OK"
#	
not ok - 13 http.receivepack false
#	
#		log_div "receivepack false"
#		config http.receivepack false &&
#		GET info/refs?service=git-receive-pack "403 Forbidden" &&
#		POST git-receive-pack 0000 "403 Forbidden"
#	
ok 14 - http-backend blocks bad PATH_INFO
# failed 12 among 14 test(s)
1..14

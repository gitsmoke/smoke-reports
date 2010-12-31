Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5560-http-backend-noserver/.git/
expecting success: 
	echo content >file &&
	git add file &&
	git commit -m one &&

	mkdir "$HTTPD_DOCUMENT_ROOT_PATH/repo.git" &&
	(cd "$HTTPD_DOCUMENT_ROOT_PATH/repo.git" &&
	 git --bare init &&
	 : >objects/info/alternates &&
	 : >objects/info/http-alternates
	) &&
	git remote add public "$HTTPD_DOCUMENT_ROOT_PATH/repo.git" &&
	git push public master:master &&

	(cd "$HTTPD_DOCUMENT_ROOT_PATH/repo.git" &&
	 git repack -a -d
	) &&

	echo other >file &&
	git add file &&
	git commit -m two &&
	git push public master:master &&

	LOOSE_URL=$(find_file objects/??) &&
	PACK_URL=$(find_file objects/pack/*.pack) &&
	IDX_URL=$(find_file objects/pack/*.idx)
[master (root-commit) cc851a2] one
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 file
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5560-http-backend-noserver/repo.git/
[master ccfee75] two
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup repository

expecting success: 
	log_div "refs/heads/master" &&
	GET refs/heads/master "404 Not Found"


ok 2 - direct refs/heads/master not found

expecting success: 
	log_div "getanyfile default" &&
	get_static_files "200 OK"
ok 3 - static file is ok

expecting success: 
	log_div "no git-daemon-export-ok" &&
	get_static_files "404 Not Found"

ok 4 - no export by default

expecting success: 
	log_div "git-daemon-export-ok" &&
        (cd "$HTTPD_DOCUMENT_ROOT_PATH/repo.git" &&
	 touch git-daemon-export-ok
	) &&
        get_static_files "200 OK"

ok 5 - export if git-daemon-export-ok

expecting success: 
	log_div "getanyfile true" &&
	config http.getanyfile true &&
	get_static_files "200 OK"

ok 6 - static file if http.getanyfile true is ok

expecting success: 
	log_div "getanyfile false" &&
	config http.getanyfile false &&
	get_static_files "403 Forbidden"


ok 7 - static file if http.getanyfile false fails

expecting success: 
	log_div "uploadpack default" &&
	GET info/refs?service=git-upload-pack "200 OK"  &&
	POST git-upload-pack 0000 "200 OK"


ok 8 - http.uploadpack default enabled

expecting success: 
	log_div "uploadpack true" &&
	config http.uploadpack true &&
	GET info/refs?service=git-upload-pack "200 OK" &&
	POST git-upload-pack 0000 "200 OK"


ok 9 - http.uploadpack true

expecting success: 
	log_div "uploadpack false" &&
	config http.uploadpack false &&
	GET info/refs?service=git-upload-pack "403 Forbidden" &&
	POST git-upload-pack 0000 "403 Forbidden"

ok 10 - http.uploadpack false

expecting success: 
	log_div "receivepack default" &&
	GET info/refs?service=git-receive-pack "403 Forbidden"  &&
	POST git-receive-pack 0000 "403 Forbidden"


ok 11 - http.receivepack default disabled

expecting success: 
	log_div "receivepack true" &&
	config http.receivepack true &&
	GET info/refs?service=git-receive-pack "200 OK" &&
	POST git-receive-pack 0000 "200 OK"

ok 12 - http.receivepack true

expecting success: 
	log_div "receivepack false" &&
	config http.receivepack false &&
	GET info/refs?service=git-receive-pack "403 Forbidden" &&
	POST git-receive-pack 0000 "403 Forbidden"


ok 13 - http.receivepack false

expecting success: 
	config http.getanyfile true &&

	expect_aliased 0 /repo.git/HEAD &&

	expect_aliased 1 /repo.git/../HEAD &&
	expect_aliased 1 /../etc/passwd &&
	expect_aliased 1 ../etc/passwd &&
	expect_aliased 1 /etc//passwd &&
	expect_aliased 1 /etc/./passwd &&
	expect_aliased 1 //domain/data.txt

--- exp.err	2010-12-31 04:02:06.000000000 +0000
+++ act.err	2010-12-31 04:02:06.000000000 +0000
@@ -1 +0,0 @@
-fatal: '/repo.git/../HEAD': aliased
--- exp.err	2010-12-31 04:02:06.000000000 +0000
+++ act.err	2010-12-31 04:02:06.000000000 +0000
@@ -1 +1 @@
-fatal: '/../etc/passwd': aliased
+Request not supported: '/Users/trast/git-smoke/t/trash directory.t5560-http-backend-noserver//../etc/passwd'
\ No newline at end of file
--- exp.err	2010-12-31 04:02:06.000000000 +0000
+++ act.err	2010-12-31 04:02:06.000000000 +0000
@@ -1 +1 @@
-fatal: '../etc/passwd': aliased
+Request not supported: '/Users/trast/git-smoke/t/trash directory.t5560-http-backend-noserver/../etc/passwd'
\ No newline at end of file
--- exp.err	2010-12-31 04:02:06.000000000 +0000
+++ act.err	2010-12-31 04:02:06.000000000 +0000
@@ -1 +1 @@
-fatal: '/etc//passwd': aliased
+Request not supported: '/Users/trast/git-smoke/t/trash directory.t5560-http-backend-noserver//etc//passwd'
\ No newline at end of file
--- exp.err	2010-12-31 04:02:06.000000000 +0000
+++ act.err	2010-12-31 04:02:06.000000000 +0000
@@ -1 +1 @@
-fatal: '/etc/./passwd': aliased
+Request not supported: '/Users/trast/git-smoke/t/trash directory.t5560-http-backend-noserver//etc/./passwd'
\ No newline at end of file
--- exp.err	2010-12-31 04:02:06.000000000 +0000
+++ act.err	2010-12-31 04:02:06.000000000 +0000
@@ -1 +1 @@
-fatal: '//domain/data.txt': aliased
+Request not supported: '/Users/trast/git-smoke/t/trash directory.t5560-http-backend-noserver///domain/data.txt'
\ No newline at end of file

ok 14 - http-backend blocks bad PATH_INFO

# passed all 14 test(s)
1..14

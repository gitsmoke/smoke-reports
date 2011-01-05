Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6001-rev-list-graft/.git/
expecting success: 
	mkdir subdir &&
	echo >fileA fileA &&
	echo >subdir/fileB fileB &&
	git add fileA subdir/fileB &&
	git commit -a -m "Initial in one history." &&
	A0=`git rev-parse --verify HEAD` &&

	echo >fileA fileA modified &&
	git commit -a -m "Second in one history." &&
	A1=`git rev-parse --verify HEAD` &&

	echo >subdir/fileB fileB modified &&
	git commit -a -m "Third in one history." &&
	A2=`git rev-parse --verify HEAD` &&

	rm -f .git/refs/heads/master .git/index &&

	echo >fileA fileA again &&
	echo >subdir/fileB fileB again &&
	git add fileA subdir/fileB &&
	git commit -a -m "Initial in alternate history." &&
	B0=`git rev-parse --verify HEAD` &&

	echo >fileA fileA modified in alternate history &&
	git commit -a -m "Second in alternate history." &&
	B1=`git rev-parse --verify HEAD` &&

	echo >subdir/fileB fileB modified in alternate history &&
	git commit -a -m "Third in alternate history." &&
	B2=`git rev-parse --verify HEAD` &&
	: done

[master (root-commit) 8279691] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 0dcfe78] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 0a34e3a] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 9554b56] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 28c9530] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master ad1ba10] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic ad1ba10a2b40959239b7bc42e4e1d943fc925563 -- ad1ba10a2b40959239b7bc42e4e1d943fc925563 28c953070038473b1f324dc012b9beeaa268a082 9554b567d6c5fbde1d037adc8fbd8145cbbb71a5
	

ok 2 - without grafts

expecting success: 
		echo '9554b567d6c5fbde1d037adc8fbd8145cbbb71a5 0a34e3a5aa1fe828eb1146dfcda13451a92e5eba' >.git/info/grafts &&
		check basic ad1ba10a2b40959239b7bc42e4e1d943fc925563 -- ad1ba10a2b40959239b7bc42e4e1d943fc925563 28c953070038473b1f324dc012b9beeaa268a082 9554b567d6c5fbde1d037adc8fbd8145cbbb71a5 0a34e3a5aa1fe828eb1146dfcda13451a92e5eba 0dcfe7808a89dc91fccdfe6089df35aca17ee1a1 82796914b787178efb87d163a36348c6eaf73e5b
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic ad1ba10a2b40959239b7bc42e4e1d943fc925563 subdir -- ad1ba10a2b40959239b7bc42e4e1d943fc925563 9554b567d6c5fbde1d037adc8fbd8145cbbb71a5
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '9554b567d6c5fbde1d037adc8fbd8145cbbb71a5 0a34e3a5aa1fe828eb1146dfcda13451a92e5eba' >.git/info/grafts &&
		check basic ad1ba10a2b40959239b7bc42e4e1d943fc925563 subdir -- ad1ba10a2b40959239b7bc42e4e1d943fc925563 9554b567d6c5fbde1d037adc8fbd8145cbbb71a5 0a34e3a5aa1fe828eb1146dfcda13451a92e5eba 82796914b787178efb87d163a36348c6eaf73e5b
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents ad1ba10a2b40959239b7bc42e4e1d943fc925563 -- ad1ba10a2b40959239b7bc42e4e1d943fc925563 28c953070038473b1f324dc012b9beeaa268a082 9554b567d6c5fbde1d037adc8fbd8145cbbb71a5
	

ok 6 - without grafts

expecting success: 
		echo '9554b567d6c5fbde1d037adc8fbd8145cbbb71a5 0a34e3a5aa1fe828eb1146dfcda13451a92e5eba' >.git/info/grafts &&
		check parents ad1ba10a2b40959239b7bc42e4e1d943fc925563 -- ad1ba10a2b40959239b7bc42e4e1d943fc925563 28c953070038473b1f324dc012b9beeaa268a082 9554b567d6c5fbde1d037adc8fbd8145cbbb71a5 0a34e3a5aa1fe828eb1146dfcda13451a92e5eba 0dcfe7808a89dc91fccdfe6089df35aca17ee1a1 82796914b787178efb87d163a36348c6eaf73e5b
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents ad1ba10a2b40959239b7bc42e4e1d943fc925563 subdir -- ad1ba10a2b40959239b7bc42e4e1d943fc925563 9554b567d6c5fbde1d037adc8fbd8145cbbb71a5
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '9554b567d6c5fbde1d037adc8fbd8145cbbb71a5 0a34e3a5aa1fe828eb1146dfcda13451a92e5eba' >.git/info/grafts &&
		check parents ad1ba10a2b40959239b7bc42e4e1d943fc925563 subdir -- ad1ba10a2b40959239b7bc42e4e1d943fc925563 9554b567d6c5fbde1d037adc8fbd8145cbbb71a5 0a34e3a5aa1fe828eb1146dfcda13451a92e5eba 82796914b787178efb87d163a36348c6eaf73e5b
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw ad1ba10a2b40959239b7bc42e4e1d943fc925563 -- ad1ba10a2b40959239b7bc42e4e1d943fc925563 28c953070038473b1f324dc012b9beeaa268a082 9554b567d6c5fbde1d037adc8fbd8145cbbb71a5
	

ok 10 - without grafts

expecting success: 
		echo '9554b567d6c5fbde1d037adc8fbd8145cbbb71a5 0a34e3a5aa1fe828eb1146dfcda13451a92e5eba' >.git/info/grafts &&
		check parents-raw ad1ba10a2b40959239b7bc42e4e1d943fc925563 -- ad1ba10a2b40959239b7bc42e4e1d943fc925563 28c953070038473b1f324dc012b9beeaa268a082 9554b567d6c5fbde1d037adc8fbd8145cbbb71a5 0a34e3a5aa1fe828eb1146dfcda13451a92e5eba 0dcfe7808a89dc91fccdfe6089df35aca17ee1a1 82796914b787178efb87d163a36348c6eaf73e5b
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw ad1ba10a2b40959239b7bc42e4e1d943fc925563 subdir -- ad1ba10a2b40959239b7bc42e4e1d943fc925563 9554b567d6c5fbde1d037adc8fbd8145cbbb71a5
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '9554b567d6c5fbde1d037adc8fbd8145cbbb71a5 0a34e3a5aa1fe828eb1146dfcda13451a92e5eba' >.git/info/grafts &&
		check parents-raw ad1ba10a2b40959239b7bc42e4e1d943fc925563 subdir -- ad1ba10a2b40959239b7bc42e4e1d943fc925563 9554b567d6c5fbde1d037adc8fbd8145cbbb71a5 0a34e3a5aa1fe828eb1146dfcda13451a92e5eba 82796914b787178efb87d163a36348c6eaf73e5b
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13

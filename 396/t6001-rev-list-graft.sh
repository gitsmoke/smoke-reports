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

[master (root-commit) 4b9bb01] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 86cde44] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master ab86c83] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 559cad1] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 8a32120] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 028c577] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 -- 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 8a321204710ca0e93726f63612fcaf8eb57dbfdb 559cad14ae7bf5500cc7e8cbfbf558ce1270965f
	

ok 2 - without grafts

expecting success: 
		echo '559cad14ae7bf5500cc7e8cbfbf558ce1270965f ab86c83d24b699e863bd3a29001fe1edb5d6dc9b' >.git/info/grafts &&
		check basic 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 -- 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 8a321204710ca0e93726f63612fcaf8eb57dbfdb 559cad14ae7bf5500cc7e8cbfbf558ce1270965f ab86c83d24b699e863bd3a29001fe1edb5d6dc9b 86cde4442a55d2f39a504b8cdc6b9d240bbd9bb2 4b9bb01a545a182266ec26fb6abca05f7312d415
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 subdir -- 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 559cad14ae7bf5500cc7e8cbfbf558ce1270965f
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '559cad14ae7bf5500cc7e8cbfbf558ce1270965f ab86c83d24b699e863bd3a29001fe1edb5d6dc9b' >.git/info/grafts &&
		check basic 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 subdir -- 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 559cad14ae7bf5500cc7e8cbfbf558ce1270965f ab86c83d24b699e863bd3a29001fe1edb5d6dc9b 4b9bb01a545a182266ec26fb6abca05f7312d415
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 -- 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 8a321204710ca0e93726f63612fcaf8eb57dbfdb 559cad14ae7bf5500cc7e8cbfbf558ce1270965f
	

ok 6 - without grafts

expecting success: 
		echo '559cad14ae7bf5500cc7e8cbfbf558ce1270965f ab86c83d24b699e863bd3a29001fe1edb5d6dc9b' >.git/info/grafts &&
		check parents 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 -- 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 8a321204710ca0e93726f63612fcaf8eb57dbfdb 559cad14ae7bf5500cc7e8cbfbf558ce1270965f ab86c83d24b699e863bd3a29001fe1edb5d6dc9b 86cde4442a55d2f39a504b8cdc6b9d240bbd9bb2 4b9bb01a545a182266ec26fb6abca05f7312d415
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 subdir -- 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 559cad14ae7bf5500cc7e8cbfbf558ce1270965f
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '559cad14ae7bf5500cc7e8cbfbf558ce1270965f ab86c83d24b699e863bd3a29001fe1edb5d6dc9b' >.git/info/grafts &&
		check parents 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 subdir -- 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 559cad14ae7bf5500cc7e8cbfbf558ce1270965f ab86c83d24b699e863bd3a29001fe1edb5d6dc9b 4b9bb01a545a182266ec26fb6abca05f7312d415
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 -- 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 8a321204710ca0e93726f63612fcaf8eb57dbfdb 559cad14ae7bf5500cc7e8cbfbf558ce1270965f
	

ok 10 - without grafts

expecting success: 
		echo '559cad14ae7bf5500cc7e8cbfbf558ce1270965f ab86c83d24b699e863bd3a29001fe1edb5d6dc9b' >.git/info/grafts &&
		check parents-raw 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 -- 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 8a321204710ca0e93726f63612fcaf8eb57dbfdb 559cad14ae7bf5500cc7e8cbfbf558ce1270965f ab86c83d24b699e863bd3a29001fe1edb5d6dc9b 86cde4442a55d2f39a504b8cdc6b9d240bbd9bb2 4b9bb01a545a182266ec26fb6abca05f7312d415
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 subdir -- 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 559cad14ae7bf5500cc7e8cbfbf558ce1270965f
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '559cad14ae7bf5500cc7e8cbfbf558ce1270965f ab86c83d24b699e863bd3a29001fe1edb5d6dc9b' >.git/info/grafts &&
		check parents-raw 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 subdir -- 028c577ed3d2aefb4c3cb4c1bf351b64f13f6a45 559cad14ae7bf5500cc7e8cbfbf558ce1270965f ab86c83d24b699e863bd3a29001fe1edb5d6dc9b 4b9bb01a545a182266ec26fb6abca05f7312d415
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13

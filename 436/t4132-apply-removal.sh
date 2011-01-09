Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4132-apply-removal/.git/
expecting success: 
	cat <<-EOF >c &&
	diff -ruN a/file b/file
	--- a/file	TS0
	+++ b/file	TS1
	@@ -0,0 +1 @@
	+something
	EOF

	cat <<-EOF >d &&
	diff -ruN a/file b/file
	--- a/file	TS0
	+++ b/file	TS1
	@@ -1 +0,0 @@
	-something
	EOF

	timeWest="1982-09-16 07:00:00.000000000 -0800" &&
	 timeGMT="1982-09-16 15:00:00.000000000 +0000" &&
	timeEast="1982-09-17 00:00:00.000000000 +0900" &&

	epocWest="1969-12-31 16:00:00.000000000 -0800" &&
	 epocGMT="1970-01-01 00:00:00.000000000 +0000" &&
	epocEast="1970-01-01 09:00:00.000000000 +0900" &&
	epocWest2="1969-12-31 16:00:00 -08:00" &&

	sed -e "s/TS0/$epocWest/" -e "s/TS1/$timeWest/" <c >createWest.patch &&
	sed -e "s/TS0/$epocEast/" -e "s/TS1/$timeEast/" <c >createEast.patch &&
	sed -e "s/TS0/$epocGMT/" -e "s/TS1/$timeGMT/" <c >createGMT.patch &&

	sed -e "s/TS0/$timeWest/" -e "s/TS1/$timeWest/" <c >addWest.patch &&
	sed -e "s/TS0/$timeEast/" -e "s/TS1/$timeEast/" <c >addEast.patch &&
	sed -e "s/TS0/$timeGMT/" -e "s/TS1/$timeGMT/" <c >addGMT.patch &&

	sed -e "s/TS0/$timeWest/" -e "s/TS1/$timeWest/" <d >emptyWest.patch &&
	sed -e "s/TS0/$timeEast/" -e "s/TS1/$timeEast/" <d >emptyEast.patch &&
	sed -e "s/TS0/$timeGMT/" -e "s/TS1/$timeGMT/" <d >emptyGMT.patch &&

	sed -e "s/TS0/$timeWest/" -e "s/TS1/$epocWest/" <d >removeWest.patch &&
	sed -e "s/TS0/$timeEast/" -e "s/TS1/$epocEast/" <d >removeEast.patch &&
	sed -e "s/TS0/$timeGMT/" -e "s/TS1/$epocGMT/" <d >removeGMT.patch &&
	sed -e "s/TS0/$timeWest/" -e "s/TS1/$epocWest2/" <d >removeWest2.patch &&

	echo something >something &&
	>empty

ok 1 - setup

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	

ok 2 - test addEast.patch

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	

ok 3 - test addGMT.patch

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	

ok 4 - test addWest.patch

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	

ok 5 - test createEast.patch

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	

ok 6 - test createGMT.patch

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	
ok 7 - test createWest.patch

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	

ok 8 - test emptyEast.patch

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	

ok 9 - test emptyGMT.patch

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	

ok 10 - test emptyWest.patch

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	

ok 11 - test removeEast.patch

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	

ok 12 - test removeGMT.patch

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	

ok 13 - test removeWest.patch

expecting success: 
		rm -f file .git/index &&
		case "$patch" in
		create*)
			# must be able to create
			git apply --index $patch &&
			test_cmp file something &&
			# must notice the file is already there
			>file &&
			git add file &&
			test_must_fail git apply $patch
			;;
		add*)
			# must be able to create or patch
			git apply $patch &&
			test_cmp file something &&
			>file &&
			git apply $patch &&
			test_cmp file something
			;;
		empty*)
			# must leave an empty file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			test -f file &&
			test_cmp empty file
			;;
		remove*)
			# must remove the file
			cat something >file &&
			git add file &&
			git apply --index $patch &&
			! test -f file
			;;
		esac
	

ok 14 - test removeWest2.patch

# passed all 14 test(s)
1..14

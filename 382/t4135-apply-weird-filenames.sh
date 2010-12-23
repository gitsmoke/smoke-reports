Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4135-apply-weird-filenames/.git/
expecting success: 
	vector=$TEST_DIRECTORY/t4135 &&

	test_tick &&
	git commit --allow-empty -m preimage &&
	git tag preimage &&

	reset_preimage() {
		git checkout -f preimage^0 &&
		git read-tree -u --reset HEAD &&
		git update-index --refresh
	} &&

	test_when_finished "rm -f \"tab	embedded.txt\"" &&
	test_when_finished "rm -f '\"quoteembedded\".txt'" &&
	if touch -- "tab	embedded.txt" '"quoteembedded".txt'
	then
		test_set_prereq FUNNYNAMES
	fi

[master (root-commit) 9cf544c] preimage
 Author: A U Thor <author@example.com>

ok 1 - setup

expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		rm -f 'postimage.txt' &&
		git apply -v "$vector"/'git-plain.diff' &&
		test_cmp expected 'postimage.txt'
	

ok 2 - plain, git-style file creation patch

expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		echo preimage >'postimage.txt' &&
		git apply -v "$vector"/'diff-plain.diff' &&
		test_cmp expected 'postimage.txt'
	
ok 3 - plain, traditional patch
expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		rm -f 'postimage.txt' &&
		git apply -v "$vector"/'add-plain.diff' &&
		test_cmp expected 'postimage.txt'
	
ok 4 - plain, traditional file creation patch
expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		rm -f 'post image.txt' &&
		git apply -v "$vector"/'git-with spaces.diff' &&
		test_cmp expected 'post image.txt'
	
ok 5 - with spaces, git-style file creation patch

expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		echo preimage >'post image.txt' &&
		git apply -v "$vector"/'diff-with spaces.diff' &&
		test_cmp expected 'post image.txt'
	
ok 6 - with spaces, traditional patch

expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		rm -f 'post image.txt' &&
		git apply -v "$vector"/'add-with spaces.diff' &&
		test_cmp expected 'post image.txt'
	
ok 7 - with spaces, traditional file creation patch
expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		rm -f 'post	image.txt' &&
		git apply -v "$vector"/'git-with tab.diff' &&
		test_cmp expected 'post	image.txt'
	
ok 8 - with tab, git-style file creation patch

expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		echo preimage >'post	image.txt' &&
		git apply -v "$vector"/'diff-with tab.diff' &&
		test_cmp expected 'post	image.txt'
	
ok 9 - with tab, traditional patch
expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		rm -f 'post	image.txt' &&
		git apply -v "$vector"/'add-with tab.diff' &&
		test_cmp expected 'post	image.txt'
	
ok 10 - with tab, traditional file creation patch
expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		rm -f 'post\image.txt' &&
		git apply -v "$vector"/'git-with backslash.diff' &&
		test_cmp expected 'post\image.txt'
	

ok 11 - with backslash, git-style file creation patch

expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		echo preimage >'post\image.txt' &&
		git apply -v "$vector"/'diff-with backslash.diff' &&
		test_cmp expected 'post\image.txt'
	

ok 12 - with backslash, traditional patch

expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		rm -f 'post\image.txt' &&
		git apply -v "$vector"/'add-with backslash.diff' &&
		test_cmp expected 'post\image.txt'
	

ok 13 - with backslash, traditional file creation patch

expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		rm -f '"postimage".txt' &&
		git apply -v "$vector"/'git-with quote.diff' &&
		test_cmp expected '"postimage".txt'
	

ok 14 - with quote, git-style file creation patch

checking known breakage: 
		echo postimage >expected &&
		reset_preimage &&
		echo preimage >'"postimage".txt' &&
		git apply -v "$vector"/'diff-with quote.diff' &&
		test_cmp expected '"postimage".txt'
	

not ok 15 - with quote, traditional patch # TODO known breakage

expecting success: 
		echo postimage >expected &&
		reset_preimage &&
		rm -f '"postimage".txt' &&
		git apply -v "$vector"/'add-with quote.diff' &&
		test_cmp expected '"postimage".txt'
	

ok 16 - with quote, traditional file creation patch

expecting success: 
	echo postimage >expected &&
	reset_preimage &&
	rm -f postimage.txt &&
	git apply -v "$vector/damaged.diff" &&
	test_cmp expected postimage.txt


ok 17 - whitespace-damaged traditional patch

expecting success: 
	echo postimage >expected &&
	reset_preimage &&
	rm -f "post image.txt" &&
	git apply "$vector/funny-tz.diff" &&
	test_cmp expected "post image.txt"

ok 18 - traditional patch with colon in timezone

expecting success: 
	echo postimage >expected &&
	reset_preimage &&
	rm -f "post image.txt" &&
	git apply "$vector/damaged-tz.diff" &&
	test_cmp expected "post image.txt"
ok 19 - traditional, whitespace-damaged, colon in timezone

# still have 1 known breakage(s)
# passed all remaining 18 test(s)
1..19

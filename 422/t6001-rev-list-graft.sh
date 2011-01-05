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

[master (root-commit) 72f9fac] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 96e0348] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 9c384ba] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) c229ffa] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 4866c68] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 2839fc6] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup
expecting success: 
		rm -f .git/info/grafts &&
		check basic 2839fc68b7dadaacb1aab6b5402af80c685e88f1 -- 2839fc68b7dadaacb1aab6b5402af80c685e88f1 4866c68257f29071c4c0c800573cc68c4b42e282 c229ffa9d0b0a253d26d2be982947ec9b76ed752
	

ok 2 - without grafts

expecting success: 
		echo 'c229ffa9d0b0a253d26d2be982947ec9b76ed752 9c384ba49560d2eabf7af0f9461ef2d5d0f9d689' >.git/info/grafts &&
		check basic 2839fc68b7dadaacb1aab6b5402af80c685e88f1 -- 2839fc68b7dadaacb1aab6b5402af80c685e88f1 4866c68257f29071c4c0c800573cc68c4b42e282 c229ffa9d0b0a253d26d2be982947ec9b76ed752 9c384ba49560d2eabf7af0f9461ef2d5d0f9d689 96e034858a6bd96c01ade941fa94c889c78124cd 72f9fac67b3b70714e179ac238f232d19ea9a287
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 2839fc68b7dadaacb1aab6b5402af80c685e88f1 subdir -- 2839fc68b7dadaacb1aab6b5402af80c685e88f1 c229ffa9d0b0a253d26d2be982947ec9b76ed752
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo 'c229ffa9d0b0a253d26d2be982947ec9b76ed752 9c384ba49560d2eabf7af0f9461ef2d5d0f9d689' >.git/info/grafts &&
		check basic 2839fc68b7dadaacb1aab6b5402af80c685e88f1 subdir -- 2839fc68b7dadaacb1aab6b5402af80c685e88f1 c229ffa9d0b0a253d26d2be982947ec9b76ed752 9c384ba49560d2eabf7af0f9461ef2d5d0f9d689 72f9fac67b3b70714e179ac238f232d19ea9a287
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 2839fc68b7dadaacb1aab6b5402af80c685e88f1 -- 2839fc68b7dadaacb1aab6b5402af80c685e88f1 4866c68257f29071c4c0c800573cc68c4b42e282 c229ffa9d0b0a253d26d2be982947ec9b76ed752
	

ok 6 - without grafts

expecting success: 
		echo 'c229ffa9d0b0a253d26d2be982947ec9b76ed752 9c384ba49560d2eabf7af0f9461ef2d5d0f9d689' >.git/info/grafts &&
		check parents 2839fc68b7dadaacb1aab6b5402af80c685e88f1 -- 2839fc68b7dadaacb1aab6b5402af80c685e88f1 4866c68257f29071c4c0c800573cc68c4b42e282 c229ffa9d0b0a253d26d2be982947ec9b76ed752 9c384ba49560d2eabf7af0f9461ef2d5d0f9d689 96e034858a6bd96c01ade941fa94c889c78124cd 72f9fac67b3b70714e179ac238f232d19ea9a287
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 2839fc68b7dadaacb1aab6b5402af80c685e88f1 subdir -- 2839fc68b7dadaacb1aab6b5402af80c685e88f1 c229ffa9d0b0a253d26d2be982947ec9b76ed752
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo 'c229ffa9d0b0a253d26d2be982947ec9b76ed752 9c384ba49560d2eabf7af0f9461ef2d5d0f9d689' >.git/info/grafts &&
		check parents 2839fc68b7dadaacb1aab6b5402af80c685e88f1 subdir -- 2839fc68b7dadaacb1aab6b5402af80c685e88f1 c229ffa9d0b0a253d26d2be982947ec9b76ed752 9c384ba49560d2eabf7af0f9461ef2d5d0f9d689 72f9fac67b3b70714e179ac238f232d19ea9a287
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 2839fc68b7dadaacb1aab6b5402af80c685e88f1 -- 2839fc68b7dadaacb1aab6b5402af80c685e88f1 4866c68257f29071c4c0c800573cc68c4b42e282 c229ffa9d0b0a253d26d2be982947ec9b76ed752
	

ok 10 - without grafts

expecting success: 
		echo 'c229ffa9d0b0a253d26d2be982947ec9b76ed752 9c384ba49560d2eabf7af0f9461ef2d5d0f9d689' >.git/info/grafts &&
		check parents-raw 2839fc68b7dadaacb1aab6b5402af80c685e88f1 -- 2839fc68b7dadaacb1aab6b5402af80c685e88f1 4866c68257f29071c4c0c800573cc68c4b42e282 c229ffa9d0b0a253d26d2be982947ec9b76ed752 9c384ba49560d2eabf7af0f9461ef2d5d0f9d689 96e034858a6bd96c01ade941fa94c889c78124cd 72f9fac67b3b70714e179ac238f232d19ea9a287
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 2839fc68b7dadaacb1aab6b5402af80c685e88f1 subdir -- 2839fc68b7dadaacb1aab6b5402af80c685e88f1 c229ffa9d0b0a253d26d2be982947ec9b76ed752
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo 'c229ffa9d0b0a253d26d2be982947ec9b76ed752 9c384ba49560d2eabf7af0f9461ef2d5d0f9d689' >.git/info/grafts &&
		check parents-raw 2839fc68b7dadaacb1aab6b5402af80c685e88f1 subdir -- 2839fc68b7dadaacb1aab6b5402af80c685e88f1 c229ffa9d0b0a253d26d2be982947ec9b76ed752 9c384ba49560d2eabf7af0f9461ef2d5d0f9d689 72f9fac67b3b70714e179ac238f232d19ea9a287
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13

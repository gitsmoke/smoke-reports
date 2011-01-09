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
[master (root-commit) a762a98] Initial in one history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master 1a4ce30] Second in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master ff34572] Third in one history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master (root-commit) 24a3093] Initial in alternate history.
 Author: A U Thor <author@example.com>
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 fileA
 create mode 100644 subdir/fileB
[master feedc65] Second in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)
[master 50a55df] Third in alternate history.
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 1 deletions(-)

ok 1 - setup

expecting success: 
		rm -f .git/info/grafts &&
		check basic 50a55df24ecd463c71b81c49f3e6b3300249f4e6 -- 50a55df24ecd463c71b81c49f3e6b3300249f4e6 feedc652c5086714f24a91c2b6d57a128ee6974e 24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee
	

ok 2 - without grafts

expecting success: 
		echo '24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee ff34572e85be53dc0c9ce889c213b97a45a4fb42' >.git/info/grafts &&
		check basic 50a55df24ecd463c71b81c49f3e6b3300249f4e6 -- 50a55df24ecd463c71b81c49f3e6b3300249f4e6 feedc652c5086714f24a91c2b6d57a128ee6974e 24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee ff34572e85be53dc0c9ce889c213b97a45a4fb42 1a4ce3059203a322a6ea7f891abb5a0431258c6f a762a9841bfef631a5be5566e71f94a77ce4ecfa
	

ok 3 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check basic 50a55df24ecd463c71b81c49f3e6b3300249f4e6 subdir -- 50a55df24ecd463c71b81c49f3e6b3300249f4e6 24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee
	

ok 4 - without grafts, with pathlimit

expecting success: 
		echo '24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee ff34572e85be53dc0c9ce889c213b97a45a4fb42' >.git/info/grafts &&
		check basic 50a55df24ecd463c71b81c49f3e6b3300249f4e6 subdir -- 50a55df24ecd463c71b81c49f3e6b3300249f4e6 24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee ff34572e85be53dc0c9ce889c213b97a45a4fb42 a762a9841bfef631a5be5566e71f94a77ce4ecfa
	

ok 5 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents 50a55df24ecd463c71b81c49f3e6b3300249f4e6 -- 50a55df24ecd463c71b81c49f3e6b3300249f4e6 feedc652c5086714f24a91c2b6d57a128ee6974e 24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee
	

ok 6 - without grafts

expecting success: 
		echo '24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee ff34572e85be53dc0c9ce889c213b97a45a4fb42' >.git/info/grafts &&
		check parents 50a55df24ecd463c71b81c49f3e6b3300249f4e6 -- 50a55df24ecd463c71b81c49f3e6b3300249f4e6 feedc652c5086714f24a91c2b6d57a128ee6974e 24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee ff34572e85be53dc0c9ce889c213b97a45a4fb42 1a4ce3059203a322a6ea7f891abb5a0431258c6f a762a9841bfef631a5be5566e71f94a77ce4ecfa
	

ok 7 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents 50a55df24ecd463c71b81c49f3e6b3300249f4e6 subdir -- 50a55df24ecd463c71b81c49f3e6b3300249f4e6 24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee
	

ok 8 - without grafts, with pathlimit

expecting success: 
		echo '24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee ff34572e85be53dc0c9ce889c213b97a45a4fb42' >.git/info/grafts &&
		check parents 50a55df24ecd463c71b81c49f3e6b3300249f4e6 subdir -- 50a55df24ecd463c71b81c49f3e6b3300249f4e6 24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee ff34572e85be53dc0c9ce889c213b97a45a4fb42 a762a9841bfef631a5be5566e71f94a77ce4ecfa
	

ok 9 - with grafts, with pathlimit

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 50a55df24ecd463c71b81c49f3e6b3300249f4e6 -- 50a55df24ecd463c71b81c49f3e6b3300249f4e6 feedc652c5086714f24a91c2b6d57a128ee6974e 24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee
	

ok 10 - without grafts

expecting success: 
		echo '24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee ff34572e85be53dc0c9ce889c213b97a45a4fb42' >.git/info/grafts &&
		check parents-raw 50a55df24ecd463c71b81c49f3e6b3300249f4e6 -- 50a55df24ecd463c71b81c49f3e6b3300249f4e6 feedc652c5086714f24a91c2b6d57a128ee6974e 24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee ff34572e85be53dc0c9ce889c213b97a45a4fb42 1a4ce3059203a322a6ea7f891abb5a0431258c6f a762a9841bfef631a5be5566e71f94a77ce4ecfa
	

ok 11 - with grafts

expecting success: 
		rm -f .git/info/grafts &&
		check parents-raw 50a55df24ecd463c71b81c49f3e6b3300249f4e6 subdir -- 50a55df24ecd463c71b81c49f3e6b3300249f4e6 24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee
	

ok 12 - without grafts, with pathlimit

expecting success: 
		echo '24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee ff34572e85be53dc0c9ce889c213b97a45a4fb42' >.git/info/grafts &&
		check parents-raw 50a55df24ecd463c71b81c49f3e6b3300249f4e6 subdir -- 50a55df24ecd463c71b81c49f3e6b3300249f4e6 24a30939b9f6ae7d1c8fc46b42b65d4f7090d2ee ff34572e85be53dc0c9ce889c213b97a45a4fb42 a762a9841bfef631a5be5566e71f94a77ce4ecfa
	

ok 13 - with grafts, with pathlimit

# passed all 13 test(s)
1..13

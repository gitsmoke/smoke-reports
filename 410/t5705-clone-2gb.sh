Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5705-clone-2gb/.git/
Skipping expensive 2GB clone test; enable it with GIT_TEST_CLONE_2GB=t
skipping test: setup 

	git config pack.compression 0 &&
	git config pack.depth 0 &&
	blobsize=$((100*1024*1024)) &&
	blobcount=$((2*1024*1024*1024/$blobsize+1)) &&
	i=1 &&
	(while test $i -le $blobcount
	 do
		printf "Generating blob $i/$blobcount" >&2 &&
		printf "blob
mark :$i
data $blobsize
" &&
		#test-genrandom $i $blobsize &&
		printf "%-${blobsize}s" $i &&
		echo "M 100644 :$i $i" >> commit
		i=$(($i+1)) ||
		echo $? > exit-status
	 done &&
	 echo "commit refs/heads/master" &&
	 echo "author A U Thor <author@email.com> 123456789 +0000" &&
	 echo "committer C O Mitter <committer@email.com> 123456789 +0000" &&
	 echo "data 5" &&
	 echo ">2gb" &&
	 cat commit) |
	git fast-import --big-file-threshold=2 &&
	test ! -f exit-status


ok 1 # skip setup (missing CLONE_2GB)
skipping test: clone - bare 

	git clone --bare --no-hardlinks . clone-bare


ok 2 # skip clone - bare (missing CLONE_2GB)

skipping test: clone - with worktree, file:// protocol 

	git clone file://. clone-wt


ok 3 # skip clone - with worktree, file:// protocol (missing CLONE_2GB)

# passed all 3 test(s)
1..3

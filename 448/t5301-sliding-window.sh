Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5301-sliding-window/.git/
expecting success: rm -f .git/index* &&
     for i in a b c
     do
         echo $i >$i &&
         test-genrandom "$i" 32768 >>$i &&
         git update-index --add $i || return 1
     done &&
     echo d >d && cat c >>d && git update-index --add d &&
     tree=`git write-tree` &&
     commit1=`git commit-tree $tree </dev/null` &&
     git update-ref HEAD $commit1 &&
     git repack -a -d &&
     test "`git count-objects`" = "0 objects, 0 kilobytes" &&
     pack1=`ls .git/objects/pack/*.pack` &&
     test -f "$pack1"

ok 1 - setup

expecting success: git verify-pack -v "$pack1"
556c804eac998cc8fa89f225a29870c3d873477b blob   10 22 98620 1 f76f6b9f6aed8209a40d300bf7dcb4fcf9863531
74fd14435c10a325fded9dbb2ed93e25d37438b8 commit 163 124 12
7c0c57f15aee3c4cbe243c44d3c01ecfa949bb25 blob   32770 32789 33040
b7fabea4d93049ea90d45d8252b9a4f8ee7c9c2c tree   116 115 136
d67b2ae81f0bd18212d239b6a965711041f73739 blob   32770 32789 251
f76f6b9f6aed8209a40d300bf7dcb4fcf9863531 blob   32772 32791 65829
non delta: 5 objects
chain length = 1: 1 object
.git/objects/pack/pack-7f549fb50f99dfb95d89e95606361050e0407885.pack: ok

ok 2 - verify-pack -v, defaults

expecting success: git config core.packedGitWindowSize 512 &&
     git verify-pack -v "$pack1"
556c804eac998cc8fa89f225a29870c3d873477b blob   10 22 98620 1 f76f6b9f6aed8209a40d300bf7dcb4fcf9863531
74fd14435c10a325fded9dbb2ed93e25d37438b8 commit 163 124 12
7c0c57f15aee3c4cbe243c44d3c01ecfa949bb25 blob   32770 32789 33040
b7fabea4d93049ea90d45d8252b9a4f8ee7c9c2c tree   116 115 136
d67b2ae81f0bd18212d239b6a965711041f73739 blob   32770 32789 251
f76f6b9f6aed8209a40d300bf7dcb4fcf9863531 blob   32772 32791 65829
non delta: 5 objects
chain length = 1: 1 object
.git/objects/pack/pack-7f549fb50f99dfb95d89e95606361050e0407885.pack: ok

ok 3 - verify-pack -v, packedGitWindowSize == 1 page

expecting success: git config core.packedGitWindowSize 512 &&
     git config core.packedGitLimit 512 &&
     git verify-pack -v "$pack1"
556c804eac998cc8fa89f225a29870c3d873477b blob   10 22 98620 1 f76f6b9f6aed8209a40d300bf7dcb4fcf9863531
74fd14435c10a325fded9dbb2ed93e25d37438b8 commit 163 124 12
7c0c57f15aee3c4cbe243c44d3c01ecfa949bb25 blob   32770 32789 33040
b7fabea4d93049ea90d45d8252b9a4f8ee7c9c2c tree   116 115 136
d67b2ae81f0bd18212d239b6a965711041f73739 blob   32770 32789 251
f76f6b9f6aed8209a40d300bf7dcb4fcf9863531 blob   32772 32791 65829
non delta: 5 objects
chain length = 1: 1 object
.git/objects/pack/pack-7f549fb50f99dfb95d89e95606361050e0407885.pack: ok

ok 4 - verify-pack -v, packedGit{WindowSize,Limit} == 1 page

expecting success: git config core.packedGitWindowSize 512 &&
     git config core.packedGitLimit 512 &&
     commit2=`git commit-tree $tree -p $commit1 </dev/null` &&
     git update-ref HEAD $commit2 &&
     git repack -a -d &&
     test "`git count-objects`" = "0 objects, 0 kilobytes" &&
     pack2=`ls .git/objects/pack/*.pack` &&
     test -f "$pack2" &&
     test "$pack1" \!= "$pack2"

ok 5 - repack -a -d, packedGit{WindowSize,Limit} == 1 page

expecting success: git config --unset core.packedGitWindowSize &&
     git config --unset core.packedGitLimit &&
     git verify-pack -v "$pack2"
556c804eac998cc8fa89f225a29870c3d873477b blob   10 22 98668 1 f76f6b9f6aed8209a40d300bf7dcb4fcf9863531
74fd14435c10a325fded9dbb2ed93e25d37438b8 commit 9 20 164 1 d4f65e0b5abad04d0e0475a5658ce157ef2a82c9
7c0c57f15aee3c4cbe243c44d3c01ecfa949bb25 blob   32770 32789 33088
b7fabea4d93049ea90d45d8252b9a4f8ee7c9c2c tree   116 115 184
d4f65e0b5abad04d0e0475a5658ce157ef2a82c9 commit 211 152 12
d67b2ae81f0bd18212d239b6a965711041f73739 blob   32770 32789 299
f76f6b9f6aed8209a40d300bf7dcb4fcf9863531 blob   32772 32791 65877
non delta: 5 objects
chain length = 1: 2 objects
.git/objects/pack/pack-e92cec88460d347d5c4c9f5d14697d1c8ddb3a60.pack: ok

ok 6 - verify-pack -v, defaults

# passed all 6 test(s)
1..6

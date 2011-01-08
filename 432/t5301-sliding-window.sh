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
4d803b8b25a1c646e0e13a6ba5f92a724879b0a1 commit 163 123 12
556c804eac998cc8fa89f225a29870c3d873477b blob   10 22 98619 1 f76f6b9f6aed8209a40d300bf7dcb4fcf9863531
7c0c57f15aee3c4cbe243c44d3c01ecfa949bb25 blob   32770 32789 33039
b7fabea4d93049ea90d45d8252b9a4f8ee7c9c2c tree   116 115 135
d67b2ae81f0bd18212d239b6a965711041f73739 blob   32770 32789 250
f76f6b9f6aed8209a40d300bf7dcb4fcf9863531 blob   32772 32791 65828
non delta: 5 objects
chain length = 1: 1 object
.git/objects/pack/pack-a93338ad3de6ed7a12b0f3ad3f0a892cca1efbc7.pack: ok
ok 2 - verify-pack -v, defaults

expecting success: git config core.packedGitWindowSize 512 &&
     git verify-pack -v "$pack1"
4d803b8b25a1c646e0e13a6ba5f92a724879b0a1 commit 163 123 12
556c804eac998cc8fa89f225a29870c3d873477b blob   10 22 98619 1 f76f6b9f6aed8209a40d300bf7dcb4fcf9863531
7c0c57f15aee3c4cbe243c44d3c01ecfa949bb25 blob   32770 32789 33039
b7fabea4d93049ea90d45d8252b9a4f8ee7c9c2c tree   116 115 135
d67b2ae81f0bd18212d239b6a965711041f73739 blob   32770 32789 250
f76f6b9f6aed8209a40d300bf7dcb4fcf9863531 blob   32772 32791 65828
non delta: 5 objects
chain length = 1: 1 object
.git/objects/pack/pack-a93338ad3de6ed7a12b0f3ad3f0a892cca1efbc7.pack: ok

ok 3 - verify-pack -v, packedGitWindowSize == 1 page

expecting success: git config core.packedGitWindowSize 512 &&
     git config core.packedGitLimit 512 &&
     git verify-pack -v "$pack1"
4d803b8b25a1c646e0e13a6ba5f92a724879b0a1 commit 163 123 12
556c804eac998cc8fa89f225a29870c3d873477b blob   10 22 98619 1 f76f6b9f6aed8209a40d300bf7dcb4fcf9863531
7c0c57f15aee3c4cbe243c44d3c01ecfa949bb25 blob   32770 32789 33039
b7fabea4d93049ea90d45d8252b9a4f8ee7c9c2c tree   116 115 135
d67b2ae81f0bd18212d239b6a965711041f73739 blob   32770 32789 250
f76f6b9f6aed8209a40d300bf7dcb4fcf9863531 blob   32772 32791 65828
non delta: 5 objects
chain length = 1: 1 object
.git/objects/pack/pack-a93338ad3de6ed7a12b0f3ad3f0a892cca1efbc7.pack: ok

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
41436cfac5f87ee532797ff53df9bc0adddce4eb commit 211 153 12
4d803b8b25a1c646e0e13a6ba5f92a724879b0a1 commit 24 35 165 1 41436cfac5f87ee532797ff53df9bc0adddce4eb
556c804eac998cc8fa89f225a29870c3d873477b blob   10 22 98684 1 f76f6b9f6aed8209a40d300bf7dcb4fcf9863531
7c0c57f15aee3c4cbe243c44d3c01ecfa949bb25 blob   32770 32789 33104
b7fabea4d93049ea90d45d8252b9a4f8ee7c9c2c tree   116 115 200
d67b2ae81f0bd18212d239b6a965711041f73739 blob   32770 32789 315
f76f6b9f6aed8209a40d300bf7dcb4fcf9863531 blob   32772 32791 65893
non delta: 5 objects
chain length = 1: 2 objects
.git/objects/pack/pack-d5d65037bf2fd66c6832453daa50170dfc09abed.pack: ok

ok 6 - verify-pack -v, defaults

# passed all 6 test(s)
1..6

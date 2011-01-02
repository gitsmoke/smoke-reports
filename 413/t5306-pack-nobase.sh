Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5306-pack-nobase/.git/
expecting success: for a in a b c d e f g h i; do echo $a >>text; done &&
     echo side >side &&
     git update-index --add text side &&
     A=$(echo A | git commit-tree $(git write-tree)) &&

     echo m >>text &&
     git update-index text &&
     B=$(echo B | git commit-tree $(git write-tree) -p $A) &&
     git update-ref HEAD $B
    

ok 1 - setup base

expecting success: base_objects=$(pwd)/.git/objects &&
     (mkdir patch_clone &&
      cd patch_clone &&
      git init &&
      echo "$base_objects" >.git/objects/info/alternates &&
      echo q >>text &&
      git read-tree $B &&
      git update-index text &&
      git update-ref HEAD $(echo C | git commit-tree $(git write-tree) -p $B) &&
      rm .git/objects/info/alternates &&

      git --git-dir=../.git cat-file commit $B |
      git hash-object -t commit -w --stdin &&

      git --git-dir=../.git cat-file tree "$B^{tree}" |
      git hash-object -t tree -w --stdin
     ) &&
     C=$(git --git-dir=patch_clone/.git rev-parse HEAD)
    
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5306-pack-nobase/patch_clone/.git/
f2bb2eb70f6179a60450e9a79e4bc68715151d16
f9037bf6e8d95d31af48907ab2c93c2d6c2c7fcd

ok 2 - setup patch_clone

expecting success: (mkdir user_clone &&
      cd user_clone &&
      git init &&
      git pull ../.git &&
      test $(git rev-parse HEAD) = $B &&

      git pull ../patch_clone/.git &&
      test $(git rev-parse HEAD) = $C
     )
    
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5306-pack-nobase/user_clone/.git/
Updating f2bb2eb..602003f
Fast-forward
 text |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

ok 3 - indirectly clone patch_clone

expecting success: (mkdir user_direct &&
      cd user_direct &&
      git init &&
      test_must_fail git fetch ../patch_clone/.git
     )
    
Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5306-pack-nobase/user_direct/.git/

ok 4 - clone of patch_clone is incomplete

# passed all 4 test(s)
1..4

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4011-diff-symlink/.git/
expecting success: ln -s xyzzy frotz &&
    git update-index &&
    tree=$(git write-tree) &&
    git update-index --add frotz &&
    GIT_DIFF_OPTS=--unified=0 git diff-index -M -p $tree > current &&
    compare_diff_patch current expected

ok 1 - diff new symlink

expecting success: tree=$(git write-tree) &&
    git update-index frotz &&
    test -z "$(git diff-index --name-only $tree)"

ok 2 - diff unchanged symlink

expecting success: mv frotz frotz2 &&
    git diff-index -M -p $tree > current &&
    compare_diff_patch current expected

ok 3 - diff removed symlink

expecting success: ln -s xyzzy frotz &&
    git diff-index -M -p $tree > current &&
    compare_diff_patch current expected

ok 4 - diff identical, but newly created symlink

expecting success: rm frotz &&
    ln -s yxyyz frotz &&
    git diff-index -M -p $tree > current &&
    compare_diff_patch current expected

ok 5 - diff different symlink

expecting success: ln -s narf pinky &&
    ln -s take\ over brain &&
    test_must_fail git diff --no-index pinky brain > output 2> output.err &&
    grep narf output &&
    ! grep error output.err
-narf

ok 6 - diff symlinks with non-existing targets

expecting success: 
	echo "*.bin diff=bin" >>.gitattributes &&
	echo content >file.bin &&
	ln -s file.bin link.bin &&
	git add -N file.bin link.bin

ok 7 - setup symlinks with attributes

expecting success: 
	git config diff.bin.binary true &&
	git diff file.bin link.bin >actual &&
	test_cmp expect actual


ok 8 - symlinks do not respect userdiff config by path

# passed all 8 test(s)
1..8

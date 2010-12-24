Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t2102-update-index-symlinks/.git/
expecting success: 
git config core.symlinks false &&
l=$(printf file | git hash-object -t blob -w --stdin) &&
echo "120000 $l	symlink" | git update-index --index-info

ok 1 - preparation

expecting success: 
printf new-file > symlink &&
git update-index symlink

ok 2 - modify the symbolic link

expecting success: 
case "`git ls-files --stage --cached symlink`" in
120000" "*symlink) echo pass;;
*) echo fail; git ls-files --stage --cached symlink; (exit 1);;
esac
pass

ok 3 - the index entry must still be a symbolic link

# passed all 3 test(s)
1..3

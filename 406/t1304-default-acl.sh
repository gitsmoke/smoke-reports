Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t1304-default-acl/.git/
Unable to use setfacl (output: 't1304-default-acl.sh: line 18: setfacl: command not found'; return code: '127')
skipping test: Setup test repo 
	setfacl -m d:u::rwx,d:g::---,d:o:---,d:m:rwx $dirs_to_set &&
	setfacl -m m:rwx               $dirs_to_set &&
	setfacl -m u:root:rwx          $dirs_to_set &&
	setfacl -m d:u:"$LOGNAME":rwx  $dirs_to_set &&
	setfacl -m d:u:root:rwx        $dirs_to_set &&

	touch file.txt &&
	git add file.txt &&
	git commit -m "init"

ok 1 # skip Setup test repo (missing SETFACL)

skipping test: Objects creation does not break ACLs with restrictive umask 
	# SHA1 for empty blob
	check_perms_and_acl .git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391

ok 2 # skip Objects creation does not break ACLs with restrictive umask (missing SETFACL)

skipping test: git gc does not break ACLs with restrictive umask 
	git gc &&
	check_perms_and_acl .git/objects/pack/*.pack

ok 3 # skip git gc does not break ACLs with restrictive umask (missing SETFACL)

# passed all 3 test(s)
1..3

Unable to use setfacl (output: 't1304-default-acl.sh: 18: setfacl: not found'; return code: '127')
ok 1 # skip Setup test repo (missing SETFACL)
ok 2 # skip Objects creation does not break ACLs with restrictive umask (missing SETFACL)
ok 3 # skip git gc does not break ACLs with restrictive umask (missing SETFACL)
# passed all 3 test(s)
1..3

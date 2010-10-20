ok 1 - setup
ok 2 - No mailmap
ok 3 - default .mailmap
ok 4 - mailmap.file set
ok 5 - mailmap.file override
ok 6 - mailmap.file non-existant
not ok - 7 name entry after email entry
#	
#		mkdir -p internal_mailmap &&
#		echo "<bugs@company.xy> <bugs@company.xx>" >internal_mailmap/.mailmap &&
#		echo "Internal Guy <bugs@company.xx>" >>internal_mailmap/.mailmap &&
#		git shortlog >actual &&
#		test_cmp expect actual
#	
not ok - 8 name entry after email entry, case-insensitive
#	
#		mkdir -p internal_mailmap &&
#		echo "<bugs@company.xy> <bugs@company.xx>" >internal_mailmap/.mailmap &&
#		echo "Internal Guy <BUGS@Company.xx>" >>internal_mailmap/.mailmap &&
#		git shortlog >actual &&
#		test_cmp expect actual
#	
ok 9 - No mailmap files, but configured
ok 10 - Shortlog output (complex mapping)
ok 11 - Log output (complex mapping)
ok 12 - Blame output (complex mapping)
# failed 2 among 12 test(s)
1..12

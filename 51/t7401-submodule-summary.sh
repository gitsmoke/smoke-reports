ok 1 - added submodule
ok 2 - modified submodule(forward)
ok 3 - modified submodule(forward), --files
ok 4 - modified submodule(backward)
ok 5 - modified submodule(backward and forward)
ok 6 - --summary-limit
ok 7 - typechanged submodule(submodule->blob), --cached
ok 8 - typechanged submodule(submodule->blob), --files
ok 9 - typechanged submodule(submodule->blob)
ok 10 - nonexistent commit
ok 11 - typechanged submodule(blob->submodule)
ok 12 - deleted submodule
ok 13 - multiple submodules
ok 14 - path filter
ok 15 - given commit
not ok - 16 --for-status
#	
#	    git submodule summary --for-status HEAD^ >actual &&
#	    test_cmp actual - <<EOF
#	# Submodule changes to be committed:
#	#
#	# * sm1 6858906...0000000:
#	#
#	# * sm2 0000000...fa9eeaf (2):
#	#   > Add foo9
#	#
#	EOF
#	
ok 17 - fail when using --files together with --cached
ok 18 - should not fail in an empty repo
# failed 1 among 18 test(s)
1..18

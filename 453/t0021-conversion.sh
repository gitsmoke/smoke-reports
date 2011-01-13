ok 1 - setup
ok 2 - check
ok 3 - expanded_in_repo
not ok - 4 filter shell-escaped filenames
#	
#		cat >argc.sh <<-EOF &&
#		#!$SHELL_PATH
#		cat >/dev/null
#		echo argc: \$# "\$@"
#		EOF
#		normal=name-no-magic &&
#		special="name  with 'sq' and \$x" &&
#		echo some test text >"$normal" &&
#		echo some test text >"$special" &&
#		git add "$normal" "$special" &&
#		git commit -q -m "add files" &&
#		echo "name* filter=argc" >.gitattributes &&
#	
#		# delete the files and check them out again, using a smudge filter
#		# that will count the args and echo the command-line back to us
#		git config filter.argc.smudge "sh ./argc.sh %f" &&
#		rm "$normal" "$special" &&
#		git checkout -- "$normal" "$special" &&
#	
#		# make sure argc.sh counted the right number of args
#		echo "argc: 1 $normal" >expect &&
#		test_cmp expect "$normal" &&
#		echo "argc: 1 $special" >expect &&
#		test_cmp expect "$special" &&
#	
#		# do the same thing, but with more args in the filter expression
#		git config filter.argc.smudge "sh ./argc.sh %f --my-extra-arg" &&
#		rm "$normal" "$special" &&
#		git checkout -- "$normal" "$special" &&
#	
#		# make sure argc.sh counted the right number of args
#		echo "argc: 2 $normal --my-extra-arg" >expect &&
#		test_cmp expect "$normal" &&
#		echo "argc: 2 $special --my-extra-arg" >expect &&
#		test_cmp expect "$special" &&
#		:
#	
# failed 1 among 4 test(s)
1..4

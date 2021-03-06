ok 1 - empty dump
ok 2 - v4 dumps not supported
not ok 3 - empty revision # TODO known breakage
ok 4 - empty properties
ok 5 - author name and commit message
ok 6 - unsupported properties are ignored
not ok 7 - timestamp and empty file # TODO known breakage
ok 8 - directory with files
ok 9 - node without action
ok 10 - action: add node without text
not ok 11 - change file mode but keep old content # TODO known breakage
ok 12 - NUL in property value
not ok - 13 NUL in log message, file content, and property name
#	
#		# Caveat: svnadmin 1.6.16 (r1073529) truncates at   in the
#		# svn:specialQnotreally example.
#		reinit_git &&
#		cat >expect <<-\EOF &&
#		OBJID
#		:100644 100644 OBJID OBJID M	greeting
#		OBJID
#		:000000 100644 OBJID OBJID A	greeting
#		EOF
#		printf "
#	%s" "something with an ASCII NUL (Q)" >expect.message &&
#		printf "%s
#	" "helQo" >expect.hello1 &&
#		printf "%s
#	" "link hello" >expect.hello2 &&
#		{
#			properties svn:log "something with an ASCII NUL (Q)" &&
#			echo PROPS-END
#		} |
#		q_to_nul >props &&
#		{
#			q_to_nul <<-\EOF &&
#			SVN-fs-dump-format-version: 3
#	
#			Revision-number: 1
#			Prop-content-length: 10
#			Content-length: 10
#	
#			PROPS-END
#	
#			Node-path: greeting
#			Node-kind: file
#			Node-action: add
#			Prop-content-length: 10
#			Text-content-length: 6
#			Content-length: 16
#	
#			PROPS-END
#			helQo
#	
#			Revision-number: 2
#			EOF
#			echo Prop-content-length: $(wc -c <props) &&
#			echo Content-length: $(wc -c <props) &&
#			echo &&
#			cat props &&
#			q_to_nul <<-\EOF
#	
#			Node-path: greeting
#			Node-kind: file
#			Node-action: change
#			Prop-content-length: 43
#			Text-content-length: 11
#			Content-length: 54
#	
#			K 21
#			svn:specialQnotreally
#			V 1
#			*
#			PROPS-END
#			link hello
#			EOF
#		} >8bitclean.dump &&
#		test-svn-fe 8bitclean.dump >stream &&
#		git fast-import <stream &&
#		{
#			git rev-list HEAD |
#			git diff-tree --root --stdin |
#			sed "s/$_x40/OBJID/g"
#		} >actual &&
#		git cat-file commit HEAD | nul_to_q | sed -ne "/^\$/,\$ p" >actual.message &&
#		git cat-file blob HEAD^:greeting | nul_to_q >actual.hello1 &&
#		git cat-file blob HEAD:greeting | nul_to_q >actual.hello2 &&
#		test_cmp expect actual &&
#		test_cmp expect.message actual.message &&
#		test_cmp expect.hello1 actual.hello1 &&
#		test_cmp expect.hello2 actual.hello2
#	
ok 14 - change file mode and reiterate content
ok 15 - deltas not supported
ok 16 - property deltas supported
ok 17 - properties on /
ok 18 - deltas for typechange
ok 19 - set up svn repo
ok 20 - t9135/svn.dump
# still have 3 known breakage(s)
# failed 1 among remaining 17 test(s)
1..20

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4201-shortlog/.git/
expecting success: 
	echo 1 >a1 &&
	git add a1 &&
	tree=$(git write-tree) &&
	commit=$(printf "%s
" "Test" "" | git commit-tree "$tree") &&
	git update-ref HEAD "$commit" &&

	echo 2 >a1 &&
	git commit --quiet -m "This is a very, very long first line for the commit message to see if it is wrapped correctly" a1 &&

	# test if the wrapping is still valid
	# when replacing all is by treble clefs.
	echo 3 >a1 &&
	git commit --quiet -m "$(
		echo "This is a very, very long first line for the commit message to see if it is wrapped correctly" |
		sed "s/i/1234/g" |
		tr 1234 "\360\235\204\236")" a1 &&

	# now fsck up the utf8
	git config i18n.commitencoding non-utf-8 &&
	echo 4 >a1 &&
	git commit --quiet -m "$(
		echo "This is a very, very long first line for the commit message to see if it is wrapped correctly" |
		sed "s/i/1234/g" |
		tr 1234 "\370\235\204\236")" a1 &&

	echo 5 >a1 &&
	git commit --quiet -m "a								12	34	56	78" a1 &&

	echo 6 >a1 &&
	git commit --quiet -m "Commit by someone else" \
		--author="Someone else <not!me>" a1 &&

	cat >expect.template <<-\EOF
	A U Thor (5):
	      SUBJECT
	      SUBJECT
	      SUBJECT
	      SUBJECT
	      SUBJECT

	Someone else (1):
	      SUBJECT

	EOF

ok 1 - setup

expecting success: 
	git shortlog HEAD >log &&
	fuzz log >log.predictable &&
	test_cmp expect.template log.predictable


ok 2 - default output format

expecting success: 
	sed s/SUBJECT/OBJECT_NAME/ expect.template >expect &&
	git shortlog --format="%H" HEAD >log &&
	fuzz log >log.predictable &&
	test_cmp expect log.predictable


ok 3 - pretty format

expecting success: 
	sed s/SUBJECT/OBJID/ expect.template >expect &&
	git shortlog --format="%h" --abbrev=5 HEAD >log &&
	fuzz log >log.predictable &&
	test_cmp expect log.predictable


ok 4 - --abbrev

expecting success: 
	sed "s/SUBJECT/two lines/" expect.template >expect &&
	git shortlog --format="two%nlines" HEAD >log &&
	fuzz log >log.predictable &&
	test_cmp expect log.predictable


ok 5 - output from user-defined format is re-wrapped

expecting success: 
	cat >expect <<\EOF &&
A U Thor (5):
      Test
      This is a very, very long first line for the commit message to see if
         it is wrapped correctly
      Thð„žs ð„žs a very, very long fð„žrst lð„žne for the commð„žt message to see ð„žf
         ð„žt ð„žs wrapped correctly
      Thø„žs ø„žs a very, very long fø„žrst lø„žne for the commø„žt
         message to see ø„žf ø„žt ø„žs wrapped correctly
      a								12	34
         56	78

Someone else (1):
      Commit by someone else

EOF
	git shortlog -w HEAD >out &&
	test_cmp expect out


ok 6 - shortlog wrapping

expecting success: 
	git log HEAD >log &&
	GIT_DIR=non-existing git shortlog -w <log >out &&
	test_cmp expect out


ok 7 - shortlog from non-git directory

expecting success: 
	git reset --hard "$commit" &&
	git config --unset i18n.commitencoding &&
	echo 2 > a1 &&
	git commit --quiet -m "$MSG1" --author="$DSCHOE" a1 &&
	git config i18n.commitencoding "ISO8859-1" &&
	echo 3 > a1 &&
	git commit --quiet -m "$(iconvfromutf8toiso88591 "$MSG2")" \
		--author="$(iconvfromutf8toiso88591 "$DSCHOE")" a1 &&
	git config --unset i18n.commitencoding &&
	git shortlog HEAD~2.. > out &&
test_cmp expect out
HEAD is now at 46ae36d Test

ok 8 - shortlog encoding

# passed all 8 test(s)
1..8

ok 1 - setup the repository
not ok - 2 blame respects i18n.commitencoding
#	
#		git blame --incremental file | \
#			egrep "^(author|summary) " > actual &&
#		test_cmp actual expected
#	
not ok - 3 blame respects i18n.logoutputencoding
#	
#		git config i18n.logoutputencoding eucJP &&
#		git blame --incremental file | \
#			egrep "^(author|summary) " > actual &&
#		test_cmp actual expected
#	
not ok - 4 blame respects --encoding=UTF-8
#	
#		git blame --incremental --encoding=UTF-8 file | \
#			egrep "^(author|summary) " > actual &&
#		test_cmp actual expected
#	
ok 5 - blame respects --encoding=none
# failed 3 among 5 test(s)
1..5

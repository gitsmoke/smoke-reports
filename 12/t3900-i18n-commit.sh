ok 1 - setup
ok 2 - no encoding header for base case
ok 3 - ISO8859-1 setup
ok 4 - eucJP setup
ok 5 - ISO-2022-JP setup
ok 6 - check encoding header for ISO8859-1
ok 7 - check encoding header for eucJP
ok 8 - check encoding header for ISO-2022-JP
ok 9 - config to remove customization
ok 10 - ISO8859-1 should be shown in UTF-8 now
ok 11 - eucJP should be shown in UTF-8 now
not ok - 12 ISO-2022-JP should be shown in UTF-8 now
#	
#			compare_with ISO-2022-JP "$TEST_DIRECTORY"/t3900/2-UTF-8.txt
#		
ok 13 - config to add customization
ok 14 - ISO8859-1 should be shown in itself now
ok 15 - eucJP should be shown in itself now
ok 16 - ISO-2022-JP should be shown in itself now
ok 17 - config to tweak customization
ok 18 - ISO8859-1 should be shown in UTF-8 now
ok 19 - eucJP should be shown in UTF-8 now
not ok - 20 ISO-2022-JP should be shown in UTF-8 now
#	
#			compare_with ISO-2022-JP "$TEST_DIRECTORY"/t3900/2-UTF-8.txt
#		
ok 21 - eucJP should be shown in eucJP now
not ok - 22 ISO-2022-JP should be shown in eucJP now
#	
#				compare_with ISO-2022-JP "$TEST_DIRECTORY"/t3900/eucJP.txt $ICONV
#			
not ok - 23 eucJP should be shown in ISO-2022-JP now
#	
#				compare_with eucJP "$TEST_DIRECTORY"/t3900/ISO-2022-JP.txt $ICONV
#			
not ok - 24 ISO-2022-JP should be shown in ISO-2022-JP now
#	
#				compare_with ISO-2022-JP "$TEST_DIRECTORY"/t3900/ISO-2022-JP.txt $ICONV
#			
ok 25 - No conversion with ISO8859-1
ok 26 - No conversion with eucJP
ok 27 - No conversion with ISO-2022-JP
# failed 5 among 27 test(s)
1..27

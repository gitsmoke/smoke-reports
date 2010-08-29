ok 1 - split sample box
not ok - 2 mailinfo 0001
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 3 mailinfo 0002
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 4 mailinfo 0003
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 5 mailinfo 0004
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 6 mailinfo 0005
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 7 mailinfo 0006
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 8 mailinfo 0007
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 9 mailinfo 0008
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 10 mailinfo 0009
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 11 mailinfo 0010
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 12 mailinfo 0011
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 13 mailinfo 0012
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 14 mailinfo 0013
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 15 mailinfo 0014
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 16 mailinfo 0015
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
not ok - 17 mailinfo 0016
#	
#			check_mailinfo $mail "" &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
#			then
#				check_mailinfo $mail --scissors
#			fi &&
#			if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
#			then
#				check_mailinfo $mail --no-inbody-headers
#			fi
#		
ok 18 - split box with rfc2047 samples
not ok - 19 mailinfo rfc2047/0001
#	
#			git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
#			echo msg &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
#			echo patch &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
#			echo info &&
#			test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
#		
not ok - 20 mailinfo rfc2047/0002
#	
#			git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
#			echo msg &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
#			echo patch &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
#			echo info &&
#			test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
#		
not ok - 21 mailinfo rfc2047/0003
#	
#			git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
#			echo msg &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
#			echo patch &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
#			echo info &&
#			test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
#		
not ok - 22 mailinfo rfc2047/0004
#	
#			git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
#			echo msg &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
#			echo patch &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
#			echo info &&
#			test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
#		
not ok - 23 mailinfo rfc2047/0005
#	
#			git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
#			echo msg &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
#			echo patch &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
#			echo info &&
#			test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
#		
not ok - 24 mailinfo rfc2047/0006
#	
#			git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
#			echo msg &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
#			echo patch &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
#			echo info &&
#			test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
#		
not ok - 25 mailinfo rfc2047/0007
#	
#			git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
#			echo msg &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
#			echo patch &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
#			echo info &&
#			test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
#		
not ok - 26 mailinfo rfc2047/0008
#	
#			git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
#			echo msg &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
#			echo patch &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
#			echo info &&
#			test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
#		
not ok - 27 mailinfo rfc2047/0009
#	
#			git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
#			echo msg &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
#			echo patch &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
#			echo info &&
#			test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
#		
not ok - 28 mailinfo rfc2047/0010
#	
#			git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
#			echo msg &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
#			echo patch &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
#			echo info &&
#			test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
#		
not ok - 29 mailinfo rfc2047/0011
#	
#			git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
#			echo msg &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
#			echo patch &&
#			test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
#			echo info &&
#			test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
#		
ok 30 - respect NULs
not ok - 31 Preserve NULs out of MIME encoded message
#	
#	
#		git mailsplit -d5 -o. "$TEST_DIRECTORY"/t5100/nul-b64.in &&
#		test_cmp "$TEST_DIRECTORY"/t5100/nul-b64.in 00001 &&
#		git mailinfo msg patch <00001 &&
#		test_cmp "$TEST_DIRECTORY"/t5100/nul-b64.expect patch
#	
#	
not ok - 32 mailinfo on from header without name works
#	
#	
#		mkdir info-from &&
#		git mailsplit -oinfo-from "$TEST_DIRECTORY"/t5100/info-from.in &&
#		test_cmp "$TEST_DIRECTORY"/t5100/info-from.in info-from/0001 &&
#		git mailinfo info-from/msg info-from/patch \
#		  <info-from/0001 >info-from/out &&
#		test_cmp "$TEST_DIRECTORY"/t5100/info-from.expect info-from/out
#	
#	
# failed 29 among 32 test(s)
1..32

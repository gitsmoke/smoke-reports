Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t5100-mailinfo/.git/
expecting success: git mailsplit -o. "$TEST_DIRECTORY"/t5100/sample.mbox >last &&
	last=`cat last` &&
	echo total is $last &&
	test `cat last` = 16
total is 16
ok 1 - split sample box
expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 2 - mailinfo 0001

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 3 - mailinfo 0002

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 4 - mailinfo 0003

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 5 - mailinfo 0004

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 6 - mailinfo 0005

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 7 - mailinfo 0006

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 8 - mailinfo 0007

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 9 - mailinfo 0008

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 10 - mailinfo 0009

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 11 - mailinfo 0010

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 12 - mailinfo 0011

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 13 - mailinfo 0012

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 14 - mailinfo 0013

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 15 - mailinfo 0014

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 16 - mailinfo 0015

expecting success: 
		check_mailinfo $mail "" &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--scissors
		then
			check_mailinfo $mail --scissors
		fi &&
		if test -f "$TEST_DIRECTORY"/t5100/msg$mail--no-inbody-headers
		then
			check_mailinfo $mail --no-inbody-headers
		fi
	

ok 17 - mailinfo 0016

expecting success: mkdir rfc2047 &&
	git mailsplit -orfc2047 "$TEST_DIRECTORY"/t5100/rfc2047-samples.mbox \
	  >rfc2047/last &&
	last=`cat rfc2047/last` &&
	echo total is $last &&
	test `cat rfc2047/last` = 11
total is 11

ok 18 - split box with rfc2047 samples

expecting success: 
		git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
		echo msg &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
		echo patch &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
		echo info &&
		test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
	
msg
patch
info

ok 19 - mailinfo rfc2047/0001

expecting success: 
		git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
		echo msg &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
		echo patch &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
		echo info &&
		test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
	
msg
patch
info

ok 20 - mailinfo rfc2047/0002

expecting success: 
		git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
		echo msg &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
		echo patch &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
		echo info &&
		test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
	
msg
patch
info

ok 21 - mailinfo rfc2047/0003

expecting success: 
		git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
		echo msg &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
		echo patch &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
		echo info &&
		test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
	
msg
patch
info

ok 22 - mailinfo rfc2047/0004

expecting success: 
		git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
		echo msg &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
		echo patch &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
		echo info &&
		test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
	
msg
patch
info

ok 23 - mailinfo rfc2047/0005

expecting success: 
		git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
		echo msg &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
		echo patch &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
		echo info &&
		test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
	
msg
patch
info

ok 24 - mailinfo rfc2047/0006
expecting success: 
		git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
		echo msg &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
		echo patch &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
		echo info &&
		test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
	
msg
patch
info

ok 25 - mailinfo rfc2047/0007

expecting success: 
		git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
		echo msg &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
		echo patch &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
		echo info &&
		test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
	
msg
patch
info
ok 26 - mailinfo rfc2047/0008
expecting success: 
		git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
		echo msg &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
		echo patch &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
		echo info &&
		test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
	
msg
patch
info
ok 27 - mailinfo rfc2047/0009
expecting success: 
		git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
		echo msg &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
		echo patch &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
		echo info &&
		test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
	
msg
patch
info

ok 28 - mailinfo rfc2047/0010
expecting success: 
		git mailinfo -u $mail-msg $mail-patch <$mail >$mail-info &&
		echo msg &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-msg &&
		echo patch &&
		test_cmp "$TEST_DIRECTORY"/t5100/empty $mail-patch &&
		echo info &&
		test_cmp "$TEST_DIRECTORY"/t5100/rfc2047-info-$(basename $mail) $mail-info
	
msg
patch
info
ok 29 - mailinfo rfc2047/0011
expecting success: 

	git mailsplit -d3 -o. "$TEST_DIRECTORY"/t5100/nul-plain &&
	test_cmp "$TEST_DIRECTORY"/t5100/nul-plain 001 &&
	(cat 001 | git mailinfo msg patch) &&
	test 4 = $(wc -l < patch)
1
ok 30 - respect NULs
expecting success: 

	git mailsplit -d5 -o. "$TEST_DIRECTORY"/t5100/nul-b64.in &&
	test_cmp "$TEST_DIRECTORY"/t5100/nul-b64.in 00001 &&
	git mailinfo msg patch <00001 &&
	test_cmp "$TEST_DIRECTORY"/t5100/nul-b64.expect patch
1
Author: Junio C Hamano
Email: gitster@pobox.com
Subject: second
Date: Sun, 25 May 2008 00:38:18 -0700

ok 31 - Preserve NULs out of MIME encoded message
expecting success: 

	mkdir info-from &&
	git mailsplit -oinfo-from "$TEST_DIRECTORY"/t5100/info-from.in &&
	test_cmp "$TEST_DIRECTORY"/t5100/info-from.in info-from/0001 &&
	git mailinfo info-from/msg info-from/patch \
	  <info-from/0001 >info-from/out &&
	test_cmp "$TEST_DIRECTORY"/t5100/info-from.expect info-from/out
1
ok 32 - mailinfo on from header without name works
# passed all 32 test(s)
1..32

ok 1 - split sample box
ok 2 - mailinfo 0001
ok 3 - mailinfo 0002
ok 4 - mailinfo 0003
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
ok 6 - mailinfo 0005
ok 7 - mailinfo 0006
ok 8 - mailinfo 0007
ok 9 - mailinfo 0008
ok 10 - mailinfo 0009
ok 11 - mailinfo 0010
ok 12 - mailinfo 0011
ok 13 - mailinfo 0012
ok 14 - mailinfo 0013
ok 15 - mailinfo 0014
ok 16 - mailinfo 0015
ok 17 - mailinfo 0016
ok 18 - split box with rfc2047 samples
ok 19 - mailinfo rfc2047/0001
ok 20 - mailinfo rfc2047/0002
ok 21 - mailinfo rfc2047/0003
ok 22 - mailinfo rfc2047/0004
ok 23 - mailinfo rfc2047/0005
ok 24 - mailinfo rfc2047/0006
ok 25 - mailinfo rfc2047/0007
ok 26 - mailinfo rfc2047/0008
ok 27 - mailinfo rfc2047/0009
ok 28 - mailinfo rfc2047/0010
ok 29 - mailinfo rfc2047/0011
ok 30 - respect NULs
ok 31 - Preserve NULs out of MIME encoded message
ok 32 - mailinfo on from header without name works
# failed 1 among 32 test(s)
1..32

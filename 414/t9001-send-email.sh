Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t9001-send-email/.git/
expecting success: echo "1A quick brown fox jumps over the" >file &&
     echo "lazy dog" >>file &&
     git add file &&
     GIT_AUTHOR_NAME="A" git commit -a -m "Initial."
[master (root-commit) 18c12c6] Initial.
 Author: A <author@example.com>
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - prepare reference tree

expecting success: (echo "#!$SHELL_PATH"
      echo shift
      echo output=1
      echo "while test -f commandline\$output; do output=\$((\$output+1)); done"
      echo for a
      echo do
      echo "  echo \"!\$a!\""
      echo "done >commandline\$output"
      echo "cat > msgtxt\$output"
      ) >fake.sendmail &&
     chmod +x ./fake.sendmail &&
     git add fake.sendmail &&
     GIT_AUTHOR_NAME="A" git commit -a -m "Second."
[master e9201c9] Second.
 Author: A <author@example.com>
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100755 fake.sendmail

ok 2 - Setup helper tool

expecting success: 
    patches=`git format-patch -s --cc="One <one@example.com>" --cc=two@example.com -n HEAD^1`

ok 3 - Extract patches

expecting success: 
	test_no_confirm --suppress-cc=sob &&
	check_no_confirm
ok 4 - No confirm with --suppress-cc
expecting success: 
	test_no_confirm --confirm=never &&
	check_no_confirm
ok 5 - No confirm with --confirm=never
expecting success: 
	git config sendemail.confirm never &&
	test_no_confirm --compose --subject=foo &&
	check_no_confirm
ok 6 - No confirm with sendemail.confirm=never
expecting success: 
     git send-email --suppress-cc=sob --from="Example <nobody@example.com>" --to=nobody@example.com --smtp-server="$(pwd)/fake.sendmail" $patches 2>errors
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:45 +0000
Message-Id: <1293941325-10045-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK

ok 7 - Send patches

expecting success: 
cat >expected <<\EOF
!nobody@example.com!
!author@example.com!
!one@example.com!
!two@example.com!
EOF


ok 8 - setup expect

expecting success: test_cmp expected commandline1

ok 9 - Verify commandline
expecting success: 
    clean_fake_sendmail &&
     git send-email --envelope-sender="Patch Contributer <patch@example.com>" --suppress-cc=sob --from="Example <nobody@example.com>" --to=nobody@example.com --smtp-server="$(pwd)/fake.sendmail" $patches 2>errors
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -f patch@example.com -i nobody@example.com author@example.com one@example.com two@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:46 +0000
Message-Id: <1293941326-10179-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK

ok 10 - Send patches with --envelope-sender

expecting success: 
cat >expected <<\EOF
!patch@example.com!
!-i!
!nobody@example.com!
!author@example.com!
!one@example.com!
!two@example.com!
EOF


ok 11 - setup expect

expecting success: test_cmp expected commandline1

ok 12 - Verify commandline

expecting success: 
    clean_fake_sendmail &&
     git send-email --envelope-sender=auto --suppress-cc=sob --from="Example <nobody@example.com>" --to=nobody@example.com --smtp-server="$(pwd)/fake.sendmail" $patches 2>errors

0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -f nobody@example.com -i nobody@example.com author@example.com one@example.com two@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:46 +0000
Message-Id: <1293941326-10294-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK

ok 13 - Send patches with --envelope-sender=auto

expecting success: 
cat >expected <<\EOF
!nobody@example.com!
!-i!
!nobody@example.com!
!author@example.com!
!one@example.com!
!two@example.com!
EOF

ok 14 - setup expect

expecting success: test_cmp expected commandline1

ok 15 - Verify commandline

expecting success: 
cat >expected-show-all-headers <<\EOF
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
Dry-OK. Log says:
Server: relay.example.com
MAIL FROM:<from@example.com>
RCPT TO:<to@example.com>
RCPT TO:<cc@example.com>
RCPT TO:<author@example.com>
RCPT TO:<one@example.com>
RCPT TO:<two@example.com>
RCPT TO:<bcc@example.com>
From: Example <from@example.com>
To: to@example.com
Cc: cc@example.com,
	A <author@example.com>,
	One <one@example.com>,
	two@example.com
Subject: [PATCH 1/1] Second.
Date: DATE-STRING
Message-Id: MESSAGE-ID-STRING
X-Mailer: X-MAILER-STRING
In-Reply-To: <unique-message-id@example.com>
References: <unique-message-id@example.com>

Result: OK
EOF


ok 16 - setup expect

expecting success: 
	git send-email \
		--dry-run \
		--suppress-cc=sob \
		--from="Example <from@example.com>" \
		--to=to@example.com \
		--cc=cc@example.com \
		--bcc=bcc@example.com \
		--in-reply-to="<unique-message-id@example.com>" \
		--smtp-server relay.example.com \
		$patches |
	sed	-e "s/^\(Date:\).*/\1 DATE-STRING/" \
		-e "s/^\(Message-Id:\).*/\1 MESSAGE-ID-STRING/" \
		-e "s/^\(X-Mailer:\).*/\1 X-MAILER-STRING/" \
		>actual-show-all-headers &&
	test_cmp expected-show-all-headers actual-show-all-headers

ok 17 - Show all headers

expecting success: 
	clean_fake_sendmail &&
	(echo "Example <from@example.com>"
	 echo "to@example.com"
	 echo ""
	) | GIT_SEND_EMAIL_NOTTY=1 git send-email \
		--smtp-server="$(pwd)/fake.sendmail" \
		$patches \
		2>errors &&
		grep "^From: Example <from@example.com>\$" msgtxt1 &&
		grep "^To: to@example.com\$" msgtxt1
0001-Second.patch
Who should the emails appear to be from? [A U Thor <author@example.com>] Emails will be sent from: Example <from@example.com>
Who should the emails be sent to? Message-ID to be used as In-Reply-To for the first email? (mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i to@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <from@example.com>
To: to@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:47 +0000
Message-Id: <1293941327-10436-1-git-send-email-from@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK
From: Example <from@example.com>
To: to@example.com

ok 18 - Prompting works

expecting success: 
	clean_fake_sendmail &&
	cp $patches tocmd.patch &&
	echo tocmd--tocmd@example.com >>tocmd.patch &&
	{
	  echo "#!$SHELL_PATH"
	  echo sed -n -e s/^tocmd--//p \"\$1\"
	} > tocmd-sed &&
	chmod +x tocmd-sed &&
	git send-email \
		--from="Example <nobody@example.com>" \
		--to-cmd=./tocmd-sed \
		--smtp-server="$(pwd)/fake.sendmail" \
		tocmd.patch \
		&&
	grep "^To: tocmd@example.com" msgtxt1
tocmd.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
(to-cmd) Adding to: tocmd@example.com from: './tocmd-sed'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i tocmd@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: tocmd@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:48 +0000
Message-Id: <1293941328-10596-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK
To: tocmd@example.com

ok 19 - tocmd works

expecting success: 
	clean_fake_sendmail &&
	cp $patches cccmd.patch &&
	echo "cccmd--  cccmd@example.com" >>cccmd.patch &&
	{
	  echo "#!$SHELL_PATH"
	  echo sed -n -e s/^cccmd--//p \"\$1\"
	} > cccmd-sed &&
	chmod +x cccmd-sed &&
	git send-email \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		--cc-cmd=./cccmd-sed \
		--smtp-server="$(pwd)/fake.sendmail" \
		cccmd.patch \
		&&
	grep "^	cccmd@example.com" msgtxt1
cccmd.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
(cc-cmd) Adding cc: cccmd@example.com from: './cccmd-sed'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com cccmd@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>,
	cccmd@example.com
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:49 +0000
Message-Id: <1293941329-10750-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK
	cccmd@example.com
ok 20 - cccmd works
expecting success: 
	z8=zzzzzzzz &&
	z64=$z8$z8$z8$z8$z8$z8$z8$z8 &&
	z512=$z64$z64$z64$z64$z64$z64$z64$z64 &&
	clean_fake_sendmail &&
	cp $patches longline.patch &&
	echo $z512$z512 >>longline.patch &&
	test_must_fail git send-email \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		--smtp-server="$(pwd)/fake.sendmail" \
		$patches longline.patch \
		2>errors &&
	grep longline.patch errors
fatal: longline.patch: 33: patch contains a line longer than 998 characters

ok 21 - reject long lines

expecting success: 
	! test -e commandline1


ok 22 - no patch was sent

expecting success: 
	clean_fake_sendmail &&
	git send-email \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		--smtp-server="$(pwd)/fake.sendmail" \
		$patches &&
	sed "1,/^\$/d" < msgtxt1 > msgbody1
	grep "From: A <author@example.com>" msgbody1
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:50 +0000
Message-Id: <1293941330-10923-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK
From: A <author@example.com>
ok 23 - Author From: in message body
expecting success: 
	clean_fake_sendmail &&
	git send-email \
		--from="A <author@example.com>" \
		--to=nobody@example.com \
		--smtp-server="$(pwd)/fake.sendmail" \
		$patches &&
	sed "1,/^\$/d" < msgtxt1 > msgbody1
	! grep "From: A <author@example.com>" msgbody1
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: A <author@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:50 +0000
Message-Id: <1293941330-10999-1-git-send-email-author@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK

ok 24 - Author From: not in message body

expecting success: 
	git send-email \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		--smtp-server="$(pwd)/fake.sendmail" \
		--novalidate \
		$patches longline.patch \
		2>errors
0001-Second.patch
longline.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:49 +0000
Message-Id: <1293941330-11078-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:50 +0000
Message-Id: <1293941330-11078-2-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <1293941330-11078-1-git-send-email-nobody@example.com>
References: <1293941330-11078-1-git-send-email-nobody@example.com>

Result: OK

ok 25 - allow long lines with --no-validate

expecting success: 
	clean_fake_sendmail &&
	git send-email \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		--in-reply-to=" " \
		--smtp-server="$(pwd)/fake.sendmail" \
		$patches \
		2>errors
	! grep "^In-Reply-To: < *>" msgtxt1
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:51 +0000
Message-Id: <1293941331-11194-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK

ok 26 - Invalid In-Reply-To

expecting success: 
	clean_fake_sendmail &&
	(echo "From Example <from@example.com>"
	 echo "To Example <to@example.com>"
	 echo ""
	) | env GIT_SEND_EMAIL_NOTTY=1 git send-email \
		--smtp-server="$(pwd)/fake.sendmail" \
		$patches 2>errors &&
	! grep "^In-Reply-To: < *>" msgtxt1
0001-Second.patch
Who should the emails appear to be from? [A U Thor <author@example.com>] Emails will be sent from: From Example <from@example.com>
Who should the emails be sent to? Message-ID to be used as In-Reply-To for the first email? (mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i to@example.com author@example.com one@example.com two@example.com committer@example.com
From: From Example <from@example.com>
To: To Example <to@example.com>
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:51 +0000
Message-Id: <1293941331-11305-1-git-send-email-from@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK

ok 27 - Valid In-Reply-To when prompting

expecting success: 
	clean_fake_sendmail &&
	echo "<unique-message-id@example.com>" >expect &&
	git send-email \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		--nochain-reply-to \
		--in-reply-to="$(cat expect)" \
		--smtp-server="$(pwd)/fake.sendmail" \
		$patches $patches $patches \
		2>errors &&
	# The first message is a reply to --in-reply-to
	sed -n -e "s/^In-Reply-To: *\(.*\)/\1/p" msgtxt1 >actual &&
	test_cmp expect actual &&
	# Second and subsequent messages are replies to the first one
	sed -n -e "s/^Message-Id: *\(.*\)/\1/p" msgtxt1 >expect &&
	sed -n -e "s/^In-Reply-To: *\(.*\)/\1/p" msgtxt2 >actual &&
	test_cmp expect actual &&
	sed -n -e "s/^In-Reply-To: *\(.*\)/\1/p" msgtxt3 >actual &&
	test_cmp expect actual
0001-Second.patch
0001-Second.patch
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:49 +0000
Message-Id: <1293941331-11470-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <unique-message-id@example.com>
References: <unique-message-id@example.com>

Result: OK
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:50 +0000
Message-Id: <1293941331-11470-2-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <1293941331-11470-1-git-send-email-nobody@example.com>
References: <unique-message-id@example.com>
 <1293941331-11470-1-git-send-email-nobody@example.com>

Result: OK
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:51 +0000
Message-Id: <1293941331-11470-3-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <1293941331-11470-1-git-send-email-nobody@example.com>
References: <unique-message-id@example.com>
 <1293941331-11470-1-git-send-email-nobody@example.com>

Result: OK

ok 28 - In-Reply-To without --chain-reply-to

expecting success: 
	clean_fake_sendmail &&
	echo "<unique-message-id@example.com>" >expect &&
	git send-email \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		--chain-reply-to \
		--in-reply-to="$(cat expect)" \
		--smtp-server="$(pwd)/fake.sendmail" \
		$patches $patches $patches \
		2>errors &&
	sed -n -e "s/^In-Reply-To: *\(.*\)/\1/p" msgtxt1 >actual &&
	test_cmp expect actual &&
	sed -n -e "s/^Message-Id: *\(.*\)/\1/p" msgtxt1 >expect &&
	sed -n -e "s/^In-Reply-To: *\(.*\)/\1/p" msgtxt2 >actual &&
	test_cmp expect actual &&
	sed -n -e "s/^Message-Id: *\(.*\)/\1/p" msgtxt2 >expect &&
	sed -n -e "s/^In-Reply-To: *\(.*\)/\1/p" msgtxt3 >actual &&
	test_cmp expect actual
0001-Second.patch
0001-Second.patch
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:50 +0000
Message-Id: <1293941332-11622-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <unique-message-id@example.com>
References: <unique-message-id@example.com>

Result: OK
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:51 +0000
Message-Id: <1293941332-11622-2-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <1293941332-11622-1-git-send-email-nobody@example.com>
References: <unique-message-id@example.com>
 <1293941332-11622-1-git-send-email-nobody@example.com>

Result: OK
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:52 +0000
Message-Id: <1293941332-11622-3-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <1293941332-11622-2-git-send-email-nobody@example.com>
References: <unique-message-id@example.com>
 <1293941332-11622-1-git-send-email-nobody@example.com>
 <1293941332-11622-2-git-send-email-nobody@example.com>

Result: OK

ok 29 - In-Reply-To with --chain-reply-to

expecting success: 
	(echo "#!$SHELL_PATH" &&
	 echo "echo fake edit >>\"\$1\""
	) >fake-editor &&
	chmod +x fake-editor


ok 30 - setup fake editor

expecting success: 
	clean_fake_sendmail &&
	git send-email \
	--compose --subject foo \
	--from="Example <nobody@example.com>" \
	--to=nobody@example.com \
	--smtp-server="$(pwd)/fake.sendmail" \
	$patches \
	2>errors

0001-Second.patch
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Subject: foo
Date: Sun,  2 Jan 2011 04:08:51 +0000
Message-Id: <1293941332-11781-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:52 +0000
Message-Id: <1293941332-11781-2-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <1293941332-11781-1-git-send-email-nobody@example.com>
References: <1293941332-11781-1-git-send-email-nobody@example.com>

Result: OK

ok 31 - --compose works

expecting success: 
	grep "^fake edit" msgtxt1

fake edit

ok 32 - first message is compose text

expecting success: 
	grep "Subject:.*Second" msgtxt2

Subject: [PATCH 1/1] Second.

ok 33 - second message is patch

expecting success: 
cat >expected-suppress-sob <<\EOF
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
Dry-OK. Log says:
Server: relay.example.com
MAIL FROM:<from@example.com>
RCPT TO:<to@example.com>
RCPT TO:<cc@example.com>
RCPT TO:<author@example.com>
RCPT TO:<one@example.com>
RCPT TO:<two@example.com>
From: Example <from@example.com>
To: to@example.com
Cc: cc@example.com,
	A <author@example.com>,
	One <one@example.com>,
	two@example.com
Subject: [PATCH 1/1] Second.
Date: DATE-STRING
Message-Id: MESSAGE-ID-STRING
X-Mailer: X-MAILER-STRING

Result: OK
EOF


ok 34 - setup expect

expecting success: 
	git config sendemail.cc cc@example.com &&
	test_suppression sob


ok 35 - sendemail.cc set

expecting success: 
cat >expected-suppress-sob <<\EOF
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
Dry-OK. Log says:
Server: relay.example.com
MAIL FROM:<from@example.com>
RCPT TO:<to@example.com>
RCPT TO:<author@example.com>
RCPT TO:<one@example.com>
RCPT TO:<two@example.com>
From: Example <from@example.com>
To: to@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com
Subject: [PATCH 1/1] Second.
Date: DATE-STRING
Message-Id: MESSAGE-ID-STRING
X-Mailer: X-MAILER-STRING

Result: OK
EOF


ok 36 - setup expect

expecting success: 
	git config --unset sendemail.cc &&
	test_suppression sob


ok 37 - sendemail.cc unset

expecting success: 
cat >expected-suppress-cccmd <<\EOF
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
Dry-OK. Log says:
Server: relay.example.com
MAIL FROM:<from@example.com>
RCPT TO:<to@example.com>
RCPT TO:<author@example.com>
RCPT TO:<one@example.com>
RCPT TO:<two@example.com>
RCPT TO:<committer@example.com>
From: Example <from@example.com>
To: to@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: DATE-STRING
Message-Id: MESSAGE-ID-STRING
X-Mailer: X-MAILER-STRING

Result: OK
EOF


ok 38 - setup expect

expecting success: 
	echo echo cc-cmd@example.com > cccmd &&
	chmod +x cccmd &&
	git config sendemail.cccmd ./cccmd &&
	test_suppression cccmd


ok 39 - sendemail.cccmd

expecting success: 
cat >expected-suppress-all <<\EOF
0001-Second.patch
Dry-OK. Log says:
Server: relay.example.com
MAIL FROM:<from@example.com>
RCPT TO:<to@example.com>
From: Example <from@example.com>
To: to@example.com
Subject: [PATCH 1/1] Second.
Date: DATE-STRING
Message-Id: MESSAGE-ID-STRING
X-Mailer: X-MAILER-STRING

Result: OK
EOF


ok 40 - setup expect

expecting success: 
	test_suppression all

ok 41 - --suppress-cc=all

expecting success: 
cat >expected-suppress-body <<\EOF
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(cc-cmd) Adding cc: cc-cmd@example.com from: './cccmd'
Dry-OK. Log says:
Server: relay.example.com
MAIL FROM:<from@example.com>
RCPT TO:<to@example.com>
RCPT TO:<author@example.com>
RCPT TO:<one@example.com>
RCPT TO:<two@example.com>
RCPT TO:<cc-cmd@example.com>
From: Example <from@example.com>
To: to@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	cc-cmd@example.com
Subject: [PATCH 1/1] Second.
Date: DATE-STRING
Message-Id: MESSAGE-ID-STRING
X-Mailer: X-MAILER-STRING

Result: OK
EOF

ok 42 - setup expect

expecting success: 
	test_suppression body
ok 43 - --suppress-cc=body
expecting success: 
cat >expected-suppress-body-cccmd <<\EOF
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
Dry-OK. Log says:
Server: relay.example.com
MAIL FROM:<from@example.com>
RCPT TO:<to@example.com>
RCPT TO:<author@example.com>
RCPT TO:<one@example.com>
RCPT TO:<two@example.com>
From: Example <from@example.com>
To: to@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com
Subject: [PATCH 1/1] Second.
Date: DATE-STRING
Message-Id: MESSAGE-ID-STRING
X-Mailer: X-MAILER-STRING

Result: OK
EOF

ok 44 - setup expect

expecting success: 
	test_suppression body cccmd

ok 45 - --suppress-cc=body --suppress-cc=cccmd

expecting success: 
cat >expected-suppress-sob <<\EOF
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
Dry-OK. Log says:
Server: relay.example.com
MAIL FROM:<from@example.com>
RCPT TO:<to@example.com>
RCPT TO:<author@example.com>
RCPT TO:<one@example.com>
RCPT TO:<two@example.com>
From: Example <from@example.com>
To: to@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com
Subject: [PATCH 1/1] Second.
Date: DATE-STRING
Message-Id: MESSAGE-ID-STRING
X-Mailer: X-MAILER-STRING

Result: OK
EOF


ok 46 - setup expect

expecting success: 
	git config --unset sendemail.cccmd
	test_suppression sob


ok 47 - --suppress-cc=sob

expecting success: 
cat >expected-suppress-bodycc <<\EOF
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
Dry-OK. Log says:
Server: relay.example.com
MAIL FROM:<from@example.com>
RCPT TO:<to@example.com>
RCPT TO:<author@example.com>
RCPT TO:<one@example.com>
RCPT TO:<two@example.com>
RCPT TO:<committer@example.com>
From: Example <from@example.com>
To: to@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: DATE-STRING
Message-Id: MESSAGE-ID-STRING
X-Mailer: X-MAILER-STRING

Result: OK
EOF


ok 48 - setup expect

expecting success: 
	test_suppression bodycc


ok 49 - --suppress-cc=bodycc

expecting success: 
cat >expected-suppress-cc <<\EOF
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
Dry-OK. Log says:
Server: relay.example.com
MAIL FROM:<from@example.com>
RCPT TO:<to@example.com>
RCPT TO:<author@example.com>
RCPT TO:<committer@example.com>
From: Example <from@example.com>
To: to@example.com
Cc: A <author@example.com>,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: DATE-STRING
Message-Id: MESSAGE-ID-STRING
X-Mailer: X-MAILER-STRING

Result: OK
EOF


ok 50 - setup expect

expecting success: 
	test_suppression cc


ok 51 - --suppress-cc=cc

expecting success: 
	test_confirm --confirm=always --suppress-cc=all
Send this email? ([y]es|[n]o|[q]uit|[a]ll): OK. Log says:

ok 52 - --confirm=always
expecting success: 
	test_confirm --confirm=auto
Send this email? ([y]es|[n]o|[q]uit|[a]ll): OK. Log says:

ok 53 - --confirm=auto

expecting success: 
	test_confirm --confirm=cc
Send this email? ([y]es|[n]o|[q]uit|[a]ll): OK. Log says:

ok 54 - --confirm=cc
expecting success: 
	test_confirm --confirm=compose --compose

Send this email? ([y]es|[n]o|[q]uit|[a]ll): OK. Log says:

ok 55 - --confirm=compose

expecting success: 
	CONFIRM=$(git config --get sendemail.confirm) &&
	git config --unset sendemail.confirm &&
	test_confirm
	ret="$?"
	git config sendemail.confirm ${CONFIRM:-never}
	test $ret = "0"
Send this email? ([y]es|[n]o|[q]uit|[a]ll): OK. Log says:

ok 56 - confirm by default (due to cc)

expecting success: 
	CONFIRM=$(git config --get sendemail.confirm) &&
	git config --unset sendemail.confirm &&
	test_confirm --suppress-cc=all --compose
	ret="$?"
	git config sendemail.confirm ${CONFIRM:-never}
	test $ret = "0"

Send this email? ([y]es|[n]o|[q]uit|[a]ll): OK. Log says:

ok 57 - confirm by default (due to --compose)

expecting success: 
	CONFIRM=$(git config --get sendemail.confirm) &&
	git config --unset sendemail.confirm &&
	rm -fr outdir &&
	git format-patch -2 -o outdir &&
	GIT_SEND_EMAIL_NOTTY=1 \
		git send-email \
			--from="Example <nobody@example.com>" \
			--to=nobody@example.com \
			--smtp-server="$(pwd)/fake.sendmail" \
			outdir/*.patch < /dev/null
	ret="$?"
	git config sendemail.confirm ${CONFIRM:-never}
	test $ret = "0"

outdir/0001-Initial.patch
outdir/0002-Second.patch
outdir/0001-Initial.patch
outdir/0002-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'

From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>
Subject: [PATCH 1/2] Initial.
Date: Sun,  2 Jan 2011 04:08:56 +0000
Message-Id: <1293941337-13853-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

    The Cc list above has been expanded by additional
    addresses found in the patch commit message. By default
    send-email prompts before sending whenever this occurs.
    This behavior is controlled by the sendemail.confirm
    configuration setting.

    For additional information, run 'git send-email --help'.
    To retain the current behavior, but squelch this message,
    run 'git config --global sendemail.confirm auto'.

Send this email? ([y]es|[n]o|[q]uit|[a]ll): 
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>
Subject: [PATCH 1/2] Initial.
Date: Sun,  2 Jan 2011 04:08:56 +0000
Message-Id: <1293941337-13853-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'

From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>
Subject: [PATCH 2/2] Second.
Date: Sun,  2 Jan 2011 04:08:57 +0000
Message-Id: <1293941337-13853-2-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <1293941337-13853-1-git-send-email-nobody@example.com>
References: <1293941337-13853-1-git-send-email-nobody@example.com>

Send this email? ([y]es|[n]o|[q]uit|[a]ll): 
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>
Subject: [PATCH 2/2] Second.
Date: Sun,  2 Jan 2011 04:08:57 +0000
Message-Id: <1293941337-13853-2-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <1293941337-13853-1-git-send-email-nobody@example.com>
References: <1293941337-13853-1-git-send-email-nobody@example.com>

Result: OK

ok 58 - confirm detects EOF (inform assumes y)

expecting success: 
	CONFIRM=$(git config --get sendemail.confirm) &&
	git config sendemail.confirm auto &&
	GIT_SEND_EMAIL_NOTTY=1 &&
	export GIT_SEND_EMAIL_NOTTY &&
		test_must_fail git send-email \
			--from="Example <nobody@example.com>" \
			--to=nobody@example.com \
			--smtp-server="$(pwd)/fake.sendmail" \
			$patches < /dev/null
	ret="$?"
	git config sendemail.confirm ${CONFIRM:-never}
	test $ret = "0"

0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'

From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:57 +0000
Message-Id: <1293941337-14035-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Send this email? ([y]es|[n]o|[q]uit|[a]ll): 

ok 59 - confirm detects EOF (auto causes failure)

expecting success: 
	CONFIRM=$(git config --get sendemail.confirm) &&
	git config sendemail.confirm auto &&
	GIT_SEND_EMAIL_NOTTY=1 &&
	export GIT_SEND_EMAIL_NOTTY &&
		yes "bogus" | test_must_fail git send-email \
			--from="Example <nobody@example.com>" \
			--to=nobody@example.com \
			--smtp-server="$(pwd)/fake.sendmail" \
			$patches
	ret="$?"
	git config sendemail.confirm ${CONFIRM:-never}
	test $ret = "0"
0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'

From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:57 +0000
Message-Id: <1293941337-14219-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Send this email? ([y]es|[n]o|[q]uit|[a]ll): Send this email? ([y]es|[n]o|[q]uit|[a]ll): Send this email? ([y]es|[n]o|[q]uit|[a]ll): Send this email? ([y]es|[n]o|[q]uit|[a]ll): Send this email? ([y]es|[n]o|[q]uit|[a]ll): Send this email? ([y]es|[n]o|[q]uit|[a]ll): Send this email? ([y]es|[n]o|[q]uit|[a]ll): Send this email? ([y]es|[n]o|[q]uit|[a]ll): Send this email? ([y]es|[n]o|[q]uit|[a]ll): Send this email? ([y]es|[n]o|[q]uit|[a]ll): 
ok 60 - confirm doesnt loop forever

expecting success: 
	clean_fake_sendmail &&
	rm -fr outdir &&
	git format-patch -1 -o outdir --cc="àéìöú <utf8@example.com>" &&
	git send-email \
	--from="Example <nobody@example.com>" \
	--to=nobody@example.com \
	--smtp-server="$(pwd)/fake.sendmail" \
	outdir/*.patch &&
	grep "^	" msgtxt1 |
	grep "=?UTF-8?q?=C3=A0=C3=A9=C3=AC=C3=B6=C3=BA?= <utf8@example.com>"

outdir/0001-Second.patch
outdir/0001-Second.patch
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: "àéìöú" <utf8@example.com> from line 'Cc: àéìöú <utf8@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com utf8@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	=?UTF-8?q?=C3=A0=C3=A9=C3=AC=C3=B6=C3=BA?= <utf8@example.com>
Subject: [PATCH] Second.
Date: Sun,  2 Jan 2011 04:08:57 +0000
Message-Id: <1293941337-14423-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1

Result: OK
	=?UTF-8?q?=C3=A0=C3=A9=C3=AC=C3=B6=C3=BA?= <utf8@example.com>

ok 61 - utf8 Cc is rfc2047 encoded

expecting success: 
	clean_fake_sendmail &&
	(echo "#!$SHELL_PATH" &&
	 echo "echo utf8 body: àéìöú >>\"\$1\""
	) >fake-editor-utf8 &&
	chmod +x fake-editor-utf8 &&
	  GIT_EDITOR="\"$(pwd)/fake-editor-utf8\"" \
	  git send-email \
	  --compose --subject foo \
	  --from="Example <nobody@example.com>" \
	  --to=nobody@example.com \
	  --smtp-server="$(pwd)/fake.sendmail" \
	  $patches &&
	grep "^utf8 body" msgtxt1 &&
	grep "^Content-Type: text/plain; charset=UTF-8" msgtxt1
0001-Second.patch
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Subject: foo
Date: Sun,  2 Jan 2011 04:08:57 +0000
Message-Id: <1293941338-14579-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Result: OK
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:58 +0000
Message-Id: <1293941338-14579-2-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <1293941338-14579-1-git-send-email-nobody@example.com>
References: <1293941338-14579-1-git-send-email-nobody@example.com>

Result: OK
utf8 body: àéìöú
Content-Type: text/plain; charset=UTF-8

ok 62 - --compose adds MIME for utf8 body

expecting success: 
	clean_fake_sendmail &&
	(echo "#!$SHELL_PATH" &&
	 echo "(echo MIME-Version: 1.0"
	 echo " echo Content-Type: text/plain\; charset=iso-8859-1"
	 echo " echo Content-Transfer-Encoding: 8bit"
	 echo " echo Subject: foo"
	 echo " echo "
	 echo " echo utf8 body: àéìöú) >\"\$1\""
	) >fake-editor-utf8-mime &&
	chmod +x fake-editor-utf8-mime &&
	  GIT_EDITOR="\"$(pwd)/fake-editor-utf8-mime\"" \
	  git send-email \
	  --compose --subject foo \
	  --from="Example <nobody@example.com>" \
	  --to=nobody@example.com \
	  --smtp-server="$(pwd)/fake.sendmail" \
	  $patches &&
	grep "^utf8 body" msgtxt1 &&
	grep "^Content-Type: text/plain; charset=iso-8859-1" msgtxt1 &&
	! grep "^Content-Type: text/plain; charset=UTF-8" msgtxt1

0001-Second.patch
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Subject: foo
Date: Sun,  2 Jan 2011 04:08:57 +0000
Message-Id: <1293941338-14761-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Result: OK
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:58 +0000
Message-Id: <1293941338-14761-2-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <1293941338-14761-1-git-send-email-nobody@example.com>
References: <1293941338-14761-1-git-send-email-nobody@example.com>

Result: OK
utf8 body: àéìöú
Content-Type: text/plain; charset=iso-8859-1

ok 63 - --compose respects user mime type

expecting success: 
	clean_fake_sendmail &&
	  GIT_EDITOR="\"$(pwd)/fake-editor\"" \
	  git send-email \
	  --compose --subject utf8-sübjëct \
	  --from="Example <nobody@example.com>" \
	  --to=nobody@example.com \
	  --smtp-server="$(pwd)/fake.sendmail" \
	  $patches &&
	grep "^fake edit" msgtxt1 &&
	grep "^Subject: =?UTF-8?q?utf8-s=C3=BCbj=C3=ABct?=" msgtxt1
0001-Second.patch
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Subject: =?UTF-8?q?utf8-s=C3=BCbj=C3=ABct?=
Date: Sun,  2 Jan 2011 04:08:57 +0000
Message-Id: <1293941338-14942-1-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Result: OK
(mbox) Adding cc: A <author@example.com> from line 'From: A <author@example.com>'
(mbox) Adding cc: One <one@example.com> from line 'Cc: One <one@example.com>, two@example.com'
(mbox) Adding cc: two@example.com from line 'Cc: One <one@example.com>, two@example.com'
(body) Adding cc: C O Mitter <committer@example.com> from line 'Signed-off-by: C O Mitter <committer@example.com>'
OK. Log says:
Sendmail: /Users/trast/git-smoke/t/trash directory.t9001-send-email/fake.sendmail -i nobody@example.com author@example.com one@example.com two@example.com committer@example.com
From: Example <nobody@example.com>
To: nobody@example.com
Cc: A <author@example.com>,
	One <one@example.com>,
	two@example.com,
	C O Mitter <committer@example.com>
Subject: [PATCH 1/1] Second.
Date: Sun,  2 Jan 2011 04:08:58 +0000
Message-Id: <1293941338-14942-2-git-send-email-nobody@example.com>
X-Mailer: git-send-email 1.7.4.rc0.279.g8b0f1
In-Reply-To: <1293941338-14942-1-git-send-email-nobody@example.com>
References: <1293941338-14942-1-git-send-email-nobody@example.com>

Result: OK
fake edit
Subject: =?UTF-8?q?utf8-s=C3=BCbj=C3=ABct?=
ok 64 - --compose adds MIME for utf8 subject
expecting success: 
	echo master > master &&
	git add master &&
	git commit -m"add master" &&
	test_must_fail git send-email --dry-run master 2>errors &&
	grep disambiguate errors
[master ee884e7] add master
 Author: A U Thor <author@example.com>
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 master
to produce patches for.  Please disambiguate by...
ok 65 - detects ambiguous reference/file conflict
expecting success: 
	rm -fr outdir &&
	git format-patch -2 -o outdir &&
	git send-email \
	--dry-run \
	--from="Example <nobody@example.com>" \
	--to=nobody@example.com \
	outdir/000?-*.patch 2>errors >out &&
	grep "^Subject: " out >subjects &&
	test "z$(sed -n -e 1p subjects)" = "zSubject: [PATCH 1/2] Second." &&
	test "z$(sed -n -e 2p subjects)" = "zSubject: [PATCH 2/2] add master"
outdir/0001-Second.patch
outdir/0002-add-master.patch

ok 66 - feed two files

expecting success: 
	git send-email \
		--dry-run \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		--in-reply-to="<in-reply-id@example.com>" \
		--nothread \
		$patches |
	grep "In-Reply-To: <in-reply-id@example.com>"
In-Reply-To: <in-reply-id@example.com>

ok 67 - in-reply-to but no threading

expecting success: 
	git send-email \
		--dry-run \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		--nothread \
		$patches $patches >stdout &&
	! grep "In-Reply-To: " stdout


ok 68 - no in-reply-to and no threading

expecting success: 
	git send-email \
		--dry-run \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		--thread \
		--nochain-reply-to \
		$patches $patches >stdout &&
	grep "In-Reply-To: " stdout
In-Reply-To: <1293941340-15863-1-git-send-email-nobody@example.com>

ok 69 - threading but no chain-reply-to

expecting success: 
	git send-email \
	--dry-run \
	--from="Example <nobody@example.com>" \
	--to=nobody@example.com \
	outdir/000?-*.patch 2>errors >out &&
	grep "no-chain-reply-to" errors

In git 1.7.0, the default has changed to --no-chain-reply-to

ok 70 - warning with an implicit --chain-reply-to

expecting success: 
	git send-email \
	--dry-run \
	--from="Example <nobody@example.com>" \
	--to=nobody@example.com \
	--chain-reply-to \
	outdir/000?-*.patch 2>errors >out &&
	! grep "no-chain-reply-to" errors


ok 71 - no warning with an explicit --chain-reply-to

expecting success: 
	git send-email \
	--dry-run \
	--from="Example <nobody@example.com>" \
	--to=nobody@example.com \
	--nochain-reply-to \
	outdir/000?-*.patch 2>errors >out &&
	! grep "no-chain-reply-to" errors

ok 72 - no warning with an explicit --no-chain-reply-to

expecting success: 
	git config sendemail.chainreplyto false &&
	git send-email \
	--dry-run \
	--from="Example <nobody@example.com>" \
	--to=nobody@example.com \
	outdir/000?-*.patch 2>errors >out &&
	! grep "no-chain-reply-to" errors

ok 73 - no warning with sendemail.chainreplyto = false

expecting success: 
	git config sendemail.chainreplyto true &&
	git send-email \
	--dry-run \
	--from="Example <nobody@example.com>" \
	--to=nobody@example.com \
	outdir/000?-*.patch 2>errors >out &&
	! grep "no-chain-reply-to" errors

ok 74 - no warning with sendemail.chainreplyto = true

expecting success: 
	git config --replace-all sendemail.to "Somebody <somebody@ex.com>" &&
	git send-email \
		--dry-run \
		--from="Example <nobody@example.com>" \
		$patches $patches >stdout &&
	grep "To: Somebody <somebody@ex.com>" stdout
To: Somebody <somebody@ex.com>
To: Somebody <somebody@ex.com>

ok 75 - sendemail.to works

expecting success: 
	git send-email \
		--dry-run \
		--from="Example <nobody@example.com>" \
		--no-to \
		--to=nobody@example.com \
		$patches $patches >stdout &&
	grep "To: nobody@example.com" stdout &&
	! grep "To: Somebody <somebody@ex.com>" stdout

To: nobody@example.com
To: nobody@example.com

ok 76 - --no-to overrides sendemail.to

expecting success: 
	git config --replace-all sendemail.cc "Somebody <somebody@ex.com>" &&
	git send-email \
		--dry-run \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		$patches $patches >stdout &&
	grep "Cc: Somebody <somebody@ex.com>" stdout

Cc: Somebody <somebody@ex.com>,
Cc: Somebody <somebody@ex.com>,

ok 77 - sendemail.cc works

expecting success: 
	git send-email \
		--dry-run \
		--from="Example <nobody@example.com>" \
		--no-cc \
		--cc=bodies@example.com \
		--to=nobody@example.com \
		$patches $patches >stdout &&
	grep "Cc: bodies@example.com" stdout &&
	! grep "Cc: Somebody <somebody@ex.com>" stdout
Cc: bodies@example.com,
Cc: bodies@example.com,

ok 78 - --no-cc overrides sendemail.cc

expecting success: 
	git config --replace-all sendemail.bcc "Other <other@ex.com>" &&
	git send-email \
		--dry-run \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		--smtp-server relay.example.com \
		$patches $patches >stdout &&
	grep "RCPT TO:<other@ex.com>" stdout
RCPT TO:<other@ex.com>
RCPT TO:<other@ex.com>

ok 79 - sendemail.bcc works

expecting success: 
	git send-email \
		--dry-run \
		--from="Example <nobody@example.com>" \
		--no-bcc \
		--bcc=bodies@example.com \
		--to=nobody@example.com \
		--smtp-server relay.example.com \
		$patches $patches >stdout &&
	grep "RCPT TO:<bodies@example.com>" stdout &&
	! grep "RCPT TO:<other@ex.com>" stdout
RCPT TO:<bodies@example.com>
RCPT TO:<bodies@example.com>

ok 80 - --no-bcc overrides sendemail.bcc

expecting success: 
	patch=`git format-patch -1 --to="bodies@example.com"` &&
	test_when_finished "rm $patch" &&
	git send-email \
		--dry-run \
		--from="Example <nobody@example.com>" \
		--smtp-server relay.example.com \
		$patch >stdout &&
	grep "RCPT TO:<bodies@example.com>" stdout

RCPT TO:<bodies@example.com>

ok 81 - patches To headers are used by default

expecting success: 
	patch=`git format-patch -1 --to="bodies@example.com"` &&
	test_when_finished "rm $patch" &&
	git send-email \
		--dry-run \
		--from="Example <nobody@example.com>" \
		--to=nobody@example.com \
		--smtp-server relay.example.com \
		$patch >stdout &&
	grep "RCPT TO:<bodies@example.com>" stdout &&
	grep "RCPT TO:<nobody@example.com>" stdout

RCPT TO:<bodies@example.com>
RCPT TO:<nobody@example.com>

ok 82 - patches To headers are appended to

expecting success: 
	patch1=`git format-patch -1 --to="bodies@example.com"` &&
	patch2=`git format-patch -1 --to="other@example.com" HEAD~` &&
	test_when_finished "rm $patch1 && rm $patch2" &&
	git send-email \
		--dry-run \
		--from="Example <nobody@example.com>" \
		--to="nobody@example.com" \
		--smtp-server relay.example.com \
		$patch1 $patch2 >stdout &&
	test $(grep -c "RCPT TO:<bodies@example.com>" stdout) = 1 &&
	test $(grep -c "RCPT TO:<nobody@example.com>" stdout) = 2 &&
	test $(grep -c "RCPT TO:<other@example.com>" stdout) = 1


ok 83 - To headers from files reset each patch

expecting success: 
cat >email-using-8bit <<EOF
From fe6ecc66ece37198fe5db91fa2fc41d9f4fe5cc4 Mon Sep 17 00:00:00 2001
Message-Id: <bogus-message-id@example.com>
From: author@example.com
Date: Sat, 12 Jun 2010 15:53:58 +0200
Subject: subject goes here

Dieser deutsche Text enthält einen Umlaut!
EOF


ok 84 - setup expect

expecting success: 
cat >content-type-decl <<EOF
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
EOF


ok 85 - setup expect

expecting success: 
	clean_fake_sendmail &&
	echo |
	git send-email --from=author@example.com --to=nobody@example.com \
			--smtp-server="$(pwd)/fake.sendmail" \
			email-using-8bit >stdout &&
	grep "do not declare a Content-Transfer-Encoding" stdout &&
	grep email-using-8bit stdout &&
	grep "Which 8bit encoding" stdout &&
	egrep "Content|MIME" msgtxt1 >actual &&
	test_cmp actual content-type-decl

The following files are 8bit, but do not declare a Content-Transfer-Encoding.
email-using-8bit
    email-using-8bit
Which 8bit encoding should I declare [UTF-8]? (mbox) Adding cc: author@example.com from line 'From: author@example.com'

ok 86 - asks about and fixes 8bit encodings

expecting success: 
	clean_fake_sendmail &&
	git config sendemail.assume8bitEncoding UTF-8 &&
	echo bogus |
	git send-email --from=author@example.com --to=nobody@example.com \
			--smtp-server="$(pwd)/fake.sendmail" \
			email-using-8bit >stdout &&
	egrep "Content|MIME" msgtxt1 >actual &&
	test_cmp actual content-type-decl

ok 87 - sendemail.8bitEncoding works

expecting success: 
	clean_fake_sendmail &&
	git config sendemail.assume8bitEncoding "bogus too" &&
	echo bogus |
	git send-email --from=author@example.com --to=nobody@example.com \
			--smtp-server="$(pwd)/fake.sendmail" \
			--8bit-encoding=UTF-8 \
			email-using-8bit >stdout &&
	egrep "Content|MIME" msgtxt1 >actual &&
	test_cmp actual content-type-decl

ok 88 - --8bit-encoding overrides sendemail.8bitEncoding

expecting success: 
cat >email-using-8bit <<EOF
From fe6ecc66ece37198fe5db91fa2fc41d9f4fe5cc4 Mon Sep 17 00:00:00 2001
Message-Id: <bogus-message-id@example.com>
From: author@example.com
Date: Sat, 12 Jun 2010 15:53:58 +0200
Subject: Dieser Betreff enthält auch einen Umlaut!

Nothing to see here.
EOF

ok 89 - setup expect

expecting success: 
cat >expected <<EOF
Subject: =?UTF-8?q?Dieser=20Betreff=20enth=C3=A4lt=20auch=20einen=20Umlaut!?=
EOF

ok 90 - setup expect

expecting success: 
	clean_fake_sendmail &&
	echo bogus |
	git send-email --from=author@example.com --to=nobody@example.com \
			--smtp-server="$(pwd)/fake.sendmail" \
			--8bit-encoding=UTF-8 \
			email-using-8bit >stdout &&
	grep "Subject" msgtxt1 >actual &&
	test_cmp expected actual

ok 91 - --8bit-encoding also treats subject

expecting success: 
	clean_fake_sendmail &&
	rm -fr outdir &&
	git format-patch --cover-letter -2 -o outdir &&
	test_must_fail git send-email \
	  --from="Example <nobody@example.com>" \
	  --to=nobody@example.com \
	  --smtp-server="$(pwd)/fake.sendmail" \
	  outdir/0002-*.patch \
	  outdir/0000-*.patch \
	  outdir/0001-*.patch \
	  2>errors >out &&
	grep "SUBJECT HERE" errors &&
	test -z "$(ls msgtxt*)"
outdir/0000-cover-letter.patch
outdir/0001-Second.patch
outdir/0002-add-master.patch
has the template subject '*** SUBJECT HERE ***'. Pass --force if you really want to send.

ok 92 - refusing to send cover letter template

expecting success: 
	clean_fake_sendmail &&
	rm -fr outdir &&
	git format-patch --cover-letter -2 -o outdir &&
	git send-email \
	  --force \
	  --from="Example <nobody@example.com>" \
	  --to=nobody@example.com \
	  --smtp-server="$(pwd)/fake.sendmail" \
	  outdir/0002-*.patch \
	  outdir/0000-*.patch \
	  outdir/0001-*.patch \
	  2>errors >out &&
	! grep "SUBJECT HERE" errors &&
	test -n "$(ls msgtxt*)"

outdir/0000-cover-letter.patch
outdir/0001-Second.patch
outdir/0002-add-master.patch

ok 93 - --force sends cover letter template anyway

# passed all 93 test(s)
1..93

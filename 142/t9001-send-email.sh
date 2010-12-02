ok 1 - prepare reference tree
ok 2 - Setup helper tool
ok 3 - Extract patches
ok 4 - No confirm with --suppress-cc
ok 5 - No confirm with --confirm=never
ok 6 - No confirm with sendemail.confirm=never
ok 7 - Send patches
ok 8 - setup expect
ok 9 - Verify commandline
ok 10 - Send patches with --envelope-sender
ok 11 - setup expect
ok 12 - Verify commandline
ok 13 - Send patches with --envelope-sender=auto
ok 14 - setup expect
ok 15 - Verify commandline
ok 16 - setup expect
ok 17 - Show all headers
ok 18 - Prompting works
ok 19 - tocmd works
ok 20 - cccmd works
ok 21 - reject long lines
ok 22 - no patch was sent
ok 23 - Author From: in message body
ok 24 - Author From: not in message body
ok 25 - allow long lines with --no-validate
ok 26 - Invalid In-Reply-To
ok 27 - Valid In-Reply-To when prompting
ok 28 - setup fake editor
ok 29 - --compose works
ok 30 - first message is compose text
ok 31 - second message is patch
ok 32 - setup expect
ok 33 - sendemail.cc set
ok 34 - setup expect
ok 35 - sendemail.cc unset
ok 36 - setup expect
ok 37 - sendemail.cccmd
ok 38 - setup expect
ok 39 - --suppress-cc=all
ok 40 - setup expect
ok 41 - --suppress-cc=body
ok 42 - setup expect
ok 43 - --suppress-cc=body --suppress-cc=cccmd
ok 44 - setup expect
ok 45 - --suppress-cc=sob
ok 46 - setup expect
ok 47 - --suppress-cc=bodycc
ok 48 - setup expect
ok 49 - --suppress-cc=cc
ok 50 - --confirm=always
ok 51 - --confirm=auto
ok 52 - --confirm=cc
ok 53 - --confirm=compose
ok 54 - confirm by default (due to cc)
ok 55 - confirm by default (due to --compose)
ok 56 - confirm detects EOF (inform assumes y)
ok 57 - confirm detects EOF (auto causes failure)
ok 58 - confirm doesnt loop forever
ok 59 - utf8 Cc is rfc2047 encoded
ok 60 - --compose adds MIME for utf8 body
ok 61 - --compose respects user mime type
ok 62 - --compose adds MIME for utf8 subject
ok 63 - detects ambiguous reference/file conflict
ok 64 - feed two files
ok 65 - in-reply-to but no threading
ok 66 - no in-reply-to and no threading
ok 67 - threading but no chain-reply-to
ok 68 - warning with an implicit --chain-reply-to
ok 69 - no warning with an explicit --chain-reply-to
ok 70 - no warning with an explicit --no-chain-reply-to
ok 71 - no warning with sendemail.chainreplyto = false
ok 72 - no warning with sendemail.chainreplyto = true
ok 73 - sendemail.to works
ok 74 - --no-to overrides sendemail.to
ok 75 - sendemail.cc works
ok 76 - --no-cc overrides sendemail.cc
ok 77 - sendemail.bcc works
ok 78 - --no-bcc overrides sendemail.bcc
ok 79 - patches To headers are used by default
ok 80 - patches To headers are appended to
ok 81 - setup expect
ok 82 - setup expect
ok 83 - asks about and fixes 8bit encodings
ok 84 - sendemail.8bitEncoding works
ok 85 - --8bit-encoding overrides sendemail.8bitEncoding
ok 86 - setup expect
ok 87 - setup expect
ok 88 - --8bit-encoding also treats subject
ok 89 - refusing to send cover letter template
ok 90 - --force sends cover letter template anyway
# passed all 90 test(s)
1..90

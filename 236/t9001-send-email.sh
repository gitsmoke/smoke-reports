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
ok 28 - In-Reply-To without --chain-reply-to
ok 29 - In-Reply-To with --chain-reply-to
ok 30 - setup fake editor
ok 31 - --compose works
ok 32 - first message is compose text
ok 33 - second message is patch
ok 34 - setup expect
ok 35 - sendemail.cc set
ok 36 - setup expect
ok 37 - sendemail.cc unset
ok 38 - setup expect
ok 39 - sendemail.cccmd
ok 40 - setup expect
ok 41 - --suppress-cc=all
ok 42 - setup expect
ok 43 - --suppress-cc=body
ok 44 - setup expect
ok 45 - --suppress-cc=body --suppress-cc=cccmd
ok 46 - setup expect
ok 47 - --suppress-cc=sob
ok 48 - setup expect
ok 49 - --suppress-cc=bodycc
ok 50 - setup expect
ok 51 - --suppress-cc=cc
ok 52 - --confirm=always
ok 53 - --confirm=auto
ok 54 - --confirm=cc
ok 55 - --confirm=compose
ok 56 - confirm by default (due to cc)
ok 57 - confirm by default (due to --compose)
ok 58 - confirm detects EOF (inform assumes y)
ok 59 - confirm detects EOF (auto causes failure)
ok 60 - confirm doesnt loop forever
ok 61 - utf8 Cc is rfc2047 encoded
ok 62 - --compose adds MIME for utf8 body
ok 63 - --compose respects user mime type
ok 64 - --compose adds MIME for utf8 subject
ok 65 - detects ambiguous reference/file conflict
ok 66 - feed two files
ok 67 - in-reply-to but no threading
ok 68 - no in-reply-to and no threading
ok 69 - threading but no chain-reply-to
ok 70 - warning with an implicit --chain-reply-to
ok 71 - no warning with an explicit --chain-reply-to
ok 72 - no warning with an explicit --no-chain-reply-to
ok 73 - no warning with sendemail.chainreplyto = false
ok 74 - no warning with sendemail.chainreplyto = true
ok 75 - sendemail.to works
ok 76 - --no-to overrides sendemail.to
ok 77 - sendemail.cc works
ok 78 - --no-cc overrides sendemail.cc
ok 79 - sendemail.bcc works
ok 80 - --no-bcc overrides sendemail.bcc
ok 81 - patches To headers are used by default
ok 82 - patches To headers are appended to
ok 83 - To headers from files reset each patch
ok 84 - setup expect
ok 85 - setup expect
ok 86 - asks about and fixes 8bit encodings
ok 87 - sendemail.8bitEncoding works
ok 88 - --8bit-encoding overrides sendemail.8bitEncoding
ok 89 - setup expect
ok 90 - setup expect
ok 91 - --8bit-encoding also treats subject
ok 92 - refusing to send cover letter template
ok 93 - --force sends cover letter template anyway
# passed all 93 test(s)
1..93

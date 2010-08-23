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
ok 19 - cccmd works
ok 20 - reject long lines
ok 21 - no patch was sent
ok 22 - Author From: in message body
ok 23 - Author From: not in message body
ok 24 - allow long lines with --no-validate
ok 25 - Invalid In-Reply-To
ok 26 - Valid In-Reply-To when prompting
ok 27 - setup fake editor
ok 28 - --compose works
ok 29 - first message is compose text
ok 30 - second message is patch
ok 31 - setup expect
ok 32 - sendemail.cc set
ok 33 - setup expect
ok 34 - sendemail.cc unset
ok 35 - setup expect
ok 36 - sendemail.cccmd
ok 37 - setup expect
ok 38 - --suppress-cc=all
ok 39 - setup expect
ok 40 - --suppress-cc=body
ok 41 - setup expect
ok 42 - --suppress-cc=body --suppress-cc=cccmd
ok 43 - setup expect
ok 44 - --suppress-cc=sob
ok 45 - setup expect
ok 46 - --suppress-cc=bodycc
ok 47 - setup expect
ok 48 - --suppress-cc=cc
ok 49 - --confirm=always
ok 50 - --confirm=auto
ok 51 - --confirm=cc
ok 52 - --confirm=compose
ok 53 - confirm by default (due to cc)
ok 54 - confirm by default (due to --compose)
ok 55 - confirm detects EOF (inform assumes y)
ok 56 - confirm detects EOF (auto causes failure)
ok 57 - confirm doesnt loop forever
ok 58 - utf8 Cc is rfc2047 encoded
ok 59 - --compose adds MIME for utf8 body
ok 60 - --compose respects user mime type
ok 61 - --compose adds MIME for utf8 subject
ok 62 - detects ambiguous reference/file conflict
ok 63 - feed two files
ok 64 - in-reply-to but no threading
ok 65 - no in-reply-to and no threading
ok 66 - threading but no chain-reply-to
ok 67 - warning with an implicit --chain-reply-to
ok 68 - no warning with an explicit --chain-reply-to
ok 69 - no warning with an explicit --no-chain-reply-to
ok 70 - no warning with sendemail.chainreplyto = false
ok 71 - no warning with sendemail.chainreplyto = true
ok 72 - sendemail.to works
ok 73 - --no-to overrides sendemail.to
ok 74 - sendemail.cc works
ok 75 - --no-cc overrides sendemail.cc
ok 76 - sendemail.bcc works
ok 77 - --no-bcc overrides sendemail.bcc
ok 78 - setup expect
ok 79 - setup expect
ok 80 - asks about and fixes 8bit encodings
ok 81 - sendemail.8bitEncoding works
ok 82 - --8bit-encoding overrides sendemail.8bitEncoding
ok 83 - setup expect
ok 84 - setup expect
ok 85 - --8bit-encoding also treats subject
# passed all 85 test(s)
1..85

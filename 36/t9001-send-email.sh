ok 1 - prepare reference tree
ok 2 - Setup helper tool
ok 3 - Extract patches
ok 4 - No confirm with --suppress-cc
ok 5 - No confirm with --confirm=never
ok 6 - No confirm with sendemail.confirm=never
ok 7 - Send patches
ok 8 - Verify commandline
ok 9 - Send patches with --envelope-sender
ok 10 - Verify commandline
ok 11 - Send patches with --envelope-sender=auto
ok 12 - Verify commandline
ok 13 - Show all headers
ok 14 - Prompting works
ok 15 - cccmd works
ok 16 - reject long lines
ok 17 - no patch was sent
ok 18 - Author From: in message body
ok 19 - Author From: not in message body
ok 20 - allow long lines with --no-validate
ok 21 - Invalid In-Reply-To
ok 22 - Valid In-Reply-To when prompting
ok 23 - setup fake editor
ok 24 - --compose works
ok 25 - first message is compose text
ok 26 - second message is patch
ok 27 - sendemail.cc set
ok 28 - sendemail.cc unset
ok 29 - sendemail.cccmd
ok 30 - --suppress-cc=all
ok 31 - --suppress-cc=body
ok 32 - --suppress-cc=body --suppress-cc=cccmd
ok 33 - --suppress-cc=sob
ok 34 - --suppress-cc=bodycc
ok 35 - --suppress-cc=cc
ok 36 - --confirm=always
ok 37 - --confirm=auto
ok 38 - --confirm=cc
ok 39 - --confirm=compose
ok 40 - confirm by default (due to cc)
ok 41 - confirm by default (due to --compose)
ok 42 - confirm detects EOF (inform assumes y)
ok 43 - confirm detects EOF (auto causes failure)
ok 44 - confirm doesnt loop forever
ok 45 - utf8 Cc is rfc2047 encoded
ok 46 - --compose adds MIME for utf8 body
ok 47 - --compose respects user mime type
ok 48 - --compose adds MIME for utf8 subject
ok 49 - detects ambiguous reference/file conflict
ok 50 - feed two files
ok 51 - in-reply-to but no threading
ok 52 - no in-reply-to and no threading
ok 53 - threading but no chain-reply-to
ok 54 - warning with an implicit --chain-reply-to
ok 55 - no warning with an explicit --chain-reply-to
ok 56 - no warning with an explicit --no-chain-reply-to
ok 57 - no warning with sendemail.chainreplyto = false
ok 58 - no warning with sendemail.chainreplyto = true
ok 59 - sendemail.to works
ok 60 - --no-to overrides sendemail.to
ok 61 - sendemail.cc works
ok 62 - --no-cc overrides sendemail.cc
ok 63 - sendemail.bcc works
ok 64 - --no-bcc overrides sendemail.bcc
ok 65 - asks about and fixes 8bit encodings
ok 66 - sendemail.8bitEncoding works
ok 67 - --8bit-encoding overrides sendemail.8bitEncoding
ok 68 - --8bit-encoding also treats subject
# passed all 68 test(s)
1..68

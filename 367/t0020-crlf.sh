ok 1 - setup
ok 2 - safecrlf: autocrlf=input, all CRLF
ok 3 - safecrlf: autocrlf=input, mixed LF/CRLF
ok 4 - safecrlf: autocrlf=true, all LF
ok 5 - safecrlf: autocrlf=true mixed LF/CRLF
ok 6 - safecrlf: print warning only once
ok 7 - switch off autocrlf, safecrlf, reset HEAD
ok 8 - update with autocrlf=input
ok 9 - update with autocrlf=true
ok 10 - checkout with autocrlf=true
ok 11 - checkout with autocrlf=input
ok 12 - apply patch (autocrlf=input)
ok 13 - apply patch --cached (autocrlf=input)
ok 14 - apply patch --index (autocrlf=input)
ok 15 - apply patch (autocrlf=true)
ok 16 - apply patch --cached (autocrlf=true)
ok 17 - apply patch --index (autocrlf=true)
ok 18 - .gitattributes says two is binary
ok 19 - .gitattributes says two is input
ok 20 - .gitattributes says two and three are text
ok 21 - in-tree .gitattributes (1)
ok 22 - in-tree .gitattributes (2)
ok 23 - in-tree .gitattributes (3)
ok 24 - in-tree .gitattributes (4)
ok 25 - checkout with existing .gitattributes
ok 26 - checkout when deleting .gitattributes
ok 27 - invalid .gitattributes (must not crash)
ok 28 - setting up for new autocrlf tests
ok 29 - report no change after setting autocrlf
ok 30 - files are clean after checkout
ok 31 - LF only file gets CRLF with autocrlf
ok 32 - Mixed file is still mixed with autocrlf
ok 33 - CRLF only file has CRLF with autocrlf
ok 34 - New CRLF file gets LF in repo
# passed all 34 test(s)
1..34

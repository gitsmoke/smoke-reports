ok 1 - setup
ok 2 - default settings cause no changes
ok 3 - crlf=true causes a CRLF file to be normalized
ok 4 - text=true causes a CRLF file to be normalized
ok 5 - eol=crlf gives a normalized file CRLFs with autocrlf=false
ok 6 - eol=crlf gives a normalized file CRLFs with autocrlf=input
ok 7 - eol=lf gives a normalized file LFs with autocrlf=true
ok 8 - autocrlf=true does not normalize CRLF files
ok 9 - text=auto, autocrlf=true _does_ normalize CRLF files
ok 10 - text=auto, autocrlf=true does not normalize binary files
ok 11 - eol=crlf _does_ normalize binary files
# passed all 11 test(s)
1..11

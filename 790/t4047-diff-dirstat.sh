ok 1 - setup
ok 2 - sanity check setup (--stat)
ok 3 - vanilla --dirstat
ok 4 - vanilla -X
ok 5 - explicit defaults: --dirstat=changes,noncumulative,3
ok 6 - explicit defaults: -Xchanges,noncumulative,3
ok 7 - later options override earlier options:
ok 8 - non-defaults in config overridden by explicit defaults on command line
ok 9 - --dirstat=0
ok 10 - -X0
ok 11 - diff.dirstat=0
ok 12 - --dirstat=0 --cumulative
ok 13 - --dirstat=0,cumulative
ok 14 - -X0,cumulative
ok 15 - diff.dirstat=0,cumulative
ok 16 - diff.dirstat=0 & --dirstat=cumulative
ok 17 - --dirstat-by-file
ok 18 - --dirstat=files
ok 19 - diff.dirstat=files
ok 20 - --dirstat-by-file=10
ok 21 - --dirstat=files,10
ok 22 - diff.dirstat=10,files
ok 23 - --dirstat-by-file --cumulative
ok 24 - --dirstat=files,cumulative
ok 25 - diff.dirstat=cumulative,files
ok 26 - --dirstat=files,cumulative,10
ok 27 - diff.dirstat=10,cumulative,files
ok 28 - --dirstat=files,cumulative,16.7
ok 29 - diff.dirstat=16.7,cumulative,files
ok 30 - diff.dirstat=16.70,cumulative,files
ok 31 - --dirstat=files,cumulative,27.2
ok 32 - --dirstat=files,cumulative,27.09
ok 33 - --dirstat=lines
ok 34 - diff.dirstat=lines
ok 35 - --dirstat=lines,0
ok 36 - diff.dirstat=0,lines
# passed all 36 test(s)
1..36

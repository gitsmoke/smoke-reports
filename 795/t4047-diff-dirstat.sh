ok 1 - setup
ok 2 - sanity check setup (--stat)
ok 3 - various ways to misspell --dirstat
ok 4 - vanilla --dirstat
ok 5 - vanilla -X
ok 6 - explicit defaults: --dirstat=changes,noncumulative,3
ok 7 - explicit defaults: -Xchanges,noncumulative,3
ok 8 - later options override earlier options:
ok 9 - non-defaults in config overridden by explicit defaults on command line
ok 10 - --dirstat=0
ok 11 - -X0
ok 12 - diff.dirstat=0
ok 13 - --dirstat=0 --cumulative
ok 14 - --dirstat=0,cumulative
ok 15 - -X0,cumulative
ok 16 - diff.dirstat=0,cumulative
ok 17 - diff.dirstat=0 & --dirstat=cumulative
ok 18 - --dirstat-by-file
ok 19 - --dirstat=files
ok 20 - diff.dirstat=files
ok 21 - --dirstat-by-file=10
ok 22 - --dirstat=files,10
ok 23 - diff.dirstat=10,files
ok 24 - --dirstat-by-file --cumulative
ok 25 - --dirstat=files,cumulative
ok 26 - diff.dirstat=cumulative,files
ok 27 - --dirstat=files,cumulative,10
ok 28 - diff.dirstat=10,cumulative,files
ok 29 - --dirstat=files,cumulative,16.7
ok 30 - diff.dirstat=16.7,cumulative,files
ok 31 - diff.dirstat=16.70,cumulative,files
ok 32 - --dirstat=files,cumulative,27.2
ok 33 - --dirstat=files,cumulative,27.09
ok 34 - --dirstat=lines
ok 35 - diff.dirstat=lines
ok 36 - --dirstat=lines,0
ok 37 - diff.dirstat=0,lines
ok 38 - --dirstat=future_param,lines,0 should fail loudly
ok 39 - --dirstat=dummy1,cumulative,2dummy should report both unrecognized parameters
ok 40 - diff.dirstat=future_param,0,lines should warn, but still work
# passed all 40 test(s)
1..40

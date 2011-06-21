ok 1 - setup baseline commit
ok 2 - create patches with short subject
ok 3 - create patches with long subject
ok 4 - create patches with multiline subject
ok 5 - short subject preserved (format-patch | am)
ok 6 - short subject preserved (format-patch -k | am)
ok 7 - short subject preserved (format-patch -k | am -k)
ok 8 - long subject preserved (format-patch | am)
ok 9 - long subject preserved (format-patch -k | am)
ok 10 - long subject preserved (format-patch -k | am -k)
ok 11 - multiline subject unwrapped (format-patch | am)
ok 12 - multiline subject unwrapped (format-patch -k | am)
ok 13 - multiline subject preserved (format-patch -k | am -k)
# passed all 13 test(s)
1..13

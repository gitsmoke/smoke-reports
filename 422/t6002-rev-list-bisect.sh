Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6002-rev-list-bisect/.git/
expecting success: test $_bisect_err -le $_max_diff

ok 1 - bisection diff --bisect l0 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 2 - bisection diff --bisect l1 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 3 - bisection diff --bisect l2 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 4 - bisection diff --bisect a0 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 5 - bisection diff --bisect a1 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 6 - bisection diff --bisect a2 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff
ok 7 - bisection diff --bisect a3 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 8 - bisection diff --bisect b1 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 9 - bisection diff --bisect b2 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 10 - bisection diff --bisect b3 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 11 - bisection diff --bisect c1 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 12 - bisection diff --bisect c2 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 13 - bisection diff --bisect c3 ^root <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 14 - bisection diff --bisect E ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 15 - bisection diff --bisect e1 ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 16 - bisection diff --bisect e2 ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 17 - bisection diff --bisect e3 ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 18 - bisection diff --bisect e4 ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 19 - bisection diff --bisect e5 ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 20 - bisection diff --bisect e6 ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 21 - bisection diff --bisect e7 ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 22 - bisection diff --bisect f1 ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 23 - bisection diff --bisect f2 ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 24 - bisection diff --bisect f3 ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 25 - bisection diff --bisect f4 ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 26 - bisection diff --bisect E ^F <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 27 - bisection diff --bisect V ^U <= 1
expecting success: test $_bisect_err -le $_max_diff

ok 28 - bisection diff --bisect V ^U ^u1 ^u2 ^u3 <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 29 - bisection diff --bisect u1 ^U <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 30 - bisection diff --bisect u2 ^U <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 31 - bisection diff --bisect u3 ^U <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 32 - bisection diff --bisect u4 ^U <= 0
expecting success: test $_bisect_err -le $_max_diff

ok 33 - bisection diff --bisect u5 ^U <= 0
expecting success: check_output bisect-l5-root "git rev-list $_bisect_option l5 ^root"
ok 34 - --bisect l5 ^root
expecting success: check_output bisect-l5-root-c3 "git rev-list $_bisect_option l5 ^root ^c3"
ok 35 - --bisect l5 ^root ^c3
expecting success: check_output bisect-l5-root-c3-b4 "git rev-list $_bisect_option l5 ^c3 ^b4"
ok 36 - --bisect l5 ^root ^c3 ^b4
expecting success: check_output bisect-l3-root-c3-b4 "git rev-list $_bisect_option l3 ^root ^c3 ^b4"

ok 37 - --bisect l3 ^root ^c3 ^b4

expecting success: check_output bisect-l5-b3-a3-b4-a4 "git rev-list $_bisect_option l3 ^b3 ^a3 ^a4"

ok 38 - --bisect l5 ^b3 ^a3 ^b4 ^a4

expecting success: check_output bisect-l4-a2-a3-b-a4 "git rev-list $_bisect_option l4 ^a2 ^a3 ^a4"

ok 39 - --bisect l4 ^a2 ^a3 ^b ^a4

expecting success: check_output bisect-l3-a2-a3-b-a4 "git rev-list $_bisect_option l3 ^a2 ^a3 ^a4"

ok 40 - --bisect l3 ^a2 ^a3 ^b ^a4
expecting success: check_output bisect-a4-a2-a3-b4 "git rev-list $_bisect_option a4 ^a2 ^a3 ^b4"
ok 41 - --bisect a4 ^a2 ^a3 ^b4
expecting success: check_output bisect-a4-a2-a3-b4-c2 "git rev-list $_bisect_option a4 ^a2 ^a3 ^b4 ^c2"
ok 42 - --bisect a4 ^a2 ^a3 ^b4 ^c2

expecting success: check_output bisect-a4-a2-a3-b4-c2-c3 "git rev-list $_bisect_option a4 ^a2 ^a3 ^b4 ^c2 ^c3"

ok 43 - --bisect a4 ^a2 ^a3 ^b4 ^c2 ^c3
expecting success: check_output bisect-a4-a2-a3-b4 "git rev-list $_bisect_option a4 ^a2 ^a3 ^b4"
ok 44 - --bisect a4 ^a2 ^a3 ^b4
expecting success: check_output bisect-c3-a2-a3-b4-c2 "git rev-list $_bisect_option c3 ^a2 ^a3 ^b4 ^c2"
ok 45 - --bisect c3 ^a2 ^a3 ^b4 ^c2
# passed all 45 test(s)
1..45

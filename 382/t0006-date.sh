Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t0006-date/.git/
expecting success: 
	test-date show 1251659995 >actual &&
	test_cmp expect actual
	

ok 1 - relative date (5 seconds ago)

expecting success: 
	test-date show 1251659700 >actual &&
	test_cmp expect actual
	

ok 2 - relative date (5 minutes ago)
expecting success: 
	test-date show 1251642000 >actual &&
	test_cmp expect actual
	

ok 3 - relative date (5 hours ago)
expecting success: 
	test-date show 1251228000 >actual &&
	test_cmp expect actual
	

ok 4 - relative date (5 days ago)
expecting success: 
	test-date show 1249932000 >actual &&
	test_cmp expect actual
	

ok 5 - relative date (3 weeks ago)

expecting success: 
	test-date show 1238660000 >actual &&
	test_cmp expect actual
	

ok 6 - relative date (5 months ago)

expecting success: 
	test-date show 1214160000 >actual &&
	test_cmp expect actual
	

ok 7 - relative date (1 year, 2 months ago)

expecting success: 
	test-date show 1196472000 >actual &&
	test_cmp expect actual
	

ok 8 - relative date (1 year, 9 months ago)

expecting success: 
	test-date show 621660000 >actual &&
	test_cmp expect actual
	

ok 9 - relative date (20 years ago)
expecting success: 
	test-date show 1220210400 >actual &&
	test_cmp expect actual
	

ok 10 - relative date (12 months ago)
expecting success: 
	TZ=UTC test-date parse '2008' >actual &&
	test_cmp expect actual
	

ok 11 - parse date (2008)
expecting success: 
	TZ=UTC test-date parse '2008-02' >actual &&
	test_cmp expect actual
	

ok 12 - parse date (2008-02)
expecting success: 
	TZ=UTC test-date parse '2008-02-14' >actual &&
	test_cmp expect actual
	

ok 13 - parse date (2008-02-14)
expecting success: 
	TZ=UTC test-date parse '2008-02-14 20:30:45' >actual &&
	test_cmp expect actual
	

ok 14 - parse date (2008-02-14 20:30:45)

expecting success: 
	TZ=UTC test-date parse '2008-02-14 20:30:45 -0500' >actual &&
	test_cmp expect actual
	

ok 15 - parse date (2008-02-14 20:30:45 -0500)

expecting success: 
	TZ=EST5 test-date parse '2008-02-14 20:30:45' >actual &&
	test_cmp expect actual
	

ok 16 - parse date (2008-02-14 20:30:45 TZ=EST5)

expecting success: 
	test-date approxidate 'now' >actual &&
	test_cmp expect actual
	

ok 17 - parse approxidate (now)

expecting success: 
	test-date approxidate '5 seconds ago' >actual &&
	test_cmp expect actual
	

ok 18 - parse approxidate (5 seconds ago)

expecting success: 
	test-date approxidate '5.seconds.ago' >actual &&
	test_cmp expect actual
	

ok 19 - parse approxidate (5.seconds.ago)

expecting success: 
	test-date approxidate '10.minutes.ago' >actual &&
	test_cmp expect actual
	

ok 20 - parse approxidate (10.minutes.ago)

expecting success: 
	test-date approxidate 'yesterday' >actual &&
	test_cmp expect actual
	

ok 21 - parse approxidate (yesterday)

expecting success: 
	test-date approxidate '3.days.ago' >actual &&
	test_cmp expect actual
	

ok 22 - parse approxidate (3.days.ago)

expecting success: 
	test-date approxidate '3.weeks.ago' >actual &&
	test_cmp expect actual
	

ok 23 - parse approxidate (3.weeks.ago)

expecting success: 
	test-date approxidate '3.months.ago' >actual &&
	test_cmp expect actual
	

ok 24 - parse approxidate (3.months.ago)

expecting success: 
	test-date approxidate '2.years.3.months.ago' >actual &&
	test_cmp expect actual
	

ok 25 - parse approxidate (2.years.3.months.ago)

expecting success: 
	test-date approxidate '6am yesterday' >actual &&
	test_cmp expect actual
	

ok 26 - parse approxidate (6am yesterday)

expecting success: 
	test-date approxidate '6pm yesterday' >actual &&
	test_cmp expect actual
	

ok 27 - parse approxidate (6pm yesterday)

expecting success: 
	test-date approxidate '3:00' >actual &&
	test_cmp expect actual
	

ok 28 - parse approxidate (3:00)

expecting success: 
	test-date approxidate '15:00' >actual &&
	test_cmp expect actual
	

ok 29 - parse approxidate (15:00)

expecting success: 
	test-date approxidate 'noon today' >actual &&
	test_cmp expect actual
	

ok 30 - parse approxidate (noon today)

expecting success: 
	test-date approxidate 'noon yesterday' >actual &&
	test_cmp expect actual
	

ok 31 - parse approxidate (noon yesterday)

expecting success: 
	test-date approxidate 'last tuesday' >actual &&
	test_cmp expect actual
	

ok 32 - parse approxidate (last tuesday)

expecting success: 
	test-date approxidate 'July 5th' >actual &&
	test_cmp expect actual
	

ok 33 - parse approxidate (July 5th)

expecting success: 
	test-date approxidate '06/05/2009' >actual &&
	test_cmp expect actual
	

ok 34 - parse approxidate (06/05/2009)

expecting success: 
	test-date approxidate '06.05.2009' >actual &&
	test_cmp expect actual
	

ok 35 - parse approxidate (06.05.2009)

expecting success: 
	test-date approxidate 'Jun 6, 5AM' >actual &&
	test_cmp expect actual
	

ok 36 - parse approxidate (Jun 6, 5AM)

expecting success: 
	test-date approxidate '5AM Jun 6' >actual &&
	test_cmp expect actual
	

ok 37 - parse approxidate (5AM Jun 6)

expecting success: 
	test-date approxidate '6AM, June 7, 2009' >actual &&
	test_cmp expect actual
	

ok 38 - parse approxidate (6AM, June 7, 2009)

# passed all 38 test(s)
1..38

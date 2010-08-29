ok 1 - relative date (5 seconds ago)
ok 2 - relative date (5 minutes ago)
ok 3 - relative date (5 hours ago)
ok 4 - relative date (5 days ago)
ok 5 - relative date (3 weeks ago)
ok 6 - relative date (5 months ago)
ok 7 - relative date (1 year, 2 months ago)
ok 8 - relative date (1 year, 9 months ago)
ok 9 - relative date (20 years ago)
ok 10 - relative date (12 months ago)
ok 11 - parse date (2008)
ok 12 - parse date (2008-02)
ok 13 - parse date (2008-02-14)
ok 14 - parse date (2008-02-14 20:30:45)
not ok - 15 parse date (2008-02-14 20:30:45 -0500)
#	
#		TZ=UTC test-date parse '2008-02-14 20:30:45 -0500' >actual &&
#		test_cmp expect actual
#		
not ok - 16 parse date (2008-02-14 20:30:45 TZ=EST5)
#	
#		TZ=EST5 test-date parse '2008-02-14 20:30:45' >actual &&
#		test_cmp expect actual
#		
ok 17 - parse approxidate (now)
ok 18 - parse approxidate (5 seconds ago)
ok 19 - parse approxidate (5.seconds.ago)
ok 20 - parse approxidate (10.minutes.ago)
ok 21 - parse approxidate (yesterday)
ok 22 - parse approxidate (3.days.ago)
ok 23 - parse approxidate (3.weeks.ago)
ok 24 - parse approxidate (3.months.ago)
ok 25 - parse approxidate (2.years.3.months.ago)
ok 26 - parse approxidate (6am yesterday)
ok 27 - parse approxidate (6pm yesterday)
ok 28 - parse approxidate (3:00)
ok 29 - parse approxidate (15:00)
ok 30 - parse approxidate (noon today)
ok 31 - parse approxidate (noon yesterday)
ok 32 - parse approxidate (last tuesday)
ok 33 - parse approxidate (July 5th)
ok 34 - parse approxidate (06/05/2009)
ok 35 - parse approxidate (06.05.2009)
ok 36 - parse approxidate (Jun 6, 5AM)
ok 37 - parse approxidate (5AM Jun 6)
ok 38 - parse approxidate (6AM, June 7, 2009)
# failed 2 among 38 test(s)
1..38

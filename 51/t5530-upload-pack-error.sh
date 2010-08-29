ok 1 - setup and corrupt repository
ok 2 - fsck fails
ok 3 - upload-pack fails due to error in pack-objects packing
ok 4 - corrupt repo differently
ok 5 - fsck fails
ok 6 - upload-pack fails due to error in rev-list
not ok - 7 upload-pack error message when bad ref requested
#	
#	
#		printf "0045want %s multi_ack_detailed\n00000009done\n0000" \
#			"deadbeefdeadbeefdeadbeefdeadbeefdeadbeef" >input &&
#		test_must_fail git upload-pack . <input >output 2>output.err &&
#		grep -q "not our ref" output.err &&
#		! grep -q multi_ack_detailed output.err
#	
ok 8 - upload-pack fails due to error in pack-objects enumeration
ok 9 - create empty repository
ok 10 - fetch fails
# failed 1 among 10 test(s)
1..10

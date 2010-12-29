Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6032-merge-large-rename/.git/
expecting success: 
	touch file &&
	git add . &&
	git commit -m initial &&
	git tag initial
[master (root-commit) 1180e11] initial
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 file

ok 1 - setup (initial)

expecting success: 
	n=5
	expect=ok
	git checkout -f master &&
	git branch -D test$n || true &&
	git reset --hard initial &&
	for i in $(count $n); do
		make_text $i initial initial >$i
	done &&
	git add . &&
	git commit -m add=$n &&
	for i in $(count $n); do
		make_text $i changed initial >$i
	done &&
	git commit -a -m change=$n &&
	git checkout -b test$n HEAD^ &&
	for i in $(count $n); do
		git rm $i
		make_text $i initial changed >$i.moved
	done &&
	git add . &&
	git commit -m change+rename=$n &&
	case "$expect" in
		ok) git merge master ;;
		 *) test_must_fail git merge master ;;
	esac
	
HEAD is now at 1180e11 initial
[master 6990c79] add=5
 Author: A U Thor <author@example.com>
 5 files changed, 110 insertions(+), 0 deletions(-)
 create mode 100644 1
 create mode 100644 2
 create mode 100644 3
 create mode 100644 4
 create mode 100644 5
[master 1a22c2d] change=5
 Author: A U Thor <author@example.com>
 5 files changed, 5 insertions(+), 5 deletions(-)
rm '1'
rm '2'
rm '3'
rm '4'
rm '5'
[test5 f6ef21c] change+rename=5
 Author: A U Thor <author@example.com>
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename 1 => 1.moved (91%)
 rename 2 => 2.moved (91%)
 rename 3 => 3.moved (91%)
 rename 4 => 4.moved (91%)
 rename 5 => 5.moved (91%)
Merging:
f6ef21c change+rename=5
virtual master
found 1 common ancestor(s):
6990c79 add=5
Auto-merging 1.moved
Auto-merging 2.moved
Auto-merging 3.moved
Auto-merging 4.moved
Auto-merging 5.moved
Merge made by recursive.
 1.moved |    2 +-
 2.moved |    2 +-
 3.moved |    2 +-
 4.moved |    2 +-
 5.moved |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

ok 2 - rename (5, ok)

expecting success: 
	git config diff.renamelimit 4


ok 3 - set diff.renamelimit to 4

expecting success: 
	n=4
	expect=ok
	git checkout -f master &&
	git branch -D test$n || true &&
	git reset --hard initial &&
	for i in $(count $n); do
		make_text $i initial initial >$i
	done &&
	git add . &&
	git commit -m add=$n &&
	for i in $(count $n); do
		make_text $i changed initial >$i
	done &&
	git commit -a -m change=$n &&
	git checkout -b test$n HEAD^ &&
	for i in $(count $n); do
		git rm $i
		make_text $i initial changed >$i.moved
	done &&
	git add . &&
	git commit -m change+rename=$n &&
	case "$expect" in
		ok) git merge master ;;
		 *) test_must_fail git merge master ;;
	esac
	
HEAD is now at 1180e11 initial
[master 258bbe7] add=4
 Author: A U Thor <author@example.com>
 4 files changed, 88 insertions(+), 0 deletions(-)
 create mode 100644 1
 create mode 100644 2
 create mode 100644 3
 create mode 100644 4
[master 3cc9b34] change=4
 Author: A U Thor <author@example.com>
 4 files changed, 4 insertions(+), 4 deletions(-)
rm '1'
rm '2'
rm '3'
rm '4'
[test4 9f0e28c] change+rename=4
 Author: A U Thor <author@example.com>
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename 1 => 1.moved (91%)
 rename 2 => 2.moved (91%)
 rename 3 => 3.moved (91%)
 rename 4 => 4.moved (91%)
Merging:
9f0e28c change+rename=4
virtual master
found 1 common ancestor(s):
258bbe7 add=4
Auto-merging 1.moved
Auto-merging 2.moved
Auto-merging 3.moved
Auto-merging 4.moved
Merge made by recursive.
 1.moved |    2 +-
 2.moved |    2 +-
 3.moved |    2 +-
 4.moved |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

ok 4 - rename (4, ok)

expecting success: 
	n=5
	expect=fail
	git checkout -f master &&
	git branch -D test$n || true &&
	git reset --hard initial &&
	for i in $(count $n); do
		make_text $i initial initial >$i
	done &&
	git add . &&
	git commit -m add=$n &&
	for i in $(count $n); do
		make_text $i changed initial >$i
	done &&
	git commit -a -m change=$n &&
	git checkout -b test$n HEAD^ &&
	for i in $(count $n); do
		git rm $i
		make_text $i initial changed >$i.moved
	done &&
	git add . &&
	git commit -m change+rename=$n &&
	case "$expect" in
		ok) git merge master ;;
		 *) test_must_fail git merge master ;;
	esac
	
Deleted branch test5 (was bafe694).
HEAD is now at 1180e11 initial
[master ced43e1] add=5
 Author: A U Thor <author@example.com>
 5 files changed, 110 insertions(+), 0 deletions(-)
 create mode 100644 1
 create mode 100644 2
 create mode 100644 3
 create mode 100644 4
 create mode 100644 5
[master 8149860] change=5
 Author: A U Thor <author@example.com>
 5 files changed, 5 insertions(+), 5 deletions(-)
rm '1'
rm '2'
rm '3'
rm '4'
rm '5'
[test5 7bfbca5] change+rename=5
 Author: A U Thor <author@example.com>
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename 1 => 1.moved (91%)
 rename 2 => 2.moved (91%)
 rename 3 => 3.moved (91%)
 rename 4 => 4.moved (91%)
 rename 5 => 5.moved (91%)
Merging:
7bfbca5 change+rename=5
virtual master
found 1 common ancestor(s):
ced43e1 add=5
CONFLICT (delete/modify): 1 deleted in HEAD and modified in master. Version master of 1 left in tree.
CONFLICT (delete/modify): 2 deleted in HEAD and modified in master. Version master of 2 left in tree.
CONFLICT (delete/modify): 3 deleted in HEAD and modified in master. Version master of 3 left in tree.
CONFLICT (delete/modify): 4 deleted in HEAD and modified in master. Version master of 4 left in tree.
CONFLICT (delete/modify): 5 deleted in HEAD and modified in master. Version master of 5 left in tree.
Automatic merge failed; fix conflicts and then commit the result.

ok 5 - rename (5, fail)

expecting success: 
	git config merge.renamelimit 5


ok 6 - set merge.renamelimit to 5

expecting success: 
	n=5
	expect=ok
	git checkout -f master &&
	git branch -D test$n || true &&
	git reset --hard initial &&
	for i in $(count $n); do
		make_text $i initial initial >$i
	done &&
	git add . &&
	git commit -m add=$n &&
	for i in $(count $n); do
		make_text $i changed initial >$i
	done &&
	git commit -a -m change=$n &&
	git checkout -b test$n HEAD^ &&
	for i in $(count $n); do
		git rm $i
		make_text $i initial changed >$i.moved
	done &&
	git add . &&
	git commit -m change+rename=$n &&
	case "$expect" in
		ok) git merge master ;;
		 *) test_must_fail git merge master ;;
	esac
	
Deleted branch test5 (was 7bfbca5).
HEAD is now at 1180e11 initial
[master 9e0043b] add=5
 Author: A U Thor <author@example.com>
 5 files changed, 110 insertions(+), 0 deletions(-)
 create mode 100644 1
 create mode 100644 2
 create mode 100644 3
 create mode 100644 4
 create mode 100644 5
[master 3c98c5e] change=5
 Author: A U Thor <author@example.com>
 5 files changed, 5 insertions(+), 5 deletions(-)
rm '1'
rm '2'
rm '3'
rm '4'
rm '5'
[test5 bd0a4fd] change+rename=5
 Author: A U Thor <author@example.com>
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename 1 => 1.moved (91%)
 rename 2 => 2.moved (91%)
 rename 3 => 3.moved (91%)
 rename 4 => 4.moved (91%)
 rename 5 => 5.moved (91%)
Merging:
bd0a4fd change+rename=5
virtual master
found 1 common ancestor(s):
9e0043b add=5
Auto-merging 1.moved
Auto-merging 2.moved
Auto-merging 3.moved
Auto-merging 4.moved
Auto-merging 5.moved
Merge made by recursive.
 1.moved |    2 +-
 2.moved |    2 +-
 3.moved |    2 +-
 4.moved |    2 +-
 5.moved |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

ok 7 - rename (5, ok)

expecting success: 
	n=6
	expect=fail
	git checkout -f master &&
	git branch -D test$n || true &&
	git reset --hard initial &&
	for i in $(count $n); do
		make_text $i initial initial >$i
	done &&
	git add . &&
	git commit -m add=$n &&
	for i in $(count $n); do
		make_text $i changed initial >$i
	done &&
	git commit -a -m change=$n &&
	git checkout -b test$n HEAD^ &&
	for i in $(count $n); do
		git rm $i
		make_text $i initial changed >$i.moved
	done &&
	git add . &&
	git commit -m change+rename=$n &&
	case "$expect" in
		ok) git merge master ;;
		 *) test_must_fail git merge master ;;
	esac
	
HEAD is now at 1180e11 initial
[master bfe3e3b] add=6
 Author: A U Thor <author@example.com>
 6 files changed, 132 insertions(+), 0 deletions(-)
 create mode 100644 1
 create mode 100644 2
 create mode 100644 3
 create mode 100644 4
 create mode 100644 5
 create mode 100644 6
[master 3e3cd36] change=6
 Author: A U Thor <author@example.com>
 6 files changed, 6 insertions(+), 6 deletions(-)
rm '1'
rm '2'
rm '3'
rm '4'
rm '5'
rm '6'
[test6 961c74d] change+rename=6
 Author: A U Thor <author@example.com>
 6 files changed, 6 insertions(+), 6 deletions(-)
 rename 1 => 1.moved (91%)
 rename 2 => 2.moved (91%)
 rename 3 => 3.moved (91%)
 rename 4 => 4.moved (91%)
 rename 5 => 5.moved (91%)
 rename 6 => 6.moved (91%)
Merging:
961c74d change+rename=6
virtual master
found 1 common ancestor(s):
bfe3e3b add=6
CONFLICT (delete/modify): 1 deleted in HEAD and modified in master. Version master of 1 left in tree.
CONFLICT (delete/modify): 2 deleted in HEAD and modified in master. Version master of 2 left in tree.
CONFLICT (delete/modify): 3 deleted in HEAD and modified in master. Version master of 3 left in tree.
CONFLICT (delete/modify): 4 deleted in HEAD and modified in master. Version master of 4 left in tree.
CONFLICT (delete/modify): 5 deleted in HEAD and modified in master. Version master of 5 left in tree.
CONFLICT (delete/modify): 6 deleted in HEAD and modified in master. Version master of 6 left in tree.
Automatic merge failed; fix conflicts and then commit the result.

ok 8 - rename (6, fail)

expecting success: 
	git config --unset merge.renamelimit &&
	git config --unset diff.renamelimit &&

	git reset --hard initial &&
	for i in $(count 200); do
		make_text foo bar baz >$i
	done &&
	git add . &&
	git commit -m create-files &&

	git branch simple-change &&
	git checkout -b simple-rename &&

	mkdir builtin &&
	git mv [0-9]* builtin/ &&
	git commit -m renamed &&

	git checkout simple-change &&
	>unrelated-change &&
	git add unrelated-change &&
	git commit -m unrelated-change

HEAD is now at 1180e11 initial
[test6 8cac532] create-files
 Author: A U Thor <author@example.com>
 200 files changed, 4400 insertions(+), 0 deletions(-)
 create mode 100644 1
 create mode 100644 10
 create mode 100644 100
 create mode 100644 101
 create mode 100644 102
 create mode 100644 103
 create mode 100644 104
 create mode 100644 105
 create mode 100644 106
 create mode 100644 107
 create mode 100644 108
 create mode 100644 109
 create mode 100644 11
 create mode 100644 110
 create mode 100644 111
 create mode 100644 112
 create mode 100644 113
 create mode 100644 114
 create mode 100644 115
 create mode 100644 116
 create mode 100644 117
 create mode 100644 118
 create mode 100644 119
 create mode 100644 12
 create mode 100644 120
 create mode 100644 121
 create mode 100644 122
 create mode 100644 123
 create mode 100644 124
 create mode 100644 125
 create mode 100644 126
 create mode 100644 127
 create mode 100644 128
 create mode 100644 129
 create mode 100644 13
 create mode 100644 130
 create mode 100644 131
 create mode 100644 132
 create mode 100644 133
 create mode 100644 134
 create mode 100644 135
 create mode 100644 136
 create mode 100644 137
 create mode 100644 138
 create mode 100644 139
 create mode 100644 14
 create mode 100644 140
 create mode 100644 141
 create mode 100644 142
 create mode 100644 143
 create mode 100644 144
 create mode 100644 145
 create mode 100644 146
 create mode 100644 147
 create mode 100644 148
 create mode 100644 149
 create mode 100644 15
 create mode 100644 150
 create mode 100644 151
 create mode 100644 152
 create mode 100644 153
 create mode 100644 154
 create mode 100644 155
 create mode 100644 156
 create mode 100644 157
 create mode 100644 158
 create mode 100644 159
 create mode 100644 16
 create mode 100644 160
 create mode 100644 161
 create mode 100644 162
 create mode 100644 163
 create mode 100644 164
 create mode 100644 165
 create mode 100644 166
 create mode 100644 167
 create mode 100644 168
 create mode 100644 169
 create mode 100644 17
 create mode 100644 170
 create mode 100644 171
 create mode 100644 172
 create mode 100644 173
 create mode 100644 174
 create mode 100644 175
 create mode 100644 176
 create mode 100644 177
 create mode 100644 178
 create mode 100644 179
 create mode 100644 18
 create mode 100644 180
 create mode 100644 181
 create mode 100644 182
 create mode 100644 183
 create mode 100644 184
 create mode 100644 185
 create mode 100644 186
 create mode 100644 187
 create mode 100644 188
 create mode 100644 189
 create mode 100644 19
 create mode 100644 190
 create mode 100644 191
 create mode 100644 192
 create mode 100644 193
 create mode 100644 194
 create mode 100644 195
 create mode 100644 196
 create mode 100644 197
 create mode 100644 198
 create mode 100644 199
 create mode 100644 2
 create mode 100644 20
 create mode 100644 200
 create mode 100644 21
 create mode 100644 22
 create mode 100644 23
 create mode 100644 24
 create mode 100644 25
 create mode 100644 26
 create mode 100644 27
 create mode 100644 28
 create mode 100644 29
 create mode 100644 3
 create mode 100644 30
 create mode 100644 31
 create mode 100644 32
 create mode 100644 33
 create mode 100644 34
 create mode 100644 35
 create mode 100644 36
 create mode 100644 37
 create mode 100644 38
 create mode 100644 39
 create mode 100644 4
 create mode 100644 40
 create mode 100644 41
 create mode 100644 42
 create mode 100644 43
 create mode 100644 44
 create mode 100644 45
 create mode 100644 46
 create mode 100644 47
 create mode 100644 48
 create mode 100644 49
 create mode 100644 5
 create mode 100644 50
 create mode 100644 51
 create mode 100644 52
 create mode 100644 53
 create mode 100644 54
 create mode 100644 55
 create mode 100644 56
 create mode 100644 57
 create mode 100644 58
 create mode 100644 59
 create mode 100644 6
 create mode 100644 60
 create mode 100644 61
 create mode 100644 62
 create mode 100644 63
 create mode 100644 64
 create mode 100644 65
 create mode 100644 66
 create mode 100644 67
 create mode 100644 68
 create mode 100644 69
 create mode 100644 7
 create mode 100644 70
 create mode 100644 71
 create mode 100644 72
 create mode 100644 73
 create mode 100644 74
 create mode 100644 75
 create mode 100644 76
 create mode 100644 77
 create mode 100644 78
 create mode 100644 79
 create mode 100644 8
 create mode 100644 80
 create mode 100644 81
 create mode 100644 82
 create mode 100644 83
 create mode 100644 84
 create mode 100644 85
 create mode 100644 86
 create mode 100644 87
 create mode 100644 88
 create mode 100644 89
 create mode 100644 9
 create mode 100644 90
 create mode 100644 91
 create mode 100644 92
 create mode 100644 93
 create mode 100644 94
 create mode 100644 95
 create mode 100644 96
 create mode 100644 97
 create mode 100644 98
 create mode 100644 99
[simple-rename 2750acb] renamed
 Author: A U Thor <author@example.com>
 300 files changed, 0 insertions(+), 2200 deletions(-)
 delete mode 100644 19
 delete mode 100644 190
 delete mode 100644 191
 delete mode 100644 192
 delete mode 100644 193
 delete mode 100644 194
 delete mode 100644 195
 delete mode 100644 196
 delete mode 100644 197
 delete mode 100644 198
 delete mode 100644 199
 delete mode 100644 2
 delete mode 100644 20
 delete mode 100644 200
 delete mode 100644 21
 delete mode 100644 22
 delete mode 100644 23
 delete mode 100644 24
 delete mode 100644 25
 delete mode 100644 26
 delete mode 100644 27
 delete mode 100644 28
 delete mode 100644 29
 delete mode 100644 3
 delete mode 100644 30
 delete mode 100644 31
 delete mode 100644 32
 delete mode 100644 33
 delete mode 100644 34
 delete mode 100644 35
 delete mode 100644 36
 delete mode 100644 37
 delete mode 100644 38
 delete mode 100644 39
 delete mode 100644 4
 delete mode 100644 40
 delete mode 100644 41
 delete mode 100644 42
 delete mode 100644 43
 delete mode 100644 44
 delete mode 100644 45
 delete mode 100644 46
 delete mode 100644 47
 delete mode 100644 48
 delete mode 100644 49
 delete mode 100644 5
 delete mode 100644 50
 delete mode 100644 51
 delete mode 100644 52
 delete mode 100644 53
 delete mode 100644 54
 delete mode 100644 55
 delete mode 100644 56
 delete mode 100644 57
 delete mode 100644 58
 delete mode 100644 59
 delete mode 100644 6
 delete mode 100644 60
 delete mode 100644 61
 delete mode 100644 62
 delete mode 100644 63
 delete mode 100644 64
 delete mode 100644 65
 delete mode 100644 66
 delete mode 100644 67
 delete mode 100644 68
 delete mode 100644 69
 delete mode 100644 7
 delete mode 100644 70
 delete mode 100644 71
 delete mode 100644 72
 delete mode 100644 73
 delete mode 100644 74
 delete mode 100644 75
 delete mode 100644 76
 delete mode 100644 77
 delete mode 100644 78
 delete mode 100644 79
 delete mode 100644 8
 delete mode 100644 80
 delete mode 100644 81
 delete mode 100644 82
 delete mode 100644 83
 delete mode 100644 84
 delete mode 100644 85
 delete mode 100644 86
 delete mode 100644 87
 delete mode 100644 88
 delete mode 100644 89
 delete mode 100644 9
 delete mode 100644 90
 delete mode 100644 91
 delete mode 100644 92
 delete mode 100644 93
 delete mode 100644 94
 delete mode 100644 95
 delete mode 100644 96
 delete mode 100644 97
 delete mode 100644 98
 delete mode 100644 99
 copy 1 => builtin/1 (100%)
 rename 10 => builtin/10 (100%)
 rename 100 => builtin/100 (100%)
 rename 101 => builtin/101 (100%)
 rename 102 => builtin/102 (100%)
 rename 103 => builtin/103 (100%)
 rename 104 => builtin/104 (100%)
 rename 105 => builtin/105 (100%)
 rename 106 => builtin/106 (100%)
 rename 107 => builtin/107 (100%)
 rename 108 => builtin/108 (100%)
 rename 109 => builtin/109 (100%)
 rename 11 => builtin/11 (100%)
 rename 110 => builtin/110 (100%)
 rename 111 => builtin/111 (100%)
 rename 112 => builtin/112 (100%)
 rename 113 => builtin/113 (100%)
 rename 114 => builtin/114 (100%)
 rename 115 => builtin/115 (100%)
 rename 116 => builtin/116 (100%)
 rename 117 => builtin/117 (100%)
 rename 118 => builtin/118 (100%)
 rename 119 => builtin/119 (100%)
 rename 12 => builtin/12 (100%)
 rename 120 => builtin/120 (100%)
 rename 121 => builtin/121 (100%)
 rename 122 => builtin/122 (100%)
 rename 123 => builtin/123 (100%)
 rename 124 => builtin/124 (100%)
 rename 125 => builtin/125 (100%)
 rename 126 => builtin/126 (100%)
 rename 127 => builtin/127 (100%)
 rename 128 => builtin/128 (100%)
 rename 129 => builtin/129 (100%)
 rename 13 => builtin/13 (100%)
 rename 130 => builtin/130 (100%)
 rename 131 => builtin/131 (100%)
 rename 132 => builtin/132 (100%)
 rename 133 => builtin/133 (100%)
 rename 134 => builtin/134 (100%)
 rename 135 => builtin/135 (100%)
 rename 136 => builtin/136 (100%)
 rename 137 => builtin/137 (100%)
 rename 138 => builtin/138 (100%)
 rename 139 => builtin/139 (100%)
 rename 14 => builtin/14 (100%)
 rename 140 => builtin/140 (100%)
 rename 141 => builtin/141 (100%)
 rename 142 => builtin/142 (100%)
 rename 143 => builtin/143 (100%)
 rename 144 => builtin/144 (100%)
 rename 145 => builtin/145 (100%)
 rename 146 => builtin/146 (100%)
 rename 147 => builtin/147 (100%)
 rename 148 => builtin/148 (100%)
 rename 149 => builtin/149 (100%)
 rename 15 => builtin/15 (100%)
 rename 150 => builtin/150 (100%)
 rename 151 => builtin/151 (100%)
 rename 152 => builtin/152 (100%)
 rename 153 => builtin/153 (100%)
 rename 154 => builtin/154 (100%)
 rename 155 => builtin/155 (100%)
 rename 156 => builtin/156 (100%)
 rename 157 => builtin/157 (100%)
 rename 158 => builtin/158 (100%)
 rename 159 => builtin/159 (100%)
 rename 16 => builtin/16 (100%)
 rename 160 => builtin/160 (100%)
 rename 161 => builtin/161 (100%)
 rename 162 => builtin/162 (100%)
 rename 163 => builtin/163 (100%)
 rename 164 => builtin/164 (100%)
 rename 165 => builtin/165 (100%)
 rename 166 => builtin/166 (100%)
 rename 167 => builtin/167 (100%)
 rename 168 => builtin/168 (100%)
 rename 169 => builtin/169 (100%)
 rename 17 => builtin/17 (100%)
 rename 170 => builtin/170 (100%)
 rename 171 => builtin/171 (100%)
 rename 172 => builtin/172 (100%)
 rename 173 => builtin/173 (100%)
 rename 174 => builtin/174 (100%)
 rename 175 => builtin/175 (100%)
 rename 176 => builtin/176 (100%)
 rename 177 => builtin/177 (100%)
 rename 178 => builtin/178 (100%)
 rename 179 => builtin/179 (100%)
 rename 18 => builtin/18 (100%)
 rename 180 => builtin/180 (100%)
 rename 181 => builtin/181 (100%)
 rename 182 => builtin/182 (100%)
 rename 183 => builtin/183 (100%)
 rename 184 => builtin/184 (100%)
 rename 185 => builtin/185 (100%)
 rename 186 => builtin/186 (100%)
 rename 187 => builtin/187 (100%)
 rename 188 => builtin/188 (100%)
 rename 189 => builtin/189 (100%)
 copy 1 => builtin/19 (100%)
 copy 1 => builtin/190 (100%)
 copy 1 => builtin/191 (100%)
 copy 1 => builtin/192 (100%)
 copy 1 => builtin/193 (100%)
 copy 1 => builtin/194 (100%)
 copy 1 => builtin/195 (100%)
 copy 1 => builtin/196 (100%)
 copy 1 => builtin/197 (100%)
 copy 1 => builtin/198 (100%)
 copy 1 => builtin/199 (100%)
 copy 1 => builtin/2 (100%)
 copy 1 => builtin/20 (100%)
 copy 1 => builtin/200 (100%)
 copy 1 => builtin/21 (100%)
 copy 1 => builtin/22 (100%)
 copy 1 => builtin/23 (100%)
 copy 1 => builtin/24 (100%)
 copy 1 => builtin/25 (100%)
 copy 1 => builtin/26 (100%)
 copy 1 => builtin/27 (100%)
 copy 1 => builtin/28 (100%)
 copy 1 => builtin/29 (100%)
 copy 1 => builtin/3 (100%)
 copy 1 => builtin/30 (100%)
 copy 1 => builtin/31 (100%)
 copy 1 => builtin/32 (100%)
 copy 1 => builtin/33 (100%)
 copy 1 => builtin/34 (100%)
 copy 1 => builtin/35 (100%)
 copy 1 => builtin/36 (100%)
 copy 1 => builtin/37 (100%)
 copy 1 => builtin/38 (100%)
 copy 1 => builtin/39 (100%)
 copy 1 => builtin/4 (100%)
 copy 1 => builtin/40 (100%)
 copy 1 => builtin/41 (100%)
 copy 1 => builtin/42 (100%)
 copy 1 => builtin/43 (100%)
 copy 1 => builtin/44 (100%)
 copy 1 => builtin/45 (100%)
 copy 1 => builtin/46 (100%)
 copy 1 => builtin/47 (100%)
 copy 1 => builtin/48 (100%)
 copy 1 => builtin/49 (100%)
 copy 1 => builtin/5 (100%)
 copy 1 => builtin/50 (100%)
 copy 1 => builtin/51 (100%)
 copy 1 => builtin/52 (100%)
 copy 1 => builtin/53 (100%)
 copy 1 => builtin/54 (100%)
 copy 1 => builtin/55 (100%)
 copy 1 => builtin/56 (100%)
 copy 1 => builtin/57 (100%)
 copy 1 => builtin/58 (100%)
 copy 1 => builtin/59 (100%)
 copy 1 => builtin/6 (100%)
 copy 1 => builtin/60 (100%)
 copy 1 => builtin/61 (100%)
 copy 1 => builtin/62 (100%)
 copy 1 => builtin/63 (100%)
 copy 1 => builtin/64 (100%)
 copy 1 => builtin/65 (100%)
 copy 1 => builtin/66 (100%)
 copy 1 => builtin/67 (100%)
 copy 1 => builtin/68 (100%)
 copy 1 => builtin/69 (100%)
 copy 1 => builtin/7 (100%)
 copy 1 => builtin/70 (100%)
 copy 1 => builtin/71 (100%)
 copy 1 => builtin/72 (100%)
 copy 1 => builtin/73 (100%)
 copy 1 => builtin/74 (100%)
 copy 1 => builtin/75 (100%)
 copy 1 => builtin/76 (100%)
 copy 1 => builtin/77 (100%)
 copy 1 => builtin/78 (100%)
 copy 1 => builtin/79 (100%)
 copy 1 => builtin/8 (100%)
 copy 1 => builtin/80 (100%)
 copy 1 => builtin/81 (100%)
 copy 1 => builtin/82 (100%)
 copy 1 => builtin/83 (100%)
 copy 1 => builtin/84 (100%)
 copy 1 => builtin/85 (100%)
 copy 1 => builtin/86 (100%)
 copy 1 => builtin/87 (100%)
 copy 1 => builtin/88 (100%)
 copy 1 => builtin/89 (100%)
 copy 1 => builtin/9 (100%)
 copy 1 => builtin/90 (100%)
 copy 1 => builtin/91 (100%)
 copy 1 => builtin/92 (100%)
 copy 1 => builtin/93 (100%)
 copy 1 => builtin/94 (100%)
 copy 1 => builtin/95 (100%)
 copy 1 => builtin/96 (100%)
 copy 1 => builtin/97 (100%)
 copy 1 => builtin/98 (100%)
 rename 1 => builtin/99 (100%)
[simple-change c0e69de] unrelated-change
 Author: A U Thor <author@example.com>
 0 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 unrelated-change

ok 9 - setup large simple rename

expecting success: 
	unset GIT_MERGE_VERBOSITY &&
	git merge --no-stat simple-rename | grep -v Removing >output &&
	test 5 -gt "$(wc -l < output)"

ok 10 - massive simple rename does not spam added files

# passed all 10 test(s)
1..10

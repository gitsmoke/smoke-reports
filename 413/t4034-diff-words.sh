Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4034-diff-words/.git/
expecting success: 

	git config diff.color.old red &&
	git config diff.color.new green &&
	git config diff.color.func magenta

ok 1 - setup
expecting success: 

	word_diff --color-words

ok 2 - word diff with runs of whitespace
expecting success: 

	word_diff --word-diff=color

ok 3 - --word-diff=color
expecting success: 

	word_diff --color --word-diff=color

ok 4 - --color --word-diff=color
expecting success: 

	word_diff --word-diff=porcelain

ok 5 - --word-diff=porcelain
expecting success: 

	word_diff --word-diff=plain

ok 6 - --word-diff=plain

expecting success: 

	word_diff --word-diff=plain --no-color



ok 7 - --word-diff=plain --no-color

expecting success: 

	word_diff --word-diff=plain --color

ok 8 - --word-diff=plain --color
expecting success: 

	word_diff --color-words --unified=0

ok 9 - word diff without context

expecting success: 

	word_diff --color-words="[a-z]+"

ok 10 - word diff with a regular expression

expecting success: 
	git config diff.testdriver.wordRegex "[^[:space:]]" &&
	cat <<EOF > .gitattributes
pre diff=testdriver
post diff=testdriver
EOF

ok 11 - set a diff driver

expecting success: 

	word_diff --color-words="[a-z]+"

ok 12 - option overrides .gitattributes

expecting success: 

	word_diff --color-words

ok 13 - use regex supplied by driver

expecting success: 
	git config diff.wordRegex "[[:alnum:]]+"

ok 14 - set diff.wordRegex option
expecting success: 
	word_diff --color-words="[a-z]+"

ok 15 - command-line overrides config
expecting success: 
	word_diff --color --word-diff-regex="[a-z]+"

ok 16 - command-line overrides config: --word-diff-regex
expecting success: 
	word_diff --color-words

ok 17 - .gitattributes override config
expecting success: 
	git config --unset diff.testdriver.wordRegex

ok 18 - remove diff driver regex
expecting success: 
	word_diff --color-words

ok 19 - use configured regex
expecting success: 

	word_diff --color-words="a+"

ok 20 - test parsing words for newline
expecting success: 

	word_diff --color-words=.

ok 21 - test when words are only removed at the end
expecting success: 

	word_diff --word-diff=plain --word-diff=none

ok 22 - --word-diff=none

# passed all 22 test(s)
1..22

Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t4018-diff-funcname/.git/
expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 1 - builtin bibtex pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 2 - builtin bibtex wordRegex pattern compiles

expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 3 - builtin cpp pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 4 - builtin cpp wordRegex pattern compiles

expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 5 - builtin csharp pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 6 - builtin csharp wordRegex pattern compiles

expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 7 - builtin fortran pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 8 - builtin fortran wordRegex pattern compiles

expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 9 - builtin html pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 10 - builtin html wordRegex pattern compiles

expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 11 - builtin java pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 12 - builtin java wordRegex pattern compiles

expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 13 - builtin objc pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 14 - builtin objc wordRegex pattern compiles

expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 15 - builtin pascal pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 16 - builtin pascal wordRegex pattern compiles

expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 17 - builtin perl pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 18 - builtin perl wordRegex pattern compiles

expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 19 - builtin php pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 20 - builtin php wordRegex pattern compiles

expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 21 - builtin python pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 22 - builtin python wordRegex pattern compiles

expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 23 - builtin ruby pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 24 - builtin ruby wordRegex pattern compiles

expecting success: 
		echo "*.java diff=$p" > .gitattributes &&
		! { git diff --no-index Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 25 - builtin tex pattern compiles

expecting success: 
		! { git diff --no-index --word-diff \
			Beer.java Beer-correct.java 2>&1 |
			grep "fatal" > /dev/null; }
	

ok 26 - builtin tex wordRegex pattern compiles

expecting success: 
	rm -f .gitattributes &&
	git diff --no-index Beer.java Beer-correct.java |
	grep "^@@.*@@ public class Beer"
@@ -7,7 +7,7 @@ public class Beer

ok 27 - default behaviour
expecting success: 
	echo "*.java diff=java" >.gitattributes &&
	git diff --no-index Beer.java Beer-correct.java |
	grep "^@@.*@@ public static void main("
@@ -7,7 +7,7 @@ public static void main(String args[])
ok 28 - preset java pattern
expecting success: 
	git diff --no-index Beer.java Beer-correct.java |
	grep "^@@.*@@ int special;$"
@@ -7,7 +7,7 @@ int special;

ok 29 - custom pattern

expecting success: 
	git config diff.java.funcname "!static" &&
	git diff --no-index Beer.java Beer-correct.java 2>&1 |
	grep "fatal: Last expression must not be negated:"
fatal: Last expression must not be negated: !static

ok 30 - last regexp must not be negated

expecting success: 
	git config diff.java.funcname "Beer$" &&
	git diff --no-index Beer.java Beer-correct.java |
	grep "^@@.*@@ Beer"
@@ -7,7 +7,7 @@ Beer

ok 31 - pattern which matches to end of line
expecting success: 
	git config diff.java.xfuncname "^[ 	]*((public|static).*)$" &&
	git diff --no-index Beer.java Beer-correct.java |
	grep "^@@.*@@ public static void main("
@@ -7,7 +7,7 @@ public static void main(String args[])
ok 32 - alternation in pattern
# passed all 32 test(s)
1..32

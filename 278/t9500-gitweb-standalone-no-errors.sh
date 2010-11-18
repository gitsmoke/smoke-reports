ok 1 - no commits: projects_list (implicit)
ok 2 - no commits: projects_index
ok 3 - no commits: .git summary (implicit)
ok 4 - no commits: .git commit (implicit HEAD)
ok 5 - no commits: .git commitdiff (implicit HEAD)
ok 6 - no commits: .git tree (implicit HEAD)
ok 7 - no commits: .git heads
ok 8 - no commits: .git tags
ok 9 - Make initial commit
ok 10 - projects_list (implicit)
ok 11 - projects_index
ok 12 - .git summary (implicit)
ok 13 - .git commit (implicit HEAD)
ok 14 - .git commitdiff (implicit HEAD, root commit)
ok 15 - .git commitdiff_plain (implicit HEAD, root commit)
ok 16 - .git commit (HEAD)
ok 17 - .git tree (implicit HEAD)
ok 18 - .git blob (file)
ok 19 - .git blob_plain (file)
ok 20 - .git commit (non-existent)
ok 21 - .git commitdiff (non-existent)
ok 22 - .git commitdiff (non-existent vs HEAD)
ok 23 - .git tree (0000000000000000000000000000000000000000)
ok 24 - .git tag (0000000000000000000000000000000000000000)
ok 25 - .git blob (non-existent)
ok 26 - .git blob_plain (non-existent)
ok 27 - commitdiff(0): root
ok 28 - commitdiff(0): file added
ok 29 - commitdiff(0): mode change
ok 30 - commitdiff(0): file renamed
ok 31 - commitdiff(0): file to symlink
ok 32 - commitdiff(0): file deleted
ok 33 - commitdiff(0): file copied / new file
ok 34 - commitdiff(0): mode change and modified
ok 35 - commitdiff(0): renamed and modified
ok 36 - commitdiff(0): renamed, mode change and modified
ok 37 - setup typechange commits
ok 38 - commitdiff(2): file renamed from foo to foo/baz
ok 39 - commitdiff(2): file renamed from foo/baz to foo
ok 40 - commitdiff(2): directory becomes file
ok 41 - commitdiff(2): file becomes directory
ok 42 - commitdiff(2): file becomes symlink
ok 43 - commitdiff(2): symlink becomes file
ok 44 - commitdiff(2): symlink becomes directory
ok 45 - commitdiff(2): directory becomes symlink
ok 46 - Create a merge
ok 47 - commit(0): merge commit
ok 48 - commitdiff(0): merge commit
ok 49 - Prepare large commit
ok 50 - commit(1): large commit
ok 51 - commitdiff(1): large commit
ok 52 - tags: list of different types of tags
ok 53 - tag: Tag to commit object
ok 54 - tag: on lightweight tag (invalid)
ok 55 - logs: log (implicit HEAD)
ok 56 - logs: shortlog (implicit HEAD)
ok 57 - logs: history (implicit HEAD, file)
ok 58 - logs: history (implicit HEAD, non-existent file)
ok 59 - logs: history (implicit HEAD, deleted file)
ok 60 - path_info: project
ok 61 - path_info: project/branch
ok 62 - path_info: project/branch:file
ok 63 - path_info: project/branch:dir/
ok 64 - path_info: project/branch:file (non-existent)
ok 65 - path_info: project/branch:dir/ (non-existent)
ok 66 - path_info: project/branch:/file
ok 67 - path_info: project/:/file (implicit HEAD)
ok 68 - path_info: project/:/ (implicit HEAD, top tree)
ok 69 - feeds: OPML
ok 70 - feed: RSS
ok 71 - feed: Atom
ok 72 - encode(commit): utf8
ok 73 - encode(commit): iso-8859-1
ok 74 - encode(log): utf-8 and iso-8859-1
ok 75 - opt: log --no-merges
ok 76 - opt: atom --no-merges
ok 77 - opt: "file" history --no-merges
ok 78 - opt: log --no-such-option (invalid option)
ok 79 - opt: tree --no-merges (invalid option for action)
ok 80 - URL: no project URLs, no base URL
ok 81 - URL: project URLs via gitweb.url
ok 82 - URL: project URLs via cloneurl file
ok 83 - config override: projects list (implicit)
ok 84 - config override: tree view, features not overridden in repo config
ok 85 - config override: tree view, features disabled in repo config
ok 86 - config override: tree view, features enabled in repo config (1)
ok 87 - config override: tree view, features enabled in repo config (2)
ok 88 - README.html with non-ASCII characters (utf-8)
ok 89 - syntax highlighting (no highlight, unknown syntax)
ok 90 - syntax highlighting (highlighted, shell script)
# passed all 90 test(s)
1..90

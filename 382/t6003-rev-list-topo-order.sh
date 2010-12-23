Initialized empty Git repository in /Users/trast/git-smoke/t/trash directory.t6003-rev-list-topo-order/.git/
expecting success: check_output rev-list-has-correct-number-of-entries "git rev-list HEAD | wc -l | tr -d \" \""
ok 1 - rev-list has correct number of entries
expecting success: check_output simple-topo-order "git rev-list --topo-order  HEAD"
ok 2 - simple topo order
expecting success: check_output two-diamonds-topo-order-g6 "git rev-list --topo-order  g4"

ok 3 - two diamonds topo order (g6)

expecting success: check_output multiple-heads "git rev-list --topo-order a3 b3 c3"

ok 4 - multiple heads

expecting success: check_output multiple-heads-prune-at-a1 "git rev-list --topo-order a3 b3 c3 ^a1"

ok 5 - multiple heads, prune at a1

expecting success: check_output multiple-heads-prune-at-l1 "git rev-list --topo-order a3 b3 c3 ^l1"

ok 6 - multiple heads, prune at l1
expecting success: check_output cross-epoch-head-at-l5-prune-at-l1 "git rev-list --topo-order l5 ^l1"
ok 7 - cross-epoch, head at l5, prune at l1
expecting success: check_output duplicated-head-arguments "git rev-list --topo-order l5 l5 ^l1"

ok 8 - duplicated head arguments

expecting success: check_output prune-near-topo "git rev-list --topo-order a4 ^c3"

ok 9 - prune near topo
expecting success: check_output head-has-no-parent "git rev-list --topo-order  root"

ok 10 - head has no parent
expecting success: check_output two-nodes-one-head-one-base "git rev-list --topo-order  l0"
ok 11 - two nodes - one head, one base
expecting success: check_output three-nodes-one-head-one-internal-one-base "git rev-list --topo-order  l1"

ok 12 - three nodes one head, one internal, one base
expecting success: check_output linear-prune-l2-root "git rev-list --topo-order  l2 ^root"
ok 13 - linear prune l2 ^root
expecting success: check_output linear-prune-l2-l0 "git rev-list --topo-order  l2 ^l0"

ok 14 - linear prune l2 ^l0

expecting success: check_output linear-prune-l2-l1 "git rev-list --topo-order  l2 ^l1"

ok 15 - linear prune l2 ^l1
expecting success: check_output linear-prune-l5-a4 "git rev-list --topo-order  l5 ^a4"
ok 16 - linear prune l5 ^a4
expecting success: check_output linear-prune-l5-l3 "git rev-list --topo-order  l5 ^l3"
ok 17 - linear prune l5 ^l3
expecting success: check_output linear-prune-l5-l4 "git rev-list --topo-order  l5 ^l4"
ok 18 - linear prune l5 ^l4
expecting success: check_output max-count-10-topo-order "git rev-list --topo-order  --max-count=10 l5"

ok 19 - max-count 10 - topo order

expecting success: check_output max-count-10-non-topo-order "git rev-list --max-count=10 l5"

ok 20 - max-count 10 - non topo order
expecting success: check_output max-age-c3-no-topo-order "git rev-list --max-age=51148811 l5"
ok 21 - --max-age=c3, no --topo-order
expecting success: check_output one-specified-head-reachable-from-another-a4-c3-topo-order "list_duplicates git rev-list --topo-order a4 c3"
ok 22 - one specified head reachable from another a4, c3, --topo-order
expecting success: check_output one-specified-head-reachable-from-another-c3-a4-topo-order "list_duplicates git rev-list --topo-order c3 a4"

ok 23 - one specified head reachable from another c3, a4, --topo-order
expecting success: check_output one-specified-head-reachable-from-another-a4-c3-no-topo-order "list_duplicates git rev-list a4 c3"
ok 24 - one specified head reachable from another a4, c3, no --topo-order
expecting success: check_output one-specified-head-reachable-from-another-c3-a4-no-topo-order "list_duplicates git rev-list c3 a4"

ok 25 - one specified head reachable from another c3, a4, no --topo-order
expecting success: check_output graph-with-c3-and-a4-parents-of-head "list_duplicates git rev-list m1"
ok 26 - graph with c3 and a4 parents of head
expecting success: check_output graph-with-a4-and-c3-parents-of-head "list_duplicates git rev-list m2"
ok 27 - graph with a4 and c3 parents of head
expecting success: git rev-list --topo-order  a3 ^a3
ok 28 - head ^head --topo-order
expecting success: git rev-list a3 ^a3
ok 29 - head ^head no --topo-order
expecting success: check_output simple-topo-order-l5r1 "git rev-list --topo-order  l5r1"

ok 30 - simple topo order (l5r1)
expecting success: check_output simple-topo-order-r1l5 "git rev-list --topo-order  r1l5"
ok 31 - simple topo order (r1l5)
expecting success: check_output don-t-print-things-unreachable-from-one-branch "git rev-list a3 ^b3 --topo-order"

ok 32 - don't print things unreachable from one branch

expecting success: check_output topo-order-a4-l3 "git rev-list --topo-order a4 l3"

ok 33 - --topo-order a4 l3
# passed all 33 test(s)
1..33

# Author: PeerHeer
#
# Start iteration by initializing the iterator and then iterating over the iterable.

# Initialize iterator.
function dynalist:_operations/initialize_iterator

# Start the iteration if the list is not empty.
execute unless score $dynalist.iterator.length dynalist.var matches 0 run function dynalist:_operations/indexof/iterate

# If the comparison was not successful, set the length to -1.
execute unless score $dynalist.compare.result dynalist.var matches 0 run scoreboard players set $dynalist.iterator.length dynalist.var -1


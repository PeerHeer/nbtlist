# As long as index is not found, append to list. This skips the appending of the element to delete.
execute unless score #nbtlist.operation.delete.index nbtlist.var = #nbtlist.iterator.index nbtlist.var run data modify storage nbtlist:operation Result.Delete.List append from storage nbtlist:iterator Iterable[0]
execute if score #nbtlist.operation.delete.index nbtlist.var = #nbtlist.iterator.index nbtlist.var run scoreboard players set #nbtlist.operation.success nbtlist.var 1
execute store result storage nbtlist:operation Result.Delete.Success byte 1.0 run scoreboard players get #nbtlist.operation.success nbtlist.var
#> operations/lookup/get_args.mcfunction
# Get the arguments for the lookup operation from 'nbtlist:args'.
#
#> Arguments from nbtlist:ags:
#   Index: the index to look up
#   Data: the data to look up
#> Returns:
#   #nbtlist.operation.args.index nbtlist.var: the index to look up.

# Load arguments for the lookup operation.
data modify storage nbtlist:iterator Args.Index set from storage nbtlist:args Index
data modify storage nbtlist:iterator Args.Data set from storage nbtlist:args Data

# Check if Data is present.
execute store result score #nbtlist.operation.has_data nbtlist.var run data get storage nbtlist:iterator Args.Data
# If data is not present, store the index in the '#nbtlist.operation.args.index nbtlist.var' variable.
execute if score #nbtlist.operation.has_data nbtlist.var matches 0 store result score #nbtlist.operation.args.index nbtlist.var run data get storage nbtlist:iterator Args.Index
execute if score #nbtlist.operation.has_data nbtlist.var matches 0 if score #nbtlist.operation.args.index nbtlist.var matches ..-1 run function nbtlist:generic/convert_negative_index

tellraw @p ["",{"score":{"name":"#nbtlist.operation.args.index","objective":"nbtlist.var"}}]
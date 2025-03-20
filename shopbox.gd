extends HBoxContainer

#When adding button/item: 
#After making it's .tres, set it's info in the exported vars
#Manually set these in the shopboxes
#Add the .tres to its array in the game node
#Find its position in the array 
#Put the position in arraypos for text in children
@export var upgrade_name : String
@export var upgrade_arraypos : int
@export_enum("idle", "task") var upgrade_type : String

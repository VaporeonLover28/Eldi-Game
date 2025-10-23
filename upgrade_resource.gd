extends Resource; class_name Upgrade_resource;

@export_category("Upgrade Data")
@export_enum("Idle", "Task") var upgrade_type : int
#general varibles
@export var Name : String
@export var Price : int
@export var Income : float
@export var rating : float
#minigame related varibles
@export var minigame_scene: PackedScene
@export var minigame_window_size: Vector2i
@export var minigame_id : int
@export var minigame_time : float
@export var minigame_step_income : int
@export var minigame_win_income : int
@export var description : String

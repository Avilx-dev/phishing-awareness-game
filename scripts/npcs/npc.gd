extends CharacterBody3D

enum NPCState { PATROL, SUSPICIOUS, ALERTED, INTERVIEW }

@export var npc_name: String = "Empleado"
@export var vision_range: float = 8.0
@export var vision_angle_deg: float = 60.0
@export var move_speed: float = 2.5
@export var suspicion_per_frame: float = 0.5

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D

var state: NPCState = NPCState.PATROL
var player_ref: Node3D = null

func _ready():
	player_ref = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	_check_vision()

func _check_vision():
	if player_ref == null:
		return
	var to_player = player_ref.global_position - global_position
	if to_player.length() > vision_range:
		return
	var angle = rad_to_deg(transform.basis.z.angle_to(to_player.normalized()))
	if abs(angle) > vision_angle_deg / 2.0:
		return
	var space = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(
		global_position + Vector3.UP * 1.5,
		player_ref.global_position + Vector3.UP * 1.0
	)
	query.exclude = [self]
	var result = space.intersect_ray(query)
	if result and result.collider == player_ref:
		var gm = get_tree().get_first_node_in_group("game_manager")
		if gm:
			gm.add_suspicion(suspicion_per_frame, npc_name + " te vio")

func interact(_player):
	state = NPCState.INTERVIEW
	var gm = get_tree().get_first_node_in_group("game_manager")
	if gm:
		gm.start_interview(npc_name)

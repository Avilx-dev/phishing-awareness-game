extends Node

enum GameMode { DETECTIVE, INSIDER }
enum GameState { MENU, PLAYING, PAUSED, WIN, LOSE }

var current_mode: GameMode = GameMode.DETECTIVE
var current_state: GameState = GameState.MENU
var suspicion_level: float = 0.0
const SUSPICION_CAP: float = 100.0
const SUSPICION_DECAY_RATE: float = 2.0
var clues_found: int = 0
var total_clues: int = 5

signal suspicion_changed(new_value: float)
signal clue_found(clue_id: String)
signal game_over(won: bool, reason: String)
signal mode_changed(new_mode: GameMode)
signal interview_started(npc_name: String)

func _ready():
	set_process(true)

func _process(delta):
	if current_state != GameState.PLAYING:
		return
	if current_mode == GameMode.INSIDER:
		suspicion_level = max(0.0, suspicion_level - SUSPICION_DECAY_RATE * delta)
		emit_signal("suspicion_changed", suspicion_level)

func set_mode(mode: GameMode):
	current_mode = mode
	suspicion_level = 0.0
	clues_found = 0
	emit_signal("mode_changed", mode)

func start_game():
	current_state = GameState.PLAYING

func add_suspicion(amount: float, reason: String = ""):
	if current_mode != GameMode.INSIDER:
		return
	suspicion_level = clamp(suspicion_level + amount, 0.0, SUSPICION_CAP)
	emit_signal("suspicion_changed", suspicion_level)
	if suspicion_level >= SUSPICION_CAP:
		current_state = GameState.LOSE
		emit_signal("game_over", false, "Fuiste descubierto: " + reason)

func register_clue(clue_id: String):
	clues_found += 1
	emit_signal("clue_found", clue_id)
	if clues_found >= total_clues:
		current_state = GameState.WIN
		emit_signal("game_over", true, "Encontraste todas las pistas")

func start_interview(npc_name: String):
	emit_signal("interview_started", npc_name)

extends Node

export (PackedScene) var missile_scene


func _ready():
	randomize()


func _on_MissileTimer_timeout():
	# Create a new instance of the Missile scene.
	var missile = missile_scene.instance()
	
	# Choose a random location on the SpawnPath.
	# We store the reference to the SpawnLocation node.
	var missile_spawn_location = get_node("SpawnPath/SpawnLocation")
	# And give it a random offset.
	missile_spawn_location.unit_offset = randf()
	
	var player_position = $Player.transform.origin
	missile.initialize(missile_spawn_location.translation, player_position, $Player)
	
	add_child(missile)

func _on_Player_hit():
	$MissileTimer.stop()

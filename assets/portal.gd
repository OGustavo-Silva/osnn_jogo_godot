extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
export(String, FILE, "*.tscn") var cenas


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_portal_body_entered(body):
	get_tree().change_scene(cenas)
	 # Replace with function body.

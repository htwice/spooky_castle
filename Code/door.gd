extends Area2D

#func _on_area_2d_area_entered(area):
	#get_tree().change_scene_to_file("res://Scene/main_scene.tscn")
	#if body.name == "Character":
	#	print('Made it')
	#	get_tree().change_scene_to_file("res://Scene/main_scene.tscn")

func _on_area_2d_body_entered(body):
	print("Hi!")
	print(body)
	if(body.name == "Character"):
		get_tree().change_scene_to_file("res://Scene/outside.tscn")

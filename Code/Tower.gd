extends CharacterBody2D

const SPEED = 300.0
@export var Bullet: PackedScene
@export var fire_rate = 0.2
var actual_rate = 0.2
var timer = 0

var power = false
var power_timer = 0

@onready var absolute_parent = get_parent()

# controls the player's movement when they die.
var die: bool = false
@export var enemy_name = "Enemies"
var enemy
# Used to increase the score (Spawners should be the child of a "scene" node)
@export var score_value = 1

#func _ready():
#	if absolute_parent.get_node_or_null(enemy_name) != null:
#		enemy = absolute_parent.get_node(enemy_name)
		

func _physics_process(delta):
	timer += delta
	
	#if absolute_parent.get_node_or_null(enemy_name) != null:
	enemy = get_tree().get_nodes_in_group(enemy_name)
	#print(enemy)
	
	#if enemy != null:
		#self.look_at(enemy.get("position"))
		#self.velocity = Vector2(0, 0)
	# Power up that you can get :D
	if power == true:
		power_timer += delta
		actual_rate = fire_rate / 2
		if power_timer >= 10:
			power = false
	else:
		actual_rate = fire_rate
		power_timer = 0
	
	# if the player isn't dead...
	#if Input.get_action_raw_strength("Shoot") && timer >= actual_rate:
	if(timer > 10):
		var temp = Bullet.instantiate()
		add_sibling(temp)
		temp.global_position = get_node("BulletSpawn").get("global_position")
		# this sets the rotation as to where it will fire
		#print("N word")
		
		if(enemy) :
			#print("Hello!")
			temp.set("area_direction", (enemy[0].get("position") - self.global_position).normalized())#(get_global_mouse_position() - self.global_position).normalized())
		
		timer = 0
		
	timer += 1

# all the things that it do when you die.
func Die():
	get_node("Explosive").set_emitting(true)
	get_node("Explosive/Sound").play()
	self.get_node("MeshInstance2D").set("visible", false)
	die = true
	#Wait 1.5 seconds before showing retry screen
	await get_tree().create_timer(1.5).timeout
	#Show Retry Background over whole screen
	$"../Retry".show()
	
# Reload Scene
func Respawn():
	get_tree().reload_current_scene()

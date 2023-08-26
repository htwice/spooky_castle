extends Node2D

@onready var Background = get_node("Background")

var Score = 0
var Coin = 0


func _ready():
	#Hide Retry UI on Start
	$Retry.hide()
	$Menu.hide()
	#Get "Respawn" mapping name
	var respawn_events = InputMap.action_get_events("Respawn")
	var respawn_event = respawn_events[0]
	var button_name = OS.get_keycode_string(respawn_event.physical_keycode)
	#Update Label to use mapping name
	var retry_label = $Retry/Label
	retry_label.text = "Press " + button_name + " to retry"

func _process(_delta):
	# This can always be changed.
	Background.get_node("Score").set("text", "Score: " + str(Score) + "\nCoins: " + str(Coin) + "\nWave: " + str(GConstants.waveNumber))
	
	#if player hits respawn button, start and stop spawning ./
	
	if Input.is_action_just_pressed("Respawn"):
		var roundActive = GConstants.roundStart
		print(roundActive)
		if (roundActive):
			GConstants.roundStart = false
			$Menu.show()
		else :
			$Menu.hide()
			GConstants.roundStart = true
			print(GConstants.waveNumber)
			GConstants.waveNumber += 1
			print(GConstants.waveNumber)
			


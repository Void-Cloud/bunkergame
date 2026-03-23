extends Node2D

@onready var lineEdit = $LineEdit
@onready var printOut = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Global.is_computer_interacted):
		if Input.is_action_just_pressed("enter"):
			parse_text(lineEdit.text)
			lineEdit.text = ""
		lineEdit.grab_focus()
		if Input.is_action_just_pressed("cancel"):
			Global.is_computer_interacted = false
			lineEdit.release_focus()

func parse_text(command: String):
	command.to_lower()
	match command:
		"help":
			write_to_print_out("Use 'open' command to open the door.")
		"open":
			write_to_print_out("Opening the door.")
		"":
			write_to_print_out(" ")
		_:
			write_to_print_out("Command: '" + command + "' not found.")

func write_to_print_out(text: String):
	var oldPrint = printOut.text
	print(oldPrint)
	var newPrint = oldPrint + "\n" + text
	printOut.text = newPrint

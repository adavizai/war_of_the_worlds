extends Node2D

onready var lasers = $Lasers
onready var plane = $Plane

func _ready():
	plane.connect("laser_shot", self, "_on_Plane_laser_shot")

func _on_Plane_laser_shot(laser):
	lasers.add_child(laser)

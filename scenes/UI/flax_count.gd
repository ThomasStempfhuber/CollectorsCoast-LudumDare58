extends Label

var red = Color(1.0,0,0)
var white = Color(1.0,1.0,1.0)

func _process(_delta):
	text = str(Global.flax)
	
	if Global.flax == Global.storage_limit:
		set("theme_override_colors/font_color",red)
	else:
			set("theme_override_colors/font_color",white)

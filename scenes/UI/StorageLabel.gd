extends RichTextLabel

func _process(_delta):
	text = "storage capacity [img]res://assets/art/icons/IconStorage.png[/img] " + str(Global.storage_limit)

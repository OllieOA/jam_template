extends MarginContainer


@export (NodePath) onready var discord_button = get_node(discord_button) as Button


const DISCORD_LINK = "https://discord.gg/yhQEzQtQ4K"
const ITCH_LINK = "https://ollieoa.itch.io/"
const TWITCH_LINK = "https://www.twitch.tv/ollieboyoa"


# =-----=
# SOCIALS
# =-----=

func _on_DiscordLink_pressed() -> void:
	OS.shell_open(DISCORD_LINK)


func _on_ItchLink_pressed() -> void:
	OS.shell_open(ITCH_LINK)


func _on_TwitchLink_pressed() -> void:
	OS.shell_open(TWITCH_LINK)

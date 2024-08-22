extends Node
#Event bus singleton: Use for events that need to communicate across multiple levels of hierarchy.

signal move2Ended

signal playerHealthUpdated(newHealth, maxHealth, characterName)

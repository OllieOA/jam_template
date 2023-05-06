extends Node

signal signal_triggered
signal signal_triggered_with(variable: int)

# To access these, run SignalBus.emit("signal_triggered") or 
# SignalBus.emit("signal_triggered_with", variable)

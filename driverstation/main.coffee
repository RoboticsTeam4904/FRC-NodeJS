frc = require 'frc'
GamePad = require 'node-gamepad'
#prompt = require 'prompt'


#ds = frc DriverStation: true

#controller = new GamePad 'logitech/extreme3dpro'
controller = new GamePad 'microsoft/xbox'
controller.connect()

controller.on 'up:press', () ->
    console.log 'up'
controller.on 'down:press', () ->
    console.log 'down'

#ds.connect()

#console.log(ds.joysticks)

'''
schema =
	properties:
		mode:
			description: ">"
			pattern: /^(?:[TADSREV!]|Teleoperated|Teleop|Autonomous|Disabled|Off|Test|Soft Reboot|Soft|Reboot|Emergency Stopped|Emergency|Stop)$/i
			message: "[T]eleoperated, [A]utonomous, [D]isabled, Te[s]t, Soft [R]eboot, [E]mergency Stopped"
			required: true

prompt.start()
prompt.message = ""
prompt.delimiter = ""
prompt.colors = false

takeInput = () ->
	prompt.get schema, (err, result) ->
		throw err if err
		switch result.mode.toLowerCase()
			when "t", "teleop", "teleoperated" then ds.enable("Teleoperated")
			when "a", "autonomous" then ds.enable("Autonomous")
			when "d", "off", "disabled" then ds.enable("Disabled")
			when "s", "test" then ds.enable("Test")
			when "r", "soft", "reboot", "soft reboot" then ds.enable("Soft Reboot")
			when "e", "!", "emergency", "stop", "emergency stopped" then ds.enable("Emergency Stopped")
			else throw new Error("Unknown mode passed validation: #{result.mode}")
		takeInput()

takeInput()
'''
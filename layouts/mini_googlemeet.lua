require "keybow"

-- Keybow MINI volume controls --

function setup()
    keybow.use_mini()
    keybow.auto_lights(false)
    keybow.clear_lights()
    keybow.set_pixel(0, 25, 25, 255)
    keybow.set_pixel(1, 255, 100, 0)
    keybow.set_pixel(2, 10, 255, 10)
end

-- Key mappings --

-- fullscreen
function handle_minikey_00(pressed)
	keybow.set_key(keybow.F11, pressed)
end

-- toggle video
function handle_minikey_01(pressed)
    if pressed then
		keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
    	keybow.tap_key("e", pressed)
    	keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
		keybow.set_pixel(1, 255, 60, 40)
	else
		keybow.set_pixel(1, 255, 100, 0)
	end
end

-- toggle mute
function handle_minikey_02(pressed)
	if pressed then 
    	keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
    	keybow.tap_key("d", pressed)
    	keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
		keybow.set_pixel(2, 255, 60, 40)
	else
		keybow.set_pixel(2, 10, 255, 10)
	end
end

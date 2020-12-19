require "keybow"

-- Keybow MINI volume controls --

function setup()
    keybow.use_mini()
    keybow.auto_lights(true)
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
	end
end

-- toggle mute
function handle_minikey_02(pressed)
	if pressed then 
    	keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_DOWN)
    	keybow.tap_key("d", pressed)
    	keybow.set_modifier(keybow.LEFT_CTRL, keybow.KEY_UP)
	end
end

local bump = require 'Libs/bump'

world = bump.newWorld(64)


local push = require 'Libs/push'




local gameWidth, gameHeight = 640, 360
local windowWidth, windowHeight = love.window.getDesktopDimensions()
windowWidth, windowHeight = windowWidth*.7, windowHeight*.7 --make the window a bit smaller than the screen itself

push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false})

camera = require 'Libs/camera'
cam = camera()
sti = require "Libs/sti"
Object = require 'Libs/classes'

MainRoom = require('MainRoom')
mainRoom = MainRoom()

maincharacter = require('player')
Player = maincharacter()

local collision = require 'Collision'


function camupdate(dt)
	local w = love.graphics.getWidth()
	local h = love.graphics.getHeight()
	local mapw = mainRoom.width * mainRoom.MainCharRoom.tilewidth
	local maph = mainRoom.height * mainRoom.MainCharRoom.tileheight

	cam:lookAt(Player.x + 400,Player.y + 240)

	if cam.x < w/2 then
		cam.x = w/2
	end
	if cam.y < h/2 then
		cam.y = h/2
	end

	if cam.x > w/2 then
		cam.x = w/2
	end
	if cam.y > h/2 then
		cam.y = h/2
	end
end


function love.main()
end



function love.update(dt)
	Player:update(dt)
	PlayerWallCollision(dt)
	camupdate(dt)
end

function love.draw()
	push:start()
	cam:attach()
		mainRoom:draw()
		Player:draw()
	cam:detach()
	push:finish()
end

return world
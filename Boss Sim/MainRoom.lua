MainRoom = Object.extend(Object)

function MainRoom:new()
	self.x = 0
	self.y = 0
	self.width = 1900
	self.height = 1000
	self.MainCharRoom = sti('Assets/Maps/MainRoom/MainCharRoom.lua')
end

function MainRoom:update(dt)

end

function MainRoom:draw()
		self.MainCharRoom:drawLayer(self.MainCharRoom.layers['TileLayer1'])
		self.MainCharRoom:drawLayer(self.MainCharRoom.layers['RightWingRoom'])
		self.MainCharRoom:drawLayer(self.MainCharRoom.layers['Misc'])
		self.MainCharRoom:drawLayer(self.MainCharRoom.layers['Clock'])
end

return MainRoom
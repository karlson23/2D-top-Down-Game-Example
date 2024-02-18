Player = Object.extend(Object)

function Player:new()
	self.x = 10
	self.y = 250
	self.width = 15
	self.height = 15


	self.speed = 50
	self.MainImage = love.graphics.newImage('/Assets/Player/Front.png')
	self.Front = love.graphics.newImage('/Assets/Player/Front.png')
	self.Down = love.graphics.newImage('Assets/Player/Down.png')
	self.Right = love.graphics.newImage('Assets/Player/Right.png')
	self.Left = love.graphics.newImage('Assets/Player/Left.png')
	self.Back = love.graphics.newImage('Assets/Player/Back.png')

	self.ismoving = false

	self.last = {}
    self.last.x = self.x
    self.last.y = self.y

end

function love.mousepressed( x, y, button, istouch, presses )
end



function Player:update(dt)
	local goalX, goalY = self.x,self.y -- this is where I want the player to go
	local actualX, actualY, cols, len = world:move(Player, goalX, goalY)
	self.x,self.y = actualX,actualY

 	if love.keyboard.isDown('a') then
        actualX = actualX - self.speed * dt
        self.x = self.x - self.speed * dt 
        self.MainImage = self.Left
        self.ismoving = true
    else
    	self.moving = false
    end
    if love.keyboard.isDown('d') then
        actualX = actualX + self.speed * dt
        self.x = self.x + self.speed * dt
        self.MainImage = self.Right
        self.ismoving = true
    else
    	self.moving = false
    end
    if love.keyboard.isDown('w') then
        actualY = actualY - self.speed * dt
        self.y = self.y - self.speed * dt 
        self.MainImage = self.Back
        self.ismoving = true
    else
    	self.moving = false
    end
    if love.keyboard.isDown('s') then
        actualY = actualY + self.speed * dt
        self.y = self.y + self.speed * dt 
        self.MainImage = self.Down
        self.ismoving = true
    else
    	self.moving = false
 	end

 	if self.ismoving == false then
 		self.MainImage = self.Front
 	end
	self.last.x = self.x
    self.last.y = self.y
end

function Player:draw()
		self.MainImage:setFilter('nearest','nearest')
		love.graphics.rectangle('line',self.x  ,self.y,self.width,self.height)
		love.graphics.draw(self.MainImage, self.x,self.y)
end

return Player
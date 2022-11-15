Cube ={}
Cube.__index = Cube


function Cube:create(position,rIndoCicle,active)
    local cube = {}
    setmetatable(cube,Cube)
    cube.rIndoCicle = rIndoCicle or 40
    cube.startRIndoCicle = rIndoCicle or 40
    cube.active = active 
    cube.position = position 
    return cube
end

function Cube:update(overPosition)
   
    self.position = overPosition or self.position
    if self.active then 
        self.rIndoCicle = self.rIndoCicle -  0.1
        if self.rIndoCicle<=0 then
            self.active=false
        end
    end
end

function Cube:draw()

    Xpoint2 = self.position.x + self.rIndoCicle
    Ypoint2 = self.position.y

    Xpoint3 = Xpoint2
    Ypoint3 = Ypoint2 + self.rIndoCicle

    Xpoint4 = self.position.x 
    Ypoint4 = self.position.y +self.rIndoCicle
    love.graphics.line( self.position.x,self.position.y,Xpoint2,Ypoint2)
    love.graphics.line( Xpoint2,Ypoint2,Xpoint3,Ypoint3)
    love.graphics.line( Xpoint4,Ypoint4,Xpoint3,Ypoint3)
    love.graphics.line( Xpoint4,Ypoint4,self.position.x,self.position.y)
end

function Cube:__tostring()
    return  "Cube"
end

function Cube:copy()
    return Cube:create(self.position,self.startRIndoCicle,true)
end
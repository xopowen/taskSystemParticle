Particle = {}
Particle.__index = Particle

function Particle:create(position,cls,r)
    local particle = {}
    setmetatable(particle,Particle)
    particle.object = cls:create(position ,r,true)
    particle.position =  position:copy()
    particle.acceleration = Vector:create(0,math.random(0.005,0.01))
    particle.velocity = Vector:create(math.random(-10,10)/10,math.random(0,-10)/10)
    return particle
end

function Particle:update()
    self.velocity:add(self.acceleration)
    self.position:add(self.velocity)
    self.object:update(self.position)
end
 

-- function Particle:applyForce(force)
--     self.acceleration:add(force)
-- end
 
function Particle:draw()
    self.object:draw()
end
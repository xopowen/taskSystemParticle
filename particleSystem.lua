ParticleSystem = {}
ParticleSystem.__index = ParticleSystem

function  ParticleSystem:create(position,cls,r,n)
    local system ={}
    setmetatable(system,ParticleSystem)
    system.cls=cls
    system.r=r
    system.object = cls:create(position,r,true) 
    system.position = position
    system.n = n  
    system.particles = {}
    system.index = 1
    system.active = true
    return system
end

function ParticleSystem:draw()
   
    for k,v in pairs(self.particles) do
        v:draw()
    end
end

-- function ParticleSystem:applyForce(force)
--     for k,v in pairs(self.particles) do
--         v:applyForce(force)
--     end
-- end

function ParticleSystem:update()
    if #self.particles< self.n then
            self.particles[self.index] = Particle:create( self.object.position, self.cls,self.r)
          
        self.index = self.index + 1
    end
  
    for k,v in pairs(self.particles) do
            v:update()
    end
end
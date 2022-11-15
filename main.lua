require("vector")
require("particle")
require("particleSystem")
-- require("repeller")
require("cube")

mamberMover = 10

function love.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    cube =  Cube:create(Vector:create(x, y),40,true)
    cubes = {}
    cubesIndex = 1
end

function love.update(dt)
  
    for k,v in pairs(cubes) do
        if v.active then
            v:update()
        else
            if v then
                cubes[k] = ParticleSystem:create(v.position,Cube,v.startRIndoCicle,10)
            end
        end
    end
    
end

function love.draw()
    for k,v in pairs(cubes) do
        v:draw()
    end
end


function love.mousepressed(x, y,button,istouch,pressed)
    if button == 1 then
        cubes[cubesIndex] =  Cube:create(Vector:create(x, y),40,true)
        
        cubesIndex = cubesIndex + 1
        if cubesIndex >10 then 
            cubesIndex = 1
        end
    end
end
 
local Test = Object:extend()

function Test:new()
end


function Test:draw()
	love.graphics.rectangle("fill", 10,10,30,30)
end
return Test
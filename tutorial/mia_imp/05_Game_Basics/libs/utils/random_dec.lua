function random_dec(min, max)
    if not max then
        return love.math.random()*min
    else
        return love.math.random()*(max - min) + min
    end
end
return random_dec
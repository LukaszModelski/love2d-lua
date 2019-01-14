function love.load()
    player = {}
    player.x = 0
    player.y = 0
    player.size = 20
    player.speed = 4
    player.bullets = {}
    player.fire = function()
        bullet = {}
        bullet.size = 5
        bullet.x = player.x + player.size/2
        bullet.y = player.y + player.size/2
        table.insert(player.bullets, bullet)
    end
end

function love.update(dt)
    -- player movement
    if (love.keyboard.isDown("right") and love.keyboard.isDown("down")) then
        player.x = player.x + player.speed
        player.y = player.y + player.speed
    elseif (love.keyboard.isDown("right") and love.keyboard.isDown("up")) then
        player.x = player.x + player.speed
        player.y = player.y - player.speed
    elseif (love.keyboard.isDown("left") and love.keyboard.isDown("down")) then
        player.x = player.x - player.speed
        player.y = player.y + player.speed
    elseif (love.keyboard.isDown("left") and love.keyboard.isDown("up")) then
        player.x = player.x - player.speed
        player.y = player.y - player.speed
    elseif love.keyboard.isDown("right") then
        player.x = player.x + player.speed
    elseif love.keyboard.isDown("left") then
        player.x = player.x - player.speed
    elseif love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    elseif love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end

    -- bullet movement
    if love.keyboard.isDown("s") then
        player.fire()
    end

    for i,b in ipairs(player.bullets) do
        b.y = b.y - 20
    end

end

function love.draw()
    -- draw player
    love.graphics.setColor(0, 255, 0)
    love.graphics.rectangle("fill", player.x, player.y, player.size, player.size)

    -- draw bullets
    love.graphics.setColor(255, 255, 255)
    for i,b in ipairs(player.bullets) do
        love.graphics.rectangle("fill", b.x, b.y, b.size, b.size)
    end
end
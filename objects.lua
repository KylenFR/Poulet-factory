
require('constants')

function menu()

  local resizeX = width / 576
  local resizeY = height / 1075
  local resize = (20 * width / 100) / 96

  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(background, 0, 0, 0, resizeX, resizeY)

  love.graphics.setColor(97, 56, 11)
  love.graphics.rectangle('fill', 15 * width / 100, 15 * height / 100, 70 * width / 100, 50 * height / 100, 5 * width / 100)
  love.graphics.setColor(147, 106, 61)
  love.graphics.rectangle('fill', 20 * width / 100, 20 * height / 100, 60 * width / 100, 40 * height / 100, 5 * width / 100)

  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(pouletImage, 30 * width / 100, 35 * height / 100, 0, resize, resize)

  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle('fill', width / 2 - width / 10, 65 * height / 100 - height / 10, width / 5, width / 5, width / 20)

  love.graphics.setColor(147, 106, 61)
  love.graphics.polygon('fill', width / 2 - 33 * (width / 10) / 100, 65 * height / 100 - height / 10 + width / 10 - 66 * (width / 10) / 100, width / 2 + 33 * (width / 5) / 100, 65 * height / 100 - height / 10 + width / 10, width / 2 - 33 * (width / 10) / 100, 65 * height / 100 - height / 10 + width / 10 + 66 * (width / 10) / 100)

  -- a remplacer
  love.graphics.setColor(0, 0, 0)
  love.graphics.print('POULET FACTORY', 25 * width / 100, 25 * height / 100, 0, 4, 4)

  local istouch = love.mouse.isDown(1)
  local posX = love.mouse.getX()
  local posY = love.mouse.getY()
  if istouch == true and posX > width / 2 - width / 10 and posX < width / 5 + width / 2 - width / 10 and posY > 65 * height / 100 - height / 10 and posY < 65 * height / 100 - height / 10 + width / 5 then
      menuL = false
      level = true

  end
end


function selectDifficulty()
  local isTouch = love.mouse.isDown(1)

  if isTouch == true then
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()

    -- test dans le bouton
    if mouseX > 1.5 * width / 100 and mouseX < ((1.5 * width / 100) + 30 * width / 100)  and mouseY > 80 * height / 100 and mouseY < ((80 * height / 100) + height / 20) then
      difficulty = "easy"
    end

    if mouseX > 34.5 * width / 100 and mouseX < ((34.5 * width / 100) + 31 * width / 100) and mouseY > 80 * height / 100 and mouseY < ((80 * height / 100) + height / 20) then
      difficulty = "normal"
    end

    if mouseX > 68.5 * width / 100 and mouseX < ((68.5 * width / 100) + 30 * width / 100) and mouseY > 80 * height / 100 and mouseY < ((80 * height / 100) + height / 20) then
      difficulty = "hardcore"
    end

    setDifficulty()
  end
end

function setDifficulty()
  -- Si la difficulte est easy
  if difficulty == "easy" then
    vie = 5
    poulet_max = 5
    jauge_rate = 7
    time_rate = 2
  end

  -- Si la difficulte est normal
  if difficulty == "normal" then
    vie = 3
    poulet_max = 10
    jauge_rate = 3
    time_rate = 1.5
  end

  -- si la difficulte est hardcore
  if difficulty == "hardcore" then
    vie = 1
    poulet_max = 15
    jauge_rate = 1
    time_rate = 1
  end
end


function drawButton()

  love.graphics.setColor(147, 106, 61)
  love.graphics.rectangle('fill', 1.5 * width / 100, 80 * height / 100, 30 * width / 100, height / 20, height / 50)
  love.graphics.rectangle('fill', 34.5 * width / 100, 80 * height / 100, 31 * width / 100, height / 20, height / 50)
  love.graphics.rectangle('fill', 68.5 * width / 100, 80 * height / 100, 30 * width / 100, height / 20, height / 50)

  love.graphics.setColor(0, 0, 0)
  love.graphics.print("easy", 13 * width / 100, 81 * height /100)
  love.graphics.print("normal", 47 * width / 100, 81 * height /100)
  love.graphics.print("hardcore", 79 * width / 100, 81 * height / 100)
end

function drawScore(posX, posY, size)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("SCORE : " .. score, posX, posY, 0, size, size)
end


function replay()
  local resizeX = width / 576
  local resizeY = height / 1075
  local resize = (20 * width / 100) / 96

  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(background, 0, 0, 0, resizeX, resizeY)

  love.graphics.setColor(97, 56, 11)
  love.graphics.rectangle('fill', 15 * width / 100, 15 * height / 100, 70 * width / 100, 50 * height / 100, 5 * width / 100)
  love.graphics.setColor(147, 106, 61)
  love.graphics.rectangle('fill', 20 * width / 100, 20 * height / 100, 60 * width / 100, 40 * height / 100, 5 * width / 100)

  -- love.graphics.setColor(255, 255, 255, 255)
  -- love.graphics.draw(pouletImage, 30 * width / 100, 35 * height / 100, 0, resize, resize)
  drawScore(2 * width / 100, 2 * height / 100, 5)

  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle('fill', width / 2 - width / 10, 65 * height / 100 - height / 10, width / 5, width / 5, width / 20)

  love.graphics.setColor(147, 106, 61)
  love.graphics.polygon('fill', width / 2 - 33 * (width / 10) / 100, 65 * height / 100 - height / 10 + width / 10 - 66 * (width / 10) / 100, width / 2 + 33 * (width / 5) / 100, 65 * height / 100 - height / 10 + width / 10, width / 2 - 33 * (width / 10) / 100, 65 * height / 100 - height / 10 + width / 10 + 66 * (width / 10) / 100)

  -- a remplacer
  love.graphics.setColor(0, 0, 0)
  love.graphics.print('GAME OVER', 25 * width / 100, 25 * height / 100, 0, 4, 4)

  local istouch = love.mouse.isDown(1)
  local posX = love.mouse.getX()
  local posY = love.mouse.getY()
  if istouch == true and posX > width / 2 - width / 10 and posX < width / 5 + width / 2 - width / 10 and posY > 65 * height / 100 - height / 10 and posY < 65 * height / 100 - height / 10 + width / 5 then
      score = 0
      jauge = 1000
      temps = 0
      times = 0
      setDifficulty()
      for index = 1, #poulets do
          table.remove(poulets, index)
      end
      rejouer = false
      level = true

  end
end


function drawLaser()

    local alpha = math.atan((laser2.y - laser1.y) / (laser2.x - laser1.x))

    love.graphics.setColor(150, 150, 150)
    love.graphics.translate(laser1.x + laser1.width / 2, laser1.y + laser1.height / 2)
    love.graphics.rotate(alpha)
    love.graphics.translate(-(laser1.x + laser1.width / 2), -(laser1.y + laser1.height / 2))
    love.graphics.rectangle('fill', laser1.x, laser1.y, laser1.width, laser1.height)
    love.graphics.origin()

    love.graphics.translate(laser2.x + laser2.width / 2, laser2.y + laser2.height / 2)
    love.graphics.rotate(alpha)
    love.graphics.translate(-(laser2.x + laser2.width / 2), -(laser2.y + laser2.height / 2))
    love.graphics.rectangle('fill', laser2.x, laser2.y, laser2.width, laser2.height)
    love.graphics.origin()

end

function drawScreen()

    local resizeX = width / 576
    local resizeY = height / 1075

    love.graphics.push()
    love.graphics.scale(resizeX, resizeY)
    love.graphics.draw(background, 0, 0)
    love.graphics.pop()

    love.graphics.setColor(30, 30, 30)
    love.graphics.line(width / 5, 0, width / 5, height)
    love.graphics.line(4 * width / 5, 0, 4 * width / 5, height)
    love.graphics.line(0, 7 * height / 10, width, 7 * height / 10)

    drawScore(width / 2 - width / 50, height / 50, 4)

end


function initializeLaser1()

    laser1 = {}

    laser1.speedX = 0
    laser1.speedY = 0
    laser1.width = width / 20
    laser1.height = laser1.width
    laser1.x = width / 10 - laser1.width / 2
    laser1.y = 85 * height / 100 - laser1.height / 2

end


function initializeLaser2()

    laser2 = {}

    laser2.speedX = 0
    laser2.speedY = 0
    laser2.width = width / 20
    laser2.height = laser2.width
    laser2.x = 9 * width / 10 - laser2.width
    laser2.y = 85 * height / 100 - laser2.height

end


function bougerLaser() -- Pour donner du mouvement au laser

    local chance = love.math.random(1, 250)

    if chance < 5 then

      laser1.speedX = love.math.random(-2, 2)
      laser1.speedY = love.math.random(-2, 2)

    end

    local chance2 = love.math.random(1, 250)

    if chance2 < 5 then

      laser2.speedX = love.math.random(-2, 2)
      laser2.speedY = love.math.random(-2, 2)

    end

    laser1.x = laser1.x + laser1.speedX * 15 * love.timer.getDelta()
    laser1.y = laser1.y + laser1.speedY * 15 * love.timer.getDelta()
    laser2.x = laser2.x + laser2.speedX * 15 * love.timer.getDelta()
    laser2.y = laser2.y + laser2.speedY * 15 * love.timer.getDelta()

    if laser1.x < 0 or laser1.x + laser1.width > width / 5 then
        laser1.speedX = - laser1.speedX
    end

    if laser1.y < 7 * height / 10 or laser1.y + laser1.width > height then
        laser1.speedY = - laser1.speedY
    end

    if laser2.x + laser2.width > width or laser2.x < 4 * width / 5 then
        laser2.speedX = - laser2.speedX
    end

    if laser2.y < 7 * height / 10 or laser2.y + laser2.height > height then
        laser2.speedY = - laser2.speedY
    end

end


function createPoulet() -- Pour créer chaque poulet

    local poulet = {}

    poulet.speed = 0
    poulet.angle = love.math.random(-8, 8)
    poulet.width = width / 15
    poulet.height = poulet.width
    poulet.x = love.math.random((width / 5), (4 * width / 5 - poulet.width))
    poulet.y = 0 - poulet.height


    table.insert(poulets, poulet)

end


function creationPoulet() -- Pour invoquer un nouveau poulet
    local chance = love.math.random(1, 80)
    if chance == 1 and #poulets < poulet_max then
        createPoulet()
    end
end


function accelerationPoulet() -- Pour faire bouger le poulet

    local indexes = {}
    for index = 1, #poulets do
      local poulet = poulets[index]
      if poulet.y >= height then -- On verifie si il sort de la fenetre
          table.insert(indexes, index)

      else

          -- Changer la vitesse du poulet
          poulet.speed = poulet.speed + love.math.random(150, 250) * love.timer.getDelta()

      end

        -- Changer la position du poulet
        poulet.y = poulet.y + poulet.speed * love.timer.getDelta()

  end

  for index = 1, #indexes do
      table.remove(poulets, index)
      vie = vie - 1
  end

end


function afficherPoulet()

  for index = 1, #poulets do
    local poulet = poulets[index]
    local res = poulet.width / 96

    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(pouletImage, poulet.x, poulet.y, poulet.angle / 10, res, res)

  end
end


function collision()

    local indexes = {}
    local istouch = love.mouse.isDown(1)
    local a = (laser2.y + laser2.height / 2 - laser1.y) / (laser2.x + laser2.width / 2 - laser1.x)
    local b = - laser1.x * a + laser1.y

    for index = 1, #poulets do
        local poulet = poulets[index]
        local x1 = poulet.x
        local x2 = poulet.x + poulet.width
        local y1 = a * x1 + b
        local y2 = a * x2  + b

        if ((poulet.y < y1 and y1 < poulet.y + poulet.height) or (poulet.y < y2 and y2 < poulet.y + poulet.height)) and istouch == true then
            table.insert(indexes, index)
        end

    end

    for index = 1, #indexes do
        table.remove(poulets, index)
        score = score + 1
    end

end


function perdre()
    if vie <= 0 then
        level = false
        rejouer = true
    end
end


function jauger()
    local istouch = love.mouse.isDown(1)

    if istouch == true and jauge > 0 and temps == 0 then
        jauge = jauge - 5
        love.graphics.line(laser1.x+(laser1.width/2), laser1.y+(laser1.height/2), laser2.x+(laser2.width/2), laser2.y+(laser2.height/2))
        -- le temps resté appuyé correspond au temps de pause entre 2 possibilité
        times = times + 2
        collision()
    elseif jauge < jauge_max then
        jauge = jauge + jauge_rate
        times = times - time_rate
        temps = times
    else
        times = times - time_rate
        temps = times
    end

    if temps < 0 then
        temps = 0
    end
    if times < 0 then
        times = 0
    end

    if jauge <= 0 then
        times = times + 150
        temps = temps + 150
    end

end


function afficherJauge()

    local jaugeHeight = height / 4
    love.graphics.setColor(150, 150, 150)
    love.graphics.rectangle('fill', 85 * width / 100, 2 * height / 10, width / 10, jaugeHeight)

    love.graphics.setColor(255, 255, 50)
    love.graphics.rectangle('fill', 85 * width / 100, (2 * height / 10) + jaugeHeight - jauge * jaugeHeight / 1000, width / 10, jauge * jaugeHeight / 1000)
end


function afficherTemps()

    love.graphics.setColor(100, 100, 100)
    love.graphics.rectangle('fill', width / 2 - times / 2, 95 * height / 100, times, 2 * height / 100)
end


function afficherVies()

    love.graphics.setColor(255, 50, 50)
    for index = 1, vie do
        drawCoeur(5 * width / 100, index * 12 * height / 100, width / 10, height / 10)
    end
end


function drawCoeur(cx, cy, size)
    local W = size / 11
    local H = size / 11


    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle('fill', cx + 4 * W, cy + 2 * H, 3 * W, 8 * H)
    love.graphics.rectangle('fill', cx + 2 * W, cy + H, 2 * W, 7 * H)
    love.graphics.rectangle('fill', cx + 7 * W, cy + H, 2 * W, 7 * H)
    love.graphics.rectangle('fill', cx + W, cy + 2 * H, 9 * W, 4 * H)
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle('fill', cx + 8 * W, cy + 2 * H, W, H)
    love.graphics.setColor(0, 0, 0)

    for index2 = 1, #coeur do
        if index2 % 2 == 1 then
            love.graphics.rectangle('fill', cx + coeur[index2] * W, cy + coeur[index2 + 1] * H, W, H)
        end
    end
end

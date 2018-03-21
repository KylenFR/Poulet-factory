
-- 20% de chaque coté d'indications (vie, lasers, et jauge de puissance)


require('constants')
require('objects')

function love.load()
    --Fonction pour initialiser le jeu (appelée au début de celui-ci)

    love.window.setTitle("Poulet factory")
    love.window.setMode(width, height)
    -- icone et titre totallements inutiles pck apk mobile

    love.graphics.setLineWidth(4)
    love.graphics.setLineStyle("smooth") -- A quoi ressemble une ligne

    poulets = {}

    pouletImage = love.graphics.newImage('images/chicken.png')
    background = love.graphics.newImage('images/sunset.jpg')

    initializeLaser1()
    initializeLaser2()

    createPoulet()
    -- Les poulet qui vont revenir souvent

end


function love.update()

    if menuL == true then
      selectDifficulty()
    end

    if level == true then
      creationPoulet()

      accelerationPoulet()

      bougerLaser()

      perdre()

      love.window.setTitle(love.timer.getFPS() .. " - " .. vie .. " - " .. score .. " - " .. jauge .. " - " .. temps .. " - " .. times)
    end
end


function love.draw()
    --Fonction pour dessiner (appelée à chaque frame)
    if menuL == true then
        menu()
        drawButton()
        selectDifficulty()

    elseif level == true then
        love.graphics.setColor(255, 255, 255)
        drawScreen()

        love.graphics.setColor(0, 0, 255)

        jauger()

        love.graphics.setColor(200, 200, 200)  -- Changer la couleur

        drawLaser()

        afficherJauge()

        afficherTemps()

        afficherPoulet()

        afficherVies()


    elseif rejouer == true then
        replay()
        drawButton()
        selectDifficulty()

    end
end


function love.keypressed()
    --Fonction pour gérer l'appui sur les touches (appelée pour chaque touche pressée)

end

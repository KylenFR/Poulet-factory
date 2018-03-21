width = love.graphics.getWidth()
height = love.graphics.getHeight()

poulet_max = 5

temps = 0
times = 0

jauge = 1000
jauge_max = 1000
jauge_rate = 5
time_rate = 1

score = 0

coeur = {2,0, 3,0, 7,0, 8,0, 1,1, 4,1, 6,1, 9,1, 0,2, 5,2, 10,2, -- 3eme rangées
          0,3, 10,3, 0,4, 10,4, 0,5, 10,5,
          1,6, 9,6, 2,7, 8,7, 3,8, 7,8, 4,9, 6,9, 5,10} --pointe


menuL = true
level = false
rejouer = false

difficulty = "hardcore"

highscores = {}

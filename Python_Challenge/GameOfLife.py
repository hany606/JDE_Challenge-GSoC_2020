# -----------------------------------------------
# Author: Hany Hamed
# Description: This code for GameOfLife class
# Notes:
#   - Variables Names: using underscores
#   - Functions Names: Upper Cammel Case
#   - Classes Names: Pascle
# Sources:
#  (1). https://stackoverflow.com/questions/50413680/matplotlib-animate-2d-array
#  (2). https://towardsdatascience.com/animations-with-matplotlib-d96375c5442c
# -----------------------------------------------


import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation



class GameOfLife:
    def __init__(self, size):
        if(type(size) is int):
            self.size = (size, size)
        else:
            self.size = size
        self.map = None
        self.fig = plt.figure()
        self.neighbours_moves = [(0,1), (0,-1), (1,0), (1,1), (1,-1), (-1,0), (-1,1), (-1,-1)]


    def animate(self):
        pass

    def random(self):
        self.map = np.random.randint(0,2,(self.size[0],self.size[1]))


    def printMap(self):
        print("-------------------------------------------------------")
        for i in range(self.size[0]):
            for j in range(self.size[1]):
                if(self.map[i][j] == 0):
                    print("*",end="")
                else:
                    print("#", end="")
            print("")
        print("-------------------------------------------------------")

    def iteration(self):
        for x in range(self.size[0]):
            for y in range(self.size[1]):
                counter = 0
                for m in self.neighbours_moves:
                    x_new, y_new = x+m[0], y+m[1]
                    if(x_new < 0 or x_new >= self.size[0] or y_new < 0 or y_new >= self.size[1]):
                        continue
                    counter += self.map[x_new][y_new]
                
                if(counter < 2 and self.map[x][y]):
                    self.map[x][y] = 0
                
                elif((counter == 2 or counter == 3)):
                    self.map[x][y] = 1

                elif(counter > 3):
                    self.map[x][y] = 0

    def game(self, num_iterations=50):
        for i in range(num_iterations):
            self.printMap()
            self.iteration()
                    

if __name__ == "__main__":
    g = GameOfLife(25)
    g.random()
    g.printMap()
    g.game(1000)

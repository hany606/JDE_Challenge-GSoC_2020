/*
CMakeList
https://www.jetbrains.com/help/clion/quick-cmake-tutorial.html#
size of the array
https://stackoverflow.com/questions/10274162/how-to-find-2d-array-size-in-c
*/

#include "Labyrinth.h"
#include <iostream>
using namespace std;

int main()
{
    string root_dir = "../data/";

    Labyrinth labyrinth = Labyrinth(root_dir+"input.txt", root_dir+"output.txt");
    labyrinth.solve();
    
    return 0;
}